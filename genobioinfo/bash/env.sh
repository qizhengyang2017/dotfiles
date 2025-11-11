alias r=radian


# 生信软件

PATH=~/work/sex_chr/06_codeml/scripts/ParaAT2.0:~/work/sex_chr/06_codeml/scripts/KaKs_Calculator3.0/src:$PATH
PATH=~/work/sex_chr/06_codeml/scripts:~/work/sex_chr/06_codeml/scripts/pal2nal_v14:$PATH
PATH=~/work/biosoftware/NGenomeSyn/bin:$PATH


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



# Ghostty使用
# export TERM=xterm-256color

alias ta='tmux new -Asmain'
alias tc='tmux -CC new -Asmain'
alias td='tmux detach'

# 配置fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# 解决cd ../** 不起作用
# https://github.com/cha0ran/fd-zh?tab=readme-ov-file#how-to-use
# export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_COMMAND="fd -I --type file --color=always" #不忽略.gitignore中的规则
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# autojump
[[ -s /home/zqi/.autojump/etc/profile.d/autojump.sh ]] && source /home/zqi/.autojump/etc/profile.d/autojump.sh

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/zqi/.local/bin/micromamba'
#export MAMBA_ROOT_PREFIX='/home/zqi/micromamba';
export MAMBA_ROOT_PREFIX='/home/zqi/work/micromamba'
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__mamba_setup"
else
	alias micromamba="$MAMBA_EXE" # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
