#!/bin/bash

eval "$(/opt/homebrew/bin/brew shellenv)"

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

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa_cern
ssh-add ~/.ssh/id_rsa
