pico-8 cartridge // http://www.pico-8.com
version 32
__lua__

frame = 0

cursor_x = 0
cursor_y = 0

-- cursor2_x = 0
-- cursor2_y = 0

-- cursor3_x = 0
-- cursor3_y = 0

-- cursor4_x = 0
-- cursor4_y = 0

cursor_r = 1
cursor_vx = 0
cursor_vy = 0

cursor_a = 0.09

cursor_distance = 16

cursor_color = 137

function change_color (speed)
	
end

function change_size ()

end

function _init ()
	cls()
	camera(-64, -64)
end

function _update()
	is_button_pressed = false

	-- Cursor Movement
	if btn(0) then
		-- left
		cursor_vx -= cursor_a
		is_button_pressed = true
	end
	if btn(1) then
		--right
		cursor_vx += cursor_a
		is_button_pressed = true
	end
    if btn(2) then
		-- up
		cursor_vy -= cursor_a
		is_button_pressed = true
	end
	if btn(3) then
		-- down
		cursor_vy += cursor_a
		is_button_pressed = true
	end

	-- Inretia
	if not(is_button_pressed) then
		
		cursor_vx = cursor_vx / 1.15
        cursor_vy = cursor_vy / 1.15
	end

	-- Rotation
	cursor_x += cursor_vx
    cursor_y += cursor_vy

	-- cursor2_x += -cursor_vx
    -- cursor2_y += -cursor_vy
	
	-- cursor3_x += cursor_vy
    -- cursor3_y += cursor_vx
	
	-- cursor4_x += -cursor_vy
    -- cursor4_y += -cursor_vx

	-- Scrren edge detection
	if (cursor_x > 64) then
		cursor_x = 64
		cursor_vx = 0		
	end
	if (cursor_x < -64) then
		cursor_x = -64
		cursor_vx = 0
	end
	if (cursor_y > 64) then
		cursor_y = 64
		cursor_vy = 0
	end
	if (cursor_y < -64) then
		cursor_y = -64
		cursor_vy = 0
	end
	
	-- Cycle through colors with X
end

function _draw()
	
	-- Paint with Z
    if not(btn(4)) then
        cls()
    end

	circfill(cursor_x * cos(0), cursor_y* sin(0.75), cursor_r, cursor_color)
	circfill(cursor_x * cos(0.5), cursor_y* sin(0.25), cursor_r, cursor_color)
	circfill((cursor_x + cursor_y)/2, (cursor_y + cursor_x)/2, cursor_r, cursor_color)
	circfill(cursor_y * cos(0), cursor_x* sin(0.75), cursor_r, cursor_color)
	-- circfill(cursor_y * cos(sqrt(2)/2), cursor_x* sin(sqrt(2)/2), cursor_r, cursor_color)
	circfill(cursor_y * cos(0.5), cursor_x* sin(0.25), cursor_r, cursor_color)
	-- circfill(cursor_y * cos(sqrt(2)/2), cursor_x* sin(-1* sqrt(2)/2), cursor_r, cursor_color)
end


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0001000008770107701676016760177501774017730177201771013710117100d7000f100101000010000100011000f10001100001000010000100001000c1000c1000c1000b1000b1000a1000a1000a1000a100
0001000005850108501885021850278502d8503185033850388503a8503c8503e8503f8503f8503e8503d8503b85039850378503385031850308502c850298502685024850208501b85016850118500885003850
00100000059700f970189601c96022950269402c9302f9202c91028910171002120013100182001620010200091000c2000920003100042000090001200000000000000000000000000000000000000000000000
