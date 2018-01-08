-------------------------
--Add food to Like Groups
-------------------------

-----CHECK FOR FOODS ADDON-------------------------------
if  minetest.registered_items["food:tomato"] ~= nil then
minetest.override_item("food:tomato", {
    groups = {tomato=1},
})

minetest.override_item("food:cheese", {
    groups = {cheese=1},
})

minetest.override_item("food:sugar", {
    groups = {sugar=1},
})

end
---------------------------------------------------------

minetest.override_item("mobs:honey", {
    groups = {sugar=1},
})

minetest.override_item("mobs:cheese", {
    groups = {cheese=1},
})



---------
--Aliases
---------
minetest.register_alias("crops:tomato", "bbq:tomato")
minetest.register_alias("food:tomato", "bbq:tomato")


minetest.register_alias("mobs:cheese", "bbq:cheese")
minetest.register_alias("food:cheese", "bbq:cheese")

minetest.register_alias("crops:pepper", "bbq:pepper")


minetest.register_alias("crops:peppercorn", "bbq:peppercorn")

minetest.register_alias("crops:pepper_ground", "bbq:pepper_ground")

minetest.register_alias("crops:pepper", "bbq:pepper")

minetest.register_alias("food:sugar", "bbq:sugar")


---------------------------------
--UPGRADE MEAT DROPS IN MOBS REDO
---------------------------------
local def = minetest.registered_entities["mobs_animal:sheep_white"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:cow"]
assert(def, "mobs:cow not found")
def.drops = {
		{name = "bbq:beef_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:leather", chance = 1, min = 1, max = 2},
}
-----------------------------------------------
--MAKE VESSEL TYPE ITEMS WORK WITH VESSEL SHELF
-----------------------------------------------
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
