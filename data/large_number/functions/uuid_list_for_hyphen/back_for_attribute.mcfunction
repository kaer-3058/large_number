##UUID带连字符的16进制转为数组  attribute法

#输入：data modify storage large_number:math uuid_hyphen_back_list.input set value "d91095bb-9a9d-4d4f-b16b-2d36136699b6"
#执行：function large_number:uuid_list_for_hyphen/back_for_attribute with storage large_number:math uuid_hyphen_back_list
#输出：data get storage large_number:math uuid_hyphen_back_list.output

#用于attribute计算的盔甲架 3faf-0-3d00-0-61900f4241f

$attribute 3faf-0-3d00-0-61900f4241f minecraft:generic.max_health modifier add $(input) "uuid_int" 1.0 add
data modify storage large_number:math uuid_hyphen_back_list.output set from entity 3faf-0-3d00-0-61900f4241f Attributes[{Name:"minecraft:generic.max_health"}].Modifiers[{Name:"uuid_int"}].UUID
$attribute 3faf-0-3d00-0-61900f4241f minecraft:generic.max_health modifier remove $(input)
