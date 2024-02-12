data modify storage math temp1 set from storage math temp3[0]
#execute if data storage math {temp1:"\\"} run data modify storage math temp1 set value "\\\\"
#execute if data storage math {temp1:"'"} run data modify storage math temp1 set value "\\'"

function large_number:timestamp/macro.4.merge_json_string with storage math

data remove storage math temp3[0]
execute if data storage math temp3[0] run function large_number:timestamp/loop.merge_json_string
