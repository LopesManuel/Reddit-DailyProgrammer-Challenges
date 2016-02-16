local trie = {}

local input = io.read()
if input == nil then print("Input error!") return end

local lastNode, lastComboNode
for match in input:gmatch("%d")do
	local node = {num=match,next={}}
	-- there will only be at max 2 nodes per lvl
	trie[#trie+1] = {} 
	trie[#trie][1] = node 
	
	if lastComboNode ~=nil then
		table.insert(lastComboNode.next, node)
		lastComboNode = nil
	end
	if lastNode ~= nil then
		table.insert(lastNode.next, node)
		if (lastNode.num*10 + node.num) < 26 then
			local comboNode = {num=lastNode.num*10 + node.num,next={}}
			trie[#trie-1][2] = comboNode
			table.insert(lastNode.next, comboNode)
			lastComboNode = comboNode
		end
	end
	lastNode = node
end
output = {}
table.insert(output, "")

for i=1,2 do
	local neighbors = trie[0][i].next
	local path = {}
	while #neighbors > 0 then
		local atNode = neighbors[0]
		table.insert(atNode, "")
		if atNode
		
	do 
end

for i, word in ipairs(output) do
	print(word)
end