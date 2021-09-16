vim.g.dashboard_default_executive = 'fzf'
vim.g.dashboard_footer_icon = '🐬 '
-- vim.g.dashboard_disable_statusline = 1
vim.g.dashboard_custom_section = {
  find_files = {
    description = { '  Find files                          SPC f p ' },
    command = 'Files',
  },
  find_history = {
    description = { '  Recently opened files               SPC f r' },
    command = 'History',
  },
  find_word = {
    description = { '  Find  word                          SPC f w' },
    command = 'Ag',
  },
  open_config = {
    description = { '  Open Config                         SPC f d' },
    command = 'cd ~/.config/nvim/ | e ./init.vim',
  },
}

vim.g.dashboard_custom_header = {
  '',
  '',
  '',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '',
}
