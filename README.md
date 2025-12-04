## git


```bash
# 查看远程的情况，确定是否需要同步。
git fetch origin
git diff main origin/main

git status
git log origin/main

# 获取并自动合并
git pull origin main
git pull
```


如果本地先修改了，那么本地先提交

使用--rebase 拉取远程最新的提交，然后把你本地的提交“接”在它后面(不产生多余 merge)。

```bash
git pull --rebase origin main
git push origin main
```
