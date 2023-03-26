local vim = vim
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"rust_analyzer",
	"clangd",
	"cmake",
	"elixirls",
	"dockerls",
	"jsonls",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "✘",
		warn = "",
		hint = "",
		info = "",
	},
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	if client.name == "eslint" then
		vim.cmd.LspStop("eslint")
		return
	end

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "LightRed", undercurl = true })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = "Orange", undercurl = true })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { fg = "LightBlue", undercurl = true })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { fg = "LightGreen", undercurl = true })

	vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { fg = "LightRed" })
	vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { fg = "LightYellow" })
	vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { fg = "LightBlue" })
	vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = "LightGreen" })
end)

lsp.setup()

local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	on_attach = function(client, bufnr)
		null_opts.on_attach(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({ bufnr = bufnr })
					-- vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
	sources = {
		-- You can add tools not supported by mason.nvim
	},
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
	ensure_installed = {
		"python-lsp-server",
	},
	automatic_installation = false, -- You can still set this to `true`
	automatic_setup = true,
})

-- Required when `automatic_setup` is true
require("mason-null-ls").setup_handlers()

require("lspconfig")["pylsp"].setup({
	settings = {
		pylsp = {
			configurationSources = { "flake8" },
			plugins = {
				flake8 = {
					enabled = true,
					maxLineLength = 120,
				},
				pycodestyle = {
					maxLineLength = 120,
				},
			},
		},
	},
})
