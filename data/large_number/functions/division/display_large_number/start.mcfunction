#输入四个整型数组
#data modify storage math display_div_large.input.dividend1 set value [I;0,0,0]
#data modify storage math display_div_large.input.dividend2 set value [I;0,0,0]
#data modify storage math display_div_large.input.dividend3 set value [I;0,0,0]
#data modify storage math display_div_large.input.divisor set value [I;0,0,0]

data modify storage math temp1 set from storage math display_div_large.input.dividend1[0]
data modify storage math temp2 set from storage math display_div_large.input.dividend1[1]
data modify storage math temp3 set from storage math display_div_large.input.dividend1[2]
data modify storage math temp4 set from storage math display_div_large.input.dividend2[0]
data modify storage math temp5 set from storage math display_div_large.input.dividend2[1]
data modify storage math temp6 set from storage math display_div_large.input.dividend2[2]
data modify storage math temp7 set from storage math display_div_large.input.dividend3[0]
data modify storage math temp8 set from storage math display_div_large.input.dividend3[1]
data modify storage math temp9 set from storage math display_div_large.input.dividend3[2]
data modify storage math temp11 set from storage math display_div_large.input.divisor[0]
data modify storage math temp12 set from storage math display_div_large.input.divisor[1]
data modify storage math temp13 set from storage math display_div_large.input.divisor[2]

function large_number:division/display_large_number/macro.1 with storage math

#data get entity 28529-0-3d00-0-2c4200ee8401 transformation.scale
