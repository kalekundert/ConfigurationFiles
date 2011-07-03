" Match any line terminated with a colon
syn match textHeader ".*:$"

" Make the Header group bold
highlight textHeader term=bold cterm=bold gui=bold
