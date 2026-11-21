#大数的10进制位移：向高位移动一位

scoreboard players remove #double_to_int.expon.1 large_number.int 1
scoreboard players operation #z large_number.int *= 10 const
scoreboard players operation #5.1 large_number.int /= 1000 const
scoreboard players operation #z large_number.int += #5.1 large_number.int

scoreboard players operation #double_to_int.1 large_number.int %= 1000 const
scoreboard players operation #double_to_int.1 large_number.int *= 10 const
scoreboard players operation #5.2 large_number.int /= 1000 const
scoreboard players operation #double_to_int.1 large_number.int += #5.2 large_number.int

scoreboard players operation #double_to_int.5 large_number.int %= 1000 const
scoreboard players operation #double_to_int.5 large_number.int *= 10 const
scoreboard players operation #5.3 large_number.int /= 1000 const
scoreboard players operation #double_to_int.5 large_number.int += #5.3 large_number.int

scoreboard players operation #double_to_int.9 large_number.int %= 1000 const
scoreboard players operation #double_to_int.9 large_number.int *= 10 const
scoreboard players operation #5.4 large_number.int /= 1000 const
scoreboard players operation #double_to_int.9 large_number.int += #5.4 large_number.int
