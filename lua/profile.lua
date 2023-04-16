local G = require('G')

-- 设置编码
G.opt.encoding = 'utf-8'

-- 行结尾可以跳到下一行
G.opt.whichwrap = 'b,s,[,],h'

-- 允许隐藏被修改过的buffer
G.opt.hidden = true

-- 使用可视铃声而不是响铃
G.opt.vb = true

-- 命令行补全以增强模式
G.opt.wildmenu = true

-- 高亮搜索
G.opt.hlsearch = true

G.opt.showmatch = true

-- 弹出菜单的最大高度
G.opt.pumheight = 10

-- 正常显示文本(是否显示可隐藏文本)
G.opt.conceallevel = 3 

-- 保存撤销文件的位置
G.optundodir = os.getenv('HOME') .. '/.config/nvim/cache/undodir'

-- mkview 存储文件的所在目录
G.opt.viewdir = os.getenv('HOME') .. '/.config/nvim/cache/viewdir'

-- 设置高亮当前行
G.opt.cursorline = true

-- 列不超过80
G.opt.colorcolumn = "80"

-- 显示行号
G.opt.number = true

-- 相对行号
G.opt.relativenumber = true

-- 行号宽度
G.opt.numberwidth = 2

-- 启用光标
G.opt.mouse = "a"

-- 系统剪切板
G.opt.clipboard = 'unnamed,unnamedplus'

-- 缩进4个空格等于一个Tab
G.opt.tabstop = 4 

-- 计算空格数
G.opt.softtabstop = 4

-- 移动宽度
G.opt.shiftwidth = 4

-- >> << 时移动长度
G.opt.shiftround = true

-- 使用适当数量的空格插入
G.opt.expandtab = true

-- 始终设置自动缩进
G.opt.autoindent = true

-- 自动缩进(C语言)
G.opt.smartindent = true

-- 禁止拆分行
G.opt.wrap = false

-- split window 从下边和右边出现
G.opt.splitbelow = true
G.opt.splitright = true

-- 关闭备份功能
G.opt.backup = false
G.opt.swapfile = false

-- 终端真颜色
G.opt.termguicolors = true

-- 左侧多一列
G.opt.signcolumn = 'yes'

-- 光标样式
G.cmd([[
    let &t_SI .= '\e[5 q'
    let &t_EI .= '\e[1 q'
    let &t_vb = ''
    let &t_ut = ''
]])

function MagicFoldText()
    local spacetext = ("        "):sub(0, G.opt.shiftwidth:get())
    local line = G.fn.getline(G.v.foldstart):gsub("\t", spacetext)
    local folded = G.v.foldend - G.v.foldstart + 1
    local findresult = line:find('%S')
    if not findresult then return '+ folded ' .. folded .. ' lines ' end
    local empty = findresult - 1
    local funcs = {
        [0] = function(_) return '' .. line end,
        [1] = function(_) return '+' .. line:sub(2) end,
        [2] = function(_) return '+ ' .. line:sub(3) end,
        [-1] = function(c)
            local result = ' ' .. line:sub(c + 1)
            local foldednumlen = #tostring(folded)
            for _ = 1, c - 2 - foldednumlen do result = '-' .. result end
            return '+' .. folded .. result
        end,
    }
    return funcs[empty <= 2 and empty or -1](empty) .. ' folded ' .. folded .. ' lines '
end
