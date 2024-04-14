##换底公式计算log.a(b)
#log.a(b)=ln(b)/ln(a)

#底数：scoreboard players set #loga.b_a int 5
#真数：scoreboard players set #loga.b_b int 12

#ln(b)
scoreboard players operation #loga.b.tempinp int = #loga.b_b int
execute if score #loga.b.tempinp int matches 1..10000 store result storage math temp int 1.0 run scoreboard players get #loga.b.tempinp int
execute if score #loga.b.tempinp int matches 1..10000 run function large_number:loga.b/1..10000 with storage math
execute if score #loga.b.tempinp int matches 10001.. run function large_number:loga.b/10001..
scoreboard players operation #loga.b.ln(b) int = #loga.b.output int

#ln(a)
scoreboard players operation #loga.b.tempinp int = #loga.b_a int
execute if score #loga.b.tempinp int matches 1..10000 store result storage math temp int 1.0 run scoreboard players get #loga.b.tempinp int
execute if score #loga.b.tempinp int matches 1..10000 run function large_number:loga.b/1..10000 with storage math
execute if score #loga.b.tempinp int matches 10001.. run function large_number:loga.b/10001..
scoreboard players operation #loga.b.ln(a) int = #loga.b.output int

#除法
scoreboard players operation #temp2 int = #loga.b.ln(b) int
scoreboard players operation #loga.b.ln(b) int /= #loga.b.ln(a) int
scoreboard players operation #temp2 int %= #loga.b.ln(a) int
scoreboard players operation #temp2 int *= 10000 const
scoreboard players operation #temp2 int /= #loga.b.ln(a) int
scoreboard players operation #loga.b.ln(b) int *= 10000 const

execute store result storage math "log.a(b).output" double 0.0001 run scoreboard players operation #loga.b.ln(b) int += #temp2 int

#特殊值判定
#以0或1为底的"不为1的数"的对数不存在
#任何数为底的1的对数都是0
#非0且非1的底数的0的对数都是负无穷
execute if score #loga.b_a int matches 0..1 unless score #loga.b_b int matches 1 run data remove storage math "log.a(b).output"
execute if score #loga.b_b int matches 1 run data modify storage math "log.a(b).output" set value 0.0d
execute unless score #loga.b_a int matches 0..1 if score #loga.b_b int matches 0 run data modify storage math "log.a(b).output" set value -999.99E400d

#输出
execute store result score #loga.b.output int run data get storage math "log.a(b).output" 10000
execute unless data storage math "log.a(b).output" run scoreboard players reset #loga.b.output int
data modify storage math temp1 set string storage math "log.a(b).output" 0 -1
execute if data storage math {temp1:"-Infinity"} run scoreboard players set #loga.b.output int -2147483648
