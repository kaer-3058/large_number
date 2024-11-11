##基础字符串排序 - 字典序 - 冒泡排序法 - 正序

#排序方法：仅检查字符串第一个字符。从前往后依次是：0~9、a~z、A~Z、其他字符、空串。

#data modify storage large_number:math string_dictionary_order_basic.input set value ["1","^^","73","29","ahhh","Kml","kml",""]
#function large_number:list_operation/sort/string_dictionary_order_basic/datapack

data modify storage large_number:math string_dictionary_order_basic.output set value []
data modify storage large_number:math stemp0 set from storage large_number:math string_dictionary_order_basic.input
data modify storage large_number:math stemp1 set value []

execute if data storage large_number:math stemp0[1] run function large_number:list_operation/sort/string_dictionary_order_basic/loop
data modify storage large_number:math string_dictionary_order_basic.output prepend from storage large_number:math stemp0[]
