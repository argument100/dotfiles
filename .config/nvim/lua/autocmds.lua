-- タブのタイトルを現在のルートディレクトリと連動させる
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function ()
    if vim.bo.buftype == "terminal" then
      -- 現在のディレクトリのフルパスを取得
      local full_path = vim.fn.substitute(vim.fn.system("pwd"), "\n$", "", "")
      local dir_name = full_path:match("([^/]+)$")
      vim.o.titlestring = dir_name
      vim.o.title = true
    end
  end
})
