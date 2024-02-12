##UUID带连字符的16进制转为数组  attribute法

#输入：data modify storage math uuid_hyphen_back_list.input set value "d91095bb-9a9d-4d4f-b16b-2d36136699b6"
#必须输入完整的32位UUID，每一段前面的0不能省
#执行：execute in minecraft:overworld run function large_number:uuid_list_for_hyphen/back_for_attribute with storage math uuid_hyphen_back_list
#输出：data get storage math uuid_hyphen_back_list.output

#用于attribute计算的盔甲架 3faf-0-3d00-0-61900f4241f

$attribute 3faf-0-3d00-0-61900f4241f minecraft:generic.max_health modifier add $(input) "uuid_int" 1.0 add
data modify storage math uuid_hyphen_back_list.output set from entity 3faf-0-3d00-0-61900f4241f Attributes[{Name:"minecraft:generic.max_health"}].Modifiers[{Name:"uuid_int"}].UUID
$attribute 3faf-0-3d00-0-61900f4241f minecraft:generic.max_health modifier remove $(input)
