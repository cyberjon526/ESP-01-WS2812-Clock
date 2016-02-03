--load NTP timer and telnet.lua
-- start NTP/TIME timers
TIME=loadfile("ntp.lua")()
TIME:run(1,1,1800,"193.170.62.252")

tmr.delay(2000000)
dofile("telnet.lua")

-- arrarys for display
number = {} -- define number array
colon = {}

-- if you want different color beisdes white, change following _on variables for example red = \010\000\000 make integer larger than 10 to increase brightness
l_on = '\010\010\010\010\010\010\010\010\010\010\010\010\010\010\010'
l_off = '\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000'
s_on = '\010\010\010\010\010\010\010\010\010\010\010\010'
s_off = '\000\000\000\000\000\000\000\000\000\000\000\000'

number[1] = s_off .. l_on .. l_on .. s_off .. l_off .. l_off .. s_off
number[2] = s_on .. l_on .. l_off .. s_on .. l_on .. l_off .. s_on
number[3] = s_on .. l_on .. l_on .. s_on .. l_off .. l_off .. s_on
number[4] = s_off .. l_on .. l_on .. s_off .. l_off .. l_on .. s_on
number[5] = s_on .. l_off .. l_on .. s_on .. l_off .. l_on .. s_on
number[6] = s_on .. l_off .. l_on .. s_on .. l_on .. l_on .. s_on
number[7] = s_on .. l_on .. l_on .. s_off .. l_off .. l_off .. s_off
number[8] = s_on .. l_on .. l_on .. s_on .. l_on .. l_on .. s_on
number[9] = s_on .. l_on .. l_on .. s_on .. l_off .. l_on .. s_on
number[0] = s_on .. l_on .. l_on .. s_on .. l_on .. l_on .. s_off
colon[0] = s_off
colon[1] = s_on

--loop for infinity -- execute ws2812-clock.lua every 250ms
tmr.alarm(0, 250, 1, function() dofile("ws2812-clock.lua") end )
