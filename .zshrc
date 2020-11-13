# Lines configured by zsh-newuser-install
#HISTFILE=~/.histfile
#HISTSIZE=1000
#SAVEHIST=1000
#bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#zstyle :compinstall filename '/home/morgan/.zshrc'

#autoload -Uz compinit
#compinit
# End of lines added by compinstall

################################################################################
# History settings
################################################################################
ZSHDOTDIR=$HOME/.zsh/
HISTFILE=$ZSHDOTDIR/histfile
HISTSIZE=5500
SAVEHIST=5000

if [ $(tty) = /dev/tty1 ]; then
    startx
    logout
fi

################################################################################
# Color definitions
################################################################################
BLK="%{"$'\033[30m'"%}"
RED="%{"$'\033[31m'"%}"
GRN="%{"$'\033[32m'"%}"
YLW="%{"$'\033[33m'"%}"
BLU="%{"$'\033[34m'"%}"
MAG="%{"$'\033[35m'"%}"
CYA="%{"$'\033[36m'"%}"
WHT="%{"$'\033[37m'"%}"

NOR="%{"$'\033[00m'"%}"
BLD="%{"$'\033[01m'"%}"

###############################################################################
# vcs_info settings
###############################################################################
autoload -Uz vcs_info && vcs_info

# Enable git cvs and svn magic
zstyle ':vcs_info:*' enable git cvs svn darcs

_vcs_fmt_action="${BLD}${MAG}[${CYA}%b${NOR}-${BLD}${WHT}%a${MAG}]${NOR}"
_vcs_fmt_branch="${BLD}${MAG}[${CYA}%b${MAG}]${NOR}"
_vcs_fmt_branch_svn="${CYA}%b${RED}:${YLW}%r${NOR}"
_vcs_fmt_type="${BLD}${MAG}(${GRN}%s${MAG})${NOR}"

# CVS formats
zstyle ':vcs_info:cvs:*' actionformats \
        ${_vcs_fmt_action} \
        ${_vcs_fmt_type}
zstyle ':vcs_info:cvs:*' formats \
        ${_vcs_fmt_branch} \
        ${_vcs_fmt_type}

# Git formats
zstyle ':vcs_info:git:*' actionformats \
        ${_vcs_fmt_action} \
        ${_vcs_fmt_type}
zstyle ':vcs_info:git:*' formats \
        ${_vcs_fmt_branch} \
        ${_vcs_fmt_type}

# Git-svn formats
zstyle ':vcs_info:git-svn:*' branchformat ${_vcs_fmt_branch_svn}
zstyle ':vcs_info:git-svn:*' actionformats \
        ${_vcs_fmt_action} \
        ${_vcs_fmt_type}
zstyle ':vcs_info:git-svn:*' formats \
        ${_vcs_fmt_branch} \
        ${_vcs_fmt_type}

# Darcs formats
zstyle ':vcs_info:darcs:*' actionformats \
        ${_vcs_fmt_action} \
        ${_vcs_fmt_type}
zstyle ':vcs_info:darcs:*' formats \
        ${_vcs_fmt_branch} \
        ${_vcs_fmt_type}

# SVN-alike formats
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat ${_vcs_fmt_branch_svn}
zstyle ':vcs_info:(sv[nk]|bzr):*' actionformats \
        ${_vcs_fmt_action} \
        ${_vcs_fmt_type}
zstyle ':vcs_info:(sv[nk]|bzr):*' formats \
        ${_vcs_fmt_branch} \
        ${_vcs_fmt_type}

################################################################################
# Completion settings
################################################################################
autoload -Uz compinit && compinit

# Unknown stuff
#zstyle ':completion:*' completions 1
#zstyle ':completion:*' prompt '%e errors found:'

# Completion engines to use
zstyle ':completion:*' completer \
        _expand \
        _complete \
        _match \
        _approximate \
        _prefix

# Cache completion results
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $ZSHDOTDIR/cache

# Ignore VCS directories when completing
zstyle ':completion:*:(all-|)files' ignored-patterns \
        '(|*/)CVS' \
        '(|*/).git' \
        '(|*/).svn'
zstyle ':completion:*:cd:*' ignored-patterns \
        '(|*/)#CVS' \
        '(|*/)#.git' \
        '(|*/)#.svn'

# Fix errors
zstyle ':completion:*:approximate:*' max-errors 2 numeric

