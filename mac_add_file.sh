
# vscode
cp $HOME/Library/Application\ Support/Code/User/settings.json mac/vscode
cp $HOME/Library/Application\ Support/Code/User/keybindings.json mac/vscode


# zsh
cp $HOME/.zshrc mac/zsh/zshrc.sh


# iterm2
cp ~/Library/Preferences/com.googlecode.iterm2.plist mac/iterm

# karabiner
# mkdir mac/karabiner
cp ~/.config/karabiner/karabiner.json mac/karabiner


# vim

cp ~/.vimrc mac/vim/vimrc


# nvim
cp -rp ~/.config/nvim mac


# Rime
# mkdir -p mac/Rime
cp ~/Library/Rime/squirrel.custom.yaml mac/Rime
cp ~/Library/Rime/default.custom.yaml mac/Rime
cp ~/Library/Rime/double_pinyin.custom.yaml mac/Rime

## 查看配置
# defaults read com.googlecode.iterm2

# echo "# dotfiles" >>README.md
# git init
# git add README.md
# git commit -m "first commit"
# git branch -M main
# git remote add origin git@github.com:qizhengyang2017/dotfiles.git
# git push -u origin main
