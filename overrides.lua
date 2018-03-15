---------
--ALIASES
---------
minetest.register_alias("bbq:mutton_raw", "mobs:mutton_raw")
minetest.register_alias("bbq:mutton", "mobs:mutton_cooked")
minetest.register_alias("bbq:wood_pile", "bbq:woodpile_aspen")

--------------------------
--COMPATIBILITY WITH CROPS
--------------------------

if  minetest.registered_items["crops:tomato"] ~= nil then
minetest.override_item("crops:tomato", {
    groups = {food_tomato=1},
})
end

if  minetest.registered_items["crops:pepper"] ~= nil then
minetest.override_item("crops:pepper", {
    groups = {food_pepper=1},
})
end

if  minetest.registered_items["crops:peppercorn"] ~= nil then
minetest.override_item("crops:peppercorn", {
    groups = {food_peppercorn=1},
})
end

if  minetest.registered_items["crops:corn_cob"] ~= nil then
minetest.override_item("crops:corn_cob", {
    groups = {food_corn=1},
})
end

if  minetest.registered_items["crops:potato"] ~= nil then
minetest.override_item("crops:potato", {
    groups = {food_potato=1},
})
end


--------------------xdecor-----------------------------

if  minetest.registered_items["xdecor:honey"] ~= nil then
minetest.override_item("xdecor:honey", {
    groups = {food_sugar=1, food_honey=1},
})
end

---------------------------------
--UPGRADE MEAT DROPS IN MOBS REDO
---------------------------------
if  minetest.registered_items["mobs_animal:cow"] ~= nil then
local def = minetest.registered_entities["mobs_animal:cow"]
assert(def, "mobs:cow not found")
def.drops = {
		{name = "bbq:beef_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:leather", chance = 1, min = 1, max = 2},
}
end

-------------------------------
--MAKE YEAST NATURALLY OCCURING
-------------------------------

for i = 1, 5 do
	minetest.override_item("default:grass_"..i, {drop = {
		max_items = 1,
		items = {
			{items = {'farming:seed_wheat'},rarity = 5},
		{items = {'bbq:yeast'},rarity = 8},
			{items = {'default:grass_1'}},
		}
	}})
end

minetest.override_item("default:junglegrass", {drop = {
	max_items = 1,
	items = {
		{items = {'farming:seed_cotton'},rarity = 8},
		{items = {'bbq:yeast'},rarity = 8},
		{items = {'default:junglegrass'}},
	}
}})

-----------------------------------------------
--MAKE VESSEL TYPE ITEMS WORK WITH VESSEL SHELF
-----------------------------------------------
if  minetest.registered_items["bucket:bucket_empty"] ~= nil then
minetest.override_item("bucket:bucket_empty", {
    groups = {vessel=1},
})

minetest.override_item("bucket:bucket_water", {
    groups = {vessel=1},
})

minetest.override_item("bucket:bucket_river_water", {
    groups = {vessel=1},
})

minetest.override_item("bucket:bucket_lava", {
    groups = {vessel=1},
})
end

if  minetest.registered_items["mobs:bucket_milk"] ~= nil then
minetest.override_item("mobs:bucket_milk", {
    groups = {vessel=1},
})
end

----------------------
--UPGRADING WOOD FUELS
----------------------
minetest.register_craft({
	type = "fuel",
	recipe = "default:junglewood",
	burntime = 100,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:acacia_wood",
	burntime = 92,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wood",
	burntime = 85,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:pine_wood",
	burntime = 75,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:aspen_wood",
	burntime = 65,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:slab_junglewood",
	burntime = 12,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:slab_acacia_wood",
	burntime = 11,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:slab_wood",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:slab_pine_wood",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:slab_aspen_wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:stick",
	burntime = 2,
})
