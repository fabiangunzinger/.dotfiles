local present, lualine = pcall(require, "lualine")
if not present then
  return
end

-- Show only first letter of active mode
local function simplifiedMode(str)
  return "  " .. (str == "V-LINE" and "VL" or (str == "V-BLOCK" and "VB" or str:sub(1, 1)))
end

-- Show total number of lines for cursor location
local function customLocation(str)
  return string.gsub(str, "%w+", "%1" .. "/%%L", 1)
end

-- Add icon for progress
local function customProgress(str)
  return " " .. str
end

-- Show macro recording messages
local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "Recording @" .. recording_register
  end
end

-- Show name of active lsp
local show_lsp_name = {
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    else
      msg = ""
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          if msg == "" then
            msg = client.name
          else
            msg = msg .. ", " .. client.name
          end
        end
      end
    end
    return msg
  end,
  icon = " LSP:",
  color = { fg = "#957fb8" },
}

-- Custom date and time format
local CustomDatetime = function()
  return os.date("%d %b, %I:%M %p")
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },

  winbar = {
    lualine_a = {},
    lualine_b = {
      show_lsp_name,
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
    },
    lualine_c = {"searchcount"},
    lualine_x = {
      "encoding",
      "filetype",
    },
    lualine_y = {
      {
        "location",
        fmt = customLocation,
      },
    },
    lualine_z = {
      {
        "progress",
        fmt = customProgress,
      },
    },
  },

  inactive_winbar = {
    lualine_a = {},
    lualine_b = { { "filename", path = 0 } },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { { "location", fmt = customLocation }},
    lualine_z = {},
  },

  sections = {
    lualine_a = {
      {
        "mode",
        fmt = simplifiedMode,
      },
    },
    lualine_b = {
      {
        "branch",
        icon = "",
      },
      {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
      },
      {
        "macro-recording",
        color = {
          fg = "#FF9E3B",
        },
        fmt = show_macro_recording,
      },
    },
    lualine_c = {
      {
        "filename",
        path = 3,
        symbols = {
          modified = "[+]",
          readonly = "[]",
          unnamed = "[No Name]",
        },
      },
    },
    lualine_x = {
      {
        "datetime",
        fmt = CustomDatetime
      }
    },
    lualine_y = {
      {
        "buffers",
        mode = 4,
        show_filename_only = true,
        max_length = vim.o.columns * 1 / 2
      },
    },
    lualine_z = {
      { "tabs" },
    },
  },
  inactive_sections = {},
  tabline = {},
  extensions = {
    "aerial",
    "fugitive",
    "nvim-tree",
    "neo-tree",
    "quickfix",
    "toggleterm",
  },
})


vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    lualine.refresh({
      place = { "statusline" },
    })
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    local M = {sleep = 0, timer = nil}
    M.timer = vim.loop.new_timer()
    M.timer:start(30, M.sleep,
      vim.schedule_wrap(function()
        lualine.refresh({
          place = { "statusline" },
        })
      end)
    )
  end,
})
