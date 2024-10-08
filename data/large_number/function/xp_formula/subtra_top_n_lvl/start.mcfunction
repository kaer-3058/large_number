##玩家经验公式 - 减去玩家前N级经验

#要减去的经验等级：#xp_formula.top_n_lvl.input int

#确保玩家现有的经验等级大于等于你要扣除的前N级经验等级，然后让被扣除经验的玩家执行此函数

execute store result score #xp_formula.levels int run xp query @s levels
execute store result score #xp_formula.points int run xp query @s points
function large_number:xp_formula/levels_to_points/start

execute store result score #temp_xp_formsstemp_1.1 int run data get storage large_number:math xp.output[0]
execute store result score #temp_xp_formsstemp_1.2 int run data get storage large_number:math xp.output[1]
execute store result score #temp_xp_formsstemp_1.3 int run data get storage large_number:math xp.output[2]
execute store result score #temp_xp_formsstemp_1.4 int run data get storage large_number:math xp.output[3]
execute store result score #temp_xp_formsstemp_1.5 int run data get storage large_number:math xp.output[4]

scoreboard players operation #xp_formula.levels int = #xp_formula.top_n_lvl.input int
scoreboard players set #xp_formula.points int 0
function large_number:xp_formula/levels_to_points/start

execute store result score #2.1 int run data get storage large_number:math xp.output[0]
execute store result score #2.2 int run data get storage large_number:math xp.output[1]
execute store result score #2.3 int run data get storage large_number:math xp.output[2]
execute store result score #2.4 int run data get storage large_number:math xp.output[3]
execute store result score #2.5 int run data get storage large_number:math xp.output[4]

#减法
data modify storage large_number:math xp_points_ope_levels.input set value [I;0,0,0,0,0]
execute if score #temp_xp_formsstemp_1.5 int < #2.5 int run scoreboard players remove #temp_xp_formsstemp_1.4 int 1
execute if score #temp_xp_formsstemp_1.5 int < #2.5 int run scoreboard players add #temp_xp_formsstemp_1.5 int 10000
execute store result storage large_number:math xp_points_ope_levels.input[4] int 1 run scoreboard players operation #temp_xp_formsstemp_1.5 int -= #2.5 int

execute if score #temp_xp_formsstemp_1.4 int < #2.4 int run scoreboard players remove #temp_xp_formsstemp_1.3 int 1
execute if score #temp_xp_formsstemp_1.4 int < #2.4 int run scoreboard players add #temp_xp_formsstemp_1.4 int 10000
execute store result storage large_number:math xp_points_ope_levels.input[3] int 1 run scoreboard players operation #temp_xp_formsstemp_1.4 int -= #2.4 int

execute if score #temp_xp_formsstemp_1.3 int < #2.3 int run scoreboard players remove #temp_xp_formsstemp_1.2 int 1
execute if score #temp_xp_formsstemp_1.3 int < #2.3 int run scoreboard players add #temp_xp_formsstemp_1.3 int 10000
execute store result storage large_number:math xp_points_ope_levels.input[2] int 1 run scoreboard players operation #temp_xp_formsstemp_1.3 int -= #2.3 int

execute if score #temp_xp_formsstemp_1.2 int < #2.2 int run scoreboard players remove #temp_xp_formsstemp_1.1 int 1
execute if score #temp_xp_formsstemp_1.2 int < #2.2 int run scoreboard players add #temp_xp_formsstemp_1.2 int 10000
execute store result storage large_number:math xp_points_ope_levels.input[1] int 1 run scoreboard players operation #temp_xp_formsstemp_1.2 int -= #2.2 int

execute store result storage large_number:math xp_points_ope_levels.input[0] int 1 run scoreboard players operation #temp_xp_formsstemp_1.1 int -= #2.1 int

function large_number:xp_formula/points_ope_levels/start

xp set @s 0 points
xp set @s 0 levels

