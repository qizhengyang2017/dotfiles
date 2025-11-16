# zsh插件配置

## zoxide

使用方式
1. 可以替代`cd`
2. `z foo<SPACE><TAB>`利用了fzf

```bash
z foo              # cd into highest ranked directory matching foo
z foo bar          # cd into highest ranked directory matching foo and bar
z foo /            # cd into a subdirectory starting with foo

z ~/foo            # z also works like a regular cd command
z foo/             # cd into relative path
z ..               # cd one level up
z -                # cd into previous directory

zi foo             # cd with interactive selection (using fzf)

z foo<SPACE><TAB>  # show interactive completions (zoxide v0.8.0+, bash 4.4+/fish/zsh only)
```

替代autojump

```bash
brew install zoxide
```

zshrc中写入
```bash
eval "$(zoxide init zsh)"
```


hzau集群也是用的zoxide

```bash
eval "$(zoxide init bash --cmd j)"
```


https://github.com/qizhengyang2017/new_analysis1124/issues/14


genobioinfo用的`autojump`

## autojump

```shell
plugins=(git autojump)
```

## zplug管理插件

- powerlevel10k 主题
- zsh-autocomplete 显示命令参数
- zsh-completions
- zsh-autosuggestions 历史命令
- zsh-syntax-highlighting

```bash
source ~/.zplug/init.zsh
#zplug 'plugins/git', from:oh-my-zsh, if:'which git'
zplug "romkatv/powerlevel10k", as:theme, depth:1
#zplug "plugins/vi-mode", from:oh-my-zsh
#zplug "wting/autojump"
zplug "marlonrichert/zsh-autocomplete"
zplug "zsh-users/zsh-completions", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
#zplug load --verbose
zplug load

# zsh-autocomplete的配置
# Make ← and → always move the cursor on the command line
bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char
```

defer=2的含义
- If the value is 2 or above, zplug will source the plugin after `compinit` (see also [#26](https://github.com/zplug/zplug/issues/26))

什么是compinit？
- compinit 是 zsh 的补全系统初始化命令 chatGPT



### zsh-autosuggestions

- 根据历史命令自动显示灰色建议

这个插件会和zsh-autocomplete的功能有冲突，造成：
- 造成选择历史命令的时候经常会卡住
- 选择完历史命令需要按enter，才能让光标在命令上移动
![](../attachments/Screenshot%202025-11-16%20at%2012.02.52.png)
![](../attachments/20251116134713-不使用autocomplete-按tab也有提示.png)
### zsh-autocomplete

不使用

>This plugin for Zsh adds real-time type-ahead autocompletion to your command line, similar to what you find desktop apps. While you type on the command line, available completions are listed automatically; no need to press any keyboard shortcuts. Press Tab to insert the top completion or ↓ to select a different one.

![](../attachments/Screenshot%202025-11-16%20at%2011.59.33.png)
## 参考

1. [marlonrichert/zsh-autocomplete: 🤖 Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type autocompletion.](https://github.com/marlonrichert/zsh-autocomplete)
2. [zsh-users/zsh-completions: Additional completion definitions for Zsh.](https://github.com/zsh-users/zsh-completions)
3. [zplug/zplug: :hibiscus: A next-generation plugin manager for zsh](https://github.com/zplug/zplug)
4. https://github.com/wting/autojump
5. https://mp.weixin.qq.com/s/0Gowu2tTsTvr0z_mUsWrig

