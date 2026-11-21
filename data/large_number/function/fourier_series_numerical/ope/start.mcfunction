##计算傅里叶级数

#输入：data modify storage large_number:math fourier_series_numerical.x set value 2.33

# function large_number:fourier_series_numerical/ope/start

data modify storage large_number:math temp_a_list set from storage large_number:math fourier_series_numerical.function_a
data modify storage large_number:math temp_b_list set from storage large_number:math fourier_series_numerical.function_b

execute if data storage large_number:math temp_a_list[0] run function large_number:fourier_series_numerical/ope/macro1

execute store result score #fourier_series_numerical.ope.loops large_number.int run data get storage large_number:math temp_a_list
execute store result score #loops2 large_number.int run data get storage large_number:math temp_b_list
scoreboard players operation #fourier_series_numerical.ope.loops large_number.int < #loops2 large_number.int

data modify storage large_number:math temp_fourier_series_numerical_function_a0 set from storage large_number:math fourier_series_numerical.function_a0

scoreboard players set #fourier_series_numerical.ope.loops.n large_number.int 0
data modify storage large_number:math list_sum.input set value []
data modify storage large_number:math list_sum.input append from storage large_number:math fourier_series_numerical.function_a0
execute if score #fourier_series_numerical.ope.loops large_number.int matches 1.. run function large_number:fourier_series_numerical/ope/loop1

function large_number:list_operation/sum/start
data modify storage large_number:math fourier_series_numerical.expression_value set from storage large_number:math list_sum.output


execute unless score #large_number.all_tellraw_set large_number.int matches 1 if score #fourier_series_numerical.tell_mode large_number.int matches 1..2 run tellraw @a [{"translate":"large_number.fourier_series_numerical.ope.end","fallback":"\u00A77\u00A7o傅里叶级数值计算完成"}]
