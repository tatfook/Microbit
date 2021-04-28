--[[
Title: ItemMicrobitBlock
Author(s): leio
Date: 2021/4/28
Desc: 
use the lib:
------------------------------------------------------------
NPL.load("(gl)Mod/NPLCAD/ItemMicrobitBlock.lua");
local ItemMicrobitBlock = commonlib.gettable("MyCompany.Aries.Game.Items.ItemMicrobitBlock");
-------------------------------------------------------
]]
NPL.load("(gl)script/apps/Aries/Creator/Game/Common/Files.lua");
local Files = commonlib.gettable("MyCompany.Aries.Game.Common.Files");
local EntityManager = commonlib.gettable("MyCompany.Aries.Game.EntityManager");
local BlockEngine = commonlib.gettable("MyCompany.Aries.Game.BlockEngine")
local block_types = commonlib.gettable("MyCompany.Aries.Game.block_types")
local GameLogic = commonlib.gettable("MyCompany.Aries.Game.GameLogic")
local ItemStack = commonlib.gettable("MyCompany.Aries.Game.Items.ItemStack");
NPL.load("(gl)script/ide/System/Core/Color.lua");
local Color = commonlib.gettable("System.Core.Color");
local ItemMicrobitBlock = commonlib.inherit(commonlib.gettable("MyCompany.Aries.Game.Items.ItemCodeBlock"), commonlib.gettable("MyCompany.Aries.Game.Items.ItemMicrobitBlock"));

block_types.RegisterItemClass("ItemMicrobitBlock", ItemMicrobitBlock);

function ItemMicrobitBlock:ctor()
end

function ItemMicrobitBlock:TryCreate(itemStack, entityPlayer, x,y,z, side, data, side_region)
	if (itemStack and itemStack.count == 0) then
		return;
	elseif (entityPlayer and not entityPlayer:CanPlayerEdit(x,y,z, data, itemStack)) then
		return;
	elseif (self:CanPlaceOnSide(x,y,z,side, data, side_region, entityPlayer, itemStack)) then
		NPL.load("(gl)script/apps/Aries/Creator/Game/Items/ItemClient.lua");
		local ItemClient = commonlib.gettable("MyCompany.Aries.Game.Items.ItemClient");
		local names = commonlib.gettable("MyCompany.Aries.Game.block_types.names");
		local item = ItemClient.GetItem(names.CodeBlock);
		if(item) then
			itemStack = itemStack or ItemStack:new():Init(names.CodeBlock, 1);
			itemStack:SetDataField("langConfigFile", "microbit");

			
			local color = Color.convert32_16(Color.ToValue("0xffff00")); 
			return item:TryCreate(itemStack, entityPlayer, x,y,z, side, color, side_region);
		end
	end
end
