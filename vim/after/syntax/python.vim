" Clear out the default string patterns.
syntax clear pythonString

" Highlight some special values
syntax keyword pythonConstant True False None

" Include the quotes in the region matched by pythonString.
syntax region pythonString start='u\=r\="' skip='\\"' end='"'
            \ contains=pythonEscape,pythonPercentCode,@Spell

" Only do spell checking in double-quoted strings.
syntax region pythonString start="u\=r\='" skip="\\'" end="'" 
            \ contains=pythonEscape,pythonPercentCode,@NoSpell

" Recognize some restructured text inside comments.
syntax region pythonNoSpell start="`" end="`"
            \ keepend contained contains=@NoSpell

" Match docstrings as comments, rather than strings.
syntax match pythonComment " *#.*" contains=pythonNoSpell,@Spell
syntax region pythonComment start='""" ' end='"""$'
            \ keepend contains=pythonNoSpell, @Spell

" Recognize magic comments that I tend to put in files.
syntax match pythonMagicComment "^#!/usr/bin/env python$" contains=@NoSpell
syntax match pythonMagicComment "^# encoding: latin-1$" contains=@NoSpell

" Recognize percent codes as special characters
syntax match pythonPercentCode "%[srcdiuoxXeEfFgG%]" contained

" Change how some groups are colored
highlight link pythonInclude Statement
highlight link pythonPreCondit Statement

highlight link pythonConstant Constant 
highlight link pythonExceptions Constant

highlight link pythonPercentCode Special
highlight link pythonDecorator Function

highlight link pythonNoSpell Comment
highlight link pythonMagicComment SpecialComment

highlight link pythonEscape String
