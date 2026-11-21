#取小浮点数的整数部分
execute store result storage large_number:math temp5 int 1 run data get storage large_number:math double_expon_input

#把整数位变成字符串
data modify storage large_number:math temp5 set string storage large_number:math temp5

#直接get整数位变成的字符串就能获得整数位的数量级
execute store result score #double_expon_output large_number.int run data get storage large_number:math temp5

#数量级减1就是科学记数法的指数
scoreboard players remove #double_expon_output large_number.int 1
