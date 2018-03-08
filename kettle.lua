
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
		"image[2.75,1.5;1,1;bbq_kettle_grill_fire_bg.png^[lowpart:"..
		(100-fuel_percent)..":bbq_kettle_grill_fire_fg.png]"..
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
		"image[2.75,1.5;1,1;bbq_kettle_grill_fire_bg.png]"..
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
		swap_node(pos, "bbq:kettle_grill_active")
		-- make sure timer restarts automatically
		result = true
	else
		if not fuellist[1]:is_empty() then
			fuel_state = "0%"
		end
		formspec = default.get_smoker_inactive_formspec()
		swap_node(pos, "bbq:kettle_grill")
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

minetest.register_node("bbq:kettle_grill", {
	description = "Kettle Grill",
	inventory_image = "bbq_kettle_grill_inv.png",
	wield_image = "bbq_kettle_grill_inv.png",

	tiles = {
		"bbq_kettle_grill_ext_top.png", "bbq_kettle_grill_ext_top.png",
		"bbq_kettle_grill_ext.png", "bbq_kettle_grill_ext.png",
		"bbq_kettle_grill_ext.png", "bbq_kettle_grill_ext.png",
	},

	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.3, 0.5}, -- main body
			},
		},


	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_metal_defaults(),


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
		drops[#drops+1] = "bbq:kettle_grill"
		minetest.remove_node(pos)
		return drops
	end,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,


	after_place_node = function(pos, placer)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z},{name = "bbq:kettle_grill_base", param2=minetest.dir_to_facedir(placer:get_look_dir())});
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "bbq:kettle_grill", param2=minetest.dir_to_facedir(placer:get_look_dir())});
    end,

	after_destruct = function(pos, oldnode)
        if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "bbq:kettle_grill_base" then
		minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z},{name = "air"}) end
	end,

})

minetest.register_node("bbq:kettle_grill_active", {
	description = "Kettle Grill Active",
	inventory_image = "bbq_kettle_grill_inv.png",
	wield_image = "bbq_kettle_grill_inv.png",

	tiles = {
		"bbq_kettle_grill_ext_top_ani.png", "bbq_kettle_grill_ext_top.png",
		"bbq_kettle_grill_ext_ani.png", "bbq_kettle_grill_ext_ani.png",
		"bbq_kettle_grill_ext_ani.png", "bbq_kettle_grill_ext_ani.png",
	},

	tiles = {
		"bbq_kettle_grill_ext_top_ani.png", "bbq_kettle_grill_ext_top.png",

		{
			image = "bbq_kettle_grill_ext_ani.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		},

		{
			image = "bbq_kettle_grill_ext_ani.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		},



		{
			image = "bbq_kettle_grill_ext_ani.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		},

		{
			image = "bbq_kettle_grill_ext_ani.png",
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
				{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5}, -- main body
				{-0.18, -0.3, -0.0, 0.18, .4, 0.0}, -- smoke
				{-0.0, -0.3, -0.18, 0.0, .4, 0.18}, -- smoke
			},
		},


	groups = {cracky=2, not_in_creative_inventory=1},
	drop = "bbq:kettle_grill",
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_metal_defaults(),
	on_timer = smoker_node_timer,

	can_dig = can_dig,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,

	after_place_node = function(pos, placer)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z},{name = "bbq:kettle_grill_base", param2=minetest.dir_to_facedir(placer:get_look_dir())});
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "bbq:kettle_grill", param2=minetest.dir_to_facedir(placer:get_look_dir())});
    end,

	after_destruct = function(pos, oldnode)
        if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "bbq:kettle_grill_base" then
		minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z},{name = "air"}) end
	end,

})

minetest.register_node("bbq:kettle_grill_base", {
	description = "Kettle Grill Base",

	tiles = {
		"bbq_kettle_top.png", "bbq_kettle_bottom.png^[transformFY",
		"bbq_kettle.png^[transformFX", "bbq_kettle.png",
		"bbq_kettle_side.png", "bbq_kettle_side.png",
	},
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.45, 0.4, -0.45, 0.45, 0.5, 0.45}, -- main body
				{-0.4, 0.313, -0.4, 0.4, 0.5, 0.4}, -- main body
				{-0.1, 0.1, -0.05, 0.05, 0.5, 0.05}, -- catch can
				{-0.342, -0.5, -0.35, -0.292, 0.5, -0.30}, -- leg
				{-0.342, -0.5, 0.35, -0.292, 0.5, 0.30}, -- leg
				{0.342, -0.5, -0.35, 0.292, 0.5, -0.30}, -- leg
				{0.342, -0.5, 0.35, 0.292, 0.5, 0.30}, -- leg
				{-0.342, -0.3, -0.35, 0.35, -0.35, -0.30}, -- cross support
				{-0.342, -0.3, 0.35, 0.30, -0.35, 0.30}, -- cross support
				{0.342, -0.3, -0.35, 0.30, -0.35, 0.35}, -- cross support
				{-0.342, -0.3, -0.35, -0.30, -0.35, 0.35}, -- cross support
				{-0.30, -0.315, -0.2, 0.30, -0.335, -0.18}, -- grid
				{-0.30, -0.315, 0.2, 0.30, -0.335, 0.18}, -- grid
				{-0.30, -0.315, -0.06, 0.30, -0.335, -0.08}, -- grid
				{-0.30, -0.315, 0.06, 0.30, -0.335, 0.08}, -- grid
				{-0.2, -0.315, 0.30, -0.18, -0.335, -0.30}, -- grid
				{0.2, -0.315, 0.30, 0.18, -0.335, -0.30}, -- grid
				{-0.06, -0.315, 0.30, -0.08, -0.335, -0.30}, -- grid
				{0.06, -0.315, 0.30, 0.08, -0.335, -0.30}, -- grid

				{-0.468, -0.5, -0.425, -0.35, -0.25, -0.225}, -- wheel
				{-0.468, -0.475, -0.45, -0.35, -0.275, -0.20}, -- wheel
				{-0.475, -0.375, -0.345, -0.415, -0.345, -0.315}, -- bolt

				{0.45, -0.5, -0.425, 0.35, -0.25, -0.225}, -- wheel
				{0.45, -0.475, -0.45, 0.35, -0.275, -0.20}, -- wheel
				{0.475, -0.375, -0.345, 0.415, -0.345, -0.315}, -- bolt

				{-0.29, -0.5, 0.36, -0.36, -0.4375, 0.29}, -- foot
				{0.29, -0.5, 0.36, 0.36, -0.4375, 0.29}, -- foot

--				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, -- main body
			},
		},
	groups = {cracky=2, not_in_creative_inventory=1},
	drop = "bbq:kettle_grill",
	after_destruct = function(pos, oldnode)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "air"})
	end,

	after_place_node = function(pos, placer)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "bbq:kettle_grill", param2=minetest.dir_to_facedir(placer:get_look_dir())});

    end,

})
