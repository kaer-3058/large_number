##LambertW函数 - 牛顿迭代法求高精度(-1的分支)

#data modify storage large_number:math lambertw.input set value 21.0

#基本思路：把公式得到的结果作为初值进行迭代

function large_number:lambertw/-1/start


#迭代次数：data modify storage large_number:math newton.s_method.loops set value 30

execute store result score #temp_newton.s_method.loops int run data get storage large_number:math newton.s_method.loops
execute if score #temp_newton.s_method.loops int matches 1.. run function large_number:lambertw/loop

execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate": "large_number.newton.s_method.end","fallback": "\u00A77\u00A7o牛顿迭代法计算完成"}
