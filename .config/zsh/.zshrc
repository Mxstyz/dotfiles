#Functions
lfcd () {
    cd "$(command lf -print-last-dir "$@")"
}

# History settings
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/.zhistory"

# Shell options
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt autocd           # Automatically cd into typed directory.
setopt inc_append_history  # Append commands to history immediately after execution

# Key bindings
bindkey -s '^F' 'fuzzylf^M'
bindkey -s '^H' '"$(find $HOME | fzf)"^M'

# Prompt settings
PROMPT_EOL_MARK=''   # or choose any other character
PROMPT=$'%F{%(#.blue.green)}┌──(%B%F{%(#.red.blue)}%n@%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '

# Aliases
alias sudo='sudo '
alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'
alias apt='nala'
alias apt-get='nala'
alias fuzzylf='. fuzzylf'
alias clear='source ${ZDOTDIR:-$HOME/.zshrc} && clear'
alias neofetch='fastfetch'
alias ls='eza'
alias lf='lfcd'
alias shutdownwin='ssh win shutdown /s /f /t 0'
alias shutdownwindows='ssh win shutdown /s /f /t 0'
alias vim='nvim'

