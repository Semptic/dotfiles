require("semptic.set")
require("semptic.remap")

require("semptic.lazy_init")

local augroup = vim.api.nvim_create_augroup
local SempticGroup = augroup('Semptic', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- function R(name)
--   require("plenary.reload").reload_module(name)
-- end

-- autocmd('TextYankPost', {
--   group = yank_group,
--   pattern = '*',
--   callback = function()
--     vim.highlight.on_yank({
--       higroup = 'IncSearch',
--       timeout = 40,
--     })
--   end,
-- })

-- autocmd({ "BufWritePre" }, {
--   group = SempticGroup,
--   pattern = "*",
--   command = [[%s/\s\+$//e]],
-- })

-- local enable_format_on_save = function(event)
--     local client_id = vim.tbl_get(event, 'data', 'client_id')
--     if client_id == nil then
--       -- I don't know how this would happen
--       -- but apparently it can happen
--       return
--     end
--
--     local client = vim.lsp.get_client_by_id(client_id)
--     local files = list[client.name] or {}
--
--     if type(files) == 'string' then
--       files = {list[client.name]}
--     end
--
--
--     if files == nil or vim.tbl_contains(files, vim.bo.filetype) == false then
--       return
--     end
--
--     vim.api.nvim_clear_autocmds({group = format_group, buffer = event.buf})
--
--     local config = {
--       async = false,
--       id = client.id,
--       bufnr = event.buf,
--       timeout_ms = format_opts.timeout_ms or timeout_ms,
--       formatting_options = format_opts.formatting_options,
--     }
--
--     local apply_format = function()
--       local autoformat = vim.b.lsp_zero_enable_autoformat
--       local enabled = (autoformat == nil or autoformat == 1 or autoformat == true)
--       if not enabled then
--         return
--       end
--
--       vim.lsp.buf.format(config)
--     end
--
--     local desc = string.format('Format buffer with %s', client.name)
--
--     autocmd('BufWritePre', {
--       group = format_id,
--       buffer = event.buf,
--       desc = desc,
--
--       callback = apply_format,
--     })
--   end

autocmd('LspAttach', {
  group = SempticGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
  end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
