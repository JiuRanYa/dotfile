return {
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = function()
			require("toggleterm").setup({
				size = function(term)
					if term.direction == "horizontal" then
						return 15
					elseif term.direction == "vertical" then
						return vim.o.columns * 0.4
					end
				end,
				direction = "float",
				float_opts = {
					border = "rounded",
					width = function()
						return math.floor(vim.o.columns * 0.85)
					end,
					height = function()
						return math.floor(vim.o.lines * 0.8)
					end,
					winblend = 3,
				},
				highlights = {
					FloatBorder = { guifg = "#5c6370" },
				},
				shade_terminals = true,
				shading_factor = -30,
				start_in_insert = true,
				persist_size = true,
				persist_mode = true,
				close_on_exit = true,
			})

			local Terminal = require("toggleterm.terminal").Terminal

			-- lazygit 浮动终端
			local lazygit = Terminal:new({
				cmd = "lazygit",
				dir = "git_dir",
				direction = "float",
				float_opts = {
					border = "double",
				},
				on_open = function(term)
					vim.cmd("startinsert!")
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"n",
						"q",
						"<cmd>close<CR>",
						{ noremap = true, silent = true }
					)
				end,
				on_close = function()
					vim.cmd("startinsert!")
				end,
			})

			function _lazygit_toggle()
				lazygit:toggle()
			end

			-- 通用浮动终端
			local float_term = Terminal:new({
				direction = "float",
				float_opts = {
					border = "rounded",
				},
				on_open = function(term)
					vim.cmd("startinsert!")
					-- 在浮动终端中按 q (normal mode) 关闭
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"n",
						"q",
						"<cmd>close<CR>",
						{ noremap = true, silent = true }
					)
				end,
			})

			function _float_term_toggle()
				float_term:toggle()
			end

			-- 水平终端
			local horizontal_term = Terminal:new({
				direction = "horizontal",
				on_open = function()
					vim.cmd("startinsert!")
				end,
			})

			function _horizontal_term_toggle()
				horizontal_term:toggle()
			end

			-- 垂直终端
			local vertical_term = Terminal:new({
				direction = "vertical",
				on_open = function()
					vim.cmd("startinsert!")
				end,
			})

			function _vertical_term_toggle()
				vertical_term:toggle()
			end

			-- 终端模式快捷键: 用 <Esc> 退出终端模式回到 normal mode
			function _set_terminal_keymaps()
				local opts = { buffer = 0, noremap = true, silent = true }
				vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			end

			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*",
				callback = function()
					_set_terminal_keymaps()
				end,
			})
		end,
	},
}
