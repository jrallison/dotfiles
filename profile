export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export EDITOR="mvim -f"

alias ebash='mvim ~/.profile'
alias rbash='source ~/.profile'

alias gb='git branch -a -v'
alias gs='git status'
alias gd='git diff | mate'
alias gca='git commit -av'
alias gcia='git commit -v -a -i'
alias grm='git ls-files --deleted | xargs git rm'
alias gcm='git checkout master'
alias gpr='git pull --rebase'
alias gspr='git stash; gpr; git stash apply'
alias pull='git pull --rebase'
alias push='git push'
alias gre='git rebase master'
alias push?='git log --pretty=format:"* \"%s\" in %h by %cn %cr" FETCH_HEAD..HEAD | perl -pe ""'
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
$GRAY\$$DEFAULT "
PS2='> '
PS4='+ '
}
proml

export GOROOT=/usr/local/go
export GOPATH=~/go
export PATH="$GOROOT/bin:~/go/bin:$PATH"
