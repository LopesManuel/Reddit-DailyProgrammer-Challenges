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
--Read message
local line = ""
while true do
  local lineTemp = io.read()
  if lineTemp == nil then break end
  line = line .. lineTemp
end
if line == "" then print("Input error!") return end

--Decode
local output = ""
for word in line:gmatch("%w+")do
  local outWord = ""
  local saveWord = word
  for i=1, #word, 1 do
    for x, entry in ipairs(dictionary) do
      fo,lo = string.find(word, entry.v)
      if fo == 1 then 
        outWord = outWord .. entry.k
        i = i + lo
        word = string.gsub(word, entry.v, "",1)
      end
    end
  end
  -- decodes by one word at a time
  line = string.gsub(line, saveWord, outWord,1)
end

print(line)
