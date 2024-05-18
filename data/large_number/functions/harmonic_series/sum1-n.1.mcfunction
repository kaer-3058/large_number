#ln(x)
execute store result score #loga.b.tempinp int store result score #Harmonic_series.sum.input int run data get storage large_number:math Harmonic_series_sum_input
execute if score #loga.b.tempinp int matches 1..10000 store result storage large_number:math temp int 1.0 run scoreboard players get #loga.b.tempinp int
execute if score #loga.b.tempinp int matches 1..10000 run function large_number:loga.b/1..10000 with storage large_number:math
execute if score #loga.b.tempinp int matches 10001.. run function large_number:loga.b/10001..

#0.4995078/x
scoreboard players operation #sstempd int = #Harmonic_series.sum.input int
execute if score #Harmonic_series.sum.input int matches 1..9 run scoreboard players operation #sstempd int *= 400000 const
execute if score #Harmonic_series.sum.input int matches 1..9 run scoreboard players set #float_exp int -1
execute if score #Harmonic_series.sum.input int matches 10..99 run scoreboard players operation #sstempd int *= 40000 const
execute if score #Harmonic_series.sum.input int matches 10..99 run scoreboard players set #float_exp int -2
execute if score #Harmonic_series.sum.input int matches 100..999 run scoreboard players operation #sstempd int *= 4000 const
execute if score #Harmonic_series.sum.input int matches 100..999 run scoreboard players set #float_exp int -3
execute if score #Harmonic_series.sum.input int matches 1000..9999 run scoreboard players operation #sstempd int *= 400 const
execute if score #Harmonic_series.sum.input int matches 1000.. run scoreboard players set #float_exp int -4
execute if score #Harmonic_series.sum.input int matches 10000..99999 run scoreboard players operation #sstempd int *= 40 const
execute if score #Harmonic_series.sum.input int matches 100000..999999 run scoreboard players operation #sstempd int *= 4 const
execute if score #Harmonic_series.sum.input int matches 1000000..9999999 run scoreboard players operation #sstempd int *= 10 const
execute if score #Harmonic_series.sum.input int matches 1000000..9999999 run scoreboard players operation #sstempd int /= 25 const
execute if score #Harmonic_series.sum.input int matches 100000000..999999999 run scoreboard players operation #sstempd int /= 250 const
execute if score #Harmonic_series.sum.input int matches 1000000000..2147483647 run scoreboard players operation #sstempd int /= 2500 const

execute store result score #sstemp1 int run scoreboard players set #float_int0 int 499507800

#计算结果4位精度
scoreboard players operation #float_int0 int /= #sstempd int
scoreboard players operation #float_int0 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int0 int += #sstemp1 int

#对齐小数点
execute if score #float_int0 int matches 10000.. if score #Harmonic_series.sum.input int matches 0..9999 run scoreboard players add #float_exp int 1
execute if score #float_int0 int matches 10000.. run scoreboard players operation #float_int0 int /= 10 const

#调整结果
execute if score #float_exp int matches -4 run scoreboard players set #float_int0 int 0
execute if score #float_exp int matches -3 run scoreboard players operation #float_int0 int /= 1000 const
execute if score #float_exp int matches -2 run scoreboard players operation #float_int0 int /= 100 const
execute if score #float_exp int matches -1 run scoreboard players operation #float_int0 int /= 10 const
scoreboard players operation #Harmonic_series.sum.output int = #float_int0 int

#欧拉常数≈0.5772156649015
scoreboard players operation #Harmonic_series.sum.output int += #loga.b.output int
scoreboard players add #Harmonic_series.sum.output int 5772


execute if score #Harmonic_series.sum.input int matches 1 run scoreboard players set #Harmonic_series.sum.output int 10000
execute if score #Harmonic_series.sum.input int matches 2 run scoreboard players set #Harmonic_series.sum.output int 15000
execute if score #Harmonic_series.sum.input int matches 3 run scoreboard players set #Harmonic_series.sum.output int 18333
execute if score #Harmonic_series.sum.input int matches 4 run scoreboard players set #Harmonic_series.sum.output int 20833
execute if score #Harmonic_series.sum.input int matches 5 run scoreboard players set #Harmonic_series.sum.output int 22833
execute if score #Harmonic_series.sum.input int matches 0 run scoreboard players set #Harmonic_series.sum.output int 0
execute if score #Harmonic_series.sum.input int matches ..-1 run scoreboard players set #Harmonic_series.sum.output int 5772
