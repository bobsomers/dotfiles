require 'cairo'

--[[
Clock Rings by Linux Mint (2011) reEdited by despot77

This script draws percentage meters as rings, and also draws clock hands if you want! It is fully customisable; all options are described in the script. This script is based off a combination of my clock.lua script and my rings.lua script.

IMPORTANT: if you are using the 'cpu' function, it will cause a segmentation fault if it tries to draw a ring straight away. The if statement on line 145 uses a delay to make sure that this doesn't happen. It calculates the length of the delay by the number of updates since Conky started. Generally, a value of 5s is long enough, so if you update Conky every 1s, use update_num>5 in that if statement (the default). If you only update Conky every 2s, you should change it to update_num>3; conversely if you update Conky every 0.5s, you should use update_num>10. ALSO, if you change your Conky, is it best to use "killall conky; conky" to update it, otherwise the update_num will not be reset and you will get an error.

To call this script in Conky, use the following (assuming that you save this script to ~/scripts/rings.lua):
    lua_load ~/scripts/clock_rings.lua
    lua_draw_hook_pre clock_rings
    
Changelog:
+ v1.0 -- Original release (30.09.2009)
   v1.1p -- Jpope edit londonali1010 (05.10.2009)
*v 2011mint -- reEdit despot77 (18.02.2011)
]]

-- Clock settings.
clock_r = 100
clock_x = 150
clock_y = 180
clock_bg_colour = 0xffffff
clock_bg_alpha = 0.1
clock_fg_colour = 0x4c7899
clock_fg_alpha = 0.8
show_seconds = true

-- CPU settings.
cpu_r = 100
cpu_x = 110
cpu_y = 400
cpu_thickness = 4
cpu_gap = 2
cpu_start_angle = -90
cpu_end_angle = 90
cpu_bg_colour = 0xffffff
cpu_bg_alpha = 0.1
cpu_fg_colour = 0xffffff
cpu_fg_alpha = 0.8

