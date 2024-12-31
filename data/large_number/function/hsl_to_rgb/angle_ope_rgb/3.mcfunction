scoreboard players set #sstempG int 255
scoreboard players set #sstempR int 0
scoreboard players operation #sstempB int = #hsl_to_rgb.h int
scoreboard players operation #sstempB int *= 17 const
scoreboard players operation #sstempB int /= 4 const
scoreboard players remove #sstempB int 510
