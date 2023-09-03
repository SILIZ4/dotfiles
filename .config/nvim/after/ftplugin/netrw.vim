nmap <buffer> o <CR>

let g:netrw_list_hide='\*\($\|\s\s\)' " executable
let g:netrw_list_hide.=',' . '\(\.so\|\.a\|\.out\|\.o\)\($\|\s\s\)' " compiled
let g:netrw_list_hide.=',' . '\(\.pdf\|\.gif\|\.png\|\.jpg\|\.jpeg\)\($\|\s\s\)' " non-text image formats
let g:netrw_list_hide.=',' . '\(\.zip\|\.tar\.gz\|\.tar\.bz2\)\($\|\s\s\)' " compressed files
let g:netrw_list_hide.=',' . '\(\.nav\|\.aux\|\.fdb_latexmk\|\.fls\|\.toc\|\.snm\)\($\|\s\s\)' " compressed files
let g:netrw_list_hide.=',' . '\(\.lock\)\($\|\s\s\)'
let g:netrw_list_hide.=',' . 'build\/\($\|\s\s\)'
let g:netrw_list_hide.=',' . '__pycache__\/\($\|\s\s\)'
let g:netrw_list_hide.=',' . '\.egg-info\/\($\|\s\s\)'
let g:netrw_list_hide.=',' . '\(^\|\s\s\)\zs\.\S\+' " dotfiles
let g:netrw_banner=0
