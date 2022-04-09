local M = {}

function M.buf_keymap(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    mode,
    lhs,
    rhs,
    vim.tbl_extend('keep', opts or {}, { noremap = true, silent = true })
  )
end

function M.keymap(mode, lhs, rhs, opts)
    vim.api.nvim_set_keymap(
        mode,
        lhs,
        rhs,
        vim.tbl_extend('keep', opts or {}, { noremap = true, silent = true })
    )
end

function M.nmap(lhs, rhs, opts)
    M.keymap('n', lhs, rhs, opts)
end

function M.imap(lhs, rhs, opts)
    M.keymap('i', lhs, rhs, opts)
end

function M.vmap(lhs, rhs, opts)
    M.keymap('v', lhs, rhs, opts)
end

return M
