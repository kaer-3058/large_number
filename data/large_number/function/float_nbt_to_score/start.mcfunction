##浮点数格式转换 - nbt格式转为记分板格式

#输入：data modify storage large_number:math float_nbt_to_score_input set value 62.71339703E12d
#支持转换任意double类型的浮点数

#function large_number:float_nbt_to_score/start

data modify storage large_number:math Store_float_nbt_to_score_input set string storage large_number:math float_nbt_to_score_input 0 1
execute if data storage large_number:math {Store_float_nbt_to_score_input:"-"} run function large_number:float_nbt_to_score/-1
execute unless data storage large_number:math {Store_float_nbt_to_score_input:"-"} run function large_number:float_nbt_to_score/1

#\
符号：#float_sign large_number.int \
尾数：#float_int0 large_number.int \
指数：#float_exp large_number.int 
