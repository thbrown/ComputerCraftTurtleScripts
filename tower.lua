-- Minecraft Computercraft script for having a turtle build a cylindrical tower.
-- Assumes no obstructions, turtle starts from the base of the tower on the left side
-- and builds straight up.
-- Requires: nothing
-- Instructions: 
-- 0) Fuel turtle
-- 1) Fill the inventory with blocks the tower shoud be made of
-- 2) Supply two argumnents <radius> and <height>
local args = {...}
local radius = tonumber(args[1]);
local topHeight = tonumber(args[2]);
local slot = 1;
turtle.select(slot);
print("Creating tower with radius " .. radius .. " and height " .. topHeight);
for h=1,topHeight,1 do
	turtle.up();
	for i=0,3,1 do
		local x = radius;
		local y = 0;
		local turnedRight = false;
		while (x ~= 0 or y ~= radius) do
			local up = math.abs(radius - math.sqrt((x)*(x)+(y+1)*(y+1)) );
			local right = math.abs(radius - math.sqrt((x-1)*(x-1)+(y)*(y)) );

			if (right < up) then
				if not turnedRight then
					turtle.turnRight();
					turnedRight = true;
				end
				turtle.forward();
				x = x - 1;
			else
				if turnedRight then
					turtle.turnLeft();
					turnedRight = false;
				end
				turtle.forward();
				y = y + 1;
			end
			-- Switch slots if needed
			while turtle.getItemCount(slot) == 0 do
				slot = slot + 1;
				print("Switching to slot " .. slot);
				turtle.select(slot);
			end
			turtle.placeDown();
		end
	end
	print("Finshed Row " .. h);
end