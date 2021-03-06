# bashrc from https://github.com/davidgroves/dotfiles
# Many things sourced from these places
# - https://github.com/mrzool/bash-sensible/blob/master/sensible.bash
# - http://maketecheasier.com/8-useful-and-interesting-bash-prompts/2009/09/04
# - http://bashrcgenerator.com/
# - http://stackoverflow.com/a/13003854/170413
# - https://github.com/jondavidjohn/dotfiles
# - https://gist.github.com/insin/1425703

###############
# ENVIRONMENT #
###############

# Use vim as my editor for things like vipw or crontab -e
# Most stuff looks at $EDITOR but ancient stuff might look at $VISUAL
export EDITOR=vim
export VISUAL=vim

# Get coloured man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export PATH=$PATH:~/bin

# I never care about mail on unix machines these days
shopt -u mailwarn
unset MAILCHECK

# Make sure my homedirs bin directory is in the path
export PATH=$PATH:~/bin

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Prefer British English and use UTF-8.
export LANG='en_GB-UTF-8';
export LC_ALL='en_GB.UTF-8';

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

###########
# ALIASES #
###########

# Always run bc with -l so division works like you would expected.
alias bc="bc -l"

# Print mount output in a sane way
alias cmount="mount | column -t"

# Alias anti-typo
alias sl=ls	# No steam locomotive please !

# Dont bother with less if the output is shorter than a single screen
alias less="less -FX"

# Shorter things
alias gits="git status"
alias gitd="git diff"
alias gitco="git checkout"
alias gitc="git commit -v"
alias ..="cd .."

#############
# FUNCTIONS #
#############

# Akamai curl with all the debug options specific to Akamai turned on
akacurl() {
  curl -I -H "Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no" $*
}

# Lets you create tarballs of things with tgz $DIRNAME
tgz() {
  tar -zcvf "$1.tar.gz" "$1"
}

# Generic extraction function for all kinds of archived things.
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Sets the window terminal title to something. For example :-
# title foo.
# Is somewhat terminal dependant so might not work on everything.
title() {
    case "$TERM" in
    *term* | rxvt)
        echo -en  "\e]0;$*\a" ;;
    *)  ;;
    esac
}

########
# MISC #
########

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

################
# AUTOCOMPLETE #
################

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

########### 
# HISTORY #
###########

# Append to history instead of overwrite
# Makes working in multiple terminals much more sane
shopt -s histappend

# Write to history as commands are performed.
# Slightly more disk I/O for much more sanity with multiple terminals.
PROMPT_COMMAND='history -a'

# Compact multiline commands as they go in history
shopt -s cmdhist

# Store more history in memory / file
# Sizes are in lines.
HISTSIZE=10000
HISTFILESIZE=100000

# If you run a command over and over, only put it in history once
HISTCONTROL="erasedups:ignoreboth"

##############
# NAVIGATION #
##############

# Prepend cd to directory names automatically
# (but only look in the current directory for directories to cd to)
shopt -s autocd
CDPATH="."

# Correct obvious typos
shopt -s dirspell
# Correct obvious typos when using cd
shopt -s cdspell

##########
# PROMPT #
##########

# Colours
# Regular
txtblk="$(tput setaf 0 2>/dev/null || echo '\e[0;30m')"  # Black
txtred="$(tput setaf 1 2>/dev/null || echo '\e[0;31m')"  # Red
txtgrn="$(tput setaf 2 2>/dev/null || echo '\e[0;32m')"  # Green
txtylw="$(tput setaf 3 2>/dev/null || echo '\e[0;33m')"  # Yellow
txtblu="$(tput setaf 4 2>/dev/null || echo '\e[0;34m')"  # Blue
txtpur="$(tput setaf 5 2>/dev/null || echo '\e[0;35m')"  # Purple
txtcyn="$(tput setaf 6 2>/dev/null || echo '\e[0;36m')"  # Cyan
txtwht="$(tput setaf 7 2>/dev/null || echo '\e[0;37m')"  # White

# Bold
bldblk="$(tput setaf 0 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;30m')"  # Black
bldred="$(tput setaf 1 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;31m')"  # Red
bldgrn="$(tput setaf 2 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;32m')"  # Green
bldylw="$(tput setaf 3 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;33m')"  # Yellow
bldblu="$(tput setaf 4 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;34m')"  # Blue
bldpur="$(tput setaf 5 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;35m')"  # Purple
bldcyn="$(tput setaf 6 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;36m')"  # Cyan
bldwht="$(tput setaf 7 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;37m')"  # White