settings_table = {
    {
        name = "time",
        arg = "%I.%M",
        max = 12,
        bg_colour = clock_bg_colour,
        bg_alpha = clock_bg_alpha,
        fg_colour = clock_fg_colour,
        fg_alpha = clock_fg_alpha,
        x = clock_x,
        y = clock_y,
        radius = clock_r - 20,
        thickness = 8,
        start_angle = 0,
        end_angle = 360
    },
    {
        name = "time",
        arg = "%M.%S",
        max = 60,
        bg_colour = clock_bg_colour,
        bg_alpha = clock_bg_alpha,
        fg_colour = clock_fg_colour,
        fg_alpha = clock_fg_alpha,
        x = clock_x,
        y = clock_y,
        radius = clock_r - 10,
        thickness = 6,
        start_angle = 0,
        end_angle = 360
    },
    {
        name = "time",
        arg = "%S",
        max = 60,
        bg_colour = clock_bg_colour,
        bg_alpha = clock_bg_alpha,
        fg_colour = clock_fg_colour,
        fg_alpha = clock_fg_alpha,
        x = clock_x,
        y = clock_y,
        radius = clock_r - 2,
        thickness = 4,
        start_angle = 0,
        end_angle = 360
    },





    {
        name = "cpu",
        arg = "cpu12",
        max = 100,
        bg_colour = cpu_bg_colour,
        bg_alpha = cpu_bg_alpha,
        fg_colour = cpu_fg_colour,
        fg_alpha = cpu_fg_alpha,
        x = cpu_x,
        y = cpu_y,
        radius = cpu_r - 0 * (cpu_thickness + cpu_gap),
        thickness = cpu_thickness,
        start_angle = cpu_start_angle,
        end_angle = cpu_end_angle
    },
    {
        name = "cpu",
        arg = "cpu11",
        max = 100,
        bg_colour = cpu_bg_colour,
        bg_alpha = cpu_bg_alpha,
        fg_colour = cpu_fg_colour,
        fg_alpha = cpu_fg_alpha,
        x = cpu_x,
        y = cpu_y,
        radius = cpu_r - 1 * (cpu_thickness + cpu_gap),
        thickness = cpu_thickness,
        start_angle = cpu_start_angle,
        end_angle = cpu_end_angle
    },
    {
        name = "cpu",
        arg = "cpu10",
        max = 100,
        bg_colour = cpu_bg_colour,
        bg_alpha = cpu_bg_alpha,
        fg_colour = cpu_fg_colour,
        fg_alpha = cpu_fg_alpha,
        x = cpu_x,
        y = cpu_y,
        radius = cpu_r - 2 * (cpu_thickness + cpu_gap),
        thickness = cpu_thickness,
        start_angle = cpu_start_angle,
        end_angle = cpu_end_angle
    },
    {
        name = "cpu",
        arg = "cpu9",
        max = 100,
        bg_colour = cpu_bg_colour,
        bg_alpha = cpu_bg_alpha,
        fg_colour = cpu_fg_colour,
        fg_alpha = cpu_fg_alpha,
        x = cpu_x,
        y = cpu_y,
        radius = cpu_r - 3 * (cpu_thickness + cpu_gap),
        thickness = cpu_thickness,
        start_angle = cpu_start_angle,
        end_angle = cpu_end_angle
    },
    {
        name = "cpu",
        arg = "cpu8",
        max = 100,
        bg_colour = cpu_bg_colour,
        bg_alpha = cpu_bg_alpha,
        fg_colour = cpu_fg_colour,
        fg_alpha = cpu_fg_alpha,
        x = cpu_x,
        y = cpu_y,
        radius = cpu_r - 4 * (cpu_thickness + cpu_gap),
        thickness = cpu_thickness,
        start_angle = cpu_start_angle,
        end_angle = cpu_end_angle
    },
    {
        name = "cpu",
        arg = "cpu7",
        max = 100,
        bg_colour = cpu_bg_colour,
        bg_alpha = cpu_bg_alpha,
        fg_colour = cpu_fg_colour,
        fg_alpha = cpu_fg_alpha,
        x = cpu_x,
        y = cpu_y,
        radius = cpu_r - 5 * (cpu_thickness + cpu_gap),
        thickness = cpu_thickness,
        start_angle = cpu_start_angle,
        end_angle = cpu_end_angle
    },
    {
        name = "cpu",
        arg = "cpu6",
        max = 100,
        bg_colour = cpu_bg_colour,
        bg_alpha = cpu_bg_alpha,
        fg_colour = cpu_fg_colour,
        fg_alpha = cpu_fg_alpha,
        x = cpu_x,
        y = cpu_y,
        radius = cpu_r - 6 * (cpu_thickness + cpu_gap),
        thickness = cpu_thickness,
        start_angle = cpu_start_angle,
        end_angle = cpu_end_angle
    },
    {
        name = "cpu",
        arg = "cpu5",
        max = 100,
        bg_colour = cpu_bg_colour,
        bg_alpha = cpu_bg_alpha,
        fg_colour = cpu_fg_colour,
        fg_alpha = cpu_fg_alpha,
        x = cpu_x,
        y = cpu_y,
        radius = cpu_r - 7 * (cpu_thickness + cpu_gap),
        thickness = cpu_thickness,
        start_angle = cpu_start_angle,
        end_angle = cpu_end_angle
    },
    {
        name = "cpu",
        arg = "cpu4",
        max = 100,
        bg_colour = cpu_bg_colour,
        bg_alpha = cpu_bg_alpha,
        fg_colour = cpu_fg_colour,
        fg_alpha = cpu_fg_colour,
        x = cpu_x,
        y = cpu_y,
        radius = cpu_r - 8 * (cpu_thickness + cpu_gap),
        thickness = cpu_thickness,
        start_angle = cpu_start_angle,
        end_angle = cpu_end_angle
    },
    {
        name = "cpu",
        arg = "cpu3",
        max = 100,
        bg_colour = cpu_bg_colour,
        bg_alpha = cpu_bg_alpha,
        fg_colour = cpu_fg_colour,
        fg_alpha = cpu_fg_colour,
        x = cpu_x,
        y = cpu_y,
        radius = cpu_r - 9 * (cpu_thickness + cpu_gap),
        thickness = cpu_thickness,
        start_angle = cpu_start_angle,
        end_angle = cpu_end_angle
    },
    {
        name = "cpu",
        arg = "cpu2",
        max = 100,
        bg_colour = cpu_bg_colour,
        bg_alpha = cpu_bg_alpha,
        fg_colour = cpu_fg_colour,
        fg_alpha = cpu_fg_colour,
        x = cpu_x,
        y = cpu_y,
        radius = cpu_r - 10 * (cpu_thickness + cpu_gap),
        thickness = cpu_thickness,
        start_angle = cpu_start_angle,
        end_angle = cpu_end_angle
    },
    {
        name = "cpu",
        arg = "cpu1",
        max = 100,
        bg_colour = cpu_bg_colour,
        bg_alpha = cpu_bg_alpha,
        fg_colour = cpu_fg_colour,
        fg_alpha = cpu_fg_colour,
        x = cpu_x,
        y = cpu_y,
        radius = cpu_r - 11 * (cpu_thickness + cpu_gap),
        thickness = cpu_thickness,
        start_angle = cpu_start_angle,
        end_angle = cpu_end_angle
    },
}

