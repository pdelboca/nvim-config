return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html", "templ" },
	root_markers = { "package.json", ".git" },
	settings = {},
	init_options = {
		provideFormatter = true,
		embeddedLanguages = { html=true, css = true, javascript = true },
		configurationSection = { "html", "css", "javascript" },
    hideAutoCompleteProposals = false,
	},
}
