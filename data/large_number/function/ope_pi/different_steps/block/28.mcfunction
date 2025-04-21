#去掉最后8位并转化为字符串
data remove storage large_number:pi_information sstemp3[-1]
data remove storage large_number:pi_information sstemp3[-1]
data modify storage large_number:pi_information pi set value []
data modify storage large_number:pi_information pi_iarray set value []
execute if data storage large_number:pi_information sstemp3[1] run function large_number:ope_pi/different_steps/loop_to_string
data modify storage large_number:pi_information temp1 set string storage large_number:pi_information sstemp3[0]
data modify storage large_number:pi_information pi prepend from storage large_number:pi_information temp1
data modify storage large_number:pi_information pi_iarray prepend from storage large_number:pi_information sstemp3[0]

#添加小数点
data modify storage large_number:pi_information pi[0] set string storage large_number:pi_information pi[0] 1
data modify storage large_number:pi_information temp1 set from storage large_number:pi_information pi[0]
execute if data storage large_number:pi_information {temp1:""} run data remove storage large_number:pi_information pi[0]
data modify storage large_number:pi_information pi prepend value "."
data modify storage large_number:pi_information pi prepend value "3"


#tellraw @a [{"text":"[\u00A7e卡儿的数学库\u00A7r]\n圆周率π ["},{"score":{"name":"#ope_pi.digit","objective":"int"}},{"text":"位]：\n"},{"nbt":"pi[]","storage":"large_number:pi_information","separator":""}]

execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate":"large_number.ope_pi.diff_end","fallback":"[圆周率 π]：计算完成！"}

scoreboard players add #pi.different_steps.mode lan.pi_information 1
