local keymaps = {}

keymaps["normal"] = {
	{ "<C-n>"     ,     ":enew<CR>"               }, -- New empty buffer
	{ "<S-l>"     ,     ":bnext<CR>"              }, -- Navigate between buffers
	{ "<S-h>"     ,     ":bprevious<CR>"          },
	{ "<BS>"      ,     ":b#<CR>"                 }, -- Like Ctrl + Tab in a browser
	{ "<Tab>"     ,     ":b#<CR>"                 },
	{ "<S-l>"     ,     "<cmd>Bdelete!<CR>"       }, -- Close buffer
	{ "<C-h>"     ,     "<C-w>h"                  }, -- Better window navigation
	{ "<C-j>"     ,     "<C-w>j"                  },
	{ "<C-k>"     ,     "<C-w>k"                  },
	{ "<C-l>"     ,     "<C-w>l"                  },
	{ "<C-Up>"    ,     ":resize -2<CR>"          }, -- Resize windows with arrows
	{ "<C-Down>"  ,     ":resize +2<CR>"          },
	{ "<C-Left>"  ,     ":vertical resize -2<CR>" },
	{ "<C-Right>" ,     ":vertical resize +2<CR>" },
	{ "<C-c>"     ,     "<cmd>normal! ciw<cr>a"   }, --ciw
	-- { "t"         ,     "s"                       }, -- Replace s with the t
	{ "J"         ,     "mzJ`z"                   }, -- Don't move the cursor when you press J
	{ "n"         ,     "nzzzv"                   }, -- Set the cursor to the middle of the screen
	{ "N"         ,     "Nzzzv"                   },
	{ "<leader>q" ,     "<CMD>q!<CR>"             },
	{ "<leader>Q" ,     "<CMD>qa!<CR>"            },
	{ "<leader>w" ,     "<cmd>w!<CR>"             },
	{ "<leader>h" ,     "<cmd>nohlsearch<CR>"     },
	-- { "<leader>E" ,     "<cmd>Explore<cr>"        },
	{ "<A-p>"     ,     "<cmd>PasteImg<CR>"       }, -- Clipboard-image.nvim plugin
  { "<Up>"      ,     "gk"                      },
  { "<Down>"    ,     "gj"                      },
}

keymaps["insert"] = {
	{ "jk"        ,     "<ESC>"                   }, -- Exit from insert mode easily
	{ "kj"        ,     "<ESC>"                   },
}

keymaps["visual"] = {
	{ "<"         ,     "<gv"                     }, -- Better indent mode
	{ ">"         ,     ">gv"                     },
	{ "J"         ,     ":m '>+1<CR>gv=gv"        }, -- Move the selected text up and down
	{ "K"         ,     ":m '<-2<CR>gv=gv"        },
	{ "p"         ,     '"_dP'                    }, -- Paste the same text multiple times
	{ "<C-r>"     ,     "<CMD>lua require('search-replace')<CR><CMD>SearchReplaceSingleBufferVisualSelection<CR>" }, -- search-replace.nvim plugin
	{ "<C-s>"     ,     "<CMD>lua require('search-replace')<CR><CMD>SearchReplaceWithinVisualSelection<CR>"       },
	{ "<C-c>"     ,     "<CMD>lua require('search-replace')<CR><CMD> SearchReplaceWithinVisualSelectionCWord<CR>" },
}

keymaps["visual_block"] = {
	{ "J"         ,     ":m '>+1<CR>gv-gv"        }, -- Move the selected text up and down
	{ "K"         ,     ":m '<-2<CR>gv-gv"        },
}

keymaps["terminal"] = {
	{ "<Tab><Tab>",     "<C-\\><C-n>"             }, -- Return to normal mode
}

return keymaps
