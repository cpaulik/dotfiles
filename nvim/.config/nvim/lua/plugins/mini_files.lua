return {
  "nvim-mini/mini.files",
  config = function()
    local MiniFiles = require("mini.files")

    MiniFiles.setup({
      mappings = {
        go_in = "L",
        go_in_plus = "l",
      },
    })

    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local cur_target = MiniFiles.get_explorer_state().target_window
        local new_target = vim.api.nvim_win_call(cur_target, function()
          vim.cmd(direction .. " split")
          return vim.api.nvim_get_current_win()
        end)

        MiniFiles.set_target_window(new_target)

        -- Immediately open the file in the new split
        MiniFiles.go_in()

        -- Close mini files after opening
        MiniFiles.close()
      end

      -- Adding `desc` will result into `show_help` entries
      local desc = "Split " .. direction
      vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak keys to your liking
        map_split(buf_id, "<C-s>", "belowright")
        map_split(buf_id, "<C-l>", "vertical belowright")
        map_split(buf_id, "<C-t>", "tab")
      end,
    })
  end,
}
