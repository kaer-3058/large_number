##N阶行列式求值
#输入值仅接受int

#data modify storage large_number:math determinant_evaluate.input set value [[4,15,7],[6,13,4],[28,2,12]]

#行列式输入规则：必须有两层列表，每个子列表表示一行。如果该行某个元素为0也必须输入0，不支持元素省略。

#判断行列式阶数
data modify storage large_number:math temp1 set from storage large_number:math determinant_evaluate.input
execute store result score #determinant.order int if data storage large_number:math temp1[]
scoreboard players operation #temp2 int = #determinant.order int
execute store result score #temp1 int if data storage large_number:math temp1[][]
scoreboard players operation #temp2 int *= #temp2 int
execute unless score #temp1 int = #temp2 int run scoreboard players set #determinant.order int -1
execute unless data storage large_number:math temp1[0][0] run scoreboard players set #determinant.order int -1
execute unless data storage large_number:math temp1[0] run scoreboard players set #determinant.order int 0



