data modify storage math temp10 set value [1.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f]
data modify storage math temp1 set string storage math int_base_int_power_out 0 -1
function large_number:int_base_int_power/input.is-.macro with storage math

data modify storage math temp10[-1] set from storage math temp1
execute in minecraft:overworld run data modify entity 28529-0-3d00-0-2c4200ee8401 transformation set from storage math temp10
execute in minecraft:overworld run data modify storage math int_base_int_power_out set from entity 28529-0-3d00-0-2c4200ee8401 transformation.scale[0]
