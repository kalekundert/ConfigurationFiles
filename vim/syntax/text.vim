" Lines that begin with a dollar sign are taken to be shell demonstrations.
syntax match textShell '^\s*[$] .*$' contains=@NoSpell

" Strings within single-quotes should not be spell-checked.
syntax region textVerbatim start="`" end="'" oneline contains=@NoSpell

highlight textShell gui=italic cterm=bold term=bold

