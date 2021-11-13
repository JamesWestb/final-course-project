defmodule Servy.Api.BearController do
  def index(conv) do
    json =
      Servy.Wildthings.list_bears()
      |> Poison.encode!()

    conv = put_resp_content_type(conv, "application/json")

    %{conv | status: 200, resp_body: json}
  end

  def put_resp_content_type(conv, type) do
    %{conv | resp_headers: Map.put(conv.resp_headers, "Content-Type", type)}
  end

  def create(conv) do
    %{
      conv
      | resp_body: "Created a #{conv.params["type"]} bear named #{conv.params["name"]}!",
        status: 201
    }
  end
end
