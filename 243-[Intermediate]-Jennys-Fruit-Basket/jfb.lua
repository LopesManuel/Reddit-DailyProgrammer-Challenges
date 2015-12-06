--Main
local fruits = {}
local wallet = 500
--Read input
while true do
  local line = io.read()
  if line == nil then break end
  local n  = string.match(line, "%a+")
  local p  = string.match(line, "%d+")
  local fruit = {name = n,price = p, howMany = 0, max = math.floor(wallet/p)}
  table.insert(fruits, fruit)
end
--Print output
function printFruits() do
	local output = ""
	for j, fruit in ipairs(fruits) do
		if fruit.howMany > 0 and j < #fruits and j > 0 and output ~= "" then
			output = output .. ","
		end
		if fruit.howMany > 1 then 
			output = output .. fruit.howMany .." ".. fruit.name .. "s" 
		elseif fruit.howMany > 0 then
			output = output .. fruit.howMany .." ".. fruit.name
		end
	end
	print(output)
end
end
 
function calculateWallet(wall, f) do
	for j, fruit in ipairs(fruits) do 
		fruit.howMany = f[j] or 0
		wall = wall - fruit.howMany*fruit.price
	end
	if wall == 0 then 
		printFruits() 
	end
end
end

function Combinations(janne, wll)
  local a = {}
  local vals = janne

  local function aux(m, w)
    for i = 0, janne[m].max do
		a[m] = i
		if m < #janne then
			aux(m + 1, w)      
	     else
			calculateWallet(w, a)
	      end		
	  end
  end

  aux(1,wll)
end

Combinations(fruits, wallet)