--[[
settings_table = {
    {
        -- Edit this table to customise your rings.
        -- You can create more rings simply by adding more elements to settings_table.
        -- "name" is the type of stat to display; you can choose from 'cpu', 'memperc', 'fs_used_perc', 'battery_used_perc'.
        name='time',
        -- "arg" is the argument to the stat type, e.g. if in Conky you would write ${cpu cpu0}, 'cpu0' would be the argument. If you would not use an argument in the Conky variable, use ''.
        arg='%I.%M',
        -- "max" is the maximum value of the ring. If the Conky variable outputs a percentage, use 100.
        max=12,
        -- "bg_colour" is the colour of the base ring.
        bg_colour=0xffffff,
        -- "bg_alpha" is the alpha value of the base ring.
        bg_alpha=0.1,
        -- "fg_colour" is the colour of the indicator part of the ring.
        fg_colour=0x7A5ADA,
        -- "fg_alpha" is the alpha value of the indicator part of the ring.
        fg_alpha=0.2,
        -- "x" and "y" are the x and y coordinates of the centre of the ring, relative to the top left corner of the Conky window.
        x=100, y=150,
        -- "radius" is the radius of the ring.
        radius=50,
        -- "thickness" is the thickness of the ring, centred around the radius.
        thickness=5,
        -- "start_angle" is the starting angle of the ring, in degrees, clockwise from top. Value can be either positive or negative.
        start_angle=0,
        -- "end_angle" is the ending angle of the ring, in degrees, clockwise from top. Value can be either positive or negative, but must be larger than start_angle.
        end_angle=360
    },
    {
        name='time',
        arg='%M.%S',
        max=60,
        bg_colour=0xffffff,
        bg_alpha=0.1,
        fg_colour=0x7A5ADA,
        fg_alpha=0.4,
        x=100, y=150,
        radius=46,
        thickness=5,
        start_angle=0,
        end_angle=360
    },
    {
        name='time',
        arg='%S',
        max=60,
        bg_colour=0xffffff,
        bg_alpha=0.1,
        fg_colour=0x7A5ADA,
        fg_alpha=0.6,
        x=100, y=150,
        radius=62,
        thickness=5,
        start_angle=0,
        end_angle=360
    },
    {
        name='time',
        arg='%d',
        max=31,
        bg_colour=0xffffff,
        bg_alpha=0.1,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=100, y=150,
        radius=70,
        thickness=5,
        start_angle=-90,
        end_angle=90
    },
    {
        name='time',
        arg='%m',
        max=12,
        bg_colour=0xffffff,
        bg_alpha=0.1,
        fg_colour=0x7A5ADA,
        fg_alpha=1,
        x=100, y=150,
        radius=76,
        thickness=5,
        start_angle=-90,
        end_angle=90
    },
    {
        name='cpu',
        arg='cpu0',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=25, y=300,
        radius=20,
        thickness=5,
        start_angle=-90,
        end_angle=180
    },
    {
        name='cpu',
        arg='cpu1',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=75, y=300,
        radius=20,
        thickness=5,
        start_angle=-90,
        end_angle=180
    },
    {
        name='cpu',
        arg='cpu2',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=125, y=300,
        radius=20,
        thickness=5,
        start_angle=-90,
        end_angle=180
    },
    {
        name='cpu',
        arg='cpu3',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=175, y=300,
        radius=20,
        thickness=5,
        start_angle=-90,
        end_angle=180
    },
    {
        name='cpu',
        arg='cpu4',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=25, y=350,
        radius=20,
        thickness=5,
        start_angle=-90,
        end_angle=180
    },
    {
        name='cpu',
        arg='cpu5',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=75, y=350,
        radius=20,
        thickness=5,
        start_angle=-90,
        end_angle=180
    },
    {
        name='cpu',
        arg='cpu6',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=125, y=350,
        radius=20,
        thickness=5,
        start_angle=-90,
        end_angle=180
    },
    {
        name='cpu',
        arg='cpu7',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=175, y=350,
        radius=20,
        thickness=5,
        start_angle=-90,
        end_angle=180
    },
    {
        name='memperc',
        arg='',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=30, y=400,
        radius=25,
        thickness=5,
        start_angle=-90,
        end_angle=180
    },
    {
        name='fs_used_perc',
        arg='/',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=55, y=450,
        radius=25,
        thickness=5,
        start_angle=-90,
        end_angle=180
    },
    {
        name='fs_used_perc',
        arg='/home',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=80, y=500,
        radius=25,
        thickness=5,
        start_angle=-90,
        end_angle=180
    },
    {
        name='downspeedf',
        arg='wlan0',
        max=1024,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=105, y=550,
        radius=25,
        thickness=4,
        start_angle=-90,
        end_angle=180
    },
        {
        name='upspeedf',
        arg='wlan0',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.2,
        fg_colour=0x7A5ADA,
        fg_alpha=0.8,
        x=105, y=550,
        radius=20,
        thickness=4,
        start_angle=-90,
        end_angle=180
    },
}
]]