# Ignore internal functions
zstyle ':completion:*:functions' ignored-patterns \
        '_*'

# Remove trailing slashes from directories
zstyle ':completion:*' squeeze-slashes true

# Attempt to complete many parts at once
zstyle ':completion:*' matcher-list '' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'

# Substitute things when tab completing
zstyle ':completion:*:expand:*' substitute true

# Insert as much as possible
zstyle ':completion:*:match:*' glob true
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:match:*' insert-unambiguous true

# Ignore where we are when completing directory names
zstyle ':completion:*' ignore-parents parent pwd directory

# Completion list settings
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# Separate groups
zstyle ':completion:*' group-name ''

################################################################################
# Environment settings
################################################################################
# Common things
EDITOR=vim
SHELL=/bin/zsh

# Include sdcc
if [[ -d /usr/libexec/sdcc ]]; then
    PATH=$PATH:/usr/libexec/sdcc
fi

# Completion in python
#PYTHONSTARTUP=$HOME/.pythonrc

# rlwrap stuff
RLWRAP_HOME=$HOME/.rlwrap/
RLWRAP_EDITOR="vim +%L"

# yokadi settings
YOKADI_HISTORY=$RLWRAP_HOME/yokadi_history

# Miscellaneous stuff
LESS="-rIM"

# Setup ls
alias ls='ls -h -G'
alias ll='ls -l'
alias la='ls -a'

# Keychain
#/usr/bin/keychain ~/.ssh/id_dsa
#source ~/.keychain/promiscuity-sh > /dev/null

# Export variables
export EDITOR
export PYTHONSTARTUP
export RLWRAP_HOME
export RLWRAP_EDITOR
export LESS

################################################################################
# Alias settings
################################################################################
# Nice tools
alias linecount="find -regextype posix-extended -regex \".*\.(h|cpp|c)\" | xargs wc -l"
alias sul="sort -u | less"
alias suc="sort | uniq -c"

# Global aliases
alias -g SAD='&> /dev/null &|'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Common typos
alias :q="exit"

################################################################################
# Prompt settings
################################################################################
precmd () {
    vcs_info

    case $TERM in
        xterm*)
            print -Pn "\e]0;%n@%m:%~ | %y\a%"
            ;;
        screen)
            print -Pn "\e_screen \005 (\005t) | %n@%m:%~ | %y\e\\%"
            ;;
    esac

    if [[ "$TERM" == "screen" ]]; then
        echo -ne "\ek\e\\"
    fi
}

() {
    local -a _ps1
    local -a _rps1
    local _ps1_color

    # Get the color
    if [[ $EUID -eq 0 ]]; then
        _ps1_color=${RED}
    elif [[ -n "$VIMRUNTIME" ]]; then
        _ps1_color=${YLW}
    else
        _ps1_color=${GRN}
    fi

    _ps1=(
        #"${CYA}%D{%a %b %d %T}${NOR}"
        "${CYA}%D{%T}${NOR}"
        "${BLD}${WHT}:${NOR}"
        " "
        "${BLD}${CYA}%~${NOR}"
        $'\n'
        "${BLD}${_ps1_color}%n${NOR}"
        "${BLD}${WHT}@${NOR}"
        "${BLD}${MAG}%M${NOR}"
        " "
        "${BLD}${WHT}%#${NOR}"
        " "
    )
    PS1=${(j::)_ps1}

    _rps1=(
        '${vcs_info_msg_1_}'
        "${WHT}-${NOR}"
        '${vcs_info_msg_0_}'
    )

    RPROMPT=${(j::)_rps1}
}

################################################################################
# Bookmarks
################################################################################
_cdb_file=$ZSHDOTDIR/bookmarks

# Functions
cdb_edit () {
    $EDITOR ${_cdb_file}
}

cdb () {
    local nd
    nd=`sed -ne "/^$1/s/^$1	//p" ${_cdb_file}`
    if [[ -n $nd ]]; then
        cd $nd
        dcl
    fi
}

_cdb () {
    reply=(`sed -e 's/	.*$//' ${_cdb_file}`);
}

compctl -K _cdb cdb

################################################################################
# Set the title back to vim
################################################################################
zshexit () {
    if [[ "$TERM" == "screen" && -n "$VIMRUNTIME" ]]; then
        echo -ne "\ekvim\e\\"
    fi
}

################################################################################
# Key bindings
################################################################################
# Vim bindings
bindkey -v
bindkey '^R' history-incremental-search-backward

