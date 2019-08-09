eval "$(rbenv init -)"

# Git branch in prompt.
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\w \[\033[36m\]\$(parse_git_branch)\n\[\033[33m\]$\[\033[00m\] "

# Git autocompletion
source ~/.git-completion.bash
