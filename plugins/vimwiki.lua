return {
  "vimwiki/vimwiki",
  lazy = false,
  config = function()
    vim.g.vimwiki_list = {
      {
        path = '/home/yarane/vimwiki/',
        syntax = 'default',
        ext = '.wiki',
      }
    }
  end
}
