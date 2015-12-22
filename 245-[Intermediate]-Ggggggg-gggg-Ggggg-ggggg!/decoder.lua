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
  table.insert(dictionary, entry)
end
--Second line has the message
line = io.read()
if line == nil then print("Input error!") return end
--Decode
local output = ""
for word in line:gmatch("%w+")do
  local outWord = ""
  for match in word:gmatch("%a%a%a")do
    for j, entry in ipairs(dictionary) do
      match = string.gsub(match, entry.v, entry.k)
    end
    outWord = outWord .. match
  end
  line = string.gsub(line, word, outWord)
end
print(line)