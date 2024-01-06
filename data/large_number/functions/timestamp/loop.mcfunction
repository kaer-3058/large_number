##解码核心
#每四个字符为一组，进行解码

data modify storage math temp1 set string storage timestamp timestamp_base64 0 1
data modify storage math temp2 set string storage timestamp timestamp_base64 1 2
data modify storage math temp3 set string storage timestamp timestamp_base64 2 3
data modify storage math temp4 set string storage timestamp timestamp_base64 3 4
data modify storage timestamp timestamp_base64 set string storage timestamp timestamp_base64 4

function large_number:timestamp/macro.1.base64_to_index with storage math
function large_number:timestamp/macro.2.01string_4_merge_to_1 with storage math

data modify storage math temp1 set string storage math temp4 0 8
data modify storage math temp2 set string storage math temp4 8 16
data modify storage math temp3 set string storage math temp4 16 24

function large_number:timestamp/macro.3.8bit_binary_to_ascii with storage math

data modify storage timestamp timestamp_decoded_base64 append from storage math temp1[]


#判断是否继续递归
scoreboard players remove #temp9 int 4
execute if score #temp9 int matches 1.. run function large_number:timestamp/loop
