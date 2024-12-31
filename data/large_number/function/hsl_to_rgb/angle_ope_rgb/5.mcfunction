scoreboard players set #sstempB int 255
scoreboard players set #sstempG int 0
scoreboard players operation #sstempR int = #hsl_to_rgb.h int
scoreboard players operation #sstempR int *= 17 const
scoreboard players operation #sstempR int /= 4 const
scoreboard players remove #sstempR int 1020
