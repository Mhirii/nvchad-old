local config = function()
  local status_ok, harpoon = pcall(require, "harpoon")
  if not status_ok then
    return
  end
  harpoon:setup {}

  -- basic telescope configuration
  local conf = require("telescope.config").values
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
  end

  vim.keymap.set("n", "<C-e>", function()
    toggle_telescope(harpoon:list())
  end, { desc = "Open harpoon window" })
  return {
    keys = {
      {
        "<leader>mh",
        function()
          -- local harpoon = require "harpoon"
          harpoon:list():append()
        end,
        desc = "Harpoon Add File",
      },
    },
  }
end

return config
