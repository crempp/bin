#   Bash-completion
#   https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
#   ------------------------------------------------------------
    if [ -f `brew --prefix`/etc/bash_completion ]
      then
        . `brew --prefix`/etc/bash_completion
      else
        echo "ERROR: BASH Completion not installed"
    fi
