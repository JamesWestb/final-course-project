Application.put_env(:elixir, :ansi_enabled, true)

IEx.configure(
	colors: [
		enabled: true,
		eval_result: [:cyan, :bright],
		eval_info: [:blue, :bright],
		eval_error: [:magenta, :bright],
		doc_title: [:reverse, :yellow, :bright],
		doc_headings: [:yellow, :bright],
		doc_inline_code: [:magenta, :bright],
		ls_directory: [:green, :bright],
		stack_app: [:green, :bright],
		stack_info: [:red, :bright]
		]
)
