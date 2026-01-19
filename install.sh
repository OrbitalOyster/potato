#!/bin/bash

echo "Installing..."

# Base files
cp nvim ~/.config -r

# Plugins
cp plugins ~/.config/nvim/lua -r

echo "Done"

--- Startup times for process: Primary (or UI client) ---

times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.001  000.001: --- NVIM STARTING ---
000.327  000.326: event init
000.504  000.177: early init
000.580  000.076: locale set
000.666  000.086: init first window
001.600  000.934: inits 1
001.630  000.030: window checked
001.639  000.009: parsing arguments
002.998  000.075  000.075: require('vim.shared')
003.200  000.080  000.080: require('vim.inspect')
003.276  000.061  000.061: require('vim._options')
003.279  000.266  000.126: require('vim._editor')
003.281  000.403  000.062: require('vim._init_packages')
003.285  001.243: init lua interpreter
005.356  002.072: nvim_ui_attach
005.960  000.603: nvim_set_client_info
005.966  000.007: --- NVIM STARTED ---

--- Startup times for process: Embedded ---

times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.000  000.000: --- NVIM STARTING ---
000.186  000.186: event init
000.290  000.104: early init
000.334  000.044: locale set
000.382  000.048: init first window
000.806  000.424: inits 1
000.823  000.017: window checked
000.825  000.002: parsing arguments
001.397  000.049  000.049: require('vim.shared')
001.502  000.045  000.045: require('vim.inspect')
001.571  000.059  000.059: require('vim._options')
001.574  000.172  000.068: require('vim._editor')
001.575  000.249  000.028: require('vim._init_packages')
001.577  000.503: init lua interpreter
001.661  000.084: expanding arguments
001.692  000.031: inits 2
001.978  000.286: init highlight
001.980  000.001: waiting for UI
002.118  000.139: done waiting for UI
002.127  000.009: clear screen
002.287  000.012  000.012: require('vim.keymap')
003.230  000.162  000.162: sourcing nvim_exec2()
003.421  001.291  001.117: require('vim._defaults')
003.424  000.006: init default mappings & autocommands
003.835  000.053  000.053: sourcing /usr/share/nvim/runtime/ftplugin.vim
003.893  000.025  000.025: sourcing /usr/share/nvim/runtime/indent.vim
004.043  000.100  000.100: sourcing /usr/share/nvim/archlinux.lua
004.047  000.128  000.029: sourcing /etc/xdg/nvim/sysinit.vim
006.035  000.006  000.006: require('vim.F')
006.103  001.860  001.854: require('vim.diagnostic')
006.581  000.373  000.373: require('lazy')
006.613  000.015  000.015: require('ffi')
006.659  000.025  000.025: require('vim.fs')
006.769  000.107  000.107: require('vim.uri')
006.783  000.168  000.036: require('vim.loader')
006.920  000.120  000.120: require('lazy.stats')
007.058  000.118  000.118: require('lazy.core.util')
007.213  000.152  000.152: require('lazy.core.config')
007.460  000.115  000.115: require('lazy.core.handler')
007.928  000.150  000.150: require('lazy.pkg')
007.933  000.289  000.140: require('lazy.core.meta')
007.937  000.475  000.185: require('lazy.core.plugin')
007.943  000.728  000.138: require('lazy.core.loader')
008.468  000.054  000.054: require('lazy.core.fragments')
010.176  000.057  000.057: require('lazy.core.handler.event')
010.180  000.103  000.047: require('lazy.core.handler.ft')
010.222  000.039  000.039: require('lazy.core.handler.cmd')
010.301  000.075  000.075: require('lazy.core.handler.keys')
010.868  000.179  000.179: sourcing nvim_exec2() called at /usr/share/nvim/runtime/filetype.lua:0
010.875  000.342  000.163: sourcing /usr/share/nvim/runtime/filetype.lua
010.883  000.377  000.035: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
012.083  000.899  000.899: require('snacks')
012.100  000.976  000.077: sourcing /home/user/.local/share/nvim/lazy/snacks.nvim/plugin/snacks.lua
012.121  001.036  000.060: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
012.161  000.017  000.017: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
012.225  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
012.722  000.006  000.006: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
012.737  000.001  000.001: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
013.346  000.518  000.518: require('catppuccin')
013.641  000.119  000.119: require('catppuccin.lib.hashing')
013.893  000.004  000.004: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
013.907  000.001  000.001: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
014.655  000.294  000.294: require('vim.lsp.log')
015.690  001.030  001.030: require('vim.lsp.protocol')
016.081  000.387  000.387: require('vim.lsp.util')
016.175  000.042  000.042: require('vim.lsp.sync')
016.181  000.096  000.055: require('vim.lsp._changetracking')
016.283  000.046  000.046: require('vim.lsp._transport')
016.319  000.135  000.090: require('vim.lsp.rpc')
016.369  002.306  000.364: require('vim.lsp')
016.713  000.341  000.341: require('blink.cmp')
016.825  000.054  000.054: require('blink.cmp.lib.async')
016.960  000.058  000.058: require('blink.cmp.config.utils')
016.997  000.035  000.035: require('blink.cmp.config.keymap')
017.069  000.032  000.032: require('blink.cmp.config.completion.keyword')
017.108  000.037  000.037: require('blink.cmp.config.completion.trigger')
017.150  000.040  000.040: require('blink.cmp.config.completion.list')
017.223  000.071  000.071: require('blink.cmp.config.completion.accept')
017.280  000.054  000.054: require('blink.cmp.config.completion.menu')
017.332  000.050  000.050: require('blink.cmp.config.completion.documentation')
017.376  000.042  000.042: require('blink.cmp.config.completion.ghost_text')
017.379  000.380  000.053: require('blink.cmp.config.completion')
017.457  000.077  000.077: require('blink.cmp.config.fuzzy')
017.526  000.067  000.067: require('blink.cmp.config.sources')
017.585  000.056  000.056: require('blink.cmp.config.signature')
017.640  000.053  000.053: require('blink.cmp.config.snippets')
017.686  000.044  000.044: require('blink.cmp.config.appearance')
017.729  000.041  000.041: require('blink.cmp.config.modes.cmdline')
017.769  000.037  000.037: require('blink.cmp.config.modes.term')
017.772  000.944  000.097: require('blink.cmp.config')
017.837  000.064  000.064: require('blink.cmp.lib.utils')
017.885  000.045  000.045: require('blink.cmp.lib.event_emitter')
017.893  001.177  000.069: require('blink.cmp.sources.lib')
017.914  003.950  000.126: sourcing /home/user/.local/share/nvim/lazy/blink.cmp/plugin/blink-cmp.lua
017.922  003.988  000.038: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
017.938  000.007  000.007: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
017.952  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
018.035  000.042  000.042: require('blink-cmp')
019.324  000.083  000.083: require('blink.cmp.config.modes.types')
019.910  000.096  000.096: require('blink.cmp.fuzzy.download.system')
019.990  000.257  000.160: require('blink.cmp.fuzzy.download.files')
019.994  000.345  000.088: require('blink.cmp.fuzzy.download.git')
019.998  000.471  000.126: require('blink.cmp.fuzzy.download')
020.288  000.166  000.166: require('vim._system')
023.873  000.110  000.110: sourcing /home/user/.local/share/nvim/lazy/bufdelete.nvim/plugin/bufdelete.lua
023.884  000.173  000.064: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
023.897  000.004  000.004: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
023.997  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
024.569  000.278  000.278: sourcing /home/user/.local/share/nvim/lazy/neo-tree.nvim/plugin/neo-tree.lua
024.577  000.314  000.036: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
024.588  000.004  000.004: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
024.605  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
025.369  000.587  000.587: require('neo-tree')
025.800  000.423  000.423: require('neo-tree.log')
026.610  000.452  000.452: require('gitsigns')
027.782  001.138  001.138: require('gitsigns.highlight')
028.390  000.569  000.569: require('gitsigns.debug.log')
028.815  000.422  000.422: require('gitsigns.config')
029.720  000.062  000.062: require('gitsigns.debounce')
029.749  003.663  001.020: sourcing /home/user/.local/share/nvim/lazy/gitsigns.nvim/plugin/gitsigns.lua
029.759  003.719  000.055: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
029.780  000.010  000.010: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
029.795  000.001  000.001: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
029.863  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
029.873  000.001  000.001: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
030.428  000.111  000.111: require('lualine_require')
030.758  000.759  000.647: require('lualine')
031.095  000.016  000.016: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
031.653  000.079  000.079: require('lualine.highlight')
033.046  000.010  000.010: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.063  000.004  000.004: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.073  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.083  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.092  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.101  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.109  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.118  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.126  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.134  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.142  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.150  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.157  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.166  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.174  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.181  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.190  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.198  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.206  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.213  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.220  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.227  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
033.244  000.014  000.014: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
034.663  000.062  000.062: require('lualine.utils.mode')
034.970  000.051  000.051: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
034.983  000.007  000.007: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.228  000.010  000.010: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.240  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.251  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.286  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.295  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.304  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.312  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.322  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.330  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.337  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.344  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.352  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.359  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.388  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.400  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.408  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.415  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.422  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.428  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.435  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.442  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.595  000.009  000.009: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.604  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.610  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
035.617  000.004  000.004: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.040  000.006  000.006: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.051  000.004  000.004: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.061  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.070  000.004  000.004: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.077  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.084  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.091  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.102  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.110  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.118  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.125  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.134  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.141  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.173  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.183  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.190  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.196  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.203  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.210  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.217  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.225  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.234  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.242  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.249  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.256  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.262  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.269  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.277  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.318  000.012  000.012: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.349  000.006  000.006: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.371  000.018  000.018: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.381  000.006  000.006: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.410  000.007  000.007: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.638  000.036  000.036: sourcing /home/user/.local/share/nvim/lazy/nvim-web-devicons/plugin/nvim-web-devicons.vim
036.643  000.071  000.035: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.650  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.688  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.906  000.003  000.003: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
036.916  000.001  000.001: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
037.371  000.043  000.043: require('bufferline.lazy')
037.456  000.074  000.074: require('bufferline.commands')
037.619  000.159  000.159: require('bufferline.config')
037.625  000.640  000.364: require('bufferline')
037.905  000.090  000.090: require('bufferline.utils')
037.909  000.272  000.182: require('bufferline.groups')
037.979  000.055  000.055: require('bufferline.constants')
038.030  000.047  000.047: require('bufferline.colors')
038.322  000.096  000.096: require('bufferline.highlights')
039.369  000.281  000.281: require('vim.version')
041.183  002.176  001.895: require('bufferline.hover')
041.621  000.273  000.273: require('bufferline.ui')
042.617  000.681  000.681: require('lspconfig.util')
042.644  000.836  000.155: sourcing /home/user/.local/share/nvim/lazy/nvim-lspconfig/plugin/lspconfig.lua
042.651  000.881  000.046: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
042.661  000.004  000.004: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
042.676  000.002  000.002: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
042.855  000.069  000.069: sourcing /usr/share/nvim/runtime/plugin/editorconfig.lua
042.860  000.097  000.028: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
043.076  000.186  000.186: sourcing /usr/share/nvim/runtime/plugin/gzip.vim
043.080  000.211  000.025: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
043.182  000.076  000.076: sourcing /usr/share/nvim/runtime/plugin/man.lua
043.187  000.100  000.024: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
045.687  000.249  000.249: sourcing /usr/share/nvim/runtime/pack/dist/opt/matchit/plugin/matchit.vim
045.723  002.507  002.258: sourcing /usr/share/nvim/runtime/plugin/matchit.vim
045.729  002.535  000.028: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
045.957  000.137  000.137: sourcing /usr/share/nvim/runtime/plugin/matchparen.vim
045.961  000.164  000.027: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
046.793  000.272  000.272: sourcing /usr/share/nvim/runtime/pack/dist/opt/netrw/plugin/netrwPlugin.vim
046.815  000.798  000.527: sourcing /usr/share/nvim/runtime/plugin/netrwPlugin.vim
046.818  000.824  000.026: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
047.040  000.170  000.170: sourcing /usr/share/nvim/runtime/plugin/osc52.lua
047.045  000.204  000.033: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
047.231  000.133  000.133: sourcing /usr/share/nvim/runtime/plugin/rplugin.vim
047.235  000.163  000.030: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
047.322  000.050  000.050: sourcing /usr/share/nvim/runtime/plugin/shada.vim
047.326  000.081  000.031: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
047.389  000.016  000.016: sourcing /usr/share/nvim/runtime/plugin/spellfile.vim
047.393  000.050  000.033: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
047.518  000.086  000.086: sourcing /usr/share/nvim/runtime/plugin/tarPlugin.vim
047.522  000.116  000.029: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
047.671  000.092  000.092: sourcing /usr/share/nvim/runtime/plugin/tohtml.lua
047.676  000.126  000.035: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
047.727  000.019  000.019: sourcing /usr/share/nvim/runtime/plugin/tutor.vim
047.731  000.050  000.031: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
047.920  000.124  000.124: sourcing /usr/share/nvim/runtime/plugin/zipPlugin.vim
047.924  000.154  000.030: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
048.122  042.015  017.349: require('config.lazy')
053.130  004.138  004.138: sourcing /home/user/.local/share/nvim/lazy/catppuccin/colors/catppuccin-frappe.vim
053.641  000.034  000.034: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.178  000.134  000.134: require('catppuccin.utils.lualine')
054.233  000.051  000.051: require('catppuccin.palettes')
054.285  000.049  000.049: require('catppuccin.palettes.frappe')
054.308  000.005  000.005: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.313  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.317  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.321  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.325  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.329  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.332  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.336  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.339  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.343  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.346  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.350  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.353  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.357  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.360  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.364  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.367  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.371  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.374  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.377  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.381  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.384  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.388  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.391  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.395  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.398  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.402  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.405  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.409  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.412  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.416  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.419  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.423  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.427  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.430  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.434  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.437  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.441  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.444  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.489  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.494  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.499  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.504  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.508  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.511  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.515  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.518  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.521  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.524  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.528  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.531  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.578  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.584  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.603  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.607  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.611  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.615  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.618  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.621  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.625  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.628  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.632  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.636  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.640  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.644  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.648  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.653  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.657  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.660  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.664  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.667  000.001  000.001: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.689  000.005  000.005: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.704  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.715  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.724  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.734  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.770  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.781  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.951  000.005  000.005: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.962  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.970  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.979  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.986  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
054.993  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.001  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.009  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.017  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.024  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.041  000.014  000.014: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.254  000.009  000.009: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.264  000.004  000.004: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.308  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.317  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.326  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.333  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.341  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.349  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.357  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.387  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.394  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.401  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.433  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.458  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.482  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.505  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.554  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.580  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.589  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.597  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.604  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.611  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.619  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.631  000.006  000.006: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.638  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.644  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.653  000.006  000.006: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.772  000.005  000.005: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.781  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.788  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.830  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.838  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.845  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.853  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.863  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.870  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.877  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.904  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.911  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.918  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.925  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.936  000.003  000.003: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.943  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.950  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.956  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.962  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.968  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.976  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.986  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.993  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
055.999  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
056.006  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
056.013  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
056.019  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
056.029  000.002  000.002: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
056.139  000.021  000.021: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
056.159  000.006  000.006: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
056.177  000.014  000.014: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
056.188  000.007  000.007: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
056.198  000.006  000.006: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
056.685  008.558  003.800: sourcing nvim_exec2() called at /home/user/.config/nvim/init.lua:0
056.707  052.633  000.199: sourcing /home/user/.config/nvim/init.lua
056.724  000.461: sourcing vimrc file(s)
056.910  000.052  000.052: sourcing /usr/share/nvim/runtime/filetype.lua
057.159  000.076  000.076: sourcing /usr/share/nvim/runtime/syntax/synload.vim
057.240  000.255  000.179: sourcing /usr/share/nvim/runtime/syntax/syntax.vim
057.254  000.223: inits 3
058.654  001.400: reading ShaDa
058.791  000.137: opening buffers
058.919  000.097  000.097: require('bufferline.state')
059.032  000.144: BufEnter autocommands
059.038  000.006: editing files in windows
059.142  000.104: VimEnter autocommands
059.648  000.132  000.132: require('snacks.util')
059.679  000.492  000.360: require('snacks.dashboard')
061.832  000.122  000.122: require('snacks.scroll')
061.906  000.056  000.056: require('snacks.animate')
062.080  000.100  000.100: require('snacks.scope')
062.371  000.050  000.050: require('vim.termcap')
062.399  000.017  000.017: require('vim.text')
062.431  002.452: UIEnter autocommands
062.433  000.002: before starting main loop
063.508  001.075: first screen update
063.514  000.005: --- NVIM STARTED ---

