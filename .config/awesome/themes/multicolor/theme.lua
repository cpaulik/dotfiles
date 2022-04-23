--[[
                                      
     Multicolor Awesome WM config 2.0 
     github.com/copycat-killer        
                                      
--]]


theme                               = {}

theme.confdir                       = os.getenv("HOME") .. "/.config/awesome/themes/multicolor"
theme.wallpaper                     = theme.confdir .. "/wall.png"
theme.useless_gap_width             = 10
theme.font                          = "Helvetica 15"
theme.taglist_font                  = "Source Code Pro 15"

theme.fg_normal                     = "#EEEEEE"
theme.fg_focus                      = "#8bc34a"
theme.fg_urgent                     = "#CC9393"
theme.bg_normal                     = "#1A1A1A"
theme.bg_focus                      = "#414141"
theme.bg_urgent                     = "#1A1A1A"
theme.border_width                  = "2"
theme.border_normal                 = "#3F3F3F"
theme.border_focus                  = "#aaddff"
theme.border_marked                 = "#CC9393"
theme.titlebar_bg_focus             = "#FFFFFF"
theme.titlebar_bg_normal            = "#FFFFFF"
theme.taglist_fg_focus              = "#FFFFFF"
theme.tasklist_bg_focus             = "#1A1A1A"
theme.tasklist_fg_focus             = "#AAddff"
theme.textbox_widget_margin_top     = 1
theme.notify_fg                     = theme.fg_normal
theme.notify_bg                     = theme.bg_normal
theme.notify_border                 = theme.border_focus
theme.awful_widget_height           = 14
theme.awful_widget_margin_top       = 2
theme.mouse_finder_color            = "#CC9393"
theme.menu_height                   = "16"
theme.menu_width                    = "140"
theme.submenu_icon                  = theme.confdir .. "/icons/submenu.png"
theme.taglist_squares_sel           = theme.confdir .. "/icons/square_sel.png"
theme.taglist_squares_unsel         = theme.confdir .. "/icons/square_unsel.png"

theme.layout_tile                   = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps               = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft               = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom             = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                  = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                  = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                 = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                    = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen             = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier              = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating               = theme.confdir .. "/icons/floating.png"

theme.arrl                          = theme.confdir .. "/icons/arrl.png"
theme.arrl_dl                       = theme.confdir .. "/icons/arrl_dl.png"
theme.arrl_ld                       = theme.confdir .. "/icons/arrl_ld.png"

theme.widget_ac                     = theme.confdir .. "/icons/ac.png"
theme.widget_battery                = theme.confdir .. "/icons/battery.png"
theme.widget_battery_low            = theme.confdir .. "/icons/battery_low.png"
theme.widget_battery_empty          = theme.confdir .. "/icons/battery_empty.png"
theme.widget_mem                    = theme.confdir .. "/icons/mem.png"
theme.widget_cpu                    = theme.confdir .. "/icons/cpu.png"
theme.widget_temp                   = theme.confdir .. "/icons/temp.png"
theme.widget_net                    = theme.confdir .. "/icons/net.png"
theme.widget_hdd                    = theme.confdir .. "/icons/hdd.png"
theme.widget_music                  = theme.confdir .. "/icons/note.png"
theme.widget_music_on               = theme.confdir .. "/icons/note_on.png"
theme.widget_vol                    = theme.confdir .. "/icons/vol.png"
theme.widget_vol_low                = theme.confdir .. "/icons/vol_low.png"
theme.widget_vol_no                 = theme.confdir .. "/icons/vol_no.png"
theme.widget_vol_mute               = theme.confdir .. "/icons/vol_mute.png"
theme.widget_mail                   = theme.confdir .. "/icons/mail.png"
theme.widget_mail_on                = theme.confdir .. "/icons/mail_on.png"

theme.tasklist_disable_icon         = true
theme.tasklist_floating             = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""

theme.lain_icons         = os.getenv("HOME") .. "/.config/awesome/lain/icons/layout/default/"
theme.layout_termfair    = theme.lain_icons .. "termfairw.png"
theme.layout_cascade     = theme.lain_icons .. "cascadew.png"
theme.layout_cascadetile = theme.lain_icons .. "cascadetilew.png"
theme.layout_centerwork  = theme.lain_icons .. "centerworkw.png"

return theme
