# set -o vi
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="el" # set by `omz`

plugins=(git git-extras zsh-syntax-highlighting zsh-autosuggestions zsh-completions dotenv)

source $ZSH/oh-my-zsh.sh

fpath=($HOME/.zfunc/ $fpath)
autoload -U compinit && compinit
# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

. ~/.path
. ~/.aliasrc
. ~/.shellrc

# alias luamake=/home/wolfo/software/luamake/luamake
# fpath+=${ZDOTDIR:-~}/.zsh_functions
eval "$(zoxide init --cmd cd zsh)"
