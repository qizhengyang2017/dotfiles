默认只有1000条history
echo $HISTSIZE
注意，`HISTSIZE` 变量只能控制缓冲区中的历史记录数量，如果需要控制 `.bash_history` 文件存储的最大记录数，可以通过 `HISTFILESIZE` 进行控制

```shell
# 命令记录
# 2021-03-04
export HISTSIZE=50000
export HISTFILESIZE=1000000

# 2021年06月07
# https://segmentfault.com/a/1190000039858269
export HISTFILE=~/my_bash_history

# 实时追加history到文件 https://blog.csdn.net/m0_38020436/article/details/78730631
export PROMPT_COMMAND="history -a"
```

ctrl+R不会实时读取.bash_history文件

history -w：将内存中的历史记录写入 .bash_history 文件。
history -r：从 .bash_history 文件重新读取历史记录并加载到内存中。


```shell
#conda 

export PATH="/public/home/zyqi/anaconda3/bin:$PATH"
source activate new
```



```shell
# prompt string one, shell 提示符
PS1="\[\033[0;32m\]\A \[\033[0;31m\]\u\[\033[0;34m\]@\[\033[0;35m\]\h\[\033[0;34m\]:\[\033[00;36m\]\w\[\033[0;33m\] \n$\[\033[0m\]"
```



```shell
# function
# search script
search()
{
grep --exclude-dir=\.ipynb_checkpoints --include=\*.{r,ipynb,py,sh} -nR . -e "$1"
}

# get col
gc()
{
  head -n 1 $1|awk '{print NF}'
}

# mkdir and enter it
mkcd()
{
  mkdir -p "$1" && cd "$1"
}

# find process
function p(){
   ps ux | grep -i $1 | grep -v grep
}
```


```shell
# User specific aliases and functions
alias l="ll -hrt"
alias les="less -S"
alias s="source ~/.bashrc"
# 排序
alias b="bjobs|awk 'NR==1 {print} NR>1 {print | \"sort\"}'"

alias bh="bhosts|grep ok"
alias lsf="echo -e '#BSUB -J \n#BSUB -n 1\n#BSUB -R span[hosts=1]\n#BSUB -o %J.out\n#BSUB -e %J.err\n'"
alias bss="bsub -q normal -o %J.out -e %J.err"
#alias his="history | cut -c 8-|tail -n " # 不带行号的历史记录
alias his="cat ~/my_bash_history|tail -n"
alias hs="cat ~/my_bash_history|grep"
alias semi="cd ~/semi_wild/results"
alias bbjobs='bjobs -o "jobid:10 user:6 stat:6 queue:6 exec_host:10 job_name:10  max_mem:14 submit_time:12"'
```


```shell
#Language
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
```
