##判断输入值是否为行列式

#data modify storage large_number:math determinant_evaluate.input set value [[4,15,7],[6,13,4],[28,2,12]]
#阶数：#determinant.order int
#-1表示输入的行列式错误

data modify storage large_number:math temp1 set from storage large_number:math determinant_evaluate.input
execute store result score #determinant.order int run data get storage large_number:math temp1
scoreboard players operation #temp2 int = #determinant.order int
execute store result score #temp1 int if data storage large_number:math temp1[][]
scoreboard players operation #temp2 int *= #temp2 int
execute unless score #temp1 int = #temp2 int run scoreboard players set #determinant.order int -1
execute unless data storage large_number:math temp1[0][0] run scoreboard players set #determinant.order int -1
execute unless data storage large_number:math temp1[0] run scoreboard players set #determinant.order int 0
