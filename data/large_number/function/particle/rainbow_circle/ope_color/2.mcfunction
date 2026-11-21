scoreboard players set #G large_number.int 1000
scoreboard players set #B large_number.int 0
scoreboard players operation #R large_number.int = #loop large_number.int
scoreboard players operation #R large_number.int *= 5 const
scoreboard players operation #R large_number.int /= 3 const
scoreboard players operation #R large_number.int *= -1 const
scoreboard players add #R large_number.int 2000
