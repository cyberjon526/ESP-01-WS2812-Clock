--load NTP timer and telnet.lua
dofile("loadNTP.lua")
tmr.delay(2000000)
dofile("telnet.lua")

--loop for infinity -- execute ws2812-clock.lua every 250ms
tmr.alarm(0, 250, 1, function() dofile("ws2812-clock.lua") end )
