# 生信软件

export CLASSPATH="/home/zqi/work/software/MCScanX/downstream_analyses"
PATH=~/work/07_paml/pal2nal.v14:$PATH
PATH=~/work/sex_chr/06_codeml/scripts/ParaAT2.0:~/work/sex_chr/06_codeml/scripts/KaKs_Calculator3.0/src:$PATH
PATH=~/work/sex_chr/06_codeml/scripts:~/work/sex_chr/06_codeml/scripts/pal2nal_v14:$PATH
PATH=~/work/biosoftware/NGenomeSyn/bin:$PATH

export PATH

# ==> function <==

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
    cp --preserve=timestamps "$target" "$backup" && echo "File backup created: $backup"
  elif [ -d "$target" ]; then
    mv "$target" "$backup" && echo "Directory backup created: $backup"
  else
    echo "Error: '$target' is neither a file nor a directory."
    return 1
  fi
}

lles() {
  local dir="${1:-.}"
  ls -lrth --color=always "$dir" | less -R
}

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

search() {
  grep --exclude-dir=\.ipynb_checkpoints --include=\*.{r,ipynb,py,sh} -nR . -e "$1"
}

# get col
gc() {
  head -n 1 $1 | awk '{print NF}'
}

# mkdir and enter it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# find process
function p() {
  ps ux | grep -i $1 | grep -v grep
}

# ==> alias <==

alias r=radian
alias python="python3"
#alias pip="pip3"

alias his="cat ~/.bash_history|tail -n"
alias hs="cat ~/.bash_history|grep -i"

alias l="ls --color=auto -lhrt"

# slurm
alias mysbatch="sbatch --mem=30G -t 4-00:00:00 -o %j.out -e %j.err --partition=workq --mail-type=begin,end,fail --mail-user=qizhengyang17@qq.com"
alias s="squeue -u zqi"
alias mysrun="srun --nodes=1 --ntasks=1 --mem=20G --time=03:00:00 --pty bash"
alias mysrun_vscode="srun --nodes=1 --nodelist=n010 --ntasks=1 --mem=30G --time=12:00:00 --pty bash"

alias trash-put="trash-put --trash-dir /work/user/zqi/.Trash"
alias trash-list="trash-list --trash-dir /work/user/zqi/.Trash"
alias trash-restore="trash-restore --trash-dir /work/user/zqi/.Trash"
alias trash-empty="trash-empty --trash-dir /work/user/zqi/.Trash"
alias trash-rm="trash-rm --trash-dir /work/user/zqi/.Trash"

alias mv="mv -i"
alias cp="cp -pi"
alias les="less -S"
alias rm="rm -i"

# Ghostty使用
# export TERM=xterm-256color

alias ta='tmux new -Asmain'
alias tc='tmux -CC new -Asmain'
alias td='tmux detach'
