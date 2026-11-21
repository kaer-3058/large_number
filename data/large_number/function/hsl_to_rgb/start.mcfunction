##HSL转RGB

#色环 - 根据角度输出RGB值

#scoreboard players set #hsl_to_rgb.h large_number.int 72

execute if score #hsl_to_rgb.h large_number.int matches 0..60 run function large_number:hsl_to_rgb/angle_ope_rgb/1
execute if score #hsl_to_rgb.h large_number.int matches 61..120 run function large_number:hsl_to_rgb/angle_ope_rgb/2
execute if score #hsl_to_rgb.h large_number.int matches 121..180 run function large_number:hsl_to_rgb/angle_ope_rgb/3
execute if score #hsl_to_rgb.h large_number.int matches 181..240 run function large_number:hsl_to_rgb/angle_ope_rgb/4
execute if score #hsl_to_rgb.h large_number.int matches 241..300 run function large_number:hsl_to_rgb/angle_ope_rgb/5
execute if score #hsl_to_rgb.h large_number.int matches 301..360 run function large_number:hsl_to_rgb/angle_ope_rgb/6


#计算色相立方uv坐标
#scoreboard players set #hsl_to_rgb.s large_number.int 33
#scoreboard players set #hsl_to_rgb.l large_number.int 66

#公式：R=floor(((255-R)u+R)(1-v))

scoreboard players set #hsl_to_rgb.R large_number.int 255
scoreboard players set #hsl_to_rgb.G large_number.int 255
scoreboard players set #hsl_to_rgb.B large_number.int 255

scoreboard players set #store_hsl_to_rgb.s large_number.int 100
scoreboard players operation #store_hsl_to_rgb.s large_number.int -= #hsl_to_rgb.s large_number.int
scoreboard players operation #hsl_to_rgb.R large_number.int -= #sstempR large_number.int
scoreboard players operation #hsl_to_rgb.G large_number.int -= #sstempG large_number.int
scoreboard players operation #hsl_to_rgb.B large_number.int -= #sstempB large_number.int
scoreboard players operation #hsl_to_rgb.R large_number.int *= #store_hsl_to_rgb.s large_number.int
scoreboard players operation #hsl_to_rgb.G large_number.int *= #store_hsl_to_rgb.s large_number.int
scoreboard players operation #hsl_to_rgb.B large_number.int *= #store_hsl_to_rgb.s large_number.int
scoreboard players operation #sstempR large_number.int *= 100 const
scoreboard players operation #sstempG large_number.int *= 100 const
scoreboard players operation #sstempB large_number.int *= 100 const
scoreboard players operation #hsl_to_rgb.R large_number.int += #sstempR large_number.int
scoreboard players operation #hsl_to_rgb.G large_number.int += #sstempG large_number.int
scoreboard players operation #hsl_to_rgb.B large_number.int += #sstempB large_number.int
scoreboard players operation #hsl_to_rgb.R large_number.int *= #hsl_to_rgb.l large_number.int
scoreboard players operation #hsl_to_rgb.G large_number.int *= #hsl_to_rgb.l large_number.int
scoreboard players operation #hsl_to_rgb.B large_number.int *= #hsl_to_rgb.l large_number.int
scoreboard players operation #hsl_to_rgb.R large_number.int /= 10000 const
scoreboard players operation #hsl_to_rgb.G large_number.int /= 10000 const
scoreboard players operation #hsl_to_rgb.B large_number.int /= 10000 const
