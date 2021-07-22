runtime ./settings.vim

call plug#begin('/nvim-conf/plugged')
" Theme
Plug 'dracula/vim', { 'as': 'dracula' }
" Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'akinsho/flutter-tools.nvim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
" Autopairs
Plug 'jiangmiao/auto-pairs'
" Theme
" Plug 'morhetz/gruvbox'
" Fuzzy Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ojroques/nvim-lspfuzzy'
" Status Line
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" Code completion
Plug 'sheerun/vim-polyglot'
" Undotree
Plug 'mbbill/undotree'
" Nerd Commenter
Plug 'preservim/nerdcommenter'
" Vim CSS Color
Plug 'ap/vim-css-color'
" Vim Surround
Plug 'tpope/vim-surround'
"Vim Startify
Plug 'glepnir/dashboard-nvim'
" Vim snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Neevash/awesome-flutter-snippets'
" Completion
Plug 'hrsh7th/nvim-compe'
" LSP gui
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
" Lua support
Plug 'nvim-lua/plenary.nvim'
" Vim game
Plug 'ThePrimeagen/vim-be-good'
" Trouble
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
" Git signs
Plug 'lewis6991/gitsigns.nvim'
" indent lines
Plug 'lukas-reineke/indent-blankline.nvim'
" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Whichkey
Plug 'folke/which-key.nvim'
Plug '/nvim-conf/plugged/custom-flutter-snippets'
" Cursor highlight
Plug 'xiyaowong/nvim-cursorword'
" Pubspec assist
Plug 'akinsho/dependency-assist.nvim'
" Smooth scroll
Plug 'karb94/neoscroll.nvim'
" Testing
Plug 'vim-test/vim-test'
" nvim tree
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

colorscheme dracula
highlight CursorWord ctermbg=240 guibg=#363636

" NVIM TREE
runtime ./plug-config/nvimtree.vim
" DASHBOARD
runtime ./plug-config/dashboard.vim
" NERD COMMENTER
runtime ./plug-config/nerdcommenter.vim
" INDENT BLANKLINE
runtime ./plug-config/indent-blankline.vim

let mapleader = " "
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <leader>e :NvimTreeToggle<cr>

" " Map ++ to call NERD Commenter and use iTerm key bindings
" " to bind Ctmd+/ to ++
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"Fuzzy Search config
nnoremap <leader>ps :Files<CR>
nnoremap <leader>ag :Ag<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}


" REMAPS
" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" " Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
" " Line moving
" "  Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" " Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" " Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Map Y to y$
nnoremap Y y$
" Useful for closing parenthesis
inoremap <C-l> <Right>
" Flutter commands
nnoremap <leader>fs :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterReload<cr>
nnoremap <leader>fR :FlutterRestart<cr>
nnoremap <leader>fe :FlutterEmulators<CR>
" nnoremap <leader>fd :below new output:///flutter-dev <CR>
nnoremap <leader>fd :below new __FLUTTER_DEV_LOG__<CR>
nnoremap <leader>fo :lua vim.lsp.buf.formatting()<cr>
nnoremap <leader>u :UndotreeShow<CR>
" Necessary for lsp to update diagnostics
inoremap <C-c> <esc>
" Test remaps
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" Dashboard load session
nmap <Leader>ls :<C-u>SessionLoad<CR>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

highlight link CompeDocumentation NormalFloat

" AUTO DART FORMAT
let g:dart_format_on_save = 1

" LSP SAGA
" LspSagaFinder
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
" code action
nnoremap <silent><leader>a :Lspsaga code_action<CR>
vnoremap <silent><leader>a :<C-U>Lspsaga range_code_action<CR>
" show hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>
" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" show signature help
nnoremap <silent> gs :Lspsaga signature_help<CR>
" rename
nnoremap <leader>rn :Lspsaga rename<CR>
" Go to definition
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
" Preview definition
nnoremap <silent> gD :Lspsaga preview_definition<CR>
" Show diagnostics
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
" Jump diagnostics
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
" Trouble 
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
" Delete comments with /
nnoremap <leader>dc :g/^\s*\//d<CR>
" Exit insert mode in terminal
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
"

" Testing
let test#strategy = "neovim"
let test#neovim#term_position = "below 12"

lua << EOF

require("flutter-tools").setup{}
require'lspconfig'.tsserver.setup{}
require'dependency_assist'.setup{}
require('neoscroll').setup()
require('lspfuzzy').setup {}

