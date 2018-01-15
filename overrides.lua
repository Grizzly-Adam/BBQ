--------------------------
--COMPATIBILITY WITH CROPS
--------------------------

if minetest.registered_items["crops:peppercorn"] ~= 1 then

minetest.override_item("bbq:peppercorn", {

		on_place =function(itemstack, placer, pointed_thing)
		local under = minetest.get_node(pointed_thing.under)
		if minetest.get_item_group(under.name, "soil") <= 1 then
			return
		end
		crops.plant(pointed_thing.above, {name="crops:pepper_plant_1", param2 = 1})
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end
})
end

if  minetest.registered_items["crops:tomato"] ~= nil then
minetest.override_item("crops:tomato", {
    groups = {tomato=1},
})
end

if  minetest.registered_items["crops:pepper"] ~= nil then
minetest.override_item("crops:pepper", {
    groups = {pepper=1},
})
end

if  minetest.registered_items["crops:peppercorn"] ~= nil then
minetest.override_item("crops:peppercorn", {
    groups = {peppercorn=1},
})
end

if  minetest.registered_items["crops:corn_cob"] ~= nil then
minetest.override_item("crops:corn_cob", {
    groups = {corn=1},
})
end

if  minetest.registered_items["crops:potato"] ~= nil then
minetest.override_item("crops:potato", {
    groups = {potato=1},
})
end

-------------------------
--Add food to Like Groups
-------------------------

-----CHECK FOR FOODS ADDON-------------------------------
if  minetest.registered_items["food:tomato"] ~= nil then
minetest.override_item("food:tomato", {
    groups = {tomato=1},
})
end


if  minetest.registered_items["food:cheese"] ~= nil then
minetest.override_item("food:cheese", {
    groups = {cheese=1},
})
end

if  minetest.registered_items["food:sugar"] ~= nil then
minetest.override_item("food:sugar", {
    groups = {sugar=1},
})
end


if  minetest.registered_items["food:potato"] ~= nil then
minetest.override_item("food:potato", {
    groups = {potato=1},
})
end

-------------------------------
---CHECK FOR FARMING REDO ADDON
-------------------------------
if  minetest.registered_items["farming:chili_pepper"] ~= nil then
minetest.override_item("farming:chili_pepper", {
    groups = {pepper=1},
})
end

if  minetest.registered_items["farming:sugar"] ~= nil then
minetest.override_item("farming:sugar", {
    groups = {sugar=1},
})
end

if  minetest.registered_items["farming:tomato"] ~= nil then
minetest.override_item("farming:tomato", {
    groups = {tomato=1},
})
end


if  minetest.registered_items["farming:corn"] ~= nil then
minetest.override_item("farming:corn", {
    groups = {corn=1},
})
end


if  minetest.registered_items["farming:potato"] ~= nil then
minetest.override_item("farming:potato", {
    groups = {potato=1},
})
end
---------------------------------------------------------

minetest.override_item("mobs:honey", {
    groups = {sugar=1},
})

minetest.override_item("mobs:cheese", {
    groups = {cheese=1},
})

---------------------------------
--UPGRADE MEAT DROPS IN MOBS REDO
---------------------------------

local def = minetest.registered_entities["mobs_animal:sheep_black"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_blue"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_brown"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_cyan"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_dark_green"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_dark_grey"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_green"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_grey"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_magenta"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_orange"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_pink"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_red"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_violet"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_white"]
assert(def, "mobs:sheep not found")
def.drops = {
	{name = "bbq:mutton_raw", chance = 1, min = 1, max = 2 },
}

local def = minetest.registered_entities["mobs_animal:sheep_yellow"]
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

minetest.register_craft({
	type = "fuel",
	recipe = "default:stick",
	burntime = 2,
})

--------------------------------------------------
--ADD WOOD SLABWOOD, TREES AND STICKS TO WOOD PILE
--------------------------------------------------
minetest.override_item("default:wood", {
    groups = {wood_pile=1, wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("default:aspen_wood", {
    groups = {wood_pile=1, wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("default:junglewood", {
    groups = {wood_pile=1, wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("default:acacia_wood", {
    groups = {wood_pile=1, wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("default:pine_wood", {
    groups = {wood_pile=1, wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})
minetest.override_item("stairs:slab_wood", {
    groups = {wood_pile=1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("stairs:slab_aspen_wood", {
    groups = {wood_pile=1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("stairs:slab_junglewood", {
    groups = {wood_pile=1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("stairs:slab_acacia_wood", {
    groups = {wood_pile=1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("stairs:slab_pine_wood", {
    groups = {wood_pile=1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("default:tree", {
    groups = {wood_pile=1, tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("default:aspen_tree", {
    groups = {wood_pile=1, tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("default:jungletree", {
    groups = {wood_pile=1, tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("default:acacia_tree", {
    groups = {wood_pile=1, tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("default:pine_tree", {
    groups = {wood_pile=1, tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
})

minetest.override_item("default:stick", {
    groups = {wood_pile=1, stick = 1, flammable = 2},
})
