defmodule Servy.Parser do
  alias Servy.Conv, as: Conv

  def parse(request) do
    [top, params_string] = String.split(request, "\r\n\r\n")

    [request_line | header_lines] = String.split(top, "\r\n")

    [method, path, _] = String.split(request_line, " ")

    headers = parse_headers(header_lines)

    params = parse_params(headers["Content-Type"], params_string)

    %Conv{method: method, path: path, params: params, headers: headers}
  end

  def parse_headers(headers) do
    Enum.reduce(headers, %{}, fn line, acc ->
      [key, value] = String.split(line, ": ")
      value = String.trim(value)
      Map.put(acc, key, value)
    end)
  end

  @doc """
  Parses the given param string of the form `key1=value1&key2=value2`
  into a map with corresponding keys and values.

  ## Examples
      iex> params_string = "name=Baloo&type=Brown"
      iex> Servy.Parser.parse_params("application/x-www-form-urlencoded", params_string)
      %{"name" => "Baloo", "type" => "Brown"}
      iex> Servy.Parser.parse_params("multipart/form-data", params_string)
      %{}
  """

  def parse_params("application/x-www-form-urlencoded", params_string) do
    params_string |> String.trim() |> URI.decode_query()
  end

  def parse_params("application/json", params_string) do
    params_string |> Poison.Parser.parse!(%{})
  end

  def parse_params(_, _), do: %{}
end
