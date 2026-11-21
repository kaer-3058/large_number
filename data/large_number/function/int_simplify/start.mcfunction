##整数约分

#scoreboard players set #int_simplify.input1 large_number.int 7745299
#scoreboard players set #int_simplify.input2 large_number.int 6533
#只接受正数
#如果最大公约数为1，则两数互质

execute store result score #int_simplify.output1 large_number.int run scoreboard players operation #sstemp1 large_number.int = #int_simplify.input1 large_number.int
execute store result score #int_simplify.output2 large_number.int run scoreboard players operation #int_simplify.greatest_common_divisor large_number.int = #int_simplify.input2 large_number.int

execute unless score #sstemp1 large_number.int = #int_simplify.greatest_common_divisor large_number.int run function large_number:int_simplify/loop
scoreboard players operation #int_simplify.output1 large_number.int /= #int_simplify.greatest_common_divisor large_number.int
scoreboard players operation #int_simplify.output2 large_number.int /= #int_simplify.greatest_common_divisor large_number.int
