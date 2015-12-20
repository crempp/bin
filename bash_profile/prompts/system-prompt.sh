#  ---------------------------------------------------------------------------
#
#  Description:  Bash Prompt developed by Charles Torvalds
#  Source: http://www.askapache.com/linux/bash-power-prompt.html
#
# "This is what I use at the moment.. It's the coolest code I've ever seen to
# do this. I rewrote the above (and below) bash prompts to this format because
# it is much more robust, and believe it or not its way faster for your
# machine. Yes the code below is correct, it looks a little weird to export
# vars from within an exported var statement.. but this is correct. If you just
# learn this one bit of code, you will gain a lot of shell kung fu, at least I
# have! Enjoy!
#
#  ---------------------------------------------------------------------------

#   Basic version
#   ------------------------------------------------------------
#   export PS1="\n\[\e[1;30m\][$$:$PPID - \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY:-o} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n\$ "

if [ "`uname -s`" = "Darwin" ]
  then
    # Mac version
    export AA_P="export PVE=\"\\033[m\\033[38;5;2m\"\$(( \`vm_stat | sed -nE \"s/Pages free:[\\t ]+([0-9]+)\\./\\1/p\"\` / 1024 ))\"\\033[38;5;22m/\"\$((\`sysctl -n \"hw.memsize\"\` / 1024 / 1024 ))MB\"\\t\\033[m\\033[38;5;55m\$(sysctl -n \"vm.loadavg\" | sed -nE \"s/\\{ ([0-9\\\\. ]+) \\}/\\1/p\")\\\033[m\";  echo -en \"\"" \
    export PROMPT_COMMAND="history -a;((\$SECONDS % 10==0 ))&&eval \"\$AA_P\";echo -en \"\$PVE\";" \
    export PS1="\\[\\e[m\\n\\e[1;30m\\][\$\$:\$PPID \\j:\\!\\[\\e[1;30m\\]]\\[\\e[0;36m\\] \\T \\d \\[\\e[1;30m\\][\\[\\e[1;34m\\]\\u@\\H\\[\\e[1;30m\\]:\\[\\e[0;37m\\]\${SSH_TTY} \\[\\e[0;32m\\]+\${SHLVL}\\[\\e[1;30m\\]] \\[\\e[1;37m\\]\\w\\[\\e[0;37m\\] \\n(\$SHLVL:\\!)\\\$ " \
    eval $AA_P
  else
    # Unix version
    export AA_P="export PVE=\"\\033[m\\033[38;5;2m\"\$(( \`sed -n \"s/MemFree:[\\t ]\\+\\([0-9]\\+\\) kB/\\1/p\" /proc/meminfo\` / 1024 ))\"\\033[38;5;22m/\"\$((\`sed -n \"s/MemTotal:[\\t ]\\+\\([0-9]\\+\\) kB/\\1/p\" /proc/meminfo\`/ 1024 ))MB\"\\t\\033[m\\033[38;5;55m\$(< /proc/loadavg)\\033[m\";echo -en \"\"" \
    export PROMPT_COMMAND="history -a;((\$SECONDS % 10==0 ))&&eval \"\$AA_P\";echo -en \"\$PVE\";" \
    export PS1="\\[\\e[m\\n\\e[1;30m\\][\$\$:\$PPID \\j:\\!\\[\\e[1;30m\\]]\\[\\e[0;36m\\] \\T \\d \\[\\e[1;30m\\][\\[\\e[1;34m\\]\\u@\\H\\[\\e[1;30m\\]:\\[\\e[0;37m\\]\${SSH_TTY} \\[\\e[0;32m\\]+\${SHLVL}\\[\\e[1;30m\\]] \\[\\e[1;37m\\]\\w\\[\\e[0;37m\\] \\n(\$SHLVL:\\!)\\\$ " \
    eval $AA_P
fi
