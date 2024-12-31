##HSL转RGB

#色环 - 根据角度输出RGB值

#scoreboard players set #hsl_to_rgb.h int 72

execute if score #hsl_to_rgb.h int matches 0..60 run function large_number:hsl_to_rgb/angle_ope_rgb/1
execute if score #hsl_to_rgb.h int matches 61..120 run function large_number:hsl_to_rgb/angle_ope_rgb/2
execute if score #hsl_to_rgb.h int matches 121..180 run function large_number:hsl_to_rgb/angle_ope_rgb/3
execute if score #hsl_to_rgb.h int matches 181..240 run function large_number:hsl_to_rgb/angle_ope_rgb/4
execute if score #hsl_to_rgb.h int matches 241..300 run function large_number:hsl_to_rgb/angle_ope_rgb/5
execute if score #hsl_to_rgb.h int matches 301..360 run function large_number:hsl_to_rgb/angle_ope_rgb/6


#计算色相立方uv坐标
#scoreboard players set #hsl_to_rgb.s int 33
#scoreboard players set #hsl_to_rgb.l int 66

#公式：R=floor(((255-R)u+R)(1-v))

scoreboard players set #hsl_to_rgb.R int 255
scoreboard players set #hsl_to_rgb.G int 255
scoreboard players set #hsl_to_rgb.B int 255

scoreboard players set #store_hsl_to_rgb.s int 100
scoreboard players operation #store_hsl_to_rgb.s int -= #hsl_to_rgb.s int
scoreboard players operation #hsl_to_rgb.R int -= #sstempR int
scoreboard players operation #hsl_to_rgb.G int -= #sstempG int
scoreboard players operation #hsl_to_rgb.B int -= #sstempB int
scoreboard players operation #hsl_to_rgb.R int *= #store_hsl_to_rgb.s int
scoreboard players operation #hsl_to_rgb.G int *= #store_hsl_to_rgb.s int
scoreboard players operation #hsl_to_rgb.B int *= #store_hsl_to_rgb.s int
scoreboard players operation #sstempR int *= 100 const
scoreboard players operation #sstempG int *= 100 const
scoreboard players operation #sstempB int *= 100 const
scoreboard players operation #hsl_to_rgb.R int += #sstempR int
scoreboard players operation #hsl_to_rgb.G int += #sstempG int
scoreboard players operation #hsl_to_rgb.B int += #sstempB int
scoreboard players operation #hsl_to_rgb.R int *= #hsl_to_rgb.l int
scoreboard players operation #hsl_to_rgb.G int *= #hsl_to_rgb.l int
scoreboard players operation #hsl_to_rgb.B int *= #hsl_to_rgb.l int
scoreboard players operation #hsl_to_rgb.R int /= 10000 const
scoreboard players operation #hsl_to_rgb.G int /= 10000 const
scoreboard players operation #hsl_to_rgb.B int /= 10000 const
