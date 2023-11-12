-- local function set_mkprg(str)
--   if str then
--     vim.g.Session_mkprg = str
--     vim.o.makeprg = [[tmux split -h "trap 'echo \"\"' INT; ]] .. vim.g.Session_mkprg .. [[; trap - INT; read -s -k '?Press any key to continue.'"]]
--   end
-- end

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
    if not vim.g.Session_mkprg then
      SET_MKPRG("cmake -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -B build -S . && ninja -C build")
    end
    vim.opt.commentstring = "// %s"
    vim.keymap.set('n', '<leader>cs', '<cmd>ClangdSwitchSourceHeader<cr>', { buffer = ev.buf, desc = 'Switch to source/header' })
  end,
})

-- wrap for markdown only
vim.cmd[[ au BufEnter *.md set wrap ]]
vim.cmd[[ au BufLeave *.md set nowrap ]]

-- recognize glsl
vim.cmd[[ au BufNewFile,BufRead *.glsl,*.vert,*.tesc,*.tese,*.frag,*.geom,*.comp set filetype=glsl ]]

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
