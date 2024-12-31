scoreboard players set #sstempB int 255
scoreboard players set #sstempR int 0
scoreboard players operation #sstempG int = #hsl_to_rgb.h int
scoreboard players operation #sstempG int *= 17 const
scoreboard players operation #sstempG int /= 4 const
scoreboard players operation #sstempG int *= -1 const
scoreboard players add #sstempG int 1020
