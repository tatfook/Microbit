--[[
Title: 
Author(s): leio
Date: 2021/4/28
Desc: 
use the lib:
------------------------------------------------------------
NPL.load("(gl)Mod/Microbit/main.lua");
------------------------------------------------------------
]]
local CmdParser = commonlib.gettable("MyCompany.Aries.Game.CmdParser");	

local Microbit = commonlib.inherit(commonlib.gettable("Mod.ModBase"),commonlib.gettable("Mod.Microbit"));

function Microbit:ctor()
end

-- virtual function get mod name
function Microbit:GetName()
	return "Microbit"
end

-- virtual function get mod description 
function Microbit:GetDesc()
	return "Microbit is a plugin in paracraft"
end

function Microbit:init()
	LOG.std(nil, "info", "Microbit", "plugin initialized");

	-- register a new block item, id < 10512 is internal items, which is not recommended to modify. 
	GameLogic.GetFilters():add_filter("block_types", function(xmlRoot) 
		local blocks = commonlib.XPath.selectNode(xmlRoot, "/blocks/");
		if(blocks) then
            -- NPL CAD v2.0 with Code Block
			NPL.load("(gl)Mod/Microbit/ItemMicrobitBlock.lua");
			blocks[#blocks+1] = {name="block", attr={ name="MicrobitBlock",
				id = 10519, item_class="ItemMicrobitBlock", text=L"Microbit",
				icon = "Mod/Microbit/textures/icon.png",
			}}
			LOG.std(nil, "info", "Microbit", "microbit  is registered");
            
		end
		return xmlRoot;
	end)

	-- add block to category list to be displayed in builder window (E key)
	GameLogic.GetFilters():add_filter("block_list", function(xmlRoot) 
		for node in commonlib.XPath.eachNode(xmlRoot, "/blocklist/category") do
			if(node.attr.name == "tool" or node.attr.name == "character") then
				node[#node+1] = {name="block", attr={name="MicrobitBlock"} };
			end
		end
		return xmlRoot;
	end)
end

function Microbit:OnLogin()
end
-- called when a new world is loaded. 

function Microbit:OnWorldLoad()
end
-- called when a world is unloaded. 

function Microbit:OnLeaveWorld()
end

function Microbit:OnDestroy()
end



