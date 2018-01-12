---------------
--CRAFT RECIPES
---------------
--Smoker Craft Recipe
minetest.register_craft( {
	output = "bbq:smoker",
	recipe = {
		{"default:steel_ingot", "default:glass", "default:steel_ingot"},
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})

--Beef Map Recipe
minetest.register_craft( {
	output = "bbq:beef_map",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "mobs:leather", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

--Smoker Blueprint Recipe
minetest.register_craft( {
	output = "bbq:smoker_blueprint",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "dye:blue", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

--Leg of Lamb Craft Recipe
minetest.register_craft( {
	output = "bbq:rack_lamb_raw",
	recipe = {
		{"", "bbq:bbq_sauce", ""},
		{"", "bbq:mutton_raw", ""},
		{"", "bbq:mutton_raw", ""}
	}
})

--Leg of Lamb Craft Recipe
minetest.register_craft( {
	output = "bbq:leg_lamb_raw",
	recipe = {
		{"", "", ""},
		{"", "", ""},
		{"bbq:sea_salt", "bbq:mutton_raw", "bbq:mutton_raw"}
	}
})

--BBQ Chicken Craft Recipe
minetest.register_craft( {
	output = "bbq:ham_raw",
	recipe = {
		{"", "", ""},
		{"", "", ""},
		{"bbq:brine", "mobs:pork_raw", "mobs:honey"}
	}
})

--BBQ Chicken Craft Recipe
minetest.register_craft( {
	output = "bbq:bbq_chicken_raw",
	recipe = {
		{"", "", ""},
		{"", "", ""},
		{"bbq:bbq_sauce", "mobs:chicken_raw", "bbq:sea_salt"}
	}
})

--BBQ Beef Ribs Craft Recipe
minetest.register_craft( {
	output = "bbq:bbq_beef_ribs_raw",
	recipe = {
		{"", "", ""},
		{"", "", ""},
		{"bbq:bbq_sauce", "bbq:beef_raw", "group:pepper_ground"}
	}
})

--Hot Wings Craft Recipe
minetest.register_craft( {
	output = "bbq:hot_wings_raw",
	recipe = {
		{"", "", ""},
		{"", "", ""},
		{"bbq:hot_sauce", "mobs:chicken_raw", "group:pepper_ground"}
	}
})

--Bacon Cheeseburger Craft Recipe
minetest.register_craft( {
	output = "bbq:bacon_cheeseburger",
	recipe = {
		{"", "farming:bread", ""},
		{"bbq:bacon", "bbq:beef", "group:cheese"},
		{"", "farming:bread", ""}
	}
})

--Hamburger Craft Recipe
minetest.register_craft( {
	output = "bbq:hamburger",
	recipe = {
		{"", "farming:bread", ""},
		{"", "bbq:beef", ""},
		{"", "farming:bread", ""}
	}
})

--Hotdog Craft Recipe
minetest.register_craft( {
	output = "bbq:hotdog",
	recipe = {
		{"", "", ""},
		{"", "", ""},
		{"mobs:pork_cooked", "mobs:chicken_cooked", "farming:bread"}
	}
})

--Bacon Craft Recipe
minetest.register_craft( {
	output = "bbq:bacon_raw",
	recipe = {
		{"", "", ""},
		{"bbq:liquid_smoke", "bbq:brine", "mobs:pork_raw"},
		{"", "", ""}
	}
})

--Beef Jerky Craft Recipe
minetest.register_craft( {
	output = "bbq:beef_jerky_raw",
	recipe = {
		{"", "", ""},
		{"bbq:liquid_smoke", "bbq:brine", "bbq:beef_raw"},
		{"", "", ""}
	}
})

--Pepper Steak Craft Recipe
minetest.register_craft( {
	output = "bbq:pepper_steak_raw",
	recipe = {
		{"", "", ""},
		{"group:pepper_ground", "bbq:beef_raw", "group:pepper_ground"},
		{"", "", ""}
	}
})

--Stuffed Pepper Craft Recipe
minetest.register_craft( {
	output = "bbq:stuffed_pepper_raw",
	recipe = {
		{"", "group:cheese", ""},
		{"", "farming:bread", ""},
		{"", "group:pepper", ""}
	}
})

--Ground Pepper Craft Recipe
minetest.register_craft( {
	output = "bbq:pepper_ground",
	recipe = {
		{"", "", ""},
		{"", "group:peppercorn", ""},
		{"", "vessels:glass_bottle", ""}
	}
})

--Brine
minetest.register_craft( {
	output = "bbq:brine",
	recipe = {
		{"", "", ""},
		{"bbq:sea_salt", "group:sugar", "bucket:bucket_water"},
		{"", "vessels:drinking_glass", ""}
	},
	replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
})

--Liquid Smoke
minetest.register_craft( {
	output = "bbq:liquid_smoke",
	recipe = {
		{"", "vessels:glass_bottle", ""},
		{"", "", ""},
		{"", "default:torch", ""}
	},
})

--Sugar
minetest.register_craft( {
	output = "bbq:sugar",
--	type = "shapeless",
	recipe = {
		{'default:papyrus'},
	},
})

--Hot Sauce
minetest.register_craft( {
	output = "bbq:hot_sauce",
	recipe = {
		{"", "", ""},
		{"group:pepper_ground", "bucket:bucket_water", "group:peppercorn"},
		{"", "vessels:glass_bottle", ""}
	},
	replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
})

--BBQ Sauce
minetest.register_craft( {
	output = "bbq:bbq_sauce",
	recipe = {
		{"", "", ""},
		{"group:sugar", "group:tomato", "bbq:liquid_smoke"},
		{"", "vessels:glass_bottle", ""}
	},
})


---------
--COOKING
---------

--Sea Salt Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:sea_salt",
	recipe = "bucket:bucket_water",
	replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
	cooktime = 8,
})

--Mutton Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:mutton",
	recipe = "bbq:mutton_raw",
	cooktime = 5,
})

--Beef Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:beef",
	recipe = "bbq:beef_raw",
	cooktime = 5,
})

--Beef Jerky Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:beef_jerky",
	recipe = "bbq:beef_jerky_raw",
	cooktime = 12,
})

--Pepper Steak Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:pepper_steak",
	recipe = "bbq:pepper_steak_raw",
	cooktime = 6,
})

--Bacon Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:bacon",
	recipe = "bbq:bacon_raw",
	cooktime = 5,
})

--Hot Wings Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:hot_wings",
	recipe = "bbq:hot_wings_raw",
	cooktime = 7,
})

--BBQ Beef Ribs Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:bbq_beef_ribs",
	recipe = "bbq:bbq_beef_ribs_raw",
	cooktime = 15,
})

--BBQ Chicken Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:bbq_chicken",
	recipe = "bbq:bbq_chicken_raw",
	cooktime = 10,
})

--Ham
minetest.register_craft({
	type = "cooking",
	output = "bbq:ham",
	recipe = "bbq:ham_raw",
	cooktime = 10,
})

--Leg of Lamb
minetest.register_craft({
	type = "cooking",
	output = "bbq:leg_lamb",
	recipe = "bbq:leg_lamb_raw",
	cooktime = 10,
})

--Rack of Lamb
minetest.register_craft({
	type = "cooking",
	output = "bbq:rack_lamb",
	recipe = "bbq:rack_lamb_raw",
	cooktime = 10,
})

--Stuff Pepper Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:stuffed_pepper",
	recipe = "bbq:stuffed_pepper_raw",
	cooktime = 4,
})
