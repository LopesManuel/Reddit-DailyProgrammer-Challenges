local numbers = {}
local count = 1
while true do
  local lineNumber = io.read("*number")
  if lineNumber == nil then break end
  count = count + 1
  table.insert(numbers, lineNumber)
end

for j, number in ipairs(numbers) do
	local sum = 0
	for i=1,number,1 do
	    if number % i == 0 then
	    	sum = sum + i
	    end
	end
	if sum-number == number then
        print(  number.." perfect")
    elseif sum < 2 * number then
        print( number .. " deficient")
    elseif sum > 2 * number then
        print(number .. " abundant by " .. sum - 2 * number)
    end
end
