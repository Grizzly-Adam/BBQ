-- Function to add groups to existing items
local function add_groups(itemstring, ...)
    local def = minetest.registered_items[itemstring]
    if not def then
        minetest.log("warning", ("[BBQ] trying to add groups to unknown item %q"):format(itemstring))
		return
    end
    local groups = table.copy(def.groups or {})
    for _, group in ipairs({ ... }) do
        local g, v = group:match("^([^=]+)=([^=]+)$")
        if g and v then
            group = g
            v = tonumber(v) or 1
        else
            v = 1
        end
        groups[group] = v
    end
    minetest.override_item(itemstring, { groups = groups })
end


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
	add_groups("crops:tomato", "food_tomato")
end

if  minetest.registered_items["crops:pepper"] ~= nil then
	add_groups("crops:pepper", "food_pepper")
end

if  minetest.registered_items["crops:peppercorn"] ~= nil then
	add_groups("crops:peppercorn", "food_peppercorn")
end

if  minetest.registered_items["crops:corn_cob"] ~= nil then
	add_groups("crops:corn_cob", "food_corn")
end

if  minetest.registered_items["crops:potato"] ~= nil then
	add_groups("crops:potato", "food_potato")
end


--------------------xdecor-----------------------------

if  minetest.registered_items["xdecor:honey"] ~= nil then
	add_groups("xdecor:honey", "food_sugar", "food_honey")
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
	add_groups("bucket:bucket_empty", "vessel")
	add_groups("bucket:bucket_water", "vessel")
	add_groups("bucket:bucket_river_water", "vessel")
	add_groups("bucket:bucket_lava", "vessel")
end

if  minetest.registered_items["mobs:bucket_milk"] ~= nil then
	add_groups("mobs:bucket_milk", "vessel")
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
