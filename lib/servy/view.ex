defmodule Servy.View do
  @templates_path Path.expand("../../templates", __DIR__)

  def render(conv, template, bindings \\ []) do
    # ----"\\ []" in Elixir establishes a default value for a parameter. Here bindings defaults to an empty list----
    content =
      @templates_path
      |> Path.join(template)
      |> EEx.eval_file(bindings)

    %{conv | status: 200, resp_body: content}
  end
end
