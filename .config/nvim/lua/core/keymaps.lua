local utils = require 'core.utils'
local map = utils.keymap.map

vim.g.mapleader = ' '

-- Avoid ex mode
map('n', 'Q', '<Nop>')
-- Avoid command history
map('n', 'q:', '<Nop>')

-- Updates diagnostics when exiting insert mode
map('i', '<C-c>', '<Esc>')

-- Move right in insert mode, to close parenthesis
map('i', '<C-l>', '<Right>')

-- Y to y$ theres not much explanation here!
map('n', 'Y', 'y$')

-- Panel switching
map('n', '<leader>h', '<cmd>wincmd h<CR>')
map('n', '<leader>j', '<cmd>wincmd j<CR>')
map('n', '<leader>k', '<cmd>wincmd k<CR>')
map('n', '<leader>l', '<cmd>wincmd l<CR>')

-- Split panel
map('n', '<leader>v', '<C-w>v')
map('n', '<leader>s', '<C-w>s')

-- Line moving
-- Normal mode
map('n', '<C-j>', ':m .+1<CR>==')
map('n', '<C-k>', ':m .-2<CR>==')
-- Insert mode
map('i', '<C-j>', '<ESC>:m .+1<CR>==gi')
map('i', '<C-k>', '<ESC>:m .-2<CR>==gi')
-- Visual mode
map('x', '<C-j>', ":m '>+1<CR>gv=gv")
map('x', '<C-k>', ":m '<-2<CR>gv=gv")

-- Terminal
-- Enter terminal mode
map('n', '<leader>t', ':ToggleTerm()<CR>')
-- Exit insert mode in terminal
map('t', '<C-o>', [[<C-\><C-n>]])

-- File tree
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

-- Commenter <plug>NERDCommenterToggle didn't work
-- https://www.reddit.com/r/neovim/comments/kup1g0/feedkey_plug_in_lua_how/
map('n', '++', [[<cmd>lua vim.fn.feedkeys(string.format('%c%c%cNERDCommenterToggle', 0x80, 253, 83))<CR>]])
map('v', '++', [[<cmd>lua vim.fn.feedkeys(string.format('%c%c%cNERDCommenterToggle', 0x80, 253, 83))<CR>]])

-- FZF Project Search
map('n', '<leader>ps', '<cmd>Files<CR>')
map('n', '<leader>fs', '<cmd>Ag<CR>')

-- Flutter emulator
map('n', '<leader>fe', '<cmd>FlutterEmulators<CR>')

-- Format Files
map('n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>')

-- Undotree
map('n', '<leader>u', '<cmd>UndotreeShow<CR>')

-- Test suite
map('n', 't<C-n>', '<cmd>TestNearest<CR>')
map('n', 't<C-f>', '<cmd>TestFile<CR>')
map('n', 't<C-s>', '<cmd>TestSuite<CR>')
map('n', 't<C-l>', '<cmd>TestLast<CR>')
map('n', 't<C-g>', '<cmd>TestVisit<CR>')

-- Lsp Saga
-- Finder
map('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>')
-- Code action
map('n', '<leader>a', '<cmd>Lspsaga code_action<CR>')
map('x', '<leader>a', '<cmd><C-U>Lspsaga range_code_action<CR>')
-- Hover doc
map('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
map('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
map('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
-- Signature help
map('n', 'gs', '<cmd>Lspsaga signature_help<CR>')
-- Rename
map('n', '<leader>rn', '<cmd>Lspsaga rename<CR>')
-- Go to definition
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- Preview definition
map('n', 'gD', '<cmd>Lspsaga preview_definition<CR>')
-- Show diagnostics
map('n', '<leader>cd', '<cmd>Lspsaga show_line_diagnostics<CR>')
-- Jump through diagnostics
map('n', '[e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
map('n', ']e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')

-- Quick fix trouble
map('n', 'xx', '<cmd>TroubleToggle<CR>')
map('n', 'xw', '<cmd>TroubleToggle lsp_workspace_diagnostics<CR>')
map('n', 'xd', '<cmd>TroubleToggle lsp_document_diagnostics<CR>')
map('n', 'xq', '<cmd>TroubleToggle quickfix<CR>')
map('n', 'xl', '<cmd>TroubleToggle loclist<CR>')
map('n', 'xl', '<cmd>TroubleToggle loclist<CR>')
map('n', 'gR', '<cmd>TroubleToggle lsp_references<CR>')

-- Breakpoints for undo
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')

-- DAP Debugging
map('n', '<leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
map('n', '<leader>dr', "<cmd>lua require'dap'.continue()<CR>")
map('n', '<leader>do', "<cmd>lua require'dap'.step_over()<CR>")
map('n', '<leader>di', "<cmd>lua require'dap'.step_into()<CR>")
