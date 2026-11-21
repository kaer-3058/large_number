#欧拉公式，e^(ix)=cos(x)+isin(x)
scoreboard players set #temp1 large_number.int 2
scoreboard players operation #temp1 large_number.int *= #DFT.n large_number.int
execute store result storage large_number:math temp1 int 1 run scoreboard players operation #temp1 large_number.int *= #DFT.k large_number.int
function large_number:discrete_fourier_transform/once/macro2 with storage large_number:math
function large_number:math_trifs/sin_cos_high_precision/start
data modify storage large_number:math temp1 set value {x:0,i:0}
execute store result storage large_number:math temp1.x int 1 run scoreboard players get #cos_high_precision large_number.int
execute if score #DFT.inverse large_number.int matches 1 store result storage large_number:math temp1.i int 1 run scoreboard players get #sin_high_precision large_number.int
execute unless score #DFT.inverse large_number.int matches 1 store result storage large_number:math temp1.i int -1 run scoreboard players get #sin_high_precision large_number.int
data modify storage large_number:math dft_exp_list append from storage large_number:math temp1

scoreboard players add #DFT.n large_number.int 1
execute if score #DFT.n large_number.int <= #DFT.loops large_number.int run function large_number:discrete_fourier_transform/once/loop1
