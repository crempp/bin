#   RVM
#   Load RVM into a shell session *as a function*
#   ------------------------------------------------------------
    if [ -d $HOME/.rvm ]
      then
        export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
        [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
      else
        echo "ERROR: RVM not installed"
    fi
