##LambertW函数

#LambertW(x)是x*e^x的反函数
#要求输入值必须为double型

#data modify storage large_number:math lambertw.input set value 21.5
#data modify storage large_number:math lambertw.branch set value 0

#function large_number:lambertw/start

scoreboard players set #lambertw_input_test1 large_number.int 0
execute store result score #lambertw_input_test1 large_number.int run data get storage large_number:math lambertw.branch
execute if score #lambertw_input_test1 large_number.int matches 0 run function large_number:lambertw/ope_0
execute if score #lambertw_input_test1 large_number.int matches -1 run function large_number:lambertw/-1/start
