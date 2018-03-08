
--
-- Formspecs
--

function default.get_smoker_active_formspec(fuel_percent, item_percent)
	return "size[8,8.5]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..
		"list[context;src;2.75,0.5;1,1;]"..
		"list[context;fuel;2.75,2.5;1,1;]"..
		"image[2.75,1.5;1,1;bbq_smoker_fire_bg.png^[lowpart:"..
		(100-fuel_percent)..":bbq_smoker_fire_fg.png]"..
		"image[3.75,1.5;1,1;gui_smoker_arrow_bg.png^[lowpart:"..
		(item_percent)..":gui_smoker_arrow_fg.png^[transformR270]"..
		"list[context;dst;4.8,0.5;3,3;]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		"listring[context;dst]"..
		"listring[current_player;main]"..
		"listring[context;src]"..
		"listring[current_player;main]"..
		"listring[context;fuel]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 4.25)
end

function default.get_smoker_inactive_formspec()
	return "size[8,8.5]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..
		"list[context;src;2.75,0.5;1,1;]"..
		"list[context;fuel;2.75,2.5;1,1;]"..
		"image[2.75,1.5;1,1;bbq_smoker_fire_bg.png]"..
		"image[3.75,1.5;1,1;gui_smoker_arrow_bg.png^[transformR270]"..
		"list[context;dst;4.8,0.5;3,3;]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		"listring[context;dst]"..
		"listring[current_player;main]"..
		"listring[context;src]"..
		"listring[current_player;main]"..
		"listring[context;fuel]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 4.25)
end

--
-- Node callback functions that are the same for active and inactive smoker
--

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("fuel") and inv:is_empty("dst") and inv:is_empty("src")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if listname == "fuel" then
		if minetest.get_craft_result({method="fuel", width=1, items={stack}}).time ~= 0 then
			if inv:is_empty("src") then
				meta:set_string("infotext", "smoker is empty")
			end
			return stack:get_count()
		else
			return 0
		end
	elseif listname == "src" then
		return stack:get_count()
	elseif listname == "dst" then
		return 0
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

local function smoker_node_timer(pos, elapsed)
	--
	-- Inizialize metadata
	--
	local meta = minetest.get_meta(pos)
	local fuel_time = meta:get_float("fuel_time") or 0
	local src_time = meta:get_float("src_time") or 0
	local fuel_totaltime = meta:get_float("fuel_totaltime") or 0

	local inv = meta:get_inventory()
	local srclist, fuellist

	local cookable, cooked
	local fuel

	local update = true
	while elapsed > 0 and update do
		update = false

		srclist = inv:get_list("src")
		fuellist = inv:get_list("fuel")

		--
		-- Cooking
		--

		-- Check if we have cookable content
		local aftercooked
		cooked, aftercooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		cookable = cooked.time ~= 0

		local el = math.min(elapsed, fuel_totaltime - fuel_time)


		if cookable then -- fuel lasts long enough, adjust el to cooking duration
			el = math.min(el, cooked.time - src_time)
		end

		-- Check if we have enough fuel to burn
		if fuel_time < fuel_totaltime then
			-- The smoker is currently active and has enough fuel
			fuel_time = fuel_time + el
			-- If there is a cookable item then check if it is ready yet
			if cookable then
				src_time = src_time + el
				if src_time >= cooked.time then
					-- Place result in dst list if possible
					if inv:room_for_item("dst", cooked.item) then
						inv:add_item("dst", cooked.item)
						inv:set_stack("src", 1, aftercooked.items[1])
						src_time = src_time - cooked.time
						update = true
					end
				else
					-- Item could not be cooked: probably missing fuel
					update = true
				end
			end
		else
			-- smoker ran out of fuel
			if cookable then
				-- We need to get new fuel
				local afterfuel
				fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})

				if fuel.time == 0 then
					-- No valid fuel in fuel list
					fuel_totaltime = 0
					src_time = 0
				else
					-- Take fuel from fuel list
					inv:set_stack("fuel", 1, afterfuel.items[1])
					update = true
					fuel_totaltime = fuel.time + (fuel_totaltime - fuel_time)
				end
			else
				-- We don't need to get new fuel since there is no cookable item
				fuel_totaltime = 0
				src_time = 0
			end
			fuel_time = 0
		end

		elapsed = elapsed - el
	end

	if fuel and fuel_totaltime > fuel.time then
		fuel_totaltime = fuel.time
	end
	if srclist[1]:is_empty() then
		src_time = 0
	end

	--
	-- Update formspec, infotext and node
	--
	local formspec
	local item_state
	local item_percent = 0
	if cookable then
		item_percent = math.floor(src_time / cooked.time * 100)
		if item_percent > 100 then
			item_state = "100% (output full)"
		else
			item_state = item_percent .. "%"
		end
	else
		if srclist[1]:is_empty() then
			item_state = "Empty"
		else
			item_state = "Not cookable"
		end
	end

	local fuel_state = "Empty"
	local active = "inactive"
	local result = false

	if fuel_totaltime ~= 0 then
		active = "active"
		local fuel_percent = math.floor(fuel_time / fuel_totaltime * 100)
		fuel_state = fuel_percent .. "%"
		formspec = default.get_smoker_active_formspec(fuel_percent, item_percent)
		swap_node(pos, "bbq:smoker_active")
		-- make sure timer restarts automatically
		result = true
	else
		if not fuellist[1]:is_empty() then
			fuel_state = "0%"
		end
		formspec = default.get_smoker_inactive_formspec()
		swap_node(pos, "bbq:smoker")
		-- stop timer on the inactive smoker
		minetest.get_node_timer(pos):stop()
	end

	local infotext = "smoker " .. active .. "\n(Item: " .. item_state ..
		"; Fuel: " .. fuel_state .. ")"

	--
	-- Set meta values
	--
	meta:set_float("fuel_totaltime", fuel_totaltime)
	meta:set_float("fuel_time", fuel_time)
	meta:set_float("src_time", src_time)
	meta:set_string("formspec", formspec)
	meta:set_string("infotext", infotext)

	return result
