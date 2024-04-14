data modify storage math temp1 set value ["","",""]
$data modify storage math temp1[0] set from storage timestamp timestamp._binary_ascii_$(temp1)
$data modify storage math temp1[1] set from storage timestamp timestamp._binary_ascii_$(temp2)
$data modify storage math temp1[2] set from storage timestamp timestamp._binary_ascii_$(temp3)