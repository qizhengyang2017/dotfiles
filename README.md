## git


```shell
# 查看远程的情况，确定是否需要同步。
git fetch origin
git status
git log origin/main

# 获取并自动合并
git pull origin main
```


## 目录结构

```
.
├── README.md
├── genobioinfo
│   ├── bash
│   │   ├── bashrc
│   │   └── env.sh
│   ├── nvim
│   │   ├── LICENSE
│   │   ├── README.md
│   │   ├── init.lua
│   │   ├── lazy-lock.json
│   │   ├── lazyvim.json
│   │   ├── lua
│   │   │   ├── config
│   │   │   │   ├── autocmds.lua
│   │   │   │   ├── keymaps.lua
│   │   │   │   ├── lazy.lua
│   │   │   │   └── options.lua
│   │   │   └── plugins
│   │   │       └── example.lua
│   │   └── stylua.toml
│   ├── tmux
│   │   ├── tmux.conf
│   │   └── tmux.conf.local
│   └── vim
│       └── vimrc
├── hzau_cluster
│   ├── bashrc
│   │   └── bashrc
│   ├── nvim
│   │   ├── init.lua
│   │   └── lua
│   │       └── options.lua
│   ├── tmux
│   │   └── tmux.conf
│   └── vim
│       └── vimrc
├── mac
│   ├── iterm
│   │   ├── Default.json
│   │   ├── Default1.json
│   │   ├── Default2025-11-07.json
│   │   ├── com.googlecode.iterm2.plist
│   │   └── iterm2_Default.json
│   ├── karabiner
│   │   └── karabiner.json
│   ├── vscode
│   │   ├── keybindings.json
│   │   └── settings.json
│   └── zsh
│       ├── env.sh
│       └── zshrc.sh
└── push.sh

20 directories, 33 files
```
