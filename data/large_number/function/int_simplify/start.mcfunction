##整数约分

#scoreboard players set #int_simplify.input1 int 7745299
#scoreboard players set #int_simplify.input2 int 6533
#只接受正数
#如果最大公约数为1，则两数互质

execute store result score #int_simplify.output1 int run scoreboard players operation #sstemp1 int = #int_simplify.input1 int
execute store result score #int_simplify.output2 int run scoreboard players operation #int_simplify.greatest_common_divisor int = #int_simplify.input2 int

execute unless score #sstemp1 int = #int_simplify.greatest_common_divisor int run function large_number:int_simplify/loop
scoreboard players operation #int_simplify.output1 int /= #int_simplify.greatest_common_divisor int
scoreboard players operation #int_simplify.output2 int /= #int_simplify.greatest_common_divisor int
