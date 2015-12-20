#  ---------------------------------------------------------------------------
#
#  Description:  Bash Prompt with system info and Git awaremenss
#  Sources:
#    * http://www.askapache.com/linux/bash-power-prompt.html
#    * https://github.com/magicmonty/bash-git-prompt
#
#  Key:
#
#  661/16384MB	1.47 1.62 1.60
#  [128:127 0:498] 06:42:53 Sun Oct 18 [crempp@ltmbpcrempp.local: +1] ~
#
#  ✔ ~/projects/dealer-portal [DP-6516_SummarySectionNotLoading|⚑ 1]
#  ---------------------------------------------------------------------------


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


