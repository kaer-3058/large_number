##五阶行列式 代数余子式 按行展开

data modify storage large_number:math temp_5yuzi5 set from storage large_number:math temp1
data modify storage large_number:math temp_5h1 set from storage large_number:math temp1[0]
data remove storage large_number:math temp_5yuzi5[0]

data modify storage large_number:math temp_5yuzi1 set from storage large_number:math temp_5yuzi5
data remove storage large_number:math temp_5yuzi1[0][0]
data remove storage large_number:math temp_5yuzi1[1][0]
data remove storage large_number:math temp_5yuzi1[2][0]
data remove storage large_number:math temp_5yuzi1[3][0]

data modify storage large_number:math temp_5yuzi2 set from storage large_number:math temp_5yuzi5
data remove storage large_number:math temp_5yuzi2[0][1]
data remove storage large_number:math temp_5yuzi2[1][1]
data remove storage large_number:math temp_5yuzi2[2][1]
data remove storage large_number:math temp_5yuzi2[3][1]

data modify storage large_number:math temp_5yuzi3 set from storage large_number:math temp_5yuzi5
data remove storage large_number:math temp_5yuzi3[0][2]
data remove storage large_number:math temp_5yuzi3[1][2]
data remove storage large_number:math temp_5yuzi3[2][2]
data remove storage large_number:math temp_5yuzi3[3][2]

data modify storage large_number:math temp_5yuzi4 set from storage large_number:math temp_5yuzi5
data remove storage large_number:math temp_5yuzi4[0][3]
data remove storage large_number:math temp_5yuzi4[1][3]
data remove storage large_number:math temp_5yuzi4[2][3]
data remove storage large_number:math temp_5yuzi4[3][3]

data remove storage large_number:math temp_5yuzi5[0][4]
data remove storage large_number:math temp_5yuzi5[1][4]
data remove storage large_number:math temp_5yuzi5[2][4]
data remove storage large_number:math temp_5yuzi5[3][4]

#余子式1
data modify storage large_number:math temp1 set from storage large_number:math temp_5yuzi1
function large_number:determinant/evaluate/4/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_5h1[0]
function large_number:determinant/evaluate/5/macro1 with storage large_number:math

#余子式2
data modify storage large_number:math temp1 set from storage large_number:math temp_5yuzi2
function large_number:determinant/evaluate/4/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_5h1[1]
function large_number:determinant/evaluate/5/macro2 with storage large_number:math

#余子式3
data modify storage large_number:math temp1 set from storage large_number:math temp_5yuzi3
function large_number:determinant/evaluate/4/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_5h1[2]
function large_number:determinant/evaluate/5/macro3 with storage large_number:math

#余子式4
data modify storage large_number:math temp1 set from storage large_number:math temp_5yuzi4
function large_number:determinant/evaluate/4/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_5h1[3]
function large_number:determinant/evaluate/5/macro4 with storage large_number:math

#余子式5
data modify storage large_number:math temp1 set from storage large_number:math temp_5yuzi5
function large_number:determinant/evaluate/4/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_5h1[4]
function large_number:determinant/evaluate/5/macro5 with storage large_number:math

function large_number:determinant/evaluate/5/macro9 with storage large_number:math
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run return run function large_number:determinant/evaluate/4/output
