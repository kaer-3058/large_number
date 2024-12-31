scoreboard players set #sstempR int 255
scoreboard players set #sstempB int 0
scoreboard players operation #sstempG int = #hsl_to_rgb.h int
scoreboard players operation #sstempG int *= 17 const
scoreboard players operation #sstempG int /= 4 const
