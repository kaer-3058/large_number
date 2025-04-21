##16位数乘12位数

#   1234
# *  123
#---------
#   abcd
#  1234
# uvxy

#竖式开根法得到的结果乘以√10

#float_mul.high_precision.input1.1 int
# 3162 2776 6016 8371
execute store result score #y int store result score #4 int run scoreboard players set #d int 8379
execute store result score #x int store result score #3 int run scoreboard players set #c int 6016
execute store result score #v int store result score #2 int run scoreboard players set #b int 2776
execute store result score #u int store result score #1 int run scoreboard players set #a int 3162

scoreboard players operation #a int *= #sstemp3 int
scoreboard players operation #b int *= #sstemp3 int
scoreboard players operation #c int *= #sstemp3 int
execute store result score #5.4 int run scoreboard players operation #d int *= #sstemp3 int
scoreboard players operation #1 int *= #sstemp2 int
scoreboard players operation #2 int *= #sstemp2 int
scoreboard players operation #3 int *= #sstemp2 int
scoreboard players operation #4 int *= #sstemp2 int
scoreboard players operation #u int *= #sstemp1 int
scoreboard players operation #v int *= #sstemp1 int
scoreboard players operation #x int *= #sstemp1 int
scoreboard players operation #y int *= #sstemp1 int

scoreboard players operation #4 int += #c int
scoreboard players operation #y int += #3 int
scoreboard players operation #y int += #b int
scoreboard players operation #x int += #2 int
scoreboard players operation #x int += #a int
scoreboard players operation #v int += #1 int

scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #4 int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #y int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #x int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #v int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #Z int run scoreboard players operation #u int += #5.4 int
scoreboard players operation #Z int /= 10000 const

scoreboard players operation #u int %= 10000 const
scoreboard players operation #v int %= 10000 const
scoreboard players operation #x int %= 10000 const

#输出
execute store result storage large_number:math sstemp3 int 1 run scoreboard players remove #double_to_int.expon.1 int 7
execute store result storage large_number:math temp1 int 1 run scoreboard players get #Z int
execute store result storage large_number:math temp2 int 1 run scoreboard players add #u int 10000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #v int 10000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #x int 10000

data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1

function large_number:macro_operation/double_sqrt_more_out2 with storage large_number:math
