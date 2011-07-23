alias ea='`edit-aliases`'

alias l='ls'
alias ld='ls'
alias ks='ls'

alias ls='\ls -X --color=auto --hide="*.pyc" --hide="*.o"'
alias la='ls -A'
alias ll='ls -l'
alias lr='ls -R'

alias cr='cp -r'

alias pu=pushd
alias po=popd

alias back='cd ~-'
alias here='cd -P .'

alias xsu='exec su'

alias :w=true
alias :q=quit
alias :wq=quit

alias quit=exit
alias term=sakura
alias where=whereis

alias date='\date +"%A, %B %-d%n%-I:%M %p"'

alias vi=vim
alias v=gvim; alias g=gvim; alias givm=gvim
alias gvim='gvim 2> /dev/null'
alias gview='gview 2> /dev/null'
alias gvimdiff='gvimdiff 2> /dev/null'

alias wgs='watch git status'

alias py=python
alias python='python -W ignore'

alias ipy='ipython -nobanner -pylab'
alias ism='isympy'

alias pymol='fork pymol -qe'
alias pymolx='fork pymol -qxe'

alias ja='java -ea'
alias jc='javac -g'
alias ju='java org.junit.runner.JUnitCore'

alias xd='od -t x1'

alias octave='octave -q'
alias network='nm-tool | less'

alias sakura='fork sakura'
alias firefox='fork firefox'
alias evince='fork evince'
alias abiword='fork abiword'
alias rhythmbox='fork rhythmbox'

alias -s py=gvim
alias -s java=gvim

alias -s c=gvim
alias -s cc=gvim
alias -s cpp=gvim
alias -s h=gvim
alias -s hpp=gvim

alias -s xml=gvim
alias -s html=gvim

alias -s txt=gvim
alias -s tex=gvim

function tmp {
    mv $1 ~/tmp/
}

function lnk {
    cd ~/lnk/$1
}
