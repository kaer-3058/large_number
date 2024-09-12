##整数的逆序数

#规定正序排列为从小到大

#输入：data modify storage large_number:math invers_num_inp set value [0,1,7,9,6,14,28,5]
#输出：#invers_num.output int

data modify storage large_number:math sstemp1 set from storage large_number:math invers_num_inp
scoreboard players set #invers_num.output int 0
execute if data storage large_number:math sstemp1[1] run function large_number:determinant/inversion_number/loop1
