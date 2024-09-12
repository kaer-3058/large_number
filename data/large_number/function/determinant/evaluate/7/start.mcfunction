##七阶行列式 代数余子式 按行展开

data modify storage large_number:math temp_7yuzi7 set from storage large_number:math temp1
data modify storage large_number:math temp_7h1 set from storage large_number:math temp1[0]
data remove storage large_number:math temp_7yuzi7[0]

data modify storage large_number:math temp_7yuzi1 set from storage large_number:math temp_7yuzi7
data remove storage large_number:math temp_7yuzi1[0][0]
data remove storage large_number:math temp_7yuzi1[1][0]
data remove storage large_number:math temp_7yuzi1[2][0]
data remove storage large_number:math temp_7yuzi1[3][0]
data remove storage large_number:math temp_7yuzi1[4][0]
data remove storage large_number:math temp_7yuzi1[5][0]

data modify storage large_number:math temp_7yuzi2 set from storage large_number:math temp_7yuzi7
data remove storage large_number:math temp_7yuzi2[0][1]
data remove storage large_number:math temp_7yuzi2[1][1]
data remove storage large_number:math temp_7yuzi2[2][1]
data remove storage large_number:math temp_7yuzi2[3][1]
data remove storage large_number:math temp_7yuzi2[4][1]
data remove storage large_number:math temp_7yuzi2[5][1]

data modify storage large_number:math temp_7yuzi3 set from storage large_number:math temp_7yuzi7
data remove storage large_number:math temp_7yuzi3[0][2]
data remove storage large_number:math temp_7yuzi3[1][2]
data remove storage large_number:math temp_7yuzi3[2][2]
data remove storage large_number:math temp_7yuzi3[3][2]
data remove storage large_number:math temp_7yuzi3[4][2]
data remove storage large_number:math temp_7yuzi3[5][2]

data modify storage large_number:math temp_7yuzi4 set from storage large_number:math temp_7yuzi7
data remove storage large_number:math temp_7yuzi4[0][3]
data remove storage large_number:math temp_7yuzi4[1][3]
data remove storage large_number:math temp_7yuzi4[2][3]
data remove storage large_number:math temp_7yuzi4[3][3]
data remove storage large_number:math temp_7yuzi4[4][3]
data remove storage large_number:math temp_7yuzi4[5][3]

data modify storage large_number:math temp_7yuzi5 set from storage large_number:math temp_7yuzi7
data remove storage large_number:math temp_7yuzi5[0][4]
data remove storage large_number:math temp_7yuzi5[1][4]
data remove storage large_number:math temp_7yuzi5[2][4]
data remove storage large_number:math temp_7yuzi5[3][4]
data remove storage large_number:math temp_7yuzi5[4][4]
data remove storage large_number:math temp_7yuzi5[5][4]

data modify storage large_number:math temp_7yuzi6 set from storage large_number:math temp_7yuzi7
data remove storage large_number:math temp_7yuzi6[0][5]
data remove storage large_number:math temp_7yuzi6[1][5]
data remove storage large_number:math temp_7yuzi6[2][5]
data remove storage large_number:math temp_7yuzi6[3][5]
data remove storage large_number:math temp_7yuzi6[4][5]
data remove storage large_number:math temp_7yuzi6[5][5]

data remove storage large_number:math temp_7yuzi7[0][6]
data remove storage large_number:math temp_7yuzi7[1][6]
data remove storage large_number:math temp_7yuzi7[2][6]
data remove storage large_number:math temp_7yuzi7[3][6]
data remove storage large_number:math temp_7yuzi7[4][6]
data remove storage large_number:math temp_7yuzi7[5][6]

#余子式1
data modify storage large_number:math temp1 set from storage large_number:math temp_7yuzi1
function large_number:determinant/evaluate/6/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_7h1[0]
function large_number:determinant/evaluate/7/macro1 with storage large_number:math

#余子式2
data modify storage large_number:math temp1 set from storage large_number:math temp_7yuzi2
function large_number:determinant/evaluate/6/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_7h1[1]
function large_number:determinant/evaluate/7/macro2 with storage large_number:math

#余子式3
data modify storage large_number:math temp1 set from storage large_number:math temp_7yuzi3
function large_number:determinant/evaluate/6/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_7h1[2]
function large_number:determinant/evaluate/7/macro3 with storage large_number:math

#余子式4
data modify storage large_number:math temp1 set from storage large_number:math temp_7yuzi4
function large_number:determinant/evaluate/6/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_7h1[3]
function large_number:determinant/evaluate/7/macro4 with storage large_number:math

#余子式5
data modify storage large_number:math temp1 set from storage large_number:math temp_7yuzi5
function large_number:determinant/evaluate/6/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_7h1[4]
function large_number:determinant/evaluate/7/macro5 with storage large_number:math

#余子式6
data modify storage large_number:math temp1 set from storage large_number:math temp_7yuzi6
function large_number:determinant/evaluate/6/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_7h1[5]
function large_number:determinant/evaluate/7/macro6 with storage large_number:math

#余子式7
data modify storage large_number:math temp1 set from storage large_number:math temp_7yuzi7
function large_number:determinant/evaluate/6/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_7h1[6]
function large_number:determinant/evaluate/7/macro7 with storage large_number:math

function large_number:determinant/evaluate/7/macro9 with storage large_number:math
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:determinant/evaluate/4/output
