##16位数乘12位数

#   1234
# *  123
#---------
#   abcd
#  1234
# uvxy

#竖式开根法得到的结果乘以√10

#float_mul.high_precision.input1.1 large_number.int
# 3162 2776 6016 8371
execute store result score #y large_number.int store result score #4 large_number.int run scoreboard players set #d large_number.int 8379
execute store result score #x large_number.int store result score #3 large_number.int run scoreboard players set #c large_number.int 6016
execute store result score #v large_number.int store result score #2 large_number.int run scoreboard players set #b large_number.int 2776
execute store result score #u large_number.int store result score #1 large_number.int run scoreboard players set #a large_number.int 3162

scoreboard players operation #a large_number.int *= #sstemp3 large_number.int
scoreboard players operation #b large_number.int *= #sstemp3 large_number.int
scoreboard players operation #c large_number.int *= #sstemp3 large_number.int
execute store result score #5.4 large_number.int run scoreboard players operation #d large_number.int *= #sstemp3 large_number.int
scoreboard players operation #1 large_number.int *= #sstemp2 large_number.int
scoreboard players operation #2 large_number.int *= #sstemp2 large_number.int
scoreboard players operation #3 large_number.int *= #sstemp2 large_number.int
scoreboard players operation #4 large_number.int *= #sstemp2 large_number.int
scoreboard players operation #u large_number.int *= #sstemp1 large_number.int
scoreboard players operation #v large_number.int *= #sstemp1 large_number.int
scoreboard players operation #x large_number.int *= #sstemp1 large_number.int
scoreboard players operation #y large_number.int *= #sstemp1 large_number.int

scoreboard players operation #4 large_number.int += #c large_number.int
scoreboard players operation #y large_number.int += #3 large_number.int
scoreboard players operation #y large_number.int += #b large_number.int
scoreboard players operation #x large_number.int += #2 large_number.int
scoreboard players operation #x large_number.int += #a large_number.int
scoreboard players operation #v large_number.int += #1 large_number.int

scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #4 large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #y large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #x large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #v large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #Z large_number.int run scoreboard players operation #u large_number.int += #5.4 large_number.int
scoreboard players operation #Z large_number.int /= 10000 const

scoreboard players operation #u large_number.int %= 10000 const
scoreboard players operation #v large_number.int %= 10000 const
scoreboard players operation #x large_number.int %= 10000 const

#输出
execute store result storage large_number:math sstemp3 int 1 run scoreboard players remove #double_to_int.expon.1 large_number.int 7
execute store result storage large_number:math temp1 int 1 run scoreboard players get #Z large_number.int
execute store result storage large_number:math temp2 int 1 run scoreboard players add #u large_number.int 10000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #v large_number.int 10000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #x large_number.int 10000

data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1

function large_number:macro_operation/double_sqrt_more_out2 with storage large_number:math
