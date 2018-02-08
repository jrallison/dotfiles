export EDITOR="vim"

alias ebash='vim ~/.profile'
alias rbash='source ~/.profile'

alias gs='git status'
alias gca='git commit -av'
alias grm='git ls-files --deleted | xargs git rm'
alias gpr='git pull --rebase'
alias gspr='git stash; gpr; git stash apply'
alias gitl='git log --pretty=format:"%h %Cblue %an %Cred %s"'

parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'; }

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local        GRAY="\[\033[1;30m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local     DEFAULT="\[\033[0;39m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\h:\W\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$GRAY\$(date +%H:%M:%S) \
$LIGHT_GRAY\w$GREEN\$(parse_git_branch) \
$WHITE\$$DEFAULT "
PS2='> '
PS4='+ '
}
proml

[[ -s "/Users/jrallison/.gvm/scripts/gvm" ]] && source "/Users/jrallison/.gvm/scripts/gvm"
[[ -s "/Users/jrallison/.profile.local" ]] && source ~/.profile.local
