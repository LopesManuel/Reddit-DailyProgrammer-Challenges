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

for j, n in ipairs(trie) do
	for i=1,#output do
		local backupWord = output[i];
		if j > 1 and (trie[j-1][1].next[1] == n[1] or trie[j-1][1].next[2] == n[1] )then
			output[i] = backupWord .." ".. n[1].num.. " " 
		end
		if n[2] ~=nil and j > 1 and  trie[j-1][2].next[2] == n[2] then
			table.insert(output, backupWord .." "..n[2].num .. " " )
		end
	end
end 
for i, word in ipairs(output) do
	print(word)
end