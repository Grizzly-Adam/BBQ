---------------
--CRAFT RECIPES
---------------

--Beer Craft Recipe
minetest.register_craft( {
	output = "bbq:beer",
	recipe = {
		{"", "bucket:bucket_water", ""},
		{"bbq:yeast", "farming:wheat", "group:sugar"},
		{"", "vessels:drinking_glass", ""}
	},
	replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
})

--Propane Craft Recipe
minetest.register_craft( {
	output = "bbq:foil",
	recipe = {
		{"", "", ""},
		{"", "", ""},
		{"default:tin_ingot", "default:tin_ingot", "default:tin_ingot"}
	}
})

--Propane Craft Recipe
minetest.register_craft( {
	output = "bbq:propane",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:torch", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})

--Charcoal Bag Recipe
minetest.register_craft( {
	output = "bbq:charcoal_bag",
	recipe = {
		{"bbq:charcoal_briquette", "bbq:charcoal_briquette", "bbq:charcoal_briquette"},
		{"bbq:charcoal_briquette", "bbq:charcoal_briquette", "bbq:charcoal_briquette"},
		{"bbq:charcoal_briquette", "bbq:charcoal_briquette", "bbq:charcoal_briquette"}
	}
})

--Charcoal Briquette Recipe
minetest.register_craft( {
	output = "bbq:charcoal_briquette",
	recipe = {
		{"", "bbq:sawdust", ""},
		{"bbq:sawdust", "bbq:charcoal_lump", "bbq:sawdust"},
		{"", "bbq:sawdust", ""}
	}
})

--Charcoal Lump Recipe
minetest.register_craft( {
	output = "bbq:charcoal_lump",
	recipe = {
		{"", "", ""},
		{"", "group:tree", ""},
		{"", "default:torch", ""}
	}
})

--Sawdust Craft Recipe
minetest.register_craft( {
	output = "bbq:sawdust",
	type = "shapeless",
	recipe = {"default:stick"},

})

--Vinegar Craft Recipe
minetest.register_craft( {
	output = "bbq:vinegar",
	recipe = {
		{"", "group:mother", ""},
		{"", "group:sugar", ""},
		{"", "bucket:bucket_water", ""}
	},
	replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
})

--Smoker Craft Recipe
minetest.register_craft( {
	output = "bbq:smoker",
	recipe = {
		{"default:steel_ingot", "default:glass", "default:steel_ingot"},
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
		{"", "default:steel_ingot", ""}
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

--Lamb Kebab Craft Recipe
minetest.register_craft( {
	output = "bbq:lamb_kebab_raw",
	recipe = {
		{"", "group:pepper", ""},
		{"", "bbq:mutton_raw", ""},
		{"", "default:stick", ""}
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

--Ham Craft Recipe
minetest.register_craft( {
	output = "bbq:ham_raw",
	recipe = {
		{"", "", ""},
		{"", "", ""},
		{"bbq:brine", "mobs:pork_raw", "mobs:honey"}
	}
})

--Pickled Peppers Recipe
minetest.register_craft( {
	output = "bbq:pickled_peppers",
	recipe = {
		{"", "group:peppercorn", ""},
		{"", "group:pepper", ""},
		{"", "bbq:brine", ""}
	}
})

--BBQ Chicken Craft Recipe
minetest.register_craft( {
	output = "bbq:bbq_chicken_raw",
	recipe = {
		{"", "", ""},
		{"", "", ""},
		{"bbq:bbq_sauce", "mobs:chicken_raw", "bbq:paprika"}
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

--Corned Beef Craft Recipe
minetest.register_craft( {
	output = "bbq:corned_beef_raw",
	recipe = {
		{"", "group:peppercorn", ""},
		{"", "bbq:beef_raw", ""},
		{"", "bbq:brine", ""}
	}
})

--BBQ Brisket Craft Recipe
minetest.register_craft( {
	output = "bbq:brisket_raw",
	recipe = {
		{"", "", ""},
		{"", "bbq:bbq_sauce", ""},
		{"bbq:molasses", "bbq:beef_raw", "bbq:paprika"}
	}
})

--Hot Wings Craft Recipe
minetest.register_craft( {
	output = "bbq:hot_wings_raw",
	recipe = {
		{"", "", ""},
		{"", "", ""},
		{"bbq:hot_sauce", "mobs:chicken_raw", "bbq:paprika"}
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

--Cheese Steak Craft Recipe
minetest.register_craft( {
	output = "bbq:cheese_steak",
	recipe = {
		{"", "farming:bread", ""},
		{"group:pepper", "bbq:beef", "group:cheese"},
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

--Grilled Pizza Craft Recipe
minetest.register_craft( {
	output = "bbq:grilled_pizza_raw",
	recipe = {
		{"", "group:cheese", ""},
		{"group:pepper", "bbq:grilled_tomato", "flowers:mushroom_brown"},
		{"bbq:sea_salt", "farming:wheat", "bbq:yeast"}
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

--Stuffed Mushroom Craft Recipe
minetest.register_craft( {
	output = "bbq:stuffed_mushroom_raw",
	recipe = {
		{"", "group:tomato", ""},
		{"", "farming:bread", ""},
		{"", "flowers:mushroom_brown", ""}
	}
})

--Veggie Kebab Craft Recipe
minetest.register_craft( {
	output = "bbq:veggie_kebab_raw",
	recipe = {
		{"", "group:pepper", ""},
		{"group:potato", "group:tomato", "flowers:mushroom_brown"},
		{"", "default:stick", ""}
	}
})

--Veggie Packet Craft Recipe
minetest.register_craft( {
	output = "bbq:veggie_packet_raw",
	recipe = {
		{"", "bbq:pepper_ground", ""},
		{"group:tomato", "group:potato", "group:corn"},
		{"", "bbq:foil", ""}
	}
})

--Portebello Steak Craft Recipe
minetest.register_craft( {
	output = "bbq:portebello_steak_raw",
	recipe = {
		{"", "group:pepper_ground", ""},
		{"", "bbq:steak_sauce", ""},
		{"", "flowers:mushroom_brown", ""}
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

--Grilled Corn Craft Recipe
minetest.register_craft( {
	output = "bbq:grilled_corn_raw",
	recipe = {
		{"", "group:cheese", ""},
		{"", "bbq:paprika", ""},
		{"", "group:corn", ""}
	}
})

--Paprika Craft Recipe
minetest.register_craft( {
	output = "bbq:paprika",
--	type = "shapeless",
	recipe = {
		{'bbq:smoked_pepper'},
	},
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

--Steak Sauce
minetest.register_craft( {
	output = "bbq:steak_sauce",
	recipe = {
		{"", "", ""},
		{"flowers:mushroom_brown", "bbq:vinegar", "bbq:hot_sauce"},
		{"", "vessels:glass_bottle", ""}
	},
	replacements = {{"bbq:vinegar","bbq:vinegar_mother"}},
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
	replacements = {{"default:papyrus","bbq:molasses"}},
})

--Hot Sauce
minetest.register_craft( {
	output = "bbq:hot_sauce",
	recipe = {
		{"", "", ""},
		{"group:pepper_ground", "bucket:bucket_water", "bbq:paprika"},
		{"", "vessels:glass_bottle", ""}
	},
	replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
})

--BBQ Sauce
minetest.register_craft( {
	output = "bbq:bbq_sauce",
	recipe = {
		{"", "bbq:molasses", ""},
		{"group:sugar", "group:tomato", "bbq:liquid_smoke"},
		{"", "bbq:vinegar", ""}
	},
	replacements = {{"bbq:vinegar","bbq:vinegar_mother"}},
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

--Veggie Kebab Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:veggie_kebab",
	recipe = "bbq:veggie_kebab_raw",
	cooktime = 8,
})

--Veggie Packet Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:veggie_packet",
	recipe = "bbq:veggie_packet_raw",
	cooktime = 8,
})

--Stuffed Mushroom Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:stuffed_mushroom",
	recipe = "bbq:stuffed_mushroom_raw",
	cooktime = 6,
})

--Portebello Steak Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:portebello_steak",
	recipe = "bbq:portebello_steak_raw",
	cooktime = 6,
})

--Pepper Steak Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:pepper_steak",
	recipe = "bbq:pepper_steak_raw",
	cooktime = 6,
})

--Smoked Pepper Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:smoked_pepper",
	recipe = "group:pepper",
	cooktime = 9,
})

--Grilled Pizza
minetest.register_craft({
	type = "cooking",
	output = "bbq:grilled_pizza",
	recipe = "bbq:grilled_pizza_raw",
	cooktime = 5,
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

--Corned Beef Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:corned_beef",
	recipe = "bbq:corned_beef_raw",
	cooktime = 15,
})

--BBQ Brisket Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:brisket",
	recipe = "bbq:brisket_raw",
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

--Lamb Kebab
minetest.register_craft({
	type = "cooking",
	output = "bbq:lamb_kebab",
	recipe = "bbq:lamb_kebab_raw",
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

--Stuffed Pepper Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:stuffed_pepper",
	recipe = "bbq:stuffed_pepper_raw",
	cooktime = 4,
})

--Grilled Tomato Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:grilled_tomato",
	recipe = "group:tomato",
	cooktime = 4,
})

--Grilled Corn Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:grilled_corn",
	recipe = "bbq:grilled_corn_raw",
	cooktime = 4,
})
