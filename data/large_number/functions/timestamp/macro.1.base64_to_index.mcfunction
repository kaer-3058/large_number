#测试是否为padding字符
$execute unless data storage large_number:timestamp timestamp._binary_$(temp1) run data modify storage large_number:timestamp timestamp._binary_$(temp1) set value "000000"
$execute unless data storage large_number:timestamp timestamp._binary_$(temp2) run data modify storage large_number:timestamp timestamp._binary_$(temp2) set value "000000"
$execute unless data storage large_number:timestamp timestamp._binary_$(temp3) run data modify storage large_number:timestamp timestamp._binary_$(temp3) set value "000000"
$execute unless data storage large_number:timestamp timestamp._binary_$(temp4) run data modify storage large_number:timestamp timestamp._binary_$(temp4) set value "000000"

$data modify storage large_number:math temp1 set from storage large_number:timestamp timestamp._binary_$(temp1)
$data modify storage large_number:math temp2 set from storage large_number:timestamp timestamp._binary_$(temp2)
$data modify storage large_number:math temp3 set from storage large_number:timestamp timestamp._binary_$(temp3)
$data modify storage large_number:math temp4 set from storage large_number:timestamp timestamp._binary_$(temp4)
