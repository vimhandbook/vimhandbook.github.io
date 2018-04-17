# vimgrep 全局搜索

我们现在已经学习大量的知识来应付文本编辑，在单个文件中开发完全没有问题了，但是在项目中呢？

一个开发项目是有很多文件构成的，在 IDE 中都有全局搜索的功能，在 Vim 中我们还没有提及这个问题。我见过很多人使用 Vim 都是单文件编辑，然后通过记忆文件名退出进入。不是不行，但总感觉很不方便，尤其是我想要知道某个关键词在哪些文件中出现的时候。

在 Linux 系统中搜索文本内容通常使用 `grep` 命令，而 Vim 中有 `vimgrep` 命令。

## 预览

![/images/vimgrep.gif](https://wxnacy.com/images/vimgrep.gif)

## vimgrep

`vimgrep` 是直接在 `command` 模式中使用的，它可以查找当前目录下文件中包含关键词的行，默认自动跳转到第一个符合目标的位置，就像预览中演示的那样。

### 命令

```bash
:vim[grep][!] /{pattern}/[g][j] {file} ...
:vim[grep][!] {pattern} {file} ...
```

### 含义

- `vim` 可作为 `vimgrep` 的缩写
- `!` 可紧随 `vimgrep` 之后，表示强制执行该命令
- 索引的关键字 `pattern` 放在了两个 `/` 中间，并且支持正则表达式
- `g, j` 可选。 如果添加 `g`，将显示重复行， 如果添加 `j`，`Vim` 将不会自动跳转到第一个匹配的行（可能是别的文件）
- `file` 可以是正则文件名，也可以是多个确定的文件名

### 使用

```bash
:vimgrep /user/g **
```

使用该命令可以查找当前目录下所有文件中包含 `user` 字符串的文件，并跳转到第一个匹配的文件，同时所有搜索结果会显示在 `Quickfix` 中，使用 `:cw, :copen` 可以打开该列表

更多命令

```bash
:cnext, :cn         # 当前页下一个结果
:cprevious, :cp     # 当前页上一个结果
:clist, :cl         # 使用 more 打开 Quickfix 窗口
:copen, :cope, :cw  # 打开 Quickfix 窗口，列出所有结果
:ccl[ose]           # 关闭 Quickfix 窗口。
```

## lvimgrep

`lvimgrep` 与 `vimgrep` 搜索命令基本一样，不同点在于搜索结果不是显示在 `Quickfix` 中而是显示在 `location-list` 中

### quickfix-list vs location-list

`quickfix list` 是全局的，相对于窗口而言，不同的窗口共用一个 `quickfix list`，可以使用 `:cw` 或者 `:copen` 打开；而 `loaction list` 是局部于某个特定窗口的，即不同窗口的 `location list` 可以不同，使用 `:lw` 或者 `:lopen` 命令打开。（请使用 `:help quickfix` 和 `:help location-list`命令获取帮助）

在 Vim 命令行模式下输入 `:h vimgrep` 可以看到 `vimgrep` 更多使用文档
