export RBENV_ROOT=/usr/local/var/rbenv

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias ll='ls -l -G'

# added by travis gem
[ -f /Users/morgan/.travis/travis.sh ] && source /Users/morgan/.travis/travis.sh
