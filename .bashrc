#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

source /usr/share/git/completion/git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

source /usr/share/nvm/init-nvm.sh
source ~/.local/bin/bashmarks.sh
source /usr/share/git/completion/git-completion.bash

alias ls='ls --color=auto'
alias gr='grep -rn --exclude-dir={output,target,bower_components,node_modules,output}'
alias grpurs='grep -rn --exclude-dir={output,target,bower_components,node_modules,output} --include="*.purs"'
alias grscala='grep -rn --exclude-dir={output,target,bower_components,node_modules,output} --include="*.scala"'

