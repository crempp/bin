# Chad Rempp's bin
Here is my collection of scripts and bash_profile I use. This is intended for my own personal use but I attempted to make everything generic and reusable where possible. Please feel free to use and modify it for your own purposes.

## Bash Setup
1. If you have bash-git-prompt installed (via Brew or otherwise) uninstall it now. I use a version included in the bin repo.
2. Create files for your local bash_profile updates. Move any existing settings/aliases/etc in your `.bash_profile` or `.bashrc` into one of these three files. Your `.bash_profile` or `.bashrc` should be empty.
   * `bin/bash_profile/local/my_profile.sh`
   * `bin/bash_profile/local/network_aliases.sh`
   * `bin/bash_profile/local/dev_aliases.sh`
3. Add the following line your `.bash_profile`  
    `source $HOME/bin/bash_profile/bash_profile.sh`
4. Restart your terminal session or run the following command  
`source $HOME/.bash_profile`

## Structure
    .
    ├── README.md                   # This file
    ├── bash_profile                #
    │   ├── bash_profile.sh         # The main bash_profile
    │   ├── helpers.sh              # helpers functions for bash_profile
    │   ├── local                   #
    │   │   ├── dev_aliases.sh      # Local development aliases
    │   │   ├── my_profile.sh       # Local bash_profile
    │   │   └── network_aliases.sh  # Local network aliases
    │   └── prompts                 #
    │       ├── bash-git-prompt     # Git prompt
    │       │   └── ...             #
    │       ├── my-prompt.sh        # A customized Bash prompt
    │       ├── simple-prompt.sh    # A simple Bash prompt
    │       └── system-prompt.sh    # A complicate Bash prompt
    ├── tools                       # Assorted tools such as network pen-tests
    │   └── ...                     #
    └── ...                         # All the other scripts

## Command and Alias Reference

**..** - Aliased version of the `cd` command to traverse up one level.    
`cd ../`

**...** - Aliased version of the `cd` command to traverse up two levels.    
`cd ../../`

**.3** - Aliased version of the `cd` command to traverse up three levels.    
`cd ../../../`

**.4** - Aliased version of the `cd` command to traverse up four levels.    
`cd ../../../../`

**.5** - Aliased version of the `cd` command to traverse up five levels.    
`cd ../../../../../`

**.6** - Aliased version of the `cd` command to traverse up six levels.    
`cd ../../../../../../`

**~** - Change to home directory.  
`cd ~`

**c** - Clear terminal display.  
`clear`

**cd** - Wrapper for the `cd` command to always list directory contents upon directory change.  
`cd() { builtin cd "$@"; ll; }`

**cd..** - Aliased version of the `cd` command to traverse up one level.    
`cd ../`

**cic** - Make tab-completion case-insensitive.  
`set completion-ignore-case On`

**cp** - Aliased version of the `cp` command to write a prompt to the standard error output before copying a file that would overwrite an existing file and be verbose  
`cp -iv`

**DT** - Pipe content to file on MacOS Desktop.  
`tee ~/Desktop/terminalOut.txt`

**f** - Opens current directory in MacOS Finder.  
`open -a Finder ./`

**fix_stty** - Restore terminal settings when screwed up.  
`stty sane`

**less** - Aliased version of the `less` command to
* Exit immediately if the file cannot be displayed
* Truncate long lines
* Only show color escape sequences as raw
* Don't send termcap initialization and deinitialization strings to the terminal
* Full screen repaints to be painted from the top line down.

`less -FSRXc`

**ll** - Aliased version of the `ls` command to
* Display a slash ('/') immediately after each pathname that is a directory, an asterisk ('*') after each that is executable, an at sign ('@') after each symbolic link, an equals sign ('=') after each socket, a percent sign ('%') after each whiteout, and a vertical bar ('|') after each that is a FIFO
* Enable colorized output.
* List in long format
* List all entries except for . and ..
* Use unit suffixes
* Write a slash (`/') after each filename if that file is a directory

`ls -FGlAhp`

**mcd** - Makes new Dir and jumps inside.  
`mcd () { mkdir -p "$1" && cd "$1"; }`

**mv** - Aliased version of the `mv` command to write a prompt to the standard error output before copying a file that would overwrite an existing file and be verbose.  
`mv -iv`

**mkdir** - Aliased version of the `mkdir` command to create intermediate directories as required and be verbose.  
`mkdir -pv`

**path** - Echo all executable Paths.    
`echo -e ${PATH//:/\\n}`

**ql** - Opens any file in MacOS Quicklook Preview.  
`ql () { qlmanage -p "$*" >& /dev/null; }`

**show_options** - Display bash options settings.  
`shopt`

**top** - Aliased version of the `top` command to show more useful columns and order by cpu usage.  
`top -r -o cpu -stats pid,ppid,command,cpu,mem,vsize,vprvt,kprvt,kshrd,purg,time,threads,state`

**trash** - Moves a file to the MacOS trash.  
`trash () { command mv "$@" ~/.Trash ; }`

**which** - An aliased version of `which` to use the `type` command.  
`type -all`

## License
**ISC License (ISC)**  
Copyright (c) 2015 year, Chad Rempp

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

## References and Dependency Licenses
* The bash_profile is modified from Nathaniel Landau's. It's license is unknown - I'm assuming a CC or GPL-like license based on context.  
[http://natelandau.com/my-mac-osx-bash_profile/]
* ievms is used unmodified from source. I include it in my bin for convenience. There is no license - it explicitly states "None" in the README.
[https://github.com/xdissent/ievms]
* ssh-copy-id is used unmodified from source. I include it in my bin for convenience. It's license is unknown - I'm assuming a CC or GPL-like license based on context.   
[https://github.com/beautifulcode/ssh-copy-id-for-OSX]
* bash-git-prompt is used unmodified from source. I include it in my bin for convenience. It uses BSD 2 Clause (NetBSD) license.  
[https://github.com/magicmonty/bash-git-prompt]
* dostools are from an unknown source. If anyone knows where they came from let me know and attribute them here. It's license is unknown - I'm assuming a CC or GPL-like license based on context.
