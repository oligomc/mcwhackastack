# store Motion tag of attacked entity
data modify storage was:motion Motion set from entity @s Motion

# Motion values are updated every tick for passengers (despite the fact they cannot move) in every direction except the y-axis
# y-axis motion can be crudely estimated using the following formula:  
# yi = [m_a] + [m_k] + [m_p]
# yf = (y - y * [m_r]) - [m_u]
# yi = initial y-motion
# yf = final y-motion
# [m_u] = universal downward y-motion (-0.0784)
# [m_a] = y-motion increase from generic attacks (0.4392)
# [m_k] = y-motion increase from knockback enchantment (0.0392)
# [m_p] = y-motion increase from punch enchantment (0.1)
# [m_r] = y-motion resistance factor from knockback_resistance attribute
execute store result score $yf was.motion run scoreboard players add @s was.motion 4392
scoreboard players operation $yf was.motion *= #10000 was.motion
execute store result score $mr was.motion run attribute @s knockback_resistance get 10000
scoreboard players operation @s was.motion *= $mr was.motion
scoreboard players operation $yf was.motion -= @s was.motion
execute store result storage was:motion Motion[1] double 0.00000001 run scoreboard players remove $yf was.motion 7840000
scoreboard players reset @s was.motion

# find vehicle at bottom of stack (recursively) and store new Motion tag
function was:loop