# setup key accordingly
if [ -f $HOME/.zkbd/$TERM-$VENDOR-$OSTYPE ]; then
    source $HOME/.zkbd/$TERM-$VENDOR-$OSTYPE
else
    #echo "WARNING: Keybindings may not be set correctly!"
fi

[[ -n "${key[Home]}" ]]    && bindkey "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}" ]]     && bindkey "${key[End]}"     end-of-line
[[ -n "${key[Insert]}" ]]  && bindkey "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}" ]]  && bindkey "${key[Delete]}"  delete-char
[[ -n "${key[Up]}" ]]      && bindkey "${key[Up]}"      up-line-or-search
[[ -n "${key[Down]}" ]]    && bindkey "${key[Down]}"    down-line-or-search
[[ -n "${key[Left]}" ]]    && bindkey "${key[Left]}"    backward-char
[[ -n "${key[Right]}" ]]   && bindkey "${key[Right]}"   forward-char
[[ -n "${key[C-Left]}" ]]  && bindkey "${key[C-Left]}"  backward-word
[[ -n "${key[C-Right]}" ]] && bindkey "${key[C-Right]}" forward-word
[[ -n "${key[C-R]}" ]]     && bindkey "${key[C-R]}"     history-incremental-search-backward
[[ -n "${key[C-T]}" ]]     && bindkey "${key[C-T]}"     history-incremental-search-forward

################################################################################
# zsh options
################################################################################
# Directory options
setopt autocd                # cd to a dir when just its name is given
setopt autopushd             # Push things onto the directory stack
setopt chasedots             # Resolve symlinks before resolving parent dirs
setopt pushdtohome           # Empty pushd acts like empty cd

# Completion options
setopt autolist              # Do a list on ambiguous completion
setopt automenu              # Do a menu after <Tab><Tab>
setopt autoparamslash        # Append a slash for directory completion
setopt completealiases       # Treat aliases as commands
setopt listpacked            # Use variable column widths

# Glob settings
setopt equals                # Expand = commands
setopt extendedglob          # Assume [#~^] refer to patterns
setopt globdots              # Assume leading . for hidden files

# History settings
setopt appendhistory         # Keep history for parallel sessions
#setopt extendedhistory       # Keep timestamp and duration as well
setopt histexpiredupsfirst   # Kill duplicates first
setopt histfindnodups        # Don't find dupes either
setopt histsavenodups        # Don't write dupes to the history file
setopt histverify            # Preview history expansions

# Job control
setopt autocontinue          # Background stopped processes when disowning
setopt notify                # Notify of job status changes ASAP

# Prompt settings
setopt promptsubst           # Substitute things in the prompt

case $TERM in
    xterm*)
        #precmd () {print -Pn "\e]0;%~\a"}
        #precmd () {print -Pn "\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | %y\a%"}
        bindkey '\eOH' beginning-of-line
        bindkey '\eOF' end-of-line
        bindkey '\e[3~' delete-char
        bindkey '\e[2~' quoted-insert
        bindkey '\e[2~' overwrite-mode
        bindkey '\e[5~' beginning-of-buffer-or-history
        bindkey '\e[6~' end-of-buffer-or-history
        bindkey '\e[1;5D' backward-word
        bindkey '\e[1;5C' forward-word
        ;;
    screen)
        #precmd () {print -Pn "\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | %y\e\\%"}
        ;;
esac

unsetopt rm_star_silent
unsetopt RM_STAR_SILENT

export TEAM=release

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function git() { if [[ $1 == 'fetch' ]]; then echo "Stop trying to make fetch happen, $USER"; /usr/local/bin/git $@; else /usr/local/bin/git $@; fi }
function changelog() { git log $1..$2 --no-merges --pretty=format:"%h: %s -- %an" | tee /dev/null }

function deb_compare() {
  comm -3 <(dpkg --contents ${1} | awk '{print $6}' | sort) <(dpkg --contents ${2} | awk '{print $6}' | sort)
}

function rpm_compare() {
  comm -3 <(rpm -qpl ${1} | sort) <(rpm -qpl ${2} | sort)
}

function git_grep_all() {
  for branch in `git branch -rl | ag ${1}`; do git --no-pager grep ${2} ${branch}; done
}

function git_upstream_grep() {
  git_grep_all upstream ${1}
}