function rgb_to_r_g_b(colour,alpha)
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function draw_ring(cr,t,pt)
    local w,h=conky_window.width,conky_window.height
    
    local xc,yc,ring_r,ring_w,sa,ea=pt['x'],pt['y'],pt['radius'],pt['thickness'],pt['start_angle'],pt['end_angle']
    local bgc, bga, fgc, fga=pt['bg_colour'], pt['bg_alpha'], pt['fg_colour'], pt['fg_alpha']

    local angle_0=sa*(2*math.pi/360)-math.pi/2
    local angle_f=ea*(2*math.pi/360)-math.pi/2
    local t_arc=t*(angle_f-angle_0)

    -- Draw background ring

    cairo_arc(cr,xc,yc,ring_r,angle_0,angle_f)
    cairo_set_source_rgba(cr,rgb_to_r_g_b(bgc,bga))
    cairo_set_line_width(cr,ring_w)
    cairo_stroke(cr)
    
    -- Draw indicator ring

    cairo_arc(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
    cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
    cairo_stroke(cr)        
end

function draw_clock_hands(cr,xc,yc)
    local secs,mins,hours,secs_arc,mins_arc,hours_arc
    local xh,yh,xm,ym,xs,ys
    
    secs=os.date("%S")    
    mins=os.date("%M")
    hours=os.date("%I")
        
    secs_arc=(2*math.pi/60)*secs
    mins_arc=(2*math.pi/60)*mins+secs_arc/60
    hours_arc=(2*math.pi/12)*hours+mins_arc/12
        
    -- Draw hour hand
    
    xh=xc+0.8*clock_r*math.sin(hours_arc)
    yh=yc-0.8*clock_r*math.cos(hours_arc)
    cairo_move_to(cr,xc,yc)
    cairo_line_to(cr,xh,yh)
    
    cairo_set_line_cap(cr,CAIRO_LINE_CAP_ROUND)
    cairo_set_line_width(cr,6)
    cairo_set_source_rgba(cr,1.0,1.0,1.0,1.0)
    cairo_stroke(cr)
    
    -- Draw minute hand
    
    xm=xc+0.9*clock_r*math.sin(mins_arc)
    ym=yc-0.9*clock_r*math.cos(mins_arc)
    cairo_move_to(cr,xc,yc)
    cairo_line_to(cr,xm,ym)
    
    cairo_set_line_width(cr,4)
    cairo_stroke(cr)
    
    -- Draw seconds hand
    
    if show_seconds then
        xs=xc+clock_r*math.sin(secs_arc)
        ys=yc-clock_r*math.cos(secs_arc)
        cairo_move_to(cr,xc,yc)
        cairo_line_to(cr,xs,ys)
    
        cairo_set_line_width(cr,2)
        cairo_stroke(cr)
    end
end

function conky_rings()
    local function setup_rings(cr,pt)
        local str=''
        local value=0
        
        str=string.format('${%s %s}',pt['name'],pt['arg'])
        str=conky_parse(str)
        
        value=tonumber(str)
        pct=value/pt['max']
        
        draw_ring(cr,pct,pt)
    end
    
    -- Check that Conky has been running for at least 5s

    if conky_window==nil then return end
    local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)
    
    local cr=cairo_create(cs)    
    
    local updates=conky_parse('${updates}')
    update_num=tonumber(updates)
    
    if update_num>5 then
        for i in pairs(settings_table) do
            setup_rings(cr,settings_table[i])
        end
    end
    
    draw_clock_hands(cr,clock_x,clock_y)
end
