data modify storage math temp1 set value ["","",""]
$execute if data storage timestamp {timestamp_binary_ascii_$(temp1):" "} run data modify storage timestamp timestamp_binary_ascii_$(temp1) set value ""
$execute if data storage timestamp {timestamp_binary_ascii_$(temp2):" "} run data modify storage timestamp timestamp_binary_ascii_$(temp2) set value ""
$execute if data storage timestamp {timestamp_binary_ascii_$(temp3):" "} run data modify storage timestamp timestamp_binary_ascii_$(temp3) set value ""

$data modify storage math temp1[0] set from storage timestamp timestamp_binary_ascii_$(temp1)
$data modify storage math temp1[1] set from storage timestamp timestamp_binary_ascii_$(temp2)
$data modify storage math temp1[2] set from storage timestamp timestamp_binary_ascii_$(temp3)
