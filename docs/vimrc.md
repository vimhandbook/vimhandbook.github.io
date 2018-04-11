# vimrc 配置文件

很多人感觉 Vim 不如 IDE，通常是因为难看的界面和没那么方便的功能，而究其原因其实是因为他们都没有配好自己的 `vimrc` 文件，所有的 IDE 都有一个类似这样的文件，只是绝大多数情况下你都碰触不到，而学习 `vimrc` 则是你配置自己的 IDE 的一个开始。

## 快速配置

在学习 `vimrc` 之前，我们先来了解下怎样快速配置。

首先打开练习文件 `Object.java`，然后进入 `command` 模式

```vim
:set number
```

回车后，你会发现在编辑器的左边出现了行号。

这是我们配置编辑器的第一步，我们可以在 `command` 模式下配置然后预览我们的配置结果，但是当你退出文件再进来，会发现刚才的配置已经失效了，它只在当前缓冲区生效，而想要让配置长久生效，就需要将配置信息放入 `vimrc` 文件中，这样每次打开 Vim 都会读取配置文件。

## 了解 vimrc

Vim 读取配置的默认路径为 `~/.vimrc`，如果你的环境没有需要新建该文件

```bash
$ touch ~/.vimrc
```

我们在文件中输入设置行号的命令

```bash
$ vim ~/.vimrc

set number
```

然后退出文件，重新打开 `Object.java`，会发现行号的配置又生效了。每次使用 Vim 重新打开文件，新加的配置就会生效。

## 重新加载 vimrc

现在我们要在加一些改动，你要关掉当前文件再打开 `.vimrc` 吗？没必要，还记得分割屏幕吗。

```vim
:vsp ~/.vimrc
```

如此，我们可以一边编辑文件，一边修改配置了。

先加上这两行配置，并保存

```vim
set cursorline        			"突出显示当前行"
set cursorcolumn        		"突出显示当前列"
```

然后需要做在 `Object.java` 中生效，怎么做呢，退出然后重新进来？每次都这样你一定会烦死的，也会显得很蠢（虽然我曾经这样蠢了很久），我们有更好的方法。

在目标文件中执行如下命令就行了。

```vim
:source $MYVIMRC
```

`$MYVIMRC` 在 Vim 环境中代表了 `~/.vimrc` 的常量，这句话的意思就是重新加载配置文件，当然你也可以通过 `:source ~/.vimrc` 来实现。

## 常用的配置

```vim
set nocompatible				    " 去掉对vi的兼容，让vim运行在完全模式下
```

`set compatible` 就是让 vim 关闭所有扩展的功能，尽量模拟 vi 的行为。但这样就不应用 vim 的很多强大功能，所以一般没有什么特殊需要的话（比如执行很老的 vi 脚本），都要在 vim 的配置开始，写上 set nocompatible，关闭兼容模式。由于这个选项是最最基础的选项，会连带很多其它选项发生变动（称作副作用），所以它必需是第一个设定的选项。

```vim
syntax on                   " 开启语法高亮"
```

这个功能对开发尤其有用，Vim 本身是会对一些简单的关键词做高亮处理的，而很多插件对语法高亮也都依赖这个设置。

```vim
set history=2003            " 记录 Vim 历史操作的条数
```

Vim 内的所有操作都会在一个 `~/.viminfo` 中记录，该设置可以配置最多记录的条数。

```vim
set autoread                " 文件在vim外修改过自动重新载入
au CursorHold,CursorHoldI * checktime
```

默认情况下，外部修改了当前打开的文件，Vim 是不会自动重新载入的，加上这两条配置，Vim 会定时检查是否有外部改动并重载，如果改动不及时，你也可以通过 `:e` 手动加载。

```vim
set novisualbell          "关掉可视化响铃警报
set noerrorbells          "关掉错误警报
set visualbell t_vb=      "关掉警报
```

闹人的报警声还是挺烦人的，可以关掉它。

```vim
set tm=500
set t_Co=256
```

显示 256 色，很多主题插件都需要打开它。

```vim
filetype on                     " 开启文件类型检测
filetype plugin on              " 开启插件的支持
filetype indent on              " 开启文件类型相应的缩进规则
```

