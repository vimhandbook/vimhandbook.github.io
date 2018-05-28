# Abbreviations 快速输入

在开发时候我们更希望把时间花在思考怎样优化代码性能，而不是浪费在做重复无意义的事情上，我们先来看一个场景

![abbrev](https://wxnacy.com/images/abbreviations.gif)

试想一下，如果手动输入上边这些代码，我需要多长时间呢，而且可能是需要重复很多的工作。说到这里我又要吐槽 Java 了，想想同样的工作 Python 需要做什么呢

```python
print('Hello World')
```

是的，只需要一行就可以了，当然这是脚本语言和编译语言的大差异。

## Hello World

程序员学什么最开始都是 `Hello World` ，这不是必要的，只是我们切入一点的习惯，如何使用 Abbreviations 快速输入 `Hello World` ，是的，及时这么短的语句我也不想每次手动输入，正所谓***懒是第一生产力***，实现很简单，编辑 `~/.vimrc` 文件

```vim
iabbrev hw Hello World
```

然后在输入 `hw` ，然后输入空格即可完成输入，是的就是这么简单，不过一定要记得，退出 `~/.vimrc` 重新进入 Vim 使配置生效

## 更复杂的使用

在截图中的 `Hello World` 就是通过这种方式快速输入的，接下来我们来探讨怎样重现预览中的效果，首先来看 `class` 的生成

```vim
iabbrev class public class{}<esc>i<cr><esc>k$Fsli
```

先什么都不要管，直接复制到 `~/.vimrc` 中，自己输入 `class` 试验一下看看效果，第一次看的话你可能会感觉懵逼，不过不要着急，我们一步步来解释

- `publich class{}` 不用解释，就是简单输入
- `<esc>` 代表输入键盘的 esc 键，这时光标会在大括号中间
- 接下来 `i` 进入插入模式，`<cr>` 输入回车，再次输入 esc 退出插入模式后
- `k` 光标上移一行，`$` 光标来到行尾，`F` 反向查找第一个 s 字母，`l` 右移动一格，`i` 再次进入插入模式

看，全部是都是 Vim 的基本操作，我们只是不想每次都手动输入而已。

接下来 `main` 方法和 `print` 方法

```vim
iabbrev main public static void main(String args[]){}<esc>i<cr>
iabbrev print System.out.println()<esc>i""<esc>i
```

这个更简单一些我就不解释了，这样通过几个关键词我们就可以完成繁琐重复的工作，你可以试试更复杂的输入 `classm` 将 class 类和 main 方法同时输出，那样更方便，就当是个练习，因为想要熟练，唯一方法就是不断的练习

## Keyword Characters

在 `hw` 后输入空格就可以出现`Hello World` ，这已经很方便了，但你一定会问是不是可以用其他字符替换空格，答案是肯定的，运行命令

```bash
:set iskeyword?

iskeyword=@,48-57,_,192-255     " 得到该结果
```

结果会让人很费解，其实 `keyword characters` 就是代表以下含义

- 下划线字符 `(_).`
- 所有字母字符，包括大小写。
- ASCII值在48到57之间的字符（数字0-9）。
- ASCII值在192到255之间的字符（一些特殊ASCII字符）。

这样在 `hw` 之后输入 `@` 也可以达到目的，但是有一点，`@` 也会出现在行尾，就像空格一样，如果这样的话，我建议还是使用空格比较好，因为很多时候空格本来就是要出现在单词后边的，这一段的完整描述可以通过 `:help isfname` 命令查看。

现在，为你代码添加 Abbreviations 配置吧

2018-05-28 发布
