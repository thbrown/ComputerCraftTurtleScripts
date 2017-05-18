-- Minecraft Computercraft script for having a turtle build dome.
-- Assumes no obstructions, turtle starts from the base of dome on the left side
-- and builds straight up.
-- Requires: tower.lua
-- Instructions: 
-- 0) Fuel turtle
-- 1) Fill the inventory with blocks the dme should be amde of
-- 2) Supply one argumnents <radius>
local args = {...}
local radius = args[1];

for h=radius,1,-1 do
	shell.run("tower",radius," 1");
	radius = radius - 1;
	turtle.turnRight();
	turtle.forward();
	turtle.turnLeft();
end