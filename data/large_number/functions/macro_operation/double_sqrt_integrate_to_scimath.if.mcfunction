data modify storage math temp2 set value "E"
execute in minecraft:overworld run data modify block -29999982 -64 22022222 front_text.messages[0] set value '{"nbt":"double_sqrt.output.double","storage":"math"}'
execute in minecraft:overworld run data modify storage math temp1 set string block -29999982 -64 22022222 front_text.messages[0] 9 -3
execute store result storage math temp3 int 1.0 run data get storage math double_sqrt.output.expon
function large_number:macro_operation/double_sqrt_integrate_to_scimath with storage math