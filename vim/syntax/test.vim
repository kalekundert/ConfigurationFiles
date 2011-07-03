for chars in range(3, 120)
    echo "syntax match rstSection " . printf(".\\{%d}\\n=\\{%d}", chars, chars)
    echo "syntax match rstSection " . printf(".\\{%d}\\n-\\{%d}", chars, chars)
endfor


