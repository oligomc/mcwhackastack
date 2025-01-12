# scoreboard
scoreboard objectives remove was.motion
scoreboard objectives add was.motion dummy
scoreboard players set #10000 was.motion 10000

# data storage
data merge storage was:motion {Motion:[0d,0d,0d]}