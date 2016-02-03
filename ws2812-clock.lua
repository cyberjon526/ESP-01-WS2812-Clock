digits = 4 --gpio 2
coln = 3 --gpio 0
thr = 0 -- tens hour
ohr = 0 -- ones hour
tmin = 0 -- tens minute
omin = 0 -- ones minute
tick = 0

timezone = 6 -- eastern time
hour = math.floor(TIME.hour) - timezone
if hour < 0 then hour = hour + 12
elseif hour > 12 then hour = hour - 12
elseif hour == 0 then hour = 12 end
minute = math.floor(TIME.minute)
tick = TIME.second%2


thr = math.floor(hour/10)
ohr = hour-thr*10
tmin = math.floor(minute/10)
omin = minute - (tmin*10)


number = {} -- define number array
colon = {}

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


ws2812.writergb(digits, number[thr] .. number[ohr] .. number[tmin] .. number[omin])
ws2812.writergb(coln, colon[tick])
