-- Rack of Lamb
minetest.register_craftitem("bbq:rack_lamb", {
	description = ("Rack of Lamb"),
	inventory_image = "bbq_rack_lamb.png",
	on_use = minetest.item_eat(9),
})

-- Rack of Lamb Raw
minetest.register_craftitem("bbq:rack_lamb_raw", {
	description = ("Rack of Lamb Raw"),
	inventory_image = "bbq_rack_lamb_raw.png",
	on_use = minetest.item_eat(4),
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
	on_use = minetest.item_eat(3),
})

-- BBQ Chicken
minetest.register_craftitem("bbq:bbq_chicken", {
	description = ("BBQ Chicken"),
	inventory_image = "bbq_bbq_chicken.png",
	on_use = minetest.item_eat(10),
})

-- BBQ Chicken Raw
minetest.register_craftitem("bbq:bbq_chicken_raw", {
	description = ("BBQ Chicken Raw"),
	inventory_image = "bbq_bbq_chicken_raw.png",
	on_use = minetest.item_eat(4),
})

-- BBQ Beef Ribs
minetest.register_craftitem("bbq:bbq_beef_ribs", {
	description = ("BBQ Ribs"),
	inventory_image = "bbq_beef_ribs.png",
	on_use = minetest.item_eat(10),
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
	on_use = minetest.item_eat(9),
})

-- Hamburger
minetest.register_craftitem("bbq:hamburger", {
	description = ("Hamburger"),
	inventory_image = "bbq_hamburger.png",
	on_use = minetest.item_eat(9),
})

-- Hot Dog
minetest.register_craftitem("bbq:hotdog", {
	description = ("Hot Dog"),
	inventory_image = "bbq_hotdog.png",
	on_use = minetest.item_eat(8),
})

-- Raw Beef Jerky
minetest.register_craftitem("bbq:beef_jerky_raw", {
	description = ("Beef Jerky Raw"),
	inventory_image = "bbq_beef_jerky_raw.png",
	on_use = minetest.item_eat(4),
})

-- Beef Jerky
minetest.register_craftitem("bbq:beef_jerky", {
	description = ("Beef Jerky"),
	inventory_image = "bbq_beef_jerky.png",
	on_use = minetest.item_eat(12),
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
	on_use = minetest.item_eat(9),
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
	on_use = minetest.item_eat(5),
})

--Bell Pepper
minetest.register_craftitem("bbq:pepper", {
	description = ("Pepper"),
	inventory_image = "bbq_pepper.png",
	on_use = minetest.item_eat(1),
	groups = {pepper=1},
})

--Tomato
minetest.register_craftitem("bbq:tomato", {
	description = ("Tomato"),
	inventory_image = "bbq_tomato.png",
	on_use = minetest.item_eat(1),
	groups = {tomato=1},
})

--Peppercorn
minetest.register_node("bbq:peppercorn", {
	description = ("Peppercorn"),
	inventory_image = "bbq_peppercorn.png",
	wield_image = "bbq_peppercorn.png",
	drawtype = "plantlike",
	tiles = { "bbq_peppercorn.png" },
	groups = { peppercorn = 1, snappy=3,flammable=3,flora=1,attached_node=1 },
	sounds = default.node_sound_leaves_defaults(),
})



--Ground Pepper
minetest.register_node("bbq:pepper_ground", {
	description = ("Ground Pepper"),
	inventory_image = "bbq_pepper_ground.png",
	wield_image = "bbq_pepper_ground.png",
	drawtype = "plantlike",
	tiles = {"bbq_pepper_ground.png"},
	groups = {pepper_ground = 1, vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Sea Salt
minetest.register_node("bbq:sea_salt", {
	description = ("Sea Salt"),
	inventory_image = "bbq_sea_salt.png",
	wield_image = "bbq_sea_salt.png",
	drawtype = "plantlike",
	tiles = {"bbq_sea_salt.png"},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Brine
minetest.register_node("bbq:brine", {
	description = ("Brine"),
	inventory_image = "bbq_brine.png",
	wield_image = "bbq_brine.png",
	drawtype = "plantlike",
	tiles = {"bbq_brine.png"},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Liquid Smoke
minetest.register_node("bbq:liquid_smoke", {
	description = ("Liquid Smoke"),
	inventory_image = "bbq_liquid_smoke.png",
	wield_image = "bbq_liquid_smoke.png",
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
	drawtype = "plantlike",
	tiles = {"bbq_sugar.png"},
	groups = {vessel = 1, sugar=1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Hot Sauce
minetest.register_node("bbq:hot_sauce", {
	description = ("Hot Sauce"),
	inventory_image = "bbq_hot_sauce.png",
	wield_image = "bbq_hot_sauce.png",
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

-------------------
--Animal Drop Meats
-------------------

-- Raw Mutton
minetest.register_craftitem("bbq:mutton_raw", {
	description = ("Raw Mutton"),
	inventory_image = "bbq_mutton_raw.png",
	on_use = minetest.item_eat(3),
})

-- Cooked Mutton
minetest.register_craftitem("bbq:mutton", {
	description = ("Mutton"),
	inventory_image = "bbq_mutton_cooked.png",
	on_use = minetest.item_eat(8),
})

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
