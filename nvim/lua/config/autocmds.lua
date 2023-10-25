local function augroup(name)
  return vim.api.nvim_create_augroup("config_" .. name, { clear = true })
end

-- automatically close terminal
-- autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif
vim.api.nvim_create_autocmd("TermClose", {
    callback = function()
       vim.cmd("bwipeout")
    end
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("C"),
  pattern = { 'c', 'cpp', 'h', 'hpp', 'objc', 'objcpp', 'cuda', 'proto' },
  callback = function(ev)
    vim.opt.commentstring = "// %s"
    vim.keymap.set('n', '<leader>cs', '<cmd>ClangdSwitchSourceHeader<cr>', { buffer = ev.buf, desc = 'Switch to source/header' })
  end,
})

-- recognize wgsl
vim.cmd[[ au BufNewFile,BufRead *.wgsl set filetype=wgsl ]]

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "toggleterm",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
 group = augroup("auto_create_dir"),
 callback = function(event)
   if event.match:match("^%w%w+://") then
     return
   end
   local file = vim.loop.fs_realpath(event.match) or event.match
   vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
 end,
})

-- Neorg - Update index on load
-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("Neorg"),
--   pattern = { 'notes/index.norg' },
--   callback = function()
--     vim.cmd[[<esc>gg0jd}<cmd>Neorg generate-workspace-summary<cr>]]
--   end,
-- })