end

-------------------
-- Node definitions
-------------------

minetest.register_node("bbq:smoker", {
	description = "Smoker",
	tiles = {
		"bbq_smoker_texture_bottom.png", --top	
		"bbq_smoker_texture_bottom.png^[transformFY", --bottom	
		"bbq_smoker_texture_side.png", --right side	
		"bbq_smoker_texture_side.png^[transformFX", --left side	
		"bbq_smoker_texture_back.png", --back
		"bbq_smoker_texture.png", --front
	},

	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-1.5, -0.03, -0.3, -1.0, 0.35, 0.093},-- smokebox
				{-1.0, -0.08, -0.5, 0.5, 0.6, 0.435	}, -- main body
				{-0.375, 0.095, -.52, -0.16, 0.155, -0.54}, -- main handle
				{-1.37, 0.095, -.32, -1.16, 0.155, -0.34}, -- smokebox handle
				{-0.345, 0.115, -.5, -0.325, 0.135, -0.55}, -- left handle bolt
				{-0.21, 0.115, -.5, -0.19, 0.135, -0.55}, -- right handle bolt
				{-1.32, 0.115, -.35, -1.34, 0.135, -0.3}, -- left smokebox handle bolt
				{-1.19, 0.115, -.35, -1.21, 0.135, -0.3}, -- right smokebox handle bolt
				{0.5, 0.18, .10, 0.99, 0.30, 0.22}, -- chimney x
				{0.87, 0.18, .10, 0.99, .62, 0.22}, -- chimney y
--				{0.93, 0.62, .10, 0.93, .9, 0.22}, -- chimney smoke
--				{0.87, 0.62, .16, 0.99, .9, 0.16}, -- chimney smoke
				{-0.8, -0.5, -0.3, -0.9, -0.08, -0.4}, -- front leftleg
				{0.3, -0.5, -0.3, 0.4, -0.08, -0.4}, -- front right leg
				{-0.8, -0.5, 0.3, -0.9, -0.08, 0.4}, -- front leftleg
				{0.3, -0.5, 0.3, 0.4, -0.08, 0.4}, -- front right leg
			},
		},

	sunlight_propagates = true,
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	can_dig = can_dig,

	on_timer = smoker_node_timer,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", default.get_smoker_inactive_formspec())
		local inv = meta:get_inventory()
		inv:set_size('src', 1)
		inv:set_size('fuel', 1	)
		inv:set_size('dst', 9)
	end,

	on_metadata_inventory_move = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- start timer function, it will sort out whether smoker can burn or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "src", drops)
		default.get_inventory_drops(pos, "fuel", drops)
		default.get_inventory_drops(pos, "dst", drops)
		drops[#drops+1] = "bbq:smoker"
		minetest.remove_node(pos)
		return drops
	end,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})

minetest.register_node("bbq:smoker_active", {
	description = "smoker",



	tiles = {
		"bbq_smoker_texture_bottom.png", --top	
		"bbq_smoker_texture_bottom.png^[transformFY", --bottom	
		{
			image = "bbq_smoker_texture_side_animated.png", --right side	
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		},
		{
			image = "bbq_smoker_texture_side_animated.png^[transformFX", --left side	
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		},

		{
			image = "bbq_smoker_texture_back_animated.png", --back	
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		},
{
			image = "bbq_smoker_texture_animated.png", --front	
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		},
	},


	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-1.5, -0.03, -0.3, -1.0, 0.35, 0.093},-- smokebox
				{-1.0, -0.08, -0.5, 0.5, 0.6, 0.435	}, -- main body
				{-0.375, 0.095, -.52, -0.16, 0.155, -0.54}, -- main handle
				{-1.37, 0.095, -.32, -1.16, 0.155, -0.34}, -- smokebox handle
				{-0.345, 0.115, -.5, -0.325, 0.135, -0.55}, -- left handle bolt
				{-0.21, 0.115, -.5, -0.19, 0.135, -0.55}, -- right handle bolt
				{-1.32, 0.115, -.35, -1.34, 0.135, -0.3}, -- left smokebox handle bolt
				{-1.19, 0.115, -.35, -1.21, 0.135, -0.3}, -- right smokebox handle bolt
				{0.5, 0.18, .10, 0.99, 0.30, 0.22}, -- chimney x
				{0.87, 0.18, .10, 0.99, .62, 0.22}, -- chimney y
				{0.93, 0.62, .10, 0.93, .9, 0.22}, -- chimney smoke
				{0.87, 0.62, .16, 0.99, .9, 0.16}, -- chimney smoke
				{-0.8, -0.5, -0.3, -0.9, -0.08, -0.4}, -- front leftleg
				{0.3, -0.5, -0.3, 0.4, -0.08, -0.4}, -- front right leg
				{-0.8, -0.5, 0.3, -0.9, -0.08, 0.4}, -- front leftleg
				{0.3, -0.5, 0.3, 0.4, -0.08, 0.4}, -- front right leg
			},
		},

	sunlight_propagates = true,
	drop = "bbq:smoker",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_timer = smoker_node_timer,

	can_dig = can_dig,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})
