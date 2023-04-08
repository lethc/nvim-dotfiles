local wilder_status_ok, wilder = pcall(require, "wilder")
if not wilder_status_ok then
  return
end

wilder.setup{
  modes = {':', '/', '?'}
}
-- wilder.set_option('renderer', wilder.renderer_mux({
--   [':'] = wilder.popupmenu_renderer({
--     pumblend = 20,
--     highlighter = wilder.basic_highlighter(),
--   }),
--   ['/'] = wilder.wildmenu_renderer({
--     highlighter = wilder.basic_highlighter(),
--   }),
-- }))

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    -- pumblend = 20,
    highlighter = wilder.basic_highlighter(),
    left = {' ', wilder.popupmenu_devicons()},
    right = {' ', wilder.popupmenu_scrollbar()},
    highlights = {
      border = 'Normal', -- highlight to use for the border
    },
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
    border = 'rounded',
  })
))
