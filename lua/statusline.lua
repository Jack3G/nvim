local gl = require("galaxyline")
local fileinfo = require("galaxyline.provider_fileinfo")
local colours = require("galaxyline.theme").default
local condition = require("galaxyline.condition")
local whitespace = require("galaxyline.provider_whitespace")
local buffer = require("galaxyline.provider_buffer")

gl.short_line_list = {"NvimTree"}


gl.section.left[1] = {
    modeIndicator = {
        provider = function()
            local mode_colours = setmetatable({
                n = colours.red,
                i = colours.green,
                v = colours.blue
            },
            { -- This is the default for all of the modes I haven't defined
                __index = function() return colours.red end
            })

            vim.cmd(
                "hi GalaxymodeIndicator guifg=" ..
                mode_colours[vim.fn.mode()] ..
                " guibg=" ..
                colours.bg)

            return "█████ " -- 
        end
    }
}
gl.section.left[2] = {
  fileIcon = {
    provider = fileinfo.get_file_icon,
    condition = function() return vim.fn.expand("%:t") end,
    highlight = {fileinfo.get_file_icon_color, colours.bg}
  }
}
gl.section.left[3] = {
  bufferIcon = {
    provider = buffer.get_buffer_type_icon,
    condition = function() return not vim.fn.expand("%:t") end
  }
}

gl.section.left[4] = { -- Give this a condition else do buffer name
    fileName = {
        provider = function()
            return fileinfo.get_current_file_name("*", "")
        end,
        highlight = {colours.fg, colours.bg}
    }
}



gl.section.right[1] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colours.green, colours.bg},
  }
}
gl.section.right[2] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colours.orange, colours.bg},
  }
}
gl.section.right[3] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colours.red, colours.bg},
  }
}

gl.section.right[4] = {
    theCap = {
        provider = function() return "" end,
        highlight = {colours.green, colours.bg}
    }
}

gl.section.right[5] = {
    fileEncoding = {
        provider = function() return " "..fileinfo.get_file_encode() end,

        condition = condition.hide_in_width,
        highlight = {colours.bg, colours.green, "bold"}
    }
}

gl.section.right[6] = {
    linePercent = {
        provider = function() return " "..fileinfo.current_line_percent() end,
        --separator = " ",
        --separator_highlight = {"NONE", colours.green},
        highlight = {colours.bg, colours.green, "bold"}
    }
}

gl.section.right[7] = {
    posInFile = {
        provider = "LineColumn",
        highlight = {colours.bg, colours.green, "bold"}
    }
}

gl.section.right[8] = {
    whitespaceCap = {
        provider = function() return "" end,
        highlight = {colours.orange, colours.green}}}
gl.section.right[9] = {
    whitespaceCheck = {
        provider = whitespace.get_item,
        highlight = {colours.bg, colours.orange}
    }
}


gl.section.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colours.bg},
    highlight = {colours.blue,colours.bg,'bold'}
  }
}

gl.section.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colours.fg,colours.bg,'bold'}
  }
}

gl.section.short_line_right[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = {colours.fg,colours.bg}
  }
}

