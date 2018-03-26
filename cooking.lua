--------------
--ITEM RECIPES
--------------

--Smoker Craft Recipe
minetest.register_craft( {
	output = "bbq:smoker",
	recipe = {
		{"", "", "default:steel_ingot"},
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"}
	}
})

--Kettle Grill Craft Recipe
minetest.register_craft( {
	output = "bbq:kettle_grill",
	recipe = {
		{"default:steel_ingot", "bbq:charcoal_lump", "default:steel_ingot"},
		{"default:steel_ingot", "bbq:charcoal_lump", "default:steel_ingot"},
		{"", "default:steel_ingot", ""}
	}
})

--Propane Grill Pro Craft Recipe
minetest.register_craft( {
	output = "bbq:propane_grill_pro",
	recipe = {
		{"default:steel_ingot", "default:glass", "default:steel_ingot"},
		{"default:steel_ingot", "bbq:propane", "default:steel_ingot"},
		{"", "default:steel_ingot", ""}
	}
})

--Propane Grill Craft Recipe
minetest.register_craft( {
	output = "bbq:propane_grill",
	recipe = {
		{"default:steel_ingot", "default:glass", "default:steel_ingot"},
		{"", "bbq:propane", ""},
		{"", "default:steel_ingot", ""}
	}
})

