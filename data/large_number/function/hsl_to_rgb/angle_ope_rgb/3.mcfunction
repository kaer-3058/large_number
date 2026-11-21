scoreboard players set #sstempG large_number.int 255
scoreboard players set #sstempR large_number.int 0
scoreboard players operation #sstempB large_number.int = #hsl_to_rgb.h large_number.int
scoreboard players operation #sstempB large_number.int *= 17 const
scoreboard players operation #sstempB large_number.int /= 4 const
scoreboard players remove #sstempB large_number.int 510
