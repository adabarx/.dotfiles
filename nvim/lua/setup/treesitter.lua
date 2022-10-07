-- RAINBOW PARENTHESES
local colors = require("catppuccin.palettes").get_palette "macchiato"
local color_hexs = {}
local banned_colors = {
    'text',
    --'teal',
    'overlay1',
    --'maroon',
    --'yellow',
    --'green',
    'crust',
    --'sky',
    --'sapphire',
    --'blue',
    --'peach',
    'lavender',
    'subtext0',
    'subtext1',
    'overlay2',
    -- 'rosewater',
    -- 'red',
    -- 'flamingo',
    -- 'pink',
    -- 'mauve',
    'overlay0',
    'mantle',
    'surface2',
    'surface1',
    'base',
    'surface0',
}

local not_in_table = function(table, element)
  for _, value in pairs(table) do
    if value == element then
      return false
    end
  end
  return true
end

local shuffle = function(tbl)
  for i = #tbl, 2, -1 do
    local j = math.random(i)
    tbl[i], tbl[j] = tbl[j], tbl[i]
  end
  return tbl
end

-- for color, hex in pairs(colors) do
--     print(color, ": ", hex)
-- end
for color, hex in pairs(colors) do
    if not_in_table(banned_colors, color) then
        table.insert(color_hexs, hex)
    end
end

color_hexs = shuffle(color_hexs)

-- Treesitter stuff
require 'nvim-treesitter.configs'.setup {
    ignore_install = { 'phpdoc' },
    context_commentstring = {
        enable = true
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = color_hexs, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
}

require('nvim-ts-autotag').setup()
