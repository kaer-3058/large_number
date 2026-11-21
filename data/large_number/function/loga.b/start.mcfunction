##换底公式计算log.a(b)
#log.a(b)=ln(b)/ln(a)

#底数：scoreboard players set #loga.b_a large_number.int 5
#真数：scoreboard players set #loga.b_b large_number.int 12

#ln(b)
scoreboard players operation #loga.b.tempinp large_number.int = #loga.b_b large_number.int
execute if score #loga.b.tempinp large_number.int matches 1..10000 store result storage large_number:math temp int 1.0 run scoreboard players get #loga.b.tempinp large_number.int
execute if score #loga.b.tempinp large_number.int matches 1..10000 store result score #loga.b.output large_number.int run function large_number:loga.b/1..10000 with storage large_number:math
execute if score #loga.b.tempinp large_number.int matches 10001.. run function large_number:loga.b/10001..
scoreboard players operation #loga.b.ln(b) large_number.int = #loga.b.output large_number.int

#ln(a)
scoreboard players operation #loga.b.tempinp large_number.int = #loga.b_a large_number.int
execute if score #loga.b.tempinp large_number.int matches 1..10000 store result storage large_number:math temp int 1.0 run scoreboard players get #loga.b.tempinp large_number.int
execute if score #loga.b.tempinp large_number.int matches 1..10000 store result score #loga.b.output large_number.int run function large_number:loga.b/1..10000 with storage large_number:math
execute if score #loga.b.tempinp large_number.int matches 10001.. run function large_number:loga.b/10001..
scoreboard players operation #loga.b.ln(a) large_number.int = #loga.b.output large_number.int

#除法
scoreboard players operation #temp2 large_number.int = #loga.b.ln(b) large_number.int
scoreboard players operation #loga.b.ln(b) large_number.int /= #loga.b.ln(a) large_number.int
scoreboard players operation #temp2 large_number.int %= #loga.b.ln(a) large_number.int
scoreboard players operation #temp2 large_number.int *= 10000 const
scoreboard players operation #temp2 large_number.int /= #loga.b.ln(a) large_number.int
scoreboard players operation #loga.b.ln(b) large_number.int *= 10000 const

execute store result storage large_number:math "log.a(b).output" double 0.0001 run scoreboard players operation #loga.b.ln(b) large_number.int += #temp2 large_number.int

#特殊值判定
#以0或1为底的"不为1的数"的对数不存在
#任何数为底的1的对数都是0
#非0且非1的底数的0的对数都是负无穷
execute if score #loga.b_a large_number.int matches 0..1 unless score #loga.b_b large_number.int matches 1 run data remove storage large_number:math "log.a(b).output"
execute if score #loga.b_b large_number.int matches 1 run data modify storage large_number:math "log.a(b).output" set value 0.0d
execute unless score #loga.b_a large_number.int matches 0..1 if score #loga.b_b large_number.int matches 0 run data modify storage large_number:math "log.a(b).output" set value -1.797693134862315807E308d

#输出
execute store result score #loga.b.output large_number.int run data get storage large_number:math "log.a(b).output" 10000
execute unless data storage large_number:math "log.a(b).output" run scoreboard players reset #loga.b.output large_number.int
data modify storage large_number:math temp1 set string storage large_number:math "log.a(b).output" 0 -1
execute if data storage large_number:math {temp1:"-Infinity"} run scoreboard players set #loga.b.output large_number.int -2147483648
