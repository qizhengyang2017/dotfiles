选择历史命令的时候经常会卡住是怎么回事
## git 插件

```bash
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z)
```

```shell
gd='git diff'
gdca='git diff --cached'
gdct='git describe --tags $(git rev-list --tags --max-count=1)'
gdcw='git diff --cached --word-diff'
gds='git diff --staged'
gdt='git diff-tree --no-commit-id --name-only -r'
gdup='git diff @{upstream}'
gdw='git diff --word-diff'
```

https://www.notion.so/git-alias-10bf1030dd5980b7a038e92a38da746f?pvs=4

## autojump

```shell
plugins=(git autojump)
```

z 插件的作用类似（使用autojump替代了）：
- 直接输入 z，紧跟 tab 键
- 输入形如 z substring，即提供子字符串，它们将所有匹配 substring 的目录都列举出来。
## zplug管理插件

- powerlevel10k 主题
- zsh-autocomplete 显示命令参数
- zsh-completions
- zsh-autosuggestions 历史命令
- zsh-syntax-highlighting

```shell fold
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

### zsh-autocomplete

>This plugin for Zsh adds real-time type-ahead autocompletion to your command line, similar to what you find desktop apps. While you type on the command line, available completions are listed automatically; no need to press any keyboard shortcuts. Press Tab to insert the top completion or ↓ to select a different one.

## 参考

1. [marlonrichert/zsh-autocomplete: 🤖 Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type autocompletion.](https://github.com/marlonrichert/zsh-autocomplete)
2. [zsh-users/zsh-completions: Additional completion definitions for Zsh.](https://github.com/zsh-users/zsh-completions)
3. [zplug/zplug: :hibiscus: A next-generation plugin manager for zsh](https://github.com/zplug/zplug)
4. https://github.com/wting/autojump
5. https://mp.weixin.qq.com/s/0Gowu2tTsTvr0z_mUsWrig