function signed_tag () { git tag -s -u 4BD6EC30 -m "$@" "$@" ;}

function unlock_timemachine() { diskutil coreStorage unlockVolume "$@" }

# tmux aliases
alias tl="tmux ls"
alias ta="tmux at -t"
alias tn="tmux new -s"
#git aliases
alias gs="git status"
alias gl="git lg"
alias gla="git lg --all"
#alias go="git checkout"
alias gob="git checkout -b"
alias gb="git branch"
alias ga="git add"
alias gd="git diff"
alias gdc="git diff --cached"
alias gc="git commit"
alias gca="git commit --amend"
alias gfa="git fetch --all --prune"
alias gr="git remote -v show"
alias gp="git push"
alias gu="git pull"
alias gdw="git diff --color-words"
alias gk="gitk --all&"
alias gx="gitx --all"
#ruby aliases
alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
# old habits
alias grep="grep -r"
alias cl="changelog"
alias pkgreset='rake package:implode package:bootstrap'
alias ggrep='git_upstream_grep'
alias stag='signed_tag'
alias clone_upstream='git clone -o upstream'
alias rpmbuilder='ssh rpm-builder-5'
alias debbuilder='ssh deb-builder-3'
alias fla='floaty list --active'
alias fla='floaty list --active --service vmpooler'
alias fd='floaty delete'
alias fda='floaty delete --all'
alias fdav='floaty delete --all --service vmpooler'
alias fssh='ssh -i ~/.ssh/id_rsa-acceptance -l root'
alias test_lein='EZBAKE_ALLOW_UNREPRODUCIBLE_BUILDS=true EZBAKE_NODEPLOY=true lein'
alias docker_run_bash='docker run --rm -it --entrypoint /bin/bash'
alias docker_run_ash='docker run --rm -it --entrypoint /bin/ash'
alias docker_run_sh='docker run --rm -it --entrypoint /bin/sh'
alias docker_run='docker run --rm -it'
alias dr=docker_run
alias drb=docker_run_bash
alias dra=docker_run_ash
alias drs=docker_run_sh

#building
export VANAGON_SSH_KEY=~/.ssh/id_rsa-acceptance

#sol11 signing
export IPS_SIGNING_KEY="/root/signing.new/signing_key.pem"
export IPS_SIGNING_CERT="/root/signing.new/signing_cert.pem"
export IPS_ROOT_CERT="/root/signing/Thawte_Primary_Root_CA.pem"
export IPS_INTER_CERT="/root/signing/Thawte_Code_Signing_Certificate.pem"
export IPS_SIGNING_SERVER="rama.delivery.puppetlabs.net"
export IPS_SIGNING_SSH_KEY='/Users/morgan/.ssh/id_rsa'

export VMPOOLER_URL="http://vmpooler.delivery.puppetlabs.net"


export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

source /Users/morgan/work/vmpooler-shell/vmpooler.sh > /dev/null 2>&1
# added by travis gem
[ -f /Users/morgan/.travis/travis.sh ] && source /Users/morgan/.travis/travis.sh
alias fingerprint='echo 6F6B15509CF8E59E6E469F327F438280EF8D349F'
alias debdate="date '+%a, %d %b %Y %H:%M:%S %z'"
alias diff="diff -u"
alias ez_stage="EZBAKE_ALLOW_UNREPRODUCIBLE_BUILDS=true EZBAKE_NODEPLOY=true lein with-profile ezbake ezbake stage"

alias find_disk_uuid="diskutil cs list"
alias find_timemachine=find_disk_uuid
alias java7="export JAVA_HOME=`/usr/libexec/java_home -v 1.7`"
alias java8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`"
alias ez_foss_build="EZBAKE_ALLOW_UNREPRODUCIBLE_BUILDS=true EZBAKE_NODEPLOY=true JENKINS_USER_AUTH=\$JENKINS_USER_AUTH_FOSS lein with-profile ezbake ezbake build"

source ~/.sensitive_data
source ~/.ssh_agent_info

if which go > /dev/null; then export PATH=$PATH:$(go env GOPATH)/bin; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/morgan/work/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/morgan/work/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/morgan/work/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/morgan/work/google-cloud-sdk/completion.zsh.inc'; fi
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH=/usr/local/Cellar/arm-gcc-bin@8/8-2019-q3-update/bin:/usr/local/Cellar/avr-gcc@8/8.4.0/bin:$PATH
