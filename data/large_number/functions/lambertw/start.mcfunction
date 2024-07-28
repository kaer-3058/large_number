##LambertW函数

#LambertW(x)是x*e^x的反函数
#公式1：LambertW0(x) ~ ln(x)-ln(ln(x))+ln(ln(x))/ln(x) x≥3
#公式2：LambertW0(x) ~ ln(x+1)/1.3 0≤x≤3
#公式3：LambertW0(x) ~ tan(3.365x)/3.2 (-1/e)≤x≤0
#公式4：LambertW-1(x) ~ ln(-x)-ln(-ln(-x))+ln(-ln(-x))/ln(-x)
#要求输入值必须为double型

#data modify storage large_number:math lambertw.input set value 21.5

execute store result score #temp_lambertw.input_size int run data get storage large_number:math lambertw.input 10
execute if score #temp_lambertw.input_size int matches 30.. run function large_number:lambertw/1
execute if score #temp_lambertw.input_size int matches 0..29 run function large_number:lambertw/2
execute if score #temp_lambertw.input_size int matches -4..-1 in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:lambertw/3
