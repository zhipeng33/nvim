local api = vim.api

-- 光标回到上次位置
vim.api.nvim_command([[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]])

-- 取消换行注释
-- 用o换行不要延续注释
api.nvim_create_augroup('Sapnvim_comments_autocmd_group', { clear = true })
api.nvim_create_autocmd({ 'BufEnter' }, {
  desc = "O and o, do not continue with the comment, but continue when you hit the enter key.",
  pattern = { '*' },
  group = 'Sapnvim_comments_autocmd_group',
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
        - 'o' -- O and o, don't continue comments
        + 'r' -- But do continue when pressing enter.
  end,
})

api.nvim_create_autocmd('FileType', {
  desc = "Unlist quickfist buffers",
  group = api.nvim_create_augroup('unlist_quickfist', { clear = true }),
  pattern = 'qf',
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

api.nvim_create_autocmd({ 'VimResized', 'WinEnter', 'WinNew', 'WinClosed', 'WinResized' }, {
  desc = "Dynamically adjust scrolloff and sidescrolloff based on window size changes",
  callback = function()
    vim.opt.scrolloff = math.ceil(vim.api.nvim_win_get_height(0) / 2)
    vim.opt.sidescrolloff = math.ceil(vim.api.nvim_win_get_width(0) / 4)
  end,
})

if vim.fn.has('wsl') == 1 then
  api.nvim_create_augroup('Sapnvim_yank', { clear = true })
  api.nvim_create_autocmd('TextYankPost', {
    desc = "Copying text using windows clip.exe",
    group = 'Sapnvim_yank',
    callback = function()
      vim.fn.system('/mnt/c/windows/system32/clip.exe ', vim.fn.getreg('"'))
    end,
  })
end

-- Highlight on yank
api.nvim_create_augroup('Sapnvim_highlight_yank', { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight on yank",
  group = 'Sapnvim_highlight_yank',
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})
-- 根据文件类型设置缩进
-- vim.cmd [[
--   augroup Indentation
--     autocmd!
--     autocmd FileType python,java,ruby,go,swift,rust,php,html,css setlocal shiftwidth=4
--   augroup END
-- ]]

-- -- 自动在 nvim 启动时运行该函数
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = utils.open_the_current_directory,
-- })
