#!/bin/bash

[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/.local/bin:$PATH"

# VS Code remote: put the newest server's `code` CLI on PATH (no-op elsewhere)
_vscode_cli=$(ls -dt "$HOME"/.vscode-server/bin/*/bin/remote-cli 2>/dev/null | head -1)
[ -n "$_vscode_cli" ] && export PATH="$_vscode_cli:$PATH"
unset _vscode_cli

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


#better pattern matching
shopt -s extglob

scplpc() { scp -r oamram@cmslpc-el9.fnal.gov:"$1" "${2:-.}"; }

alias lpc='ssh oamram@cmslpc-el8.fnal.gov'
alias lpc9='ssh oamram@cmslpc-el8.fnal.gov'


# append to the history file, don't overwrite it
shopt -s histappend
#
# # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=90000000
HISTFILESIZE=90000000
PROMPT_COMMAND="history -a; history -n"

# Start a local agent only if there is no usable one (keeps forwarded agents over SSH)
# (ssh-add -l exit codes: 0 = has keys, 1 = agent empty, 2 = no agent)
ssh-add -l >/dev/null 2>&1; _agent=$?
if [ $_agent -ne 0 ] && [ -f ~/.ssh/id_rsa ]; then
    [ $_agent -eq 2 ] && eval "$(ssh-agent -s)" >/dev/null
    for k in ~/.ssh/id_rsa_cern ~/.ssh/id_rsa; do [ -f "$k" ] && ssh-add "$k" 2>/dev/null; done
fi
unset _agent
