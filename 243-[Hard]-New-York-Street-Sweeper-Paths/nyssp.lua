--Main
local height = io.read("*number")
local width = io.read("*number")
io.read() -- clear \0
local start = io.read()
print("Height:" .. height .. " Width:" .. width .." Start:" ..start)
print("Reading map...")
local nodes = {}
local map = {}
-- Handles input and saves it
for i=1, (height*2-1),1 do
	local line = io.read()
	if line == nil then print("Input error")break end
	table.insert(map, line)
end
print("Constructing graph...")
-- Graph construction
for j, line in ipairs(map) do
	for w in string.gmatch(line, "%a+") do
		if j % 2 ~= 0 then
			local node = {id = w, adj={}}
			-- Creates adjacent list for the nodes
			local index = string.find(line, w)
			-- Horizontal links
			if index ~= #line then
				right = line:sub(index+2,index+2)
				if  right == '-' or  right == '>' then
					table.insert(node.adj, line:sub(index+4,index+4))
				end
			end
			if index ~= 1 then
				left = line:sub(index-2,index-2)
				if  left == '-' or  left == '<' then
					table.insert(node.adj, line:sub(index-4,index-4))
				end			
			end
			-- Vertical links
			if j ~= #map then
				down = map[j+1]:sub(index,index)
				if  down == '|' or  down == 'v' then
					table.insert(node.adj, map[j+2]:sub(index,index))
				end
			end
			if j ~= 1 then
				up = map[j-1]:sub(index,index)
				if  up == '|' or  up == '^' then
					table.insert(node.adj, map[j-2]:sub(index,index))
				end			
			end
			table.insert(nodes, node)
		end
	end
end
print("Calculating route...")
for j, node in ipairs(nodes) do
	for j, adj in ipairs(node.adj) do
		print( node.id..""..adj)
	end
end