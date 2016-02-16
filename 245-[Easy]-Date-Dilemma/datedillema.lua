local dates = {}
local count = 1

while true do
  --read input
  local line = io.read()
  if line == nil then break end
  local numberInput = {}
  --get numbers from input
  local date = {day = 0,month = 0,year = 0}
  for n in line:gmatch("[%d%.]+")do
     table.insert(numberInput, tonumber(n))
  end
  --identify the data type Y M D or M D Y.
  if numberInput[1] > 31 then 
     date.year = numberInput[1]
     date.month = numberInput[2]
     date.day = numberInput[3]
  else
     date.month = numberInput[1]
     date.day = numberInput[2]
      if numberInput[3] > 31 then 
        date.year = numberInput[3] 
      else 
        date.year = 2000+numberInput[3] 
      end
  end 
  table.insert(dates, date)
end
--print output
for j, date in ipairs(dates) do
    print(string.format("%04d-%02d-%02d",date.year,date.month,date.day))
end



