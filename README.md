# ESP-01-WS2812-Clock

Clock built using ESP-01 with WS2812B led strips. Time is updated from a remote NTP server and displayed on the WS2812 strips.

The digits are built by sticking the strips to a board. Segments A, D & G consist of stips of 4 pixels. Segments B, C, E & F consist of strips of 5 pixels. Segments B & C are one continuous strip of 10 pixels and segments E & F are the same. The colons consist of 2 x 2led strips.

The strands are soldered together segments starting at the Tens/Hour A => B => C => D => E => F => G ==> Ones/Hour =>ABCDEFG ==> Tens/Minute ==> Ones/Minute. The data line for the digits strand is wired to gpio2. 

The colon strands are wired together and the data line is connected to gpio0.
