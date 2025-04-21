##四阶行列式 代数余子式 按行展开

data modify storage large_number:math temp_4yuzi4 set from storage large_number:math temp1
data modify storage large_number:math temp_4h1 set from storage large_number:math temp1[0]
data remove storage large_number:math temp_4yuzi4[0]

data modify storage large_number:math temp_4yuzi1 set from storage large_number:math temp_4yuzi4
data remove storage large_number:math temp_4yuzi1[0][0]
data remove storage large_number:math temp_4yuzi1[1][0]
data remove storage large_number:math temp_4yuzi1[2][0]

data modify storage large_number:math temp_4yuzi2 set from storage large_number:math temp_4yuzi4
data remove storage large_number:math temp_4yuzi2[0][1]
data remove storage large_number:math temp_4yuzi2[1][1]
data remove storage large_number:math temp_4yuzi2[2][1]

data modify storage large_number:math temp_4yuzi3 set from storage large_number:math temp_4yuzi4
data remove storage large_number:math temp_4yuzi3[0][2]
data remove storage large_number:math temp_4yuzi3[1][2]
data remove storage large_number:math temp_4yuzi3[2][2]

data remove storage large_number:math temp_4yuzi4[0][3]
data remove storage large_number:math temp_4yuzi4[1][3]
data remove storage large_number:math temp_4yuzi4[2][3]

#余子式1
data modify storage large_number:math temp1 set from storage large_number:math temp_4yuzi1
function large_number:determinant/evaluate/3/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_4h1[0]
function large_number:determinant/evaluate/4/macro1 with storage large_number:math

#余子式2
data modify storage large_number:math temp1 set from storage large_number:math temp_4yuzi2
function large_number:determinant/evaluate/3/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_4h1[1]
function large_number:determinant/evaluate/4/macro2 with storage large_number:math

#余子式3
data modify storage large_number:math temp1 set from storage large_number:math temp_4yuzi3
function large_number:determinant/evaluate/3/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_4h1[2]
function large_number:determinant/evaluate/4/macro3 with storage large_number:math

#余子式4
data modify storage large_number:math temp1 set from storage large_number:math temp_4yuzi4
function large_number:determinant/evaluate/3/start
data modify storage large_number:math sstemp1 set from storage large_number:math determinant_evaluate.output
data modify storage large_number:math sstemp2 set from storage large_number:math temp_4h1[3]
function large_number:determinant/evaluate/4/macro4 with storage large_number:math

function large_number:determinant/evaluate/4/macro5 with storage large_number:math
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run return run function large_number:determinant/evaluate/4/output