execute store result score #temp1 int run data get storage large_number:math xp_points_ope_levels.output_levels
execute if score #temp1 int matches 1073741824.. run xp add @s 1073741824 levels
execute if score #temp1 int matches 1073741824.. run scoreboard players remove #temp1 int 1073741824
execute if score #temp1 int matches 536870912.. run xp add @s 536870912 levels
execute if score #temp1 int matches 536870912.. run scoreboard players remove #temp1 int 536870912
execute if score #temp1 int matches 268435456.. run xp add @s 268435456 levels
execute if score #temp1 int matches 268435456.. run scoreboard players remove #temp1 int 268435456
execute if score #temp1 int matches 134217728.. run xp add @s 134217728 levels
execute if score #temp1 int matches 134217728.. run scoreboard players remove #temp1 int 134217728
execute if score #temp1 int matches 67108864.. run xp add @s 67108864 levels
execute if score #temp1 int matches 67108864.. run scoreboard players remove #temp1 int 67108864
execute if score #temp1 int matches 33554432.. run xp add @s 33554432 levels
execute if score #temp1 int matches 33554432.. run scoreboard players remove #temp1 int 33554432
execute if score #temp1 int matches 16777216.. run xp add @s 16777216 levels
execute if score #temp1 int matches 16777216.. run scoreboard players remove #temp1 int 16777216
execute if score #temp1 int matches 8388608.. run xp add @s 8388608 levels
execute if score #temp1 int matches 8388608.. run scoreboard players remove #temp1 int 8388608
execute if score #temp1 int matches 4194304.. run xp add @s 4194304 levels
execute if score #temp1 int matches 4194304.. run scoreboard players remove #temp1 int 4194304
execute if score #temp1 int matches 2097152.. run xp add @s 2097152 levels
execute if score #temp1 int matches 2097152.. run scoreboard players remove #temp1 int 2097152
execute if score #temp1 int matches 1048576.. run xp add @s 1048576 levels
execute if score #temp1 int matches 1048576.. run scoreboard players remove #temp1 int 1048576
execute if score #temp1 int matches 524288.. run xp add @s 524288 levels
execute if score #temp1 int matches 524288.. run scoreboard players remove #temp1 int 524288
execute if score #temp1 int matches 262144.. run xp add @s 262144 levels
execute if score #temp1 int matches 262144.. run scoreboard players remove #temp1 int 262144
execute if score #temp1 int matches 131072.. run xp add @s 131072 levels
execute if score #temp1 int matches 131072.. run scoreboard players remove #temp1 int 131072
execute if score #temp1 int matches 65536.. run xp add @s 65536 levels
execute if score #temp1 int matches 65536.. run scoreboard players remove #temp1 int 65536
execute if score #temp1 int matches 32768.. run xp add @s 32768 levels
execute if score #temp1 int matches 32768.. run scoreboard players remove #temp1 int 32768
execute if score #temp1 int matches 16384.. run xp add @s 16384 levels
execute if score #temp1 int matches 16384.. run scoreboard players remove #temp1 int 16384
execute if score #temp1 int matches 8192.. run xp add @s 8192 levels
execute if score #temp1 int matches 8192.. run scoreboard players remove #temp1 int 8192
execute if score #temp1 int matches 4096.. run xp add @s 4096 levels
execute if score #temp1 int matches 4096.. run scoreboard players remove #temp1 int 4096
execute if score #temp1 int matches 2048.. run xp add @s 2048 levels
execute if score #temp1 int matches 2048.. run scoreboard players remove #temp1 int 2048
execute if score #temp1 int matches 1024.. run xp add @s 1024 levels
execute if score #temp1 int matches 1024.. run scoreboard players remove #temp1 int 1024
execute if score #temp1 int matches 512.. run xp add @s 512 levels
execute if score #temp1 int matches 512.. run scoreboard players remove #temp1 int 512
execute if score #temp1 int matches 256.. run xp add @s 256 levels
execute if score #temp1 int matches 256.. run scoreboard players remove #temp1 int 256
execute if score #temp1 int matches 128.. run xp add @s 128 levels
execute if score #temp1 int matches 128.. run scoreboard players remove #temp1 int 128
execute if score #temp1 int matches 64.. run xp add @s 64 levels
execute if score #temp1 int matches 64.. run scoreboard players remove #temp1 int 64
execute if score #temp1 int matches 32.. run xp add @s 32 levels
execute if score #temp1 int matches 32.. run scoreboard players remove #temp1 int 32
execute if score #temp1 int matches 16.. run xp add @s 16 levels
execute if score #temp1 int matches 16.. run scoreboard players remove #temp1 int 16
execute if score #temp1 int matches 8.. run xp add @s 8 levels
execute if score #temp1 int matches 8.. run scoreboard players remove #temp1 int 8
execute if score #temp1 int matches 4.. run xp add @s 4 levels
execute if score #temp1 int matches 4.. run scoreboard players remove #temp1 int 4
execute if score #temp1 int matches 2.. run xp add @s 2 levels
execute if score #temp1 int matches 2.. run scoreboard players remove #temp1 int 2
execute if score #temp1 int matches 1.. run xp add @s 1 levels
execute if score #temp1 int matches 1.. run scoreboard players remove #temp1 int 1


execute store result score #temp1 int run data get storage large_number:math xp_points_ope_levels.remaining_points[2] 100000000
execute store result score #temp2 int run data get storage large_number:math xp_points_ope_levels.remaining_points[3] 10000
execute store result score #temp3 int run data get storage large_number:math xp_points_ope_levels.remaining_points[4]
scoreboard players operation #temp1 int += #temp2 int
scoreboard players operation #temp1 int += #temp3 int

