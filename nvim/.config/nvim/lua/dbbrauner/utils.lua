function _G.set_option(options)
	for name, value in pairs(options) do
		vim.opt[name] = value
	end
end
