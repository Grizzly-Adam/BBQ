-- Kettle Grill
minetest.register_node("bbq:kettle_grill", {
	description = ("Kettle Grill"),
	inventory_image = "bbq_kettle_grill.png",
	wield_image = "bbq_kettle_grill.png",
	drawtype = "plantlike",
	tiles = {"bbq_kettle_grill.png"},
	groups = {grill=1, vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_metal_defaults(),
})

-- Sawdust
minetest.register_node("bbq:sawdust", {
	description = ("Saw Dust"),
	inventory_image = "bbq_sawdust.png",
	wield_image = "bbq_sawdust.png",
	drawtype = "plantlike",
	tiles = {
		"bbq_sawdust.png",
	},
	groups = {choppy=3, oddly_breakable_by_hand=2, flammable=3},
	sounds = default.node_sound_leaves_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
})

-- Chimeny Smoke
minetest.register_node("bbq:chimney_smoke", {
	description = ("Chimney Smoke"),
	inventory_image = "bbq_chimney_smoke.png",
	wield_image = "bbq_chimney_smoke.png",
	drawtype = "plantlike",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	tiles = {
		{
			image = "bbq_chimney_smoke_animation.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		},

	},


	groups = {dig_immediate = 3, attached_node = 1},
})

-- Foil
minetest.register_craftitem("bbq:foil", {
	description = ("Foil"),
	inventory_image = "bbq_foil.png",
	wield_image = "bbq_foil.png",
})

-- Charocal Briquette
minetest.register_craftitem("bbq:charcoal_briquette", {
	description = ("Charcoal Briquette"),
	inventory_image = "bbq_charcoal_briquette.png",
	wield_image = "bbq_charcoal_briquette.png",
})

minetest.register_craft({
	type = "fuel",
	recipe = "bbq:charcoal_briquette",
	burntime = 10,
})

-- Charocal Lump
minetest.register_craftitem("bbq:charcoal_lump", {
	description = ("Charcoal Lump"),
	inventory_image = "bbq_charcoal_lump.png",
	wield_image = "bbq_charcoal_lump.png",
})

minetest.register_craft({
	type = "fuel",
	recipe = "bbq:charcoal_lump",
	burntime = 25,
})

-- Charcoal Bag
minetest.register_node("bbq:charcoal_bag", {
	description = ("Bag o' Charcoal"),
	inventory_image = "bbq_charcoal_bag.png",
	wield_image = "bbq_charcoal_bag.png",
	drawtype = "plantlike",
	sunlight_propagates = true,
	tiles = {
		"bbq_charcoal_bag_top.png", "bbq_charcoal_bag_top.png",
		"bbq_charcoal_bag_side.png", "bbq_charcoal_bag_side.png",
		"bbq_charcoal_bag_back.png", "bbq_charcoal_bag.png",
	},
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.21, -0.5, -0.1, 0.21, 0.22, 0.1},
				{-0.235, 0.22, -0.025, 0.235, 0.25, 0.025},
			},
		},
})

minetest.register_craft({
	type = "fuel",
	recipe = "bbq:charcoal_bag",
	burntime = 150,
})

-- Propane
minetest.register_node("bbq:propane", {
	description = ("Propane"),
	inventory_image = "bbq_propane.png",
	paramtype = "light",
	paramtype2 = "facedir",
	wield_image = "bbq_propane.png",
	drawtype = "plantlike",
	sunlight_propagates = true,
	tiles = {"bbq_propane.png"},
	groups = {explody = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_craft({
	type = "fuel",
	recipe = "bbq:propane",
	burntime = 500,
})

-- Beer
minetest.register_node("bbq:beer", {
	description = ("Beer"),
	inventory_image = "bbq_beer.png",
	wield_image = "bbq_beer.png",
	drawtype = "plantlike",
	sunlight_propagates = true,
	tiles = {
		"bbq_beer_top.png", "bbq_beer_top.png^[transformFy",
		"bbq_beer.png", "bbq_beer.png",
		"bbq_beer.png", "bbq_beer.png^[transformFx",
	},
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.18, -0.5, -0.18, 0.18, 0.3, 0.18},
				{-0.3, -0.25, -0.06, -0.18, 0.18, 0.06},

			},
		},


	on_use = minetest.item_eat(6),
})

