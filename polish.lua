return function()
  vim.cmd [[
                let g:nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'java': 'java', 'scala': 'scala'}
                au BufRead,BufNewFile *.wiki set filetype=vimwiki
                function! ToggleCalendar()
                  execute ":Calendar"
                  if exists("g:calendar_open")
                    if g:calendar_open == 1
                      execute "q"
                      unlet g:calendar_open
                    else
                      g:calendar_open = 1
                    end
                  else
                    let g:calendar_open = 1

                  end

                endfunction
                map <leader>c :call ToggleCalendar()<CR>
                let g:calendar_no_mappings=1	"unmap <leader>cal/caL (makes <leader>c hang for timeout)

                " :Diary to navigate to diary index
                  command! Diary VimwikiDiaryIndex
                  augroup vimwikigroup
                    autocmd!
                    " automatically update links on read diary
                    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
                  augroup end
                ]]
end
