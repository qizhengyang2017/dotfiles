# User specific aliases and functions


# 显示最近 N 条历史命令（不带编号）

hs() {
  local n=${1:-10}
  history | tail -n "$n" | sed 's/^ *[0-9]\+\** *//'
  # tail -n "$n" ~/.zsh_history | sed 's/^: [0-9]*:[0-9]*;//'
}




# 生信软件
PATH=/Users/zhengyangqi/Melon/proj_sexChr/sessilifolia_tree/softwares/Gblocks_0.91b:$PATH
PATH=/Users/zhengyangqi/Melon/paml-dev/bin:$PATH
PATH="$HOME/Work/softwares/mash-OSX64-v2.3:${PATH}"
# for sequenceTubeMap
PATH=~/Melon/sequenceTubeMap/vg/bin:$PATH

PATH=/Users/zhengyangqi/plum:$PATH

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# >>> bioinfo <<<

# GNU版本的awk, grep, sed
PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

export PATH

# 可以预览gz文件
fzfp() {
  fzf --preview '
    if [[ $(file --mime {}) =~ gzip ]]; then
        zcat {}
    elif [[ $(file --mime {}) =~ zip ]]; then
        unzip -p {}
    else
        cat {}
    fi
    '
}

lles() {
  local dir="${1:-.}"
  ls -lrth --color=always "$dir" | less -R
}

## >>> personal alias <<<

alias r="radian"

# alias l="ls --color=auto -lhrt"

# 使用always, 用管道连接tail还能有颜色
alias l="ls --color=always -lhrt"

# alias ll="ls -lrth --color=always| less -R" #列出文件

alias cat="gcat" # brew install coreutils

alias cp="cp -ip"
alias mv="mv -i"
alias rm="trash"
#alias l="ls -lrth"
alias les="less -S"

alias st="cd /Users/zhengyangqi/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/MyToolkit"
# alias envc="vim ~/Dropbox/config/env.sh"
alias envc="vim /Users/zhengyangqi/dotfiles/mac/env.sh"

alias condaenv="micromamba activate R4.2"

alias pap="nvim ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/MyToolkit/seminar/文献阅读记录.md"
alias tmp="nvim /Users/zhengyangqi/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/MyToolkit/tmp.md"
alias lab="nvim /Users/zhengyangqi/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/MyToolkit/实验日志.md"

dn() {
  local dn_path="/Users/zhengyangqi/Library/Mobile Documents/iCloud~md~obsidian/Documents/MyToolkit/2025/$(date -u +%Y-%m-%d).md"
  nvim "$dn_path"
}

dn1() {
  local dn_path="/Users/zhengyangqi/Library/Mobile Documents/iCloud~md~obsidian/Documents/MyToolkit/2025/$(date -u -v -1d +%Y-%m-%d).md"
  nvim "$dn_path"
}

#dn1="/Users/zhengyangqi/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/MyToolkit/2025/"`date -u -v -1d +%Y-%m-%d`.md
#alias dn1="nvim $dn1"

alias lib="cd ~/Library/Application\ Support"
# alias vim="nvim"

# open software
alias rstudio="open -na Rstudio"
alias typora="open -a typora"
alias obsidian="open -a obsidian"

# ==============   fzf   ======

# https://www.liuvv.com/p/a0700771.html
#find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!"
    return 1
  fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# 查找目录并进入
fdd() {
  local dir
  dir=$(find "${1:-.}" -type d | fzf)
  if [[ -n "$dir" ]]; then
    cd "$dir" || return
  fi
}

search() {
  grep --exclude-dir=\.ipynb_checkpoints --include=\*.{R,r,ipynb,py,sh,md} -inR . -e "$1"
}

# mkdir and enter it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# get col
getcol() {
  head -n 1 $1 | awk '{print NF}'
}

# 快速备份文件或者目录的函数
backup() {
  if [ -z "$1" ]; then
    echo "Usage: backup <file_or_directory>"
    return 1
  fi

  local target="$1"
  if [ ! -e "$target" ]; then
    echo "Error: '$target' does not exist."
    return 1
  fi

  local timestamp
  timestamp=$(date +%Y%m%d%H%M%S)
  local backup="${target}.${timestamp}.bak"

  if [ -f "$target" ]; then
    cp -p "$target" "$backup" && echo "File backup created: $backup"
  elif [ -d "$target" ]; then
    mv "$target" "$backup" && echo "Directory backup created: $backup"
  else
    echo "Error: '$target' is neither a file nor a directory."
    return 1
  fi
}

#  >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/opt/homebrew/bin/micromamba'
export MAMBA_ROOT_PREFIX='/Users/zhengyangqi/micromamba'
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__mamba_setup"
else
  alias micromamba="$MAMBA_EXE" # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
