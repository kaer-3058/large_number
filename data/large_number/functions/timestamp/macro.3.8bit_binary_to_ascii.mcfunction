data modify storage large_number:math temp1 set value ["","",""]
$data modify storage large_number:math temp1[0] set from storage large_number:timestamp timestamp._binary_ascii_$(temp1)
$data modify storage large_number:math temp1[1] set from storage large_number:timestamp timestamp._binary_ascii_$(temp2)
$data modify storage large_number:math temp1[2] set from storage large_number:timestamp timestamp._binary_ascii_$(temp3)