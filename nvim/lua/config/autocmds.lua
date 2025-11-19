local function augroup(name)
  return vim.api.nvim_create_augroup("config_" .. name, { clear = true })
end

-- automatically close dap-terminal on quitting neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      local name = vim.api.nvim_buf_get_name(buf)
      if name:match("%[dap%-terminal%]") then
        pcall(vim.api.nvim_buf_delete, buf, { force = true })
      end
    end
  end,
})

-- C
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("C"),
  pattern = { 'c', 'cpp', 'h', 'hpp', 'objc', 'objcpp', 'cuda', 'proto' },
  callback = function(ev)
    if not vim.g.Session_mkprg then
      SET_MKPRG(
        "cmake -GNinja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -B build -S . && ninja -C build")
    end
    vim.opt.shiftwidth = 4
    vim.opt.commentstring = "// %s"
    vim.keymap.set('n', '<leader>cs', '<cmd>LspClangdSwitchSourceHeader<cr>',
      { buffer = ev.buf, desc = 'Switch to source/header' })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("Swift"),
  pattern = { 'swift' },
  callback = function()
    if not vim.g.Session_mkprg then
      if vim.fn.file_readable(".run") == 1 then
        SET_MKPRG("./.run")
      else
        SET_MKPRG("swift build && swift run")
      end
    end
    vim.opt.commentstring = "// %s"
  end,
})

-- WASM
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("WASM"),
  pattern = { 'wat' },
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.commentstring = ";; %s"
  end,
})

-- wrap for markdown only
vim.cmd [[ au BufEnter *.md set wrap ]]
vim.cmd [[ au BufLeave *.md set nowrap ]]

-- recognize glsl
vim.cmd [[ au BufNewFile,BufRead *.glsl,*.vert,*.tesc,*.tese,*.frag,*.geom,*.comp set filetype=glsl ]]
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("GLSL"),
  pattern = { 'glsl' },
  callback = function(ev)
    vim.opt.commentstring = "// %s"

    -- get current file and swap extensions
    vim.keymap.set('n', '<leader>cs', function()
      local file = vim.fn.expand("%:r")
      local ext = vim.fn.expand("%:e")
      ext = ext == "vert" and "frag" or "vert"
      file = file .. '.' .. ext
      if vim.fn.file_readable(file) == 1 then
        vim.cmd('e ' .. file)
      else
        print("File not found: " .. file)
      end
    end, { buffer = ev.buf, desc = 'Switch to vert/frag' })
  end,
})

-- recognize wgsl
vim.cmd [[ au BufNewFile,BufRead *.wgsl set filetype=wgsl ]]

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
