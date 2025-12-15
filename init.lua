--Trash Can
local function formspec1(pos)
    local spos = pos.x .. "," .. pos.y .. "," ..pos.z
    local formspec =
        "size[9,7]"..
		"background[-0.15,-0.25;9.3,7.75;mytrash_background.png]"..
		"button_exit[6,1.5;2,1;exit;Exit]"..
		"label[0.5,0.5;Drop items here to delete]"..
        "list[nodemeta:".. spos .. ";trash;4,1;1,1;]"..
        "list[current_player;main;0.5,3;8,4;]"..
        "listring[]"
    return formspec
end
--Small Trash Can
local function formspec2(pos)
    local spos = pos.x .. "," .. pos.y .. "," ..pos.z
    local formspec =
        "size[9,7]"..
		"background[-0.15,-0.25;9.3,7.75;mytrash_background.png]"..
		"button_exit[6,1.5;2,1;exit;Exit]"..
		"label[0.5,0.5;Drop items here to delete]"..
        "list[nodemeta:".. spos .. ";trash;4,1;1,1;]"..
        "list[current_player;main;0.5,3;8,4;]"..
        "listring[]"
    return formspec
end
--Trash Bin
local function formspec3(pos)
    local spos = pos.x .. "," .. pos.y .. "," ..pos.z
    local formspec =
        "size[9,7]"..
		"background[-0.15,-0.25;9.3,7.75;mytrash_background.png]"..
		"button_exit[6,1.5;2,1;exit;Exit]"..
		"label[0.5,0.5;Drop items here to delete]"..
        "list[nodemeta:".. spos .. ";trash;4,1;1,1;]"..
        "list[current_player;main;0.5,3;8,4;]"..
        "listring[]"
    return formspec
end
--Sharing Bin
local function formspec4(pos)
    local spos = pos.x .. "," .. pos.y .. "," ..pos.z
    local formspec =
        "size[9,7]"..
		"background[-0.15,-0.25;9.3,7.75;mytrash_background.png]"..
		"label[1,0;Put what you don't want or take what you need:]"..
        "list[nodemeta:".. spos .. ";main;0.5,0.5;8,2;]"..
        "list[current_player;main;0.5,3;8,4;]"..
        "listring[]"
    return formspec
end
core.register_node("mytrash:trash_can",{
	description = "Trash Can",
	drawtype = "mesh",
	mesh = "mytrash_trash_can.obj",
	tiles = {"mytrash_trash_can.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, choppy = 1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	
	after_place_node = function(pos, placer)
		local meta = core.get_meta(pos);
		meta:set_string("infotext",  "Trash Can");
	end,
	
	can_dig = function()
    	return true
	end,
	
	on_construct = function(pos)
        local meta = core.get_meta(pos)
        meta:set_string("infotext", "Trash Can")
        local inv = meta:get_inventory()
        inv:set_size("trash", 1*1)
    end,
    
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
    	local inv = core.get_meta(pos):get_inventory()
    	inv:set_stack(listname, index, nil)
	end,

    on_rightclick = function(pos, node, clicker)
        local meta = core.get_meta(pos)
            core.show_formspec(
                clicker:get_player_name(),
                "mytrash:trash_can_" .. core.pos_to_string(pos),
                formspec1(pos))
    end,
})
	
core.register_node("mytrash:trash_can_sm",{
	description = "Small Trash Can",
	drawtype = "mesh",
	mesh = "mytrash_trash_can_sm.obj",
	tiles = {"mytrash_trash_can_sm.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, choppy = 1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0, 0.25},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0, 0.25},
		}
	},
	
	after_place_node = function(pos, placer)
		local meta = core.get_meta(pos);
		meta:set_string("infotext",  "Small Trash Can");
	end,
	
	can_dig = function()
    	return true
	end,
	
	on_construct = function(pos)
        local meta = core.get_meta(pos)
        meta:set_string("infotext", "Small Trash Can")
        local inv = meta:get_inventory()
        inv:set_size("trash", 1*1)
    end,
    
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
    	local inv = core.get_meta(pos):get_inventory()
    	inv:set_stack(listname, index, nil)
	end,

    on_rightclick = function(pos, node, clicker)
        local meta = core.get_meta(pos)
            core.show_formspec(
                clicker:get_player_name(),
                "mytrash:trash_can_sm_" .. core.pos_to_string(pos),
                formspec2(pos))
    end,
})
	
core.register_node("mytrash:trash_bin",{
	description = "Trash Bin",
	drawtype = "mesh",
	mesh = "mytrash_bin.obj",
	tiles = {"mytrash_bin.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, choppy = 1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 1, 0.5, 0.5},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 1, 0.5, 0.5},
		}
	},
	
	after_place_node = function(pos, placer)
		local meta = core.get_meta(pos);
		meta:set_string("infotext",  "Trash Bin");
	end,
	
	can_dig = function()
    	return true
	end,
	
	on_construct = function(pos)
        local meta = core.get_meta(pos)
        meta:set_string("infotext", "Trash Bin")
        local inv = meta:get_inventory()
        inv:set_size("trash", 1*1)
    end,
    
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
    	local inv = core.get_meta(pos):get_inventory()
    	inv:set_stack(listname, index, nil)
	end,

    on_rightclick = function(pos, node, clicker)
        local meta = core.get_meta(pos)
            core.show_formspec(
                clicker:get_player_name(),
                "mytrash:trash_bin_" .. core.pos_to_string(pos),
                formspec3(pos))
    end,
})
	
core.register_node("mytrash:sharing_bin",{
	description = "Sharing Bin",
	drawtype = "mesh",
	mesh = "mytrash_sharing_bin.obj",
	tiles = {"mytrash_sharing_bin.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, choppy = 1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	after_place_node = function(pos, placer)
		local meta = core.get_meta(pos);
		meta:set_string("infotext",  "Sharing Bin");
	end,
	can_dig = function(pos,player)
		local meta = core.get_meta(pos);
		local inv = meta:get_inventory()
				return inv:is_empty("main")
	end,
	on_construct = function(pos)
        local meta = core.get_meta(pos)
        meta:set_string("infotext", "Sharing Bin")
        local inv = meta:get_inventory()
        inv:set_size("main", 8*2)
    end,
    allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
        local meta = core.get_meta(pos)

        return count
    end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
        local meta = core.get_meta(pos)
        return stack:get_count()
    end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
        local meta = core.get_meta(pos)
        return stack:get_count()
    end,


    on_rightclick = function(pos, node, clicker)
        local meta = core.get_meta(pos)
            core.show_formspec(
                clicker:get_player_name(),
                "mytrash:sharing_bin_" .. core.pos_to_string(pos),
                formspec4(pos))
    end,
})

