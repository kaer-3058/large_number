##判断输入值是否为行列式

#data modify storage large_number:math determinant_evaluate.input set value [[4,15,7],[6,13,4],[28,2,12]]
#阶数：#determinant.order large_number.int
#-1表示输入的行列式错误

data modify storage large_number:math temp1 set from storage large_number:math determinant_evaluate.input
execute store result score #determinant.order large_number.int run data get storage large_number:math temp1
scoreboard players operation #temp2 large_number.int = #determinant.order large_number.int
execute store result score #temp1 large_number.int if data storage large_number:math temp1[][]
scoreboard players operation #temp2 large_number.int *= #temp2 large_number.int
execute unless score #temp1 large_number.int = #temp2 large_number.int run scoreboard players set #determinant.order large_number.int -1
execute unless data storage large_number:math temp1[0][0] run scoreboard players set #determinant.order large_number.int -1
execute unless data storage large_number:math temp1[0] run scoreboard players set #determinant.order large_number.int 0