这个配置组非常有用，开启后 Vim 可以根据打开的文件格式显示不同的高亮、使用缩进等。不管是使用插件还是自己写插件对他非常依赖。你可以使用 `:filetype` 来查看当前文件是否开启文件检测

```vim
" encoding
set encoding=utf-8              " 打开文件时编码格式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1         "vim会根据该设置识别文件编码

set fileformat=unix    			    " 设置以unix的格式保存文件"
set fileencoding=utf-8          " 在保存文件时，指定编码
set termencoding=utf-8          " 终端环境告诉vim使用编码
set ffs=unix,dos,mac            " 在创建文件或写入时，这三种文件格式分别决定了行末要添加什么特殊字符，而在读入文件时，又分别决定了要从行末移去什么特殊字符。
set formatoptions+=m
set formatoptions+=B

" 主题
set background=dark       		  " 配色主题的色系,注意，这不是什么背景色！dark 是暗色系，light 是亮色系。
colorscheme desert              " 配色主题的名称,:coloscheme 后键入<tab>可以自动补全 比较喜欢的desert,peachpuff,torte,elfload,slate

" show
set number                      " 显示行号
set ruler						            " 显示当前光标行号和列
set wrap    					          " 设置折行 set nowrap 为不折行
set sidescroll=1                " 默认设置set sidescroll=0之下，当光标到达屏幕边缘时，将自动扩展显示1/2屏幕的文本。通过使用set sidescroll=1设置，可以实现更加平滑的逐个字符扩展显示。
set showcmd						          " 在屏幕右下角显示未完成的命令
set showmode					          " 显示当前vim模式
set showmatch    				        " 显示匹配的括号
set matchtime=1					        " 设置showmatch的效果时间，默认500ms，现在是100ms
set cursorline        			    " 突出显示当前行
set cursorcolumn        		    " 突出显示当前列
set colorcolumn=80              " 设置某一列高亮


" search
set smartcase					"搜索时，如果输入大写，则严格按照大小写搜索，如果小写，并设置了ignorecase，则忽略大小写
set ignorecase        			"搜索时忽略大小写"
set incsearch					"搜索时及时匹配搜索内容，需要回车确认
set hlsearch        			"高亮搜索项"

" tab
set expandtab                   "将<tab>符号转变为<space>空格
set smarttab					"配合shiftwidth使用，如果设置该值，在行首键入<tab>会填充shiftwidth的数值,其他地方使用tabstop的数值，不设置的话，所有地方都是用shiftwidth数值

" indent
set autoindent                  "换行自动缩进
set smartindent                 "缩进采用c语言风格
set shiftround                  "在一般模式下键入>>整个缩进shiftwidth的长度，<<反向操作,== 可以与上一行对齐，插入模式下C-T和C-D也可以左右启动
set shiftwidth=4                "缩进的空格数
set tabstop=4                   "键入<tab>的步长
set softtabstop=4                " insert mode tab and backspace use 4 spaces

" set mark column color
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" status line
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2   " 底部显示两行状态栏"


" select & complete
set selection=inclusive         "选择文本事，光标所在位置也会被选中
set selectmode=mouse,key

set scrolloff=5        			"距离顶部和底部5行"
set backspace=2					"任何情况允许使用退格键删除
set mouse=a       				"启用鼠标"

" 代码折叠
set foldlevelstart=99           "默认不折叠"
set foldmethod=indent           "按照缩紧折叠"
```

剩下这些配置也都很有用，你可以尝试着一个个配置上对比效果。Vim 的配置千变万化，这些只是部分基本配置，基本没有两个人的 `vimrc` 文件是完全相同，人们会根据当前的学习进度和自己的环境配置不同的样式和功能，这也是 Vim 迷人的地方，构建自己的 IDE，谁不想呢。

记住，在这个环节需要我们勤用 `:help` 查看帮助文档，比如 `:h showcmd` 它的讲解绝对任何人都专业。

在对 `vimrc` 有了初步的了解后，以后我们会逐步学习各种高效的配置，让我们的 Vim 越来越得心应手。

2018-04-09 写于北京