execute if score #temp1 int matches 1073741824.. run xp add @s 1073741824 points
execute if score #temp1 int matches 1073741824.. run scoreboard players remove #temp1 int 1073741824
execute if score #temp1 int matches 536870912.. run xp add @s 536870912 points
execute if score #temp1 int matches 536870912.. run scoreboard players remove #temp1 int 536870912
execute if score #temp1 int matches 268435456.. run xp add @s 268435456 points
execute if score #temp1 int matches 268435456.. run scoreboard players remove #temp1 int 268435456
execute if score #temp1 int matches 134217728.. run xp add @s 134217728 points
execute if score #temp1 int matches 134217728.. run scoreboard players remove #temp1 int 134217728
execute if score #temp1 int matches 67108864.. run xp add @s 67108864 points
execute if score #temp1 int matches 67108864.. run scoreboard players remove #temp1 int 67108864
execute if score #temp1 int matches 33554432.. run xp add @s 33554432 points
execute if score #temp1 int matches 33554432.. run scoreboard players remove #temp1 int 33554432
execute if score #temp1 int matches 16777216.. run xp add @s 16777216 points
execute if score #temp1 int matches 16777216.. run scoreboard players remove #temp1 int 16777216
execute if score #temp1 int matches 8388608.. run xp add @s 8388608 points
execute if score #temp1 int matches 8388608.. run scoreboard players remove #temp1 int 8388608
execute if score #temp1 int matches 4194304.. run xp add @s 4194304 points
execute if score #temp1 int matches 4194304.. run scoreboard players remove #temp1 int 4194304
execute if score #temp1 int matches 2097152.. run xp add @s 2097152 points
execute if score #temp1 int matches 2097152.. run scoreboard players remove #temp1 int 2097152
execute if score #temp1 int matches 1048576.. run xp add @s 1048576 points
execute if score #temp1 int matches 1048576.. run scoreboard players remove #temp1 int 1048576
execute if score #temp1 int matches 524288.. run xp add @s 524288 points
execute if score #temp1 int matches 524288.. run scoreboard players remove #temp1 int 524288
execute if score #temp1 int matches 262144.. run xp add @s 262144 points
execute if score #temp1 int matches 262144.. run scoreboard players remove #temp1 int 262144
execute if score #temp1 int matches 131072.. run xp add @s 131072 points
execute if score #temp1 int matches 131072.. run scoreboard players remove #temp1 int 131072
execute if score #temp1 int matches 65536.. run xp add @s 65536 points
execute if score #temp1 int matches 65536.. run scoreboard players remove #temp1 int 65536
execute if score #temp1 int matches 32768.. run xp add @s 32768 points
execute if score #temp1 int matches 32768.. run scoreboard players remove #temp1 int 32768
execute if score #temp1 int matches 16384.. run xp add @s 16384 points
execute if score #temp1 int matches 16384.. run scoreboard players remove #temp1 int 16384
execute if score #temp1 int matches 8192.. run xp add @s 8192 points
execute if score #temp1 int matches 8192.. run scoreboard players remove #temp1 int 8192
execute if score #temp1 int matches 4096.. run xp add @s 4096 points
execute if score #temp1 int matches 4096.. run scoreboard players remove #temp1 int 4096
execute if score #temp1 int matches 2048.. run xp add @s 2048 points
execute if score #temp1 int matches 2048.. run scoreboard players remove #temp1 int 2048
execute if score #temp1 int matches 1024.. run xp add @s 1024 points
execute if score #temp1 int matches 1024.. run scoreboard players remove #temp1 int 1024
execute if score #temp1 int matches 512.. run xp add @s 512 points
execute if score #temp1 int matches 512.. run scoreboard players remove #temp1 int 512
execute if score #temp1 int matches 256.. run xp add @s 256 points
execute if score #temp1 int matches 256.. run scoreboard players remove #temp1 int 256
execute if score #temp1 int matches 128.. run xp add @s 128 points
execute if score #temp1 int matches 128.. run scoreboard players remove #temp1 int 128
execute if score #temp1 int matches 64.. run xp add @s 64 points
execute if score #temp1 int matches 64.. run scoreboard players remove #temp1 int 64
execute if score #temp1 int matches 32.. run xp add @s 32 points
execute if score #temp1 int matches 32.. run scoreboard players remove #temp1 int 32
execute if score #temp1 int matches 16.. run xp add @s 16 points
execute if score #temp1 int matches 16.. run scoreboard players remove #temp1 int 16
execute if score #temp1 int matches 8.. run xp add @s 8 points
execute if score #temp1 int matches 8.. run scoreboard players remove #temp1 int 8
execute if score #temp1 int matches 4.. run xp add @s 4 points
execute if score #temp1 int matches 4.. run scoreboard players remove #temp1 int 4
execute if score #temp1 int matches 2.. run xp add @s 2 points
execute if score #temp1 int matches 2.. run scoreboard players remove #temp1 int 2
execute if score #temp1 int matches 1.. run xp add @s 1 points
execute if score #temp1 int matches 1.. run scoreboard players remove #temp1 int 1

