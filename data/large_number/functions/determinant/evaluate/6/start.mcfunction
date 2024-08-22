##六阶行列式 代数余子式 按行展开

data modify storage large_number:math temp_6yuzi6 set from storage large_number:math temp1
data modify storage large_number:math temp_6h1 set from storage large_number:math temp1[0]
data remove storage large_number:math temp_6yuzi6[0]

data modify storage large_number:math temp_6yuzi1 set from storage large_number:math temp_6yuzi6
data remove storage large_number:math temp_6yuzi1[0][0]
data remove storage large_number:math temp_6yuzi1[1][0]
data remove storage large_number:math temp_6yuzi1[2][0]
data remove storage large_number:math temp_6yuzi1[3][0]
data remove storage large_number:math temp_6yuzi1[4][0]

data modify storage large_number:math temp_6yuzi2 set from storage large_number:math temp_6yuzi6
data remove storage large_number:math temp_6yuzi2[0][1]
data remove storage large_number:math temp_6yuzi2[1][1]
data remove storage large_number:math temp_6yuzi2[2][1]
data remove storage large_number:math temp_6yuzi2[3][1]
data remove storage large_number:math temp_6yuzi2[4][1]

data modify storage large_number:math temp_6yuzi3 set from storage large_number:math temp_6yuzi6
data remove storage large_number:math temp_6yuzi3[0][2]
data remove storage large_number:math temp_6yuzi3[1][2]
data remove storage large_number:math temp_6yuzi3[2][2]
data remove storage large_number:math temp_6yuzi3[3][2]
data remove storage large_number:math temp_6yuzi3[4][2]

data modify storage large_number:math temp_6yuzi4 set from storage large_number:math temp_6yuzi6
data remove storage large_number:math temp_6yuzi4[0][3]
data remove storage large_number:math temp_6yuzi4[1][3]
data remove storage large_number:math temp_6yuzi4[2][3]
data remove storage large_number:math temp_6yuzi4[3][3]
data remove storage large_number:math temp_6yuzi4[4][3]

data modify storage large_number:math temp_6yuzi5 set from storage large_number:math temp_6yuzi6
data remove storage large_number:math temp_6yuzi5[0][4]
data remove storage large_number:math temp_6yuzi5[1][4]
data remove storage large_number:math temp_6yuzi5[2][4]
data remove storage large_number:math temp_6yuzi5[3][4]
data remove storage large_number:math temp_6yuzi5[4][4]

data remove storage large_number:math temp_6yuzi6[0][5]
data remove storage large_number:math temp_6yuzi6[1][5]
data remove storage large_number:math temp_6yuzi6[2][5]
data remove storage large_number:math temp_6yuzi6[3][5]
data remove storage large_number:math temp_6yuzi6[4][5]

#余子式1
data modify storage large_number:math temp1 set from storage large_number:math temp_6yuzi1
function large_number:determinant/evaluate/5/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_6h1[0]
function large_number:determinant/evaluate/6/macro1 with storage large_number:math

#余子式2
data modify storage large_number:math temp1 set from storage large_number:math temp_6yuzi2
function large_number:determinant/evaluate/5/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_6h1[1]
function large_number:determinant/evaluate/6/macro2 with storage large_number:math

#余子式3
data modify storage large_number:math temp1 set from storage large_number:math temp_6yuzi3
function large_number:determinant/evaluate/5/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_6h1[2]
function large_number:determinant/evaluate/6/macro3 with storage large_number:math

#余子式4
data modify storage large_number:math temp1 set from storage large_number:math temp_6yuzi4
function large_number:determinant/evaluate/5/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_6h1[3]
function large_number:determinant/evaluate/6/macro4 with storage large_number:math

#余子式5
data modify storage large_number:math temp1 set from storage large_number:math temp_6yuzi5
function large_number:determinant/evaluate/5/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_6h1[4]
function large_number:determinant/evaluate/6/macro5 with storage large_number:math

#余子式6
data modify storage large_number:math temp1 set from storage large_number:math temp_6yuzi6
function large_number:determinant/evaluate/5/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_6h1[5]
function large_number:determinant/evaluate/6/macro6 with storage large_number:math

function large_number:determinant/evaluate/6/macro9 with storage large_number:math
execute as @e[type=minecraft:item] if data entity @s Item{id:"minecraft:stone"} if data entity @s Item.tag{large_number_loot_spawn1:1b} run function large_number:determinant/evaluate/4/output
