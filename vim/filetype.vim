if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    autocmd BufRead,BufNewFile *.sh     setfiletype zsh

    autocmd BufRead,BufNewFile *.s      setfiletype mips
    autocmd BufRead,BufNewFile *.txt    setfiletype text
    autocmd BufRead,BufNewFile *.tex    setfiletype tex

    autocmd BufRead,BufNewFile *.html,*.xml     setfiletype sgml
augroup end

