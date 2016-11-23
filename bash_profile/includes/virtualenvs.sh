#   Setup virtualenv
#   ------------------------------------------------------------
    if [ -f /usr/local/bin/virtualenvwrapper.sh ]
      then
        export WORKON_HOME=~/.virtualenvs
        source /usr/local/bin/virtualenvwrapper.sh
      else
        echo "ERROR: virtualenvwrapper not installed"
    fi
