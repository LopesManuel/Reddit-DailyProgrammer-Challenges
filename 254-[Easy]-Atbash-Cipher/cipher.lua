local line =  io.read()
local m = 26
repeat
    local msg = { line:byte( 1, -1 ) }  
    local enc = {}
    --the m letters of the alphabet are mapped to 1, 2, .., m
    for i = 1, #msg do
        if  msg[i] >= string.byte('A') and msg[i] <= string.byte('Z')then
            msg[i] = msg[i] - string.byte('A') + 1   
            enc[i] = (-msg[i]%m + 1) + string.byte('A') - 1
        elseif  msg[i] >= string.byte('a') and msg[i] <= string.byte('z') then
            msg[i] = msg[i] - string.byte('a') + 1   
            enc[i] = (-msg[i]%m + 1) + string.byte('a') - 1
        else
            enc[i] = msg[i]  
        end
    end
    print(string.char(unpack(enc)))
    line = io.read()
until line == nil 