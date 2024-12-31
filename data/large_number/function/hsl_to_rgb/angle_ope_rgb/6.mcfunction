scoreboard players set #sstempR int 255
scoreboard players set #sstempG int 0
scoreboard players operation #sstempB int = #hsl_to_rgb.h int
scoreboard players operation #sstempB int *= 17 const
scoreboard players operation #sstempB int /= 4 const
scoreboard players operation #sstempB int *= -1 const
scoreboard players add #sstempB int 1530