# Underline
undblk="$(tput setaf 0 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;30m')"  # Black
undred="$(tput setaf 1 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;31m')"  # Red
undgrn="$(tput setaf 2 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;32m')"  # Green
undylw="$(tput setaf 3 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;33m')"  # Yellow
undblu="$(tput setaf 4 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;34m')"  # Blue
undpur="$(tput setaf 5 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;35m')"  # Purple
undcyn="$(tput setaf 6 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;36m')"  # Cyan
undwht="$(tput setaf 7 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;37m')"  # White

# Background
bakblk="$(tput setab 0 2>/dev/null || echo '\e[40m')"  # Black
bakred="$(tput setab 1 2>/dev/null || echo '\e[41m')"  # Red
bakgrn="$(tput setab 2 2>/dev/null || echo '\e[42m')"  # Green
bakylw="$(tput setab 3 2>/dev/null || echo '\e[43m')"  # Yellow
bakblu="$(tput setab 4 2>/dev/null || echo '\e[44m')"  # Blue
bakpur="$(tput setab 5 2>/dev/null || echo '\e[45m')"  # Purple
bakcyn="$(tput setab 6 2>/dev/null || echo '\e[46m')"  # Cyan
bakwht="$(tput setab 7 2>/dev/null || echo '\e[47m')"  # White

# Reset
txtrst="$(tput sgr 0 2>/dev/null || echo '\e[0m')"  # Text Reset

# Detect whether the current directory is a git repository.
function is_git_repository {
  git branch > /dev/null 2>&1
}

# Determine the branch/state information for this git repository.
function set_git_branch {
  # Capture the output of the "git status" command.
  git_status="$(git status 2> /dev/null)"

  # Set color based on clean/staged/dirty.
  if [[ ${git_status} =~ "working directory clean" ]]; then
    state="${txtgrn}"
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    state="${txtylw}"
  else
    state="${txtred}"
  fi

  # Set arrow icon based on status against remote.
  remote_pattern="# Your branch is (.*) of"
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="↑"
    else
      remote="↓"
    fi
  else
    remote=""
  fi
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="↕"
  fi

  # Get the name of the branch.
  # WARNING: On some versions of git, this needs to be 
  # branch_pattern="^# On branch ([^${IFS}]*)"

  branch_pattern="^On branch ([^${IFS}]*)"
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
  fi

  # Set the final branch string.
  BRANCH="${state}(${branch})${remote}${txtrst} "
}

# Determine active Python virtualenv details.
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="`basename \"$VIRTUAL_ENV\"`"
  fi
}

function _prompt_command() {
  local RCODE=$?
  local RED="\[$(tput setaf 1)\]"
  local GREEN="\[$(tput setaf 2)\]"
  local BLUE="\[$(tput setaf 4)\]"
  local RESET="\[$(tput sgr0)\]"
 
  # If the last command ran okay (return code 0) 
  if [ $RCODE -eq 0 ]; then
    RCODEDISPLAY=${GREEN}[${RCODE}]${BLUE}
  # And if it didnt (return code > 0)
  else
    RCODEDISPLAY=${RED}[${RCODE}]${BLUE}
  fi
  
  # If we are root
  if [ $UID -eq 0 ]; then	
    COLOR=$RED
  # And if we are not
  else	
    COLOR=$GREEN
  fi

  # Set the PYTHON_VIRTUALENV variable.
  set_virtualenv

  # Set the BRANCH variable.
  if is_git_repository; then
    set_git_branch
  else
    BRANCH=''
  fi
   
  # First line with username@host and path 
  export PS1="\n$COLOR[\u@\h]$BLUE \w\n"
  export PS1+="\[$txtcyn\][Git: $BRANCH\[$txtcyn\]]\[$txtrst\]"
  export PS1+="\[$txtcyn\][Venv: \[$txtgrn\]${PYTHON_VIRTUALENV} \[$txtcyn\]]"
 
  # Last line is the return code of the previous command and the time. 
  export PS1+="${RCODEDISPLAY} \t \\$ \[$(tput sgr0)\]"
}

# Run this function after each command to generate the prompt
export PROMPT_COMMAND=_prompt_command

# Run this or the first displayed prompt wont look correct.
_prompt_command
