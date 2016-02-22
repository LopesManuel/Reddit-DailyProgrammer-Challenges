local ranges = {}
local count = 0
local next = next 

local switch_range = io.read('*number')
while true do
	local start = io.read('*number')
	local finish = io.read('*number')
	if finish == nil or start == nil then break end
	if start < finish then 
		i = start; j = finish
	else 
		i = finish; j = start 
	end
	local range = {start = i, finish = j}

	print(i .. " , " .. j)
	if next(ranges) == nil then 
		table.insert(ranges, range) 
	else
		for key,value in pairs(ranges) do 
			local temp = { finish = value.finish, start = value.start}
			-- both inside range
			if value.start <= range.finish and value.finish >= range.finish  
			   and value.start <= range.start and value.finish >= range.start then
			   value.finish = range.start-1
			   range.start  = range.finish+1
			   range.finish = temp.finish
			--start inside range
			elseif value.start <= range.finish and value.finish <= range.finish  
			   and value.start <= range.start and value.finish >= range.start then
			   value.finish = range.start-1
			   range.start  = temp.finish+1
			--finish inside range
			elseif value.start <= range.finish and value.finish >= range.finish  
			   and value.start >= range.start and value.finish >= range.start then
			   value.start = range.finish+1
			   range.finish  = temp.start-1
			--both outside range
			elseif value.start <= range.finish and value.finish <= range.finish  
			   and value.start >= range.start and value.finish >= range.start then
			   value.start = range.start
			   value.finish = temp.start-1
			   range.start  = temp.finish+1
			end
		end
		table.insert(ranges, range) 
	end
	
	for key,value in pairs(ranges) do 
		print(value.start .. " " .. value.finish)
	end
	print("...................")
end
for key,value in pairs(ranges) do 
	count = count + (value.finish - value.start) + 1
end

print(count)