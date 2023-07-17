local G = require ('G')

G.g.mapleader = " "
G.g.maplocalleader = " "

G.map({
    -- -------------------------------插入模式------------------------------- --
    -- 设置退出insert模式为"jk"
    { 'i', 'jk',                    '<ESC>',                            {} },
    
    -- -------------------------------视觉模式------------------------------- --
    -- 单行或者多行移动
    { 'v', '<C-p>',                 ":m '<-2<CR>gv=gv",                 {} },
    { 'v', '<C-n>',                 ":m '>+1<CR>gv=gv",                 {} },
    
    -- -------------------------------普通模式------------------------------- --
    -- 窗口
    { 'n', '<leader>sv',            '<C-w>v',                           {} },
    { 'n', '<leader>sh',            '<C-w>s',                           {} },

    -- 取消高亮搜索
    { "n", '<leader>nh',            ':nohl<CR>',                        {} },
})
