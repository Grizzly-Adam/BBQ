-- Minetest 0.4 mod: bbq
-- See README.txt for licensing and other information.

local bbq_wood_pile_formspec =
	"size[8,7;]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[context;bbq;0,0.3;8,2;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;bbq]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0, 2.85)

local function get_bbq_wood_pile_formspec(inv)
	local formspec = bbq_wood_pile_formspec
	local invlist = inv and inv:get_list("bbq")
	-- Inventory slots overlay
	local vx, vy = 0, 0.3
	for i = 1, 16 do
		if i == 9 then
			vx = 0
			vy = vy + 1
		end
		if not invlist or invlist[i]:is_empty() then
			formspec = formspec ..
				"image[" .. vx .. "," .. vy .. ";1,1;bbq_wood_pile_slot.png]"
		end
		vx = vx + 1
	end
	return formspec
end

minetest.register_node("bbq:wood_pile", {
	description = "Wood Pile",
	tiles = {"bbq_wood_pile_top.png", "bbq_wood_pile_top.png", "bbq_wood_pile_side.png",
		"bbq_wood_pile_side.png", "bbq_wood_pile_front.png", "bbq_wood_pile_front.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_bbq_wood_pile_formspec(nil))
		local inv = meta:get_inventory()
		inv:set_size("bbq", 8 * 2)
	end,
	can_dig = function(pos,player)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("bbq")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if minetest.get_item_group(stack:get_name(), "wood_pile") ~= 0 then
			return stack:get_count()
		end
		return 0
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			   " moves stuff in bbq wood_pile at ".. minetest.pos_to_string(pos))
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_bbq_wood_pile_formspec(meta:get_inventory()))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			   " moves stuff to bbq wood_pile at ".. minetest.pos_to_string(pos))
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_bbq_wood_pile_formspec(meta:get_inventory()))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			   " takes stuff from bbq wood_pile at ".. minetest.pos_to_string(pos))
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_bbq_wood_pile_formspec(meta:get_inventory()))
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "bbq", drops)
		drops[#drops + 1] = "bbq:wood_pile"
		minetest.remove_node(pos)
		return drops
	end,
})

minetest.register_craft({
	output = "bbq:wood_pile",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})
