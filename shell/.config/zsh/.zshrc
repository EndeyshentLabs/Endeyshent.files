# set -o vi
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

autoload -U colors && colors

setopt autocd # Enabled by default in Oh My Zsh(?)
setopt interactive_comments
stty stop undef

HISTFILE="$XDG_CACHE_HOME/zsh/history"
setopt inc_append_history

ZSH_THEME="el" # set by `omz`
plugins=(git git-extras zsh-syntax-highlighting zsh-autosuggestions zsh-completions dotenv)
source "$ZSH/oh-my-zsh.sh"

fpath=("$XDG_CONFIG_HOME/zsh/zfunc" $fpath)
autoload -U compinit && compinit

[ -f "$XDG_CONFIG_HOME/shell/aliasrc" ] && source "$XDG_CONFIG_HOME/shell/aliasrc"

if [[ "$TERM" == "alacritty" || "$TERM_PROGRAM" == "__wezterm__" ]]; then
    cat ~/.cache/wal/sequences
    clear
fi

eval "$(zoxide init --cmd cd zsh)"
