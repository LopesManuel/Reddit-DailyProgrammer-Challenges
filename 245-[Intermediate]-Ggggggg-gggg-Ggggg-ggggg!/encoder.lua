local comb = {}
function combinations(s1, s2)
    if s2:len() > 0 then
        local c = s2:sub(1, 1)
        local l = c:lower()
        local u = c:upper()
    if l == u then
        combinations(s1 .. c, s2:sub(2))
    else
        combinations(s1 .. l, s2:sub(2))
        combinations(s1 .. u, s2:sub(2))
    end
    else

         comb[#comb+1] = s1 

    end
end
        
--Main
local dictionary = {}
local keys = {}
--Read input
local line = ""
while true do
  local lineTemp = io.read()
  if lineTemp == nil then break end
  line = line .. lineTemp
end
if line == "" then print("Input error!") return end
--Create decoder dictionary
local count = 0
for match in line:gmatch("%a")do
    if keys[match] == nil then
        count = count + 1
        keys[match] = count
    end
end
--Generates values to enconde the keys
local alphabet = "g"

for i=1,math.ceil(math.log(count)/math.log(2))+1,1 do 
   alphabet = alphabet .. "g" 
end
combinations("",alphabet)
--Atribute the values generated
for key,value in pairs(keys) do 
    io.write(key .. " " .. comb[value] .. " ") 
    local entry = {k = key, v = comb[value]}
    table.insert(dictionary, entry)
end
print()
--Encode
local output = ""
for word in line:gmatch("%w+")do
  local outWord = ""
  local saveWord = word
  for i=1, #word, 1 do
    for x, entry in ipairs(dictionary) do
      fo,lo = string.find(word, entry.k)
      if fo == 1 then 
        outWord = outWord .. entry.v
        i = i + lo
        word = string.gsub(word, entry.k, "",1)
      end
    end
  end
  -- decodes by one word at a time
  line = string.gsub(line, saveWord, outWord,1)
end

print(line)