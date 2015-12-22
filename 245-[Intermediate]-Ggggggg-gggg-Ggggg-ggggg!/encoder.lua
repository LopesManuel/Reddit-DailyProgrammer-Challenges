--http://stackoverflow.com/questions/33464037/find-all-upper-lower-mixed-combinations-of-a-string?answertab=votes#tab-top
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
                print(s1)
        end
end

--Main
local dictionary = {}
local keys = {}
--Read input
local line = io.read()
if line == nil then print("Input error!") return end
--Create decoder dictionary
for match in line:gmatch("%a")do
    if keys[match] == nil then
        keys[match] = true
    end
end
