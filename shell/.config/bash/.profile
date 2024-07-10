if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

. ~/.config/shell/profile
# . ~/.path
. "$HOME/.cargo/env"
