digits = 4 --gpio 2
coln = 3 --gpio 0
thr = 0 -- tens hour
ohr = 0 -- ones hour
tmin = 0 -- tens minute
omin = 0 -- ones minute
tick = 0 -- colon variable

timezone = 6 -- eastern time, standard time
hour = math.floor(TIME.hour) - timezone -- adjust time from GMT
if hour < 0 then hour = hour + 12 -- adjust hour to a non-negative number
elseif hour > 12 then hour = hour - 12 -- adjust to AM/PM time (non-military)
elseif hour == 0 then hour = 12 end -- make 0 hour a 12
minute = math.floor(TIME.minute) -- round TIME>minute
tick = TIME.second%2 -- load colon variable to tick at 1/2hz

-- break hour and minute into 4 variables for display
thr = math.floor(hour/10)
ohr = hour-thr*10
tmin = math.floor(minute/10)
omin = minute - (tmin*10)

-- write data to led strips
ws2812.writergb(digits, number[thr] .. number[ohr] .. number[tmin] .. number[omin])
ws2812.writergb(coln, colon[tick])
