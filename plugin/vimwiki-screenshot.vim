" Vim filetype plugin to create screenshots with Vimwiki
" Last Change: 2022 April 27
" Maintainer: Alexander Moortgat-Pick <moortgat.pick@gmail.com>
" License: Copyright (c) Alexander Moortgat-Pick.
"          Distributed under the same terms as Vim itself.
"          see :help license

if exists("g:loaded_vimwiki_screenshot")
    finish
endif
let g:loaded_vimwiki_screenshot = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:makeFileName()
    let link_name_format = get(g:, 'vimwiki_screenshot_nameformat', '%Y-%m-%d_%H-%M-%S')
    let file_name = strftime(link_name_format) . ".png"
    return file_name
endfunction

function! s:makeFilePath(file_name)
    let wikipath=vimwiki#vars#get_wikilocal("path")
    let sub_dir = get(g:, 'vimwiki_screenshot_directory', 'attachments')
    let dest_dir = wikipath . sub_dir
    return dest_dir . "/" . a:file_name
endfunction

function! s:takeScreenshot(file_path)
    let s:screenshot_program = get(g:, 'vimwiki_screenshot_program', "gnome-screenshot -a -f")
    call system(s:screenshot_program . " " . a:file_path)
endfunction

function! s:insertScreenshotLink(file_name)
    let sub_dir = get(g:, 'vimwiki_screenshot_directory', 'attachments')
    let link = '![' . a:file_name . '](/' . sub_dir . '/' . a:file_name . ')'
    let l = line('.')
    let c = col('.')-1
    call append(l, link)
    call cursor(l+1, c)
endfunction

function! s:vimwikiScreenshot()
    if vimwiki#vars#get_bufferlocal('wiki_nr') == -1
        return
    endif
    let file_name = s:makeFileName()
    let file_path = s:makeFilePath(file_name)
    call s:takeScreenshot(file_path)
    if filereadable(file_path)
        call s:insertScreenshotLink(file_name)
    endif
endfunction

command! VimwikiScreenshot  call s:vimwikiScreenshot()

let &cpo = s:save_cpo
unlet s:save_cpo
