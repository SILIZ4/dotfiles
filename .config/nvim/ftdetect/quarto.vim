if exists("did_load_custom_filetypes")
  finish
endif
augroup filetypedetect
  au BufRead,BufNewFile *.qmd                set filetype=quarto
augroup END