-- Vinegar
minetest.register_node("bbq:vinegar", {
	description = ("Vinegar"),
	inventory_image = "bbq_vinegar.png",
	wield_image = "bbq_vinegar.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "plantlike",
	tiles = {"bbq_vinegar.png"},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Vinegar Mother
minetest.register_node("bbq:vinegar_mother", {
	description = ("Vinegar Mother"),
	inventory_image = "bbq_vinegar_mother.png",
	wield_image = "bbq_vinegar_mother.png",
	drawtype = "plantlike",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bbq_vinegar_mother.png"},
	groups = {food_vinegarmother=1, vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Veggie Kebab
minetest.register_craftitem("bbq:veggie_kebab", {
	description = ("Veggie Kebab"),
	inventory_image = "bbq_veggie_kebab.png",
	on_use = minetest.item_eat(8),
})

-- Veggie Kebab Raw
minetest.register_craftitem("bbq:veggie_kebab_raw", {
	description = ("Veggie Kebab Raw"),
	inventory_image = "bbq_veggie_kebab_raw.png",
	on_use = minetest.item_eat(4),
})

-- Veggie Packet
minetest.register_craftitem("bbq:veggie_packet", {
	description = ("Veggie Packet"),
	inventory_image = "bbq_veggie_packet.png",
	on_use = minetest.item_eat(5),
})

-- Veggie Packet Raw
minetest.register_craftitem("bbq:veggie_packet_raw", {
	description = ("Veggie Packet Raw"),
	inventory_image = "bbq_veggie_packet_raw.png",
	on_use = minetest.item_eat(4),
})

-- Stuffed Mushroom
minetest.register_craftitem("bbq:stuffed_mushroom", {
	description = ("Stuffed Mushroom"),
	inventory_image = "bbq_stuffed_mushroom.png",
	on_use = minetest.item_eat(9),
})

-- Stuffed Mushroom Raw
minetest.register_craftitem("bbq:stuffed_mushroom_raw", {
	description = ("Stuffed Mushroom Raw"),
	inventory_image = "bbq_stuffed_mushroom_raw.png",
	on_use = minetest.item_eat(5),
})

-- Portebello Steak_Raw
minetest.register_craftitem("bbq:portebello_steak_raw", {
	description = ("Portebello Steak Raw"),
	inventory_image = "bbq_portebello_steak_raw.png",
	on_use = minetest.item_eat(5),
})

-- Portebello Steak
minetest.register_craftitem("bbq:portebello_steak", {
	description = ("Portebello Steak"),
	inventory_image = "bbq_portebello_steak.png",
	on_use = minetest.item_eat(9),
})

-- Lamb Kebab
minetest.register_craftitem("bbq:lamb_kebab", {
	description = ("Lamb Kebab"),
	inventory_image = "bbq_lamb_kebab.png",
	on_use = minetest.item_eat(4),
})

-- Lamb Kebab Raw
minetest.register_craftitem("bbq:lamb_kebab_raw", {
	description = ("Lamb Kebab Raw"),
	inventory_image = "bbq_lamb_kebab_raw.png",
	on_use = minetest.item_eat(2),
})

-- Rack of Lamb
minetest.register_craftitem("bbq:rack_lamb", {
	description = ("Rack of Lamb"),
	inventory_image = "bbq_rack_lamb.png",
	on_use = minetest.item_eat(10),
})

-- Rack of Lamb Raw
minetest.register_craftitem("bbq:rack_lamb_raw", {
	description = ("Rack of Lamb Raw"),
	inventory_image = "bbq_rack_lamb_raw.png",
	on_use = minetest.item_eat(5),
})

-- Leg of Lamb
minetest.register_craftitem("bbq:leg_lamb", {
	description = ("Leg of Lamb"),
	inventory_image = "bbq_leg_lamb.png",
	on_use = minetest.item_eat(9),
})

-- Leg of Lamb Raw
minetest.register_craftitem("bbq:leg_lamb_raw", {
	description = ("Leg of Lamb Raw"),
	inventory_image = "bbq_leg_lamb_raw.png",
	on_use = minetest.item_eat(4),
})

-- Ham
minetest.register_craftitem("bbq:ham", {
	description = ("Ham"),
	inventory_image = "bbq_ham.png",
	on_use = minetest.item_eat(9),
})

-- Ham Raw
minetest.register_craftitem("bbq:ham_raw", {
	description = ("Ham Raw"),
	inventory_image = "bbq_ham_raw.png",
	on_use = minetest.item_eat(4),
})

-- BBQ Chicken
minetest.register_craftitem("bbq:bbq_chicken", {
	description = ("BBQ Chicken"),
	inventory_image = "bbq_bbq_chicken.png",
	on_use = minetest.item_eat(8),
})

-- BBQ Chicken Raw
minetest.register_craftitem("bbq:bbq_chicken_raw", {
	description = ("BBQ Chicken Raw"),
	inventory_image = "bbq_bbq_chicken_raw.png",
	on_use = minetest.item_eat(4),
})

-- Corned Beef Raw
minetest.register_craftitem("bbq:corned_beef_raw", {
	description = ("Corned Beef Raw"),
	inventory_image = "bbq_corned_beef_raw.png",
	on_use = minetest.item_eat(5),
})

-- Corned Beef
minetest.register_craftitem("bbq:corned_beef", {
	description = ("Corned Beef"),
	inventory_image = "bbq_corned_beef.png",
	on_use = minetest.item_eat(10),
})

-- BBQ Brisket
minetest.register_craftitem("bbq:brisket", {
	description = ("BBQ Brisket"),
	inventory_image = "bbq_brisket.png",
	on_use = minetest.item_eat(9),
})

-- BBQ Brisket Raw
minetest.register_craftitem("bbq:brisket_raw", {
	description = ("BBQ Brisket Raw"),
	inventory_image = "bbq_brisket_raw.png",
	on_use = minetest.item_eat(4),
})

-- BBQ Beef Ribs
minetest.register_craftitem("bbq:bbq_beef_ribs", {
	description = ("BBQ Ribs"),
	inventory_image = "bbq_beef_ribs.png",
	on_use = minetest.item_eat(9),
})

-- BBQ Beef Ribs Raw
minetest.register_craftitem("bbq:bbq_beef_ribs_raw", {
	description = ("BBQ Ribs Raw"),
	inventory_image = "bbq_beef_ribs_raw.png",
	on_use = minetest.item_eat(4),
})

-- Hot Wings Raw
minetest.register_craftitem("bbq:hot_wings_raw", {
	description = ("Hot Wings Raw"),
	inventory_image = "bbq_hot_wings_raw.png",
	on_use = minetest.item_eat(3),
})

-- Hot Wings
minetest.register_craftitem("bbq:hot_wings", {
	description = ("Hot Wings"),
	inventory_image = "bbq_hot_wings.png",
	on_use = minetest.item_eat(8),
})

-- Bacon Cheeseburger
minetest.register_craftitem("bbq:bacon_cheeseburger", {
	description = ("Bacon Cheeseburger"),
	inventory_image = "bbq_bacon_cheeseburger.png",
	on_use = minetest.item_eat(9),
})

-- Cheese Steak
minetest.register_craftitem("bbq:cheese_steak", {
	description = ("Cheese Steak"),
	inventory_image = "bbq_cheese_steak.png",
	on_use = minetest.item_eat(8),
})

-- Hamburger
minetest.register_craftitem("bbq:hamburger", {
	description = ("Hamburger"),
	inventory_image = "bbq_hamburger.png",
	on_use = minetest.item_eat(9),
})

-- Hamburger Patty
minetest.register_craftitem("bbq:hamburger_patty", {
	description = ("Hamburger Patty"),
	inventory_image = "bbq_hamburger_patty.png",
	on_use = minetest.item_eat(8),
})

-- Hamburger Patty Raw
minetest.register_craftitem("bbq:hamburger_patty_raw", {
	description = ("Hamburger Patty Raw"),
	inventory_image = "bbq_hamburger_patty_raw.png",
	on_use = minetest.item_eat(3),
})

-- Hot Dog
minetest.register_craftitem("bbq:hotdog", {
	description = ("Hot Dog"),
	inventory_image = "bbq_hotdog.png",
	on_use = minetest.item_eat(8),
})

-- Hotdog Raw
minetest.register_craftitem("bbq:hotdog_cooked", {
	description = ("Hotdog Cooked"),
	inventory_image = "bbq_hotdog_cooked.png",
	on_use = minetest.item_eat(7),
})

-- Hotdog Raw
minetest.register_craftitem("bbq:hotdog_raw", {
	description = ("Hotdog Raw"),
	inventory_image = "bbq_hotdog_raw.png",
	on_use = minetest.item_eat(3),
})

-- Pulled Pork
minetest.register_craftitem("bbq:pulled_pork", {
	description = ("Pulled Pork"),
	inventory_image = "bbq_pulled_pork.png",
	on_use = minetest.item_eat(8),
})

-- Grilled Pizza Raw
minetest.register_craftitem("bbq:grilled_pizza_raw", {
	description = ("Grilled Pizza Raw"),
	inventory_image = "bbq_grilled_pizza_raw.png",
	on_use = minetest.item_eat(5),
})

-- Grilled Pizza
minetest.register_craftitem("bbq:grilled_pizza", {
	description = ("Grilled Pizza"),
	inventory_image = "bbq_grilled_pizza.png",
	on_use = minetest.item_eat(8),
})

-- Raw Beef Jerky
minetest.register_craftitem("bbq:beef_jerky_raw", {
	description = ("Beef Jerky Raw"),
	inventory_image = "bbq_beef_jerky_raw.png",
	on_use = minetest.item_eat(2),
})

-- Beef Jerky
minetest.register_craftitem("bbq:beef_jerky", {
	description = ("Beef Jerky"),
	inventory_image = "bbq_beef_jerky.png",
	on_use = minetest.item_eat(5),
})

-- Raw Pepper Steak
minetest.register_craftitem("bbq:pepper_steak_raw", {
	description = ("Pepper Steak Raw"),
	inventory_image = "bbq_pepper_steak_raw.png",
	on_use = minetest.item_eat(4),
})

-- Pepper Steak
minetest.register_craftitem("bbq:pepper_steak", {
	description = ("Pepper Steak"),
	inventory_image = "bbq_pepper_steak.png",
	on_use = minetest.item_eat(10),
})

-- Raw Bacon
minetest.register_craftitem("bbq:bacon_raw", {
	description = ("Bacon Raw"),
	inventory_image = "bbq_bacon_raw.png",
	on_use = minetest.item_eat(3),
})

-- Bacon
minetest.register_craftitem("bbq:bacon", {
	description = ("Bacon"),
	inventory_image = "bbq_bacon.png",
	on_use = minetest.item_eat(7),
})

-- London Broil Raw
minetest.register_craftitem("bbq:london_broil_raw", {
	description = ("London Broil Raw"),
	inventory_image = "bbq_london_broil_raw.png",
	on_use = minetest.item_eat(3),
})

-- London Broil
minetest.register_craftitem("bbq:london_broil", {
	description = ("London Broil"),
	inventory_image = "bbq_london_broil.png",
	on_use = minetest.item_eat(7),
})

-- Stuffed Chop Raw
minetest.register_craftitem("bbq:stuffed_chop_raw", {
	description = ("Stuffed Chop Raw"),
	inventory_image = "bbq_stuffed_chop_raw.png",
	on_use = minetest.item_eat(3),
})

-- Stuffed Chop
minetest.register_craftitem("bbq:stuffed_chop", {
	description = ("Stuffed Chop"),
	inventory_image = "bbq_stuffed_chop.png",
	on_use = minetest.item_eat(8),
})

-- Stuffed Pepper
minetest.register_craftitem("bbq:stuffed_pepper", {
	description = ("Stuffed Pepper"),
	inventory_image = "bbq_stuffed_pepper.png",
	on_use = minetest.item_eat(9),
})

-- Stuffed Pepper Raw
minetest.register_craftitem("bbq:stuffed_pepper_raw", {
	description = ("Stuffed Pepper Raw"),
	inventory_image = "bbq_stuffed_pepper_raw.png",
	on_use = minetest.item_eat(4),
})

--Smoked Pepper
minetest.register_craftitem("bbq:smoked_pepper", {
	description = ("Smoked Pepper"),
	inventory_image = "bbq_smoked_pepper.png",
	on_use = minetest.item_eat(5),
})

--Tomato Sauce
minetest.register_craftitem("bbq:tomato_sauce", {
	description = ("Tomato Sauce"),
	inventory_image = "bbq_tomato_sauce.png",
	groups = { food_tomato_sauce=1, vessel=1 },
	on_use = minetest.item_eat(2)
})

--Grilled Tomato
minetest.register_craftitem("bbq:grilled_tomato", {
	description = ("Grilled Tomato"),
	inventory_image = "bbq_grilled_tomato.png",
	on_use = minetest.item_eat(5),
})

--Grilled Corn
minetest.register_craftitem("bbq:grilled_corn", {
	description = ("Grilled Corn"),
	inventory_image = "bbq_grilled_corn.png",
	on_use = minetest.item_eat(8),
})

--Grilled Corn Raw
minetest.register_craftitem("bbq:grilled_corn_raw", {
	description = ("Grilled Corn Raw"),
	inventory_image = "bbq_grilled_corn_raw.png",
	on_use = minetest.item_eat(5),
})

--Paprika
minetest.register_node("bbq:paprika", {
	description = ("Smoked Paprika"),
	inventory_image = "bbq_paprika.png",
	wield_image = "bbq_paprika.png",
	drawtype = "plantlike",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bbq_paprika.png"},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Sea Salt
minetest.register_node("bbq:sea_salt", {
	description = ("Sea Salt"),
	inventory_image = "bbq_sea_salt.png",
	wield_image = "bbq_sea_salt.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "plantlike",
	tiles = {"bbq_sea_salt.png"},
	groups = {food_salt=1, vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Brine
minetest.register_node("bbq:brine", {
	description = ("Brine"),
	inventory_image = "bbq_brine.png",
	wield_image = "bbq_brine.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "plantlike",
	tiles = {"bbq_brine.png"},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Pickled Peppers
minetest.register_node("bbq:pickled_peppers", {
	description = ("Pickled Peppers"),
	inventory_image = "bbq_pickled_peppers.png",
	wield_image = "bbq_pickled_peppers.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "plantlike",
	tiles = {"bbq_pickled_peppers.png"},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
	on_use = minetest.item_eat(5),
})

-- Steak Sauce
minetest.register_node("bbq:steak_sauce", {
	description = ("Steak Sauce"),
	inventory_image = "bbq_steak_sauce.png",
	wield_image = "bbq_steak_sauce.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "plantlike",
	tiles = {"bbq_steak_sauce.png"},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Liquid Smoke
minetest.register_node("bbq:liquid_smoke", {
	description = ("Liquid Smoke"),
	inventory_image = "bbq_liquid_smoke.png",
	wield_image = "bbq_liquid_smoke.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "plantlike",
	tiles = {"bbq_liquid_smoke.png"},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Sugar
minetest.register_node("bbq:sugar", {
	description = ("Sugar"),
	inventory_image = "bbq_sugar.png",
	wield_image = "bbq_sugar.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "plantlike",
	tiles = {"bbq_sugar.png"},
	groups = {vessel = 1, food_sugar=1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
	on_use = minetest.item_eat(2),
})

-- Molasses
minetest.register_node("bbq:molasses", {
	description = ("Molasses"),
	inventory_image = "bbq_molasses.png",
	wield_image = "bbq_molasses.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "plantlike",
	tiles = {"bbq_molasses.png"},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Hot Sauce
minetest.register_node("bbq:hot_sauce", {
	description = ("Hot Sauce"),
	inventory_image = "bbq_hot_sauce.png",
	wield_image = "bbq_hot_sauce.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "plantlike",
	tiles = {"bbq_hot_sauce.png"},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- BBQ Sauce
minetest.register_node("bbq:bbq_sauce", {
	description = ("BBQ Sauce"),
	inventory_image = "bbq_bbq_sauce.png",
	wield_image = "bbq_bbq_sauce.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "plantlike",
	tiles = {"bbq_bbq_sauce.png"},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("bbq:beef_map", {
	description = "Beef Map",
	inventory_image = "bbq_cow_map.png",
	tiles = {
		"default_junglewood.png", "default_junglewood.png",
		"default_junglewood.png", "default_junglewood.png",
		"default_junglewood.png", "bbq_cow_map.png",
	},

	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, 0.4, 0.5, 0.5, 0.5},

			},
		},
	groups = {choppy=3, oddly_breakable_by_hand=2, flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("bbq:smoker_blueprint", {
	description = "Smoker Blueprint",
	inventory_image = "bbq_smoker_blueprint.png",
	tiles = {
		"default_pine_wood.png", "default_pine_wood.png",
		"default_pine_wood.png", "default_pine_wood.png",
		"default_pine_wood.png", "bbq_smoker_blueprint.png",
	},

	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, 0.4, 0.5, 0.5, 0.5},

			},
		},
	groups = {choppy=3, oddly_breakable_by_hand=2, flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

-- Yeast
minetest.register_node("bbq:yeast", {
	description = ("Yeast"),
	inventory_image = "bbq_yeast.png",
	wield_image = "bbq_yeast.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "plantlike",
	tiles = {"bbq_yeast.png"},
	groups = {food_vinegarmother=1, vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-------------------
--Animal Drop Meats
-------------------

-- Raw Beef
minetest.register_craftitem("bbq:beef_raw", {
	description = ("Raw Beef"),
	inventory_image = "bbq_beef_raw.png",
	on_use = minetest.item_eat(3),
})

-- Cooked Beef
minetest.register_craftitem("bbq:beef", {
	description = ("Beef"),
	inventory_image = "bbq_beef_cooked.png",
	on_use = minetest.item_eat(8),
})

------------
--Utensils--
------------

local cold_grills = {
	"bbq:kettle_grill",
	"bbq:propane_grill",
	"bbq:propane_grill_pro",
	"bbq:smoker",
}

local hot_grills = {
	"bbq:kettle_grill_active",
	"bbq:propane_grill_active",
	"bbq:propane_grill_pro_active",
	"bbq:smoker_active",
}

local function on_use_play_sound(sound, use_on_cold)
	return function(itemstack, placer, pointed_thing)
		if not pointed_thing or pointed_thing.type ~= "node" then return end
		local under_pos       = pointed_thing.under
		local under_node_name = minetest.get_node(under_pos).name
		for _, grill_name in ipairs(hot_grills) do
			if under_node_name == grill_name then
				minetest.sound_play(sound, { pos = under_pos, max_hear_distance = 10 })
				return
			end
		end
		if use_on_cold then
			for _, grill_name in ipairs(cold_grills) do
				if under_node_name == grill_name then
					minetest.sound_play(sound, { pos = under_pos, max_hear_distance = 10 })
					return
				end
			end
		end
	end
end


--Spatula
minetest.register_node("bbq:spatula", {
	description = ("Spatula"),
	inventory_image = "bbq_spatula.png",
	wield_image = "bbq_spatula.png",
	groups = {dig_immediate = 3, cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_metal_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"bbq_spatula_tile.png", "bbq_spatula_tile.png",
		"bbq_spatula_tile.png", "bbq_spatula_tile.png",
		"bbq_spatula_tile.png", "bbq_spatula_tile.png",
	},
	groups = {vessel = 1, dig_immediate = 3},
	sounds = default.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
				{-0.15, -0.45, 0.5, 0.125, -.218, 0.45,},
				{-0.105, -0.218, 0.5, 0.085, -0.19, 0.45,},
				{-0.0625, -0.19, 0.5, 0.03125, .5, 0.45,},
--				{-0.15, -0.45, 0.5, 0.125, -.1, 0.45,},
		},
	},
	on_use = on_use_play_sound("bbq_sizzle"),
})

--Basting Brush
minetest.register_node("bbq:basting_brush", {
	description = ("Basting Brush"),
	inventory_image = "bbq_basting_brush.png",
	wield_image = "bbq_basting_brush.png",
	groups = {dig_immediate = 3, cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_metal_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"bbq_basting_brush_hang.png", "bbq_basting_brush_hang.png",
		"bbq_basting_brush_hang.png", "bbq_basting_brush_hang.png",
		"bbq_basting_brush_hang.png", "bbq_basting_brush_hang.png",
	},
	groups = {vessel = 1, dig_immediate = 3},
	sounds = default.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
				{-0.085, -0.45, 0.5, 0.085, -.2525, 0.45,},
				{-0.0625, -0.2525, 0.5, 0.0625, -.218, 0.45,},
				{-0.03, -0.218, 0.5, 0.03, 0.0	, 0.45,},
				{-0.0625, 0.0, 0.5, 0.0625, 0.465, 0.45,},
				{-0.03, .465, 0.5, 0.03, .5, 0.45,},
		},
	},
	on_use = on_use_play_sound("bbq_basting"),
})

--Grill Brush
minetest.register_node("bbq:grill_brush", {
	description = ("Grill Brush"),
	inventory_image = "bbq_grill_brush.png",
	wield_image = "bbq_grill_brush.png",
	groups = {dig_immediate = 3, cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_metal_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"bbq_grill_brush_hang_top.png", "bbq_grill_brush_hang.png",
		"bbq_grill_brush_hang.png", "bbq_grill_brush_hang.png",
		"bbq_grill_brush_hang.png", "bbq_grill_brush_hang.png",
	},
	groups = {vessel = 1, dig_immediate = 3},
	sounds = default.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
				{-0.12, -0.5, 0.49, 0.12, -.467, 0.48,},
				{-0.15, -0.467, 0.5, 0.15, -.2225, 0.45,},
				{-0.125, -0.44, 0.5, 0.125, -.25, 0.35,},
				{-0.03, -0.2225, 0.5, 0.03, 0.13, 0.45,},
				{-0.0625, 0.13	, 0.5, 0.0625, 0.485, 0.45,},
				{-0.03, .485, 0.5, 0.03, .5, 0.45,},
		},
	},
	on_use = on_use_play_sound("bbq_grill_brush", true),
})
