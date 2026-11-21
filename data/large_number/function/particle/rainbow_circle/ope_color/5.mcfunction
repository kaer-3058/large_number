scoreboard players set #B large_number.int 1000
scoreboard players set #G large_number.int 0
scoreboard players operation #R large_number.int = #loop large_number.int
scoreboard players operation #R large_number.int *= 5 const
scoreboard players operation #R large_number.int /= 3 const
scoreboard players remove #R large_number.int 4000
