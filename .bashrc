export GPG_TTY=$(tty)
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# LS aliases
alias ls='exa --sort type'                                      # Use exa
alias ll='exa --long --header --git --icons --sort type'        # Long list
alias la='exa --long --header --git --icons --sort type --all'  # Long list, show all

alias grep='grep --color'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles-config/ --work-tree=$HOME'

# grep history
alias hgrep="fc -El 0 | grep"

