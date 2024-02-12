##展示实体法浮点乘法
#data modify storage math float_multiply.input1 set value 3.5f
#data modify storage math float_multiply.input2 set value 7.2f
#a*b = a/(1/b)

#执行：execute in minecraft:overworld as 28529-0-3d00-0-2c4200ee8401 run function large_number:float_multiply/for_display_entity

data modify storage math temp1 set value [1.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f]
data modify storage math temp1[-1] set from storage math float_multiply.input1
data modify entity @s transformation set from storage math temp1
data modify storage math temp1[-1] set from entity @s transformation.scale[0]
data modify storage math temp1[0] set from storage math float_multiply.input2
data modify entity @s transformation set from storage math temp1
data modify storage math float_multiply.output set from entity @s transformation.scale[0]
