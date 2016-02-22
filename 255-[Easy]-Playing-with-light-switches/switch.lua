local switchs = {}
local count = 0
function switch_count(flag)
	if flag then 
		count = count + 1
	else
		count = count - 1
	end
end

local switch_range = io.read('*number')
for i=1,switch_range do 
	table.insert(switchs, false)
end
while true do
	local start = io.read('*number')
	local finish = io.read('*number')
	if finish == nil or start == nil then break end
	if start < finish then 
		i = start; j = finish
	else 
		i = finish; j = start 
	end

	while i < j do 
		switchs[i] = not switchs[i]
		switchs[j] = not switchs[j]
		switch_count(switchs[i])
		switch_count(switchs[j])
		i = i +1
		j = j -1
	end
	if i == j then 
		switchs[i] = not switchs[i] 
		switch_count(switchs[i]) 
	end
end


print(count)