require('gitsigns').setup{
  keymaps = {
    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

    ['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
}

require("trouble").setup {}

vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        path = {kind = "   (Path)"},
        buffer = {kind = "   (Buffer)"},
        calc = {kind = "   (Calc)"},
        vsnip = {kind = "   (Snippet)"},
        nvim_lsp = {kind = "   (LSP)"},
		    nvim_lua = false,
        spell = {kind = "   (Spell)"},
        tags = false,
        vim_dadbod_completion = true,
        emoji = {kind = " ﲃ  (Emoji)", filetypes={"markdown", "text"}}
        -- nvim_lua = {kind = "  "},
        -- snippets_nvim = {kind = "  "},
        -- ultisnips = {kind = "  "},
        -- treesitter = {kind = "  "},
        -- for emoji press : (idk if that in compe tho)
    }
}

-- TAB IN AUTOCOMPLETION
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end


vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)",
}


require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = false,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}

-- Whichkey
require("which-key").setup {}

local gl = require('galaxyline')
-- get my theme in galaxyline repo
-- local colors = require('galaxyline.theme').default
local colors = {
    bg = '#23252F',
    yellow = '#f1fa8c',
    dark_yellow = '#D5DB89',
    cyan = '#8be9fd',
    green = '#50fa7b',
    light_green = '#50FA7B',
    string_orange = '#ffb86c',
    orange = '#ffb86c',
    purple = '#bd93f9',
    magenta = '#ff79c6',
    grey = '#44475a',
    blue = '#8be9fd',
    vivid_blue = '#8be9fd',
    light_blue = '#8be9fd',
    red = '#ff5555',
    error_red = '#ff5555',
    info_yellow = '#f1fa8c'
}
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

table.insert(gls.left, {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n = colors.blue,
                i = colors.green,
                v = colors.purple,
                [''] = colors.purple,
                V = colors.purple,
                c = colors.magenta,
                no = colors.blue,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.red,
                Rv = colors.red,
                cv = colors.blue,
                ce = colors.blue,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.blue,
                t = colors.blue
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
            return '▊ '
        end,
        highlight = {colors.red, colors.bg}
    }
})
print(vim.fn.getbufvar(0, 'ts'))
vim.fn.getbufvar(0, 'ts')

table.insert(gls.left, {
    GitIcon = {
        provider = function()
            return ' '
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
})

table.insert(gls.left, {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
})

table.insert(gls.left, {
    FileIcon = {
      provider = 'FileIcon',
      condition = condition.buffer_not_empty,
      highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
    },
})


table.insert(gls.left, {
    FileName = {
      provider = 'FileName',
      condition = condition.buffer_not_empty,
      highlight = {colors.grey, colors.bg}
    }
})

table.insert(gls.left, {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.green, colors.bg}
    }
})
table.insert(gls.left, {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {colors.blue, colors.bg}
    }
})
table.insert(gls.left, {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.red, colors.bg}
    }
})

table.insert(gls.right, {
    DiagnosticError = {provider = 'DiagnosticError', icon = '  ', highlight = {colors.error_red, colors.bg}}
})
table.insert(gls.right, {DiagnosticWarn = {provider = 'DiagnosticWarn', icon = '  ', highlight = {colors.orange, colors.bg}}})

table.insert(gls.right, {
    DiagnosticHint = {provider = 'DiagnosticHint', icon = '  ', highlight = {colors.vivid_blue, colors.bg}}
})

table.insert(gls.right, {DiagnosticInfo = {provider = 'DiagnosticInfo', icon = '  ', highlight = {colors.info_yellow, colors.bg}}})

table.insert(gls.right, {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [' '] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = '  ',
        highlight = {colors.grey, colors.bg}
    }
})

table.insert(gls.right, {
    LineInfo = {
        provider = 'LineColumn',
        separator = '  ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
})

table.insert(gls.right, {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
})

table.insert(gls.right, {
    Tabstop = {
        provider = function()
            return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
        end,
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
})

table.insert(gls.right, {
    BufferType = {
        provider = 'FileTypeName',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
})

table.insert(gls.right, {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
})

table.insert(gls.right, {
    Space = {
        provider = function()
            return ' '
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
})

table.insert(gls.short_line_left, {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
})

table.insert(gls.short_line_left, {
    SFileName = {provider = 'SFileName', condition = condition.buffer_not_empty, highlight = {colors.grey, colors.bg}}
})

EOF
