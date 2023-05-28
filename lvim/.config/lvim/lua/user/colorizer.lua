local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

local options = {
	RGB = true, -- #RGB hex codes
	RRGGBB = true, -- #RRGGBB hex codes
	names = true, -- "Name" codes like Blue
	RRGGBBAA = true, -- #RRGGBBAA hex codes
	rgb_fn = true, -- CSS rgb() and rgba() functions
	hsl_fn = true, -- CSS hsl() and hsla() functions
	css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background
	mode = "background", -- Set the display mode.
}
-- Use the `default_options` as the second parameter, which uses
-- `foreground` for every mode. This is the inverse of the previous
-- setup configuration.
colorizer.setup({
	"*", -- Highlight all files, but customize some others.
	css = options, -- Enable parsing rgb(...) functions in css.
	html = options, -- Disable parsing "names" like Blue or Gray
})
