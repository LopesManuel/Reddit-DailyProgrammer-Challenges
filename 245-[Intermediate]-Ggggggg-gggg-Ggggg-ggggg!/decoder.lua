--Main
local dictionary = {}

--Read input
--First line has the dictionary
local line = io.read()
if line == nil then print("Input error!") return end
--Save decoder dictionary
for match in line:gmatch("%a+ %a+")do
  local key  = string.match(match, "%a+")
  local value  = string.match(match, "%a+$")
  local entry = {k = key, v = value}
      print( key .. " " .. value)
  table.insert(dictionary, entry)
end
--Second line has the message
line = io.read()
if line == nil then print("Input error!") return end
--Decode
local output = ""
for match,p in line:gmatch("%a%a%a")do
  print(match)
  for j, entry in ipairs(dictionary) do
    match = string.gsub(match, entry.v, entry.k)
  end
  output = output .. match
end
print(output)