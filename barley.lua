--Barley

minetest.register_node("bbq:barley_1", {
	description = "Barley",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"bbq_barley_1.png"},
	-- Use texture of a taller barley stage in inventory
	inventory_image = "bbq_barley_3.png",
	wield_image = "bbq_barley_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, barley = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random barley node
		local stack = ItemStack("bbq:barley_" .. math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("bbq:barley_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("bbq:barley_" .. i, {
		description = "Barley",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"bbq_barley_" .. i .. ".png"},
		inventory_image = "bbq_barley_" .. i .. ".png",
		wield_image = "bbq_barley_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "bbq:barley_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, barley = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

--Dry Barley
minetest.register_node("bbq:dry_barley_1", {
	description = "Dry Barley",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"bbq_dry_barley_1.png"},
	inventory_image = "bbq_dry_barley_3.png",
	wield_image = "bbq_dry_barley_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1,
		attached_node = 1, dry_barley = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random dry barley node
		local stack = ItemStack("bbq:dry_barley_" .. math.random(1, 5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("bbq:dry_barley_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("bbq:dry_barley_" .. i, {
		description = "Dry barley",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"bbq_dry_barley_" .. i .. ".png"},
		inventory_image = "bbq_dry_barley_" .. i .. ".png",
		wield_image = "bbq_dry_barley_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory=1, dry_barley = 1},
		drop = "bbq:dry_barley_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -1 / 16, 6 / 16},
		},
	})
end