--Chimeny Smoke Craft Recipe
minetest.register_craft( {
	output = "bbq:chimney_smoke",
	recipe = {
		{"", "group:wood", ""},
		{"", "group:wood", ""},
		{"", "default:torch", ""}
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

--Spatula Craft Recipe
minetest.register_craft( {
	output = "bbq:spatula",
	recipe = {
		{"", "default:tin_ingot", ""},
		{"", "default:tin_ingot", ""},
		{"", "default:stick", ""}
	}
})

--Basting Brush Craft Recipe
minetest.register_craft( {
	output = "bbq:basting_brush",
	recipe = {
		{"", "farming:cotton", ""},
		{"", "default:tin_ingot", ""},
		{"", "default:stick", ""}
	}
})

--Grill Brush Craft Recipe
minetest.register_craft( {
	output = "bbq:grill_brush",
	recipe = {
		{"", "default:tin_ingot", "farming:cotton"},
		{"", "default:tin_ingot", ""},
		{"", "default:stick", ""}
	}
})

--Foil Craft Recipe
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
	type = "shapeless",
	recipe = {"group:tree", "default:torch"}
})

--Sawdust Craft Recipe
minetest.register_craft( {
	output = "bbq:sawdust",
	type = "shapeless",
	recipe = {"default:stick"},

})


--------------
--FOOD RECIPES
--------------

--Beer Craft Recipe
minetest.register_craft( {
	output = "bbq:beer",
	type = "shapeless",
	recipe = {"bucket:bucket_water", "bbq:yeast", "farming:wheat", "group:food_sugar", "vessels:drinking_glass"},
	replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
})

--Vinegar Craft Recipe
minetest.register_craft( {
	output = "bbq:vinegar",
	type = "shapeless",
	recipe = {"group:food_vinegarmother", "group:food_sugar", "bucket:bucket_water"},
	replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
})

--Lamb Kebab Craft Recipe
minetest.register_craft( {
	output = "bbq:lamb_kebab_raw 4",
	type = "shapeless",
	recipe = {"group:food_pepper", "mobs:mutton_raw", "default:stick", "flowers:mushroom_brown", "group:food_onion"}
})

--Rack of Lamb Craft Recipe
minetest.register_craft( {
	output = "bbq:rack_lamb_raw 2",
	type = "shapeless",
	recipe = {"bbq:bbq_sauce", "mobs:mutton_raw", "mobs:mutton_raw"}
})

--Leg of Lamb Craft Recipe
minetest.register_craft( {
	output = "bbq:leg_lamb_raw 2",
	type = "shapeless",
	recipe = {"group:food_garlic_clove", "mobs:mutton_raw", "mobs:mutton_raw"}
})

--Ham Craft Recipe
minetest.register_craft( {
	output = "bbq:ham_raw 2",
	type = "shapeless",
	recipe = {"bbq:brine", "mobs:pork_raw", "group:food_honey"}
})

--Pickled Peppers Recipe
minetest.register_craft( {
	output = "bbq:pickled_peppers",
	type = "shapeless",
	recipe = {"group:food_peppercorn", "group:food_pepper", "bbq:brine"}
})

--BBQ Chicken Craft Recipe
minetest.register_craft( {
	output = "bbq:bbq_chicken_raw 3",
	type = "shapeless",
	recipe = {"bbq:bbq_sauce", "mobs:chicken_raw", "bbq:paprika"}
})

--BBQ Beef Ribs Craft Recipe
minetest.register_craft( {
	output = "bbq:bbq_beef_ribs_raw 2",
	type = "shapeless",
	recipe = {"bbq:bbq_sauce", "bbq:beef_raw", "group:food_pepper_ground"}
})

--Corned Beef Craft Recipe
minetest.register_craft( {
	output = "bbq:corned_beef_raw",
	type = "shapeless",
	recipe = {"group:food_peppercorn", "bbq:beef_raw","bbq:brine",}
})

--BBQ Brisket Craft Recipe
minetest.register_craft( {
	output = "bbq:brisket_raw 2",
	type = "shapeless",
	recipe = {"bbq:bbq_sauce", "bbq:molasses", "bbq:beef_raw", "group:food_garlic_clove"}
})

--Hot Wings Craft Recipe
minetest.register_craft( {
	output = "bbq:hot_wings_raw 3",
	type = "shapeless",
	recipe = {"bbq:hot_sauce", "mobs:chicken_raw", "bbq:paprika"}
})


--Cheese Steak Craft Recipe
minetest.register_craft( {
	output = "bbq:cheese_steak 2",
	type = "shapeless",
	recipe = {"farming:bread", "group:food_pepper", "bbq:beef", "group:food_cheese", "group:food_onion"}
})

--Bacon Cheeseburger Craft Recipe
minetest.register_craft( {
	output = "bbq:bacon_cheeseburger 3",
	type = "shapeless",
	recipe = {"farming:bread", "bbq:bacon", "bbq:hamburger_patty", "group:food_cheese"}
})

--Hamburger Craft Recipe
minetest.register_craft( {
	output = "bbq:hamburger 2",
	type = "shapeless",
	recipe = {"farming:bread", "bbq:hamburger_patty"}
})

--Hamburger Craft Recipe
minetest.register_craft( {
	output = "bbq:hamburger_patty_raw",
	type = "shapeless",
	recipe = {"bbq:beef_raw"}
})

--Hotdog Craft Recipe
minetest.register_craft( {
	output = "bbq:hotdog 2",
	type = "shapeless",
	recipe = {"bbq:hotdog_cooked", "farming:bread"}
})

--Hotdog Raw Craft Recipe
minetest.register_craft( {
	output = "bbq:hotdog_raw",
	type = "shapeless",
	recipe = {"mobs:pork_raw", "mobs:chicken_raw", "bbq:sawdust"}
})

--Pulled Pork Craft Recipe
minetest.register_craft( {
	output = "bbq:pulled_pork 2",
	type = "shapeless",
	recipe = {"mobs:pork_cooked", "farming:bread", "bbq:bbq_sauce"}
})

--Grilled Pizza Craft Recipe
minetest.register_craft( {
	output = "bbq:grilled_pizza_raw 3",
	type = "shapeless",
	recipe = {"group:food_cheese", "group:food_pepper", "bbq:grilled_tomato", "flowers:mushroom_brown", "group:food_salt", "farming:wheat", "bbq:yeast"}
})

--Bacon Craft Recipe
minetest.register_craft( {
	output = "bbq:bacon_raw 2",
	type = "shapeless",
	recipe = {"bbq:liquid_smoke", "bbq:brine", "mobs:pork_raw"}
})

--London Broil Craft Recipe
minetest.register_craft( {
	output = "bbq:london_broil_raw 2",
	type = "shapeless",
	recipe = {"bbq:bacon", "group:food_garlic_clove", "bbq:beef_raw"}
})

--Beef Jerky Craft Recipe
minetest.register_craft( {
	output = "bbq:beef_jerky_raw 3",
	type = "shapeless",
	recipe = {"bbq:liquid_smoke", "bbq:brine", "bbq:beef_raw"}
})

--Pepper Steak Craft Recipe
minetest.register_craft( {
	output = "bbq:pepper_steak_raw",
	type = "shapeless",
	recipe = {"group:food_pepper_ground", "bbq:beef_raw", "group:food_pepper_ground"}
})

--Stuffed Chop Craft Recipe
minetest.register_craft( {
	output = "bbq:stuffed_chop_raw 3",
	type = "shapeless",
	recipe = {"group:food_onion", "farming:bread", "flowers:mushroom_brown", "mobs:pork_raw", "default:apple"}
})

--Stuffed Mushroom Craft Recipe
minetest.register_craft( {
	output = "bbq:stuffed_mushroom_raw 2",
	type = "shapeless",
	recipe = {"group:food_tomato", "farming:bread", "flowers:mushroom_brown"}
})

--Veggie Kebab Craft Recipe
minetest.register_craft( {
	output = "bbq:veggie_kebab_raw 2",
	type = "shapeless",
	recipe = {"group:food_pepper", "group:food_potato", "group:food_tomato", "flowers:mushroom_brown", "default:stick"}
})

--Veggie Packet Craft Recipe
minetest.register_craft( {
	output = "bbq:veggie_packet_raw 2",
	type = "shapeless",
	recipe = {"group:food_pepper_ground", "group:food_tomato", "group:food_potato", "group:food_corn", "bbq:foil"}
})

--Portebello Steak Craft Recipe
minetest.register_craft( {
	output = "bbq:portebello_steak_raw",
	type = "shapeless",
	recipe = {"group:food_pepper_ground", "bbq:steak_sauce", "flowers:mushroom_brown"}
})

--Stuffed Pepper Craft Recipe
minetest.register_craft( {
	output = "bbq:stuffed_pepper_raw 3",
	type = "shapeless",
	recipe = {"group:food_cheese", "farming:bread", "group:food_pepper"}
})

--Grilled Corn Craft Recipe
minetest.register_craft( {
	output = "bbq:grilled_corn_raw 2",
	type = "shapeless",
	recipe = {"group:food_cheese", "bbq:paprika", "group:food_corn"}
})

---------------------
--Spices, Sauces, Etc
---------------------
--Tomato Sauce Craft Recipe
if  minetest.registered_items["crops:tomato"] ~= nil then
minetest.register_craft({
	type = "shapeless",
	output = "bbq:tomato_sauce",
	recipe = { "group:food_tomato" },
    replacements = {{"group:food_tomato","crops:tomato_seed"}}
})
else

minetest.register_craft({
	type = "shapeless",
	output = "bbq:tomato_sauce",
	recipe = { "group:food_tomato" },
})
end

--Paprika Craft Recipe
minetest.register_craft( {
	output = "bbq:paprika",
--	type = "shapeless",
	recipe = {
		{'bbq:smoked_pepper'},
	},
})

--Garlic Clove Craft Recipe
minetest.register_craft({
	type = "shapeless",
	output = "bbq:garlic_clove 9",
	recipe = { "group:food_garlic" }
})

--Garlic Braid Craft Recipe
minetest.register_craft({
	output = "bbq:garlic_braid",
	recipe = { 
		{"group:food_garlic", "group:food_garlic", "group:food_garlic"},
		{"group:food_garlic", "group:food_garlic", "group:food_garlic"},
		{"group:food_garlic", "group:food_garlic", "group:food_garlic"}
	}
})

--Garlic Craft Recipe
minetest.register_craft({
	type = "shapeless",
	output = "bbq:garlic 9",
	recipe = { "group:food_garlic_braid" }
})

--Brine
minetest.register_craft( {
	output = "bbq:brine",
	type = "shapeless",
	recipe = {"group:food_salt", "group:food_sugar", "bucket:bucket_water", "vessels:drinking_glass"},
	replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
})

--Steak Sauce
minetest.register_craft( {
	output = "bbq:steak_sauce",
	type = "shapeless",
	recipe = {"flowers:mushroom_brown", "bbq:vinegar", "bbq:hot_sauce", "vessels:glass_bottle"},
	replacements = {{"bbq:vinegar","bbq:vinegar_mother"}},
})

--Liquid Smoke
minetest.register_craft( {
	output = "bbq:liquid_smoke",
	type = "shapeless",
	recipe = {"vessels:glass_bottle", "default:torch"}
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
	type = "shapeless",
	recipe = {"group:food_pepper_ground", "bucket:bucket_water", "bbq:paprika", "vessels:glass_bottle"},
	replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
})

--BBQ Sauce
minetest.register_craft( {
	output = "bbq:bbq_sauce",
	type = "shapeless",
	recipe = {"bbq:molasses", "group:food_sugar", "group:food_tomato_sauce", "bbq:liquid_smoke", "bbq:vinegar"},
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

--Hamburger Patty Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:hamburger_patty",
	recipe = "bbq:hamburger_patty_raw",
	cooktime = 5,
})

--Hotdog Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:hotdog_cooked",
	recipe = "bbq:hotdog_raw",
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

--Stuffed Chop Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:stuffed_chop",
	recipe = "bbq:stuffed_chop_raw",
	cooktime = 8,
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
	recipe = "group:food_pepper",
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

--London Broil Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:london_broil",
	recipe = "bbq:london_broil_raw",
	cooktime = 6,
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
	recipe = "group:food_tomato",
	cooktime = 4,
})

--Grilled Corn Cooking
minetest.register_craft({
	type = "cooking",
	output = "bbq:grilled_corn",
	recipe = "bbq:grilled_corn_raw",
	cooktime = 4,
})
