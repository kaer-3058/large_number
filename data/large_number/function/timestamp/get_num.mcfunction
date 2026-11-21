data modify storage large_number:math temp1 set string storage large_number:timestamp timestamp_base64 8 9
data modify storage large_number:math temp2 set string storage large_number:timestamp timestamp_base64 9 10
data modify storage large_number:math temp3 set string storage large_number:timestamp timestamp_base64 10 11
data modify storage large_number:math temp4 set string storage large_number:timestamp timestamp_base64 11 12
execute store result score #temp1 large_number.int run function large_number:timestamp/macro.1.base64_to_index/1 with storage large_number:math
execute store result score #temp2 large_number.int run function large_number:timestamp/macro.1.base64_to_index/2 with storage large_number:math
execute store result score #temp3 large_number.int run function large_number:timestamp/macro.1.base64_to_index/3 with storage large_number:math
execute store result score #temp4 large_number.int run function large_number:timestamp/macro.1.base64_to_index/4 with storage large_number:math
execute store result storage large_number:math temp1 int 1 run scoreboard players add #temp1 large_number.int 1000000
execute store result storage large_number:math temp2 int 1 run scoreboard players add #temp2 large_number.int 1000000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #temp3 large_number.int 1000000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #temp4 large_number.int 1000000
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1
function large_number:timestamp/macro.2.01string_4_merge_to_1 with storage large_number:math
data modify storage large_number:math s1[0].a set string storage large_number:math y4 0 8
data modify storage large_number:math s1[1].a set string storage large_number:math y4 8 16
data modify storage large_number:math s1[2].a set string storage large_number:math y4 16 24

data modify storage large_number:math temp1 set string storage large_number:timestamp timestamp_base64 12 13
data modify storage large_number:math temp2 set string storage large_number:timestamp timestamp_base64 13 14
execute store result score #temp1 large_number.int run function large_number:timestamp/macro.1.base64_to_index/1 with storage large_number:math
execute store result score #temp2 large_number.int run function large_number:timestamp/macro.1.base64_to_index/2 with storage large_number:math
execute store result storage large_number:math temp1 int 1 run scoreboard players add #temp1 large_number.int 1000000
execute store result storage large_number:math temp2 int 1 run scoreboard players add #temp2 large_number.int 1000000
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
data modify storage large_number:math temp2 set string storage large_number:math temp2 1
function large_number:timestamp/macro.2.01string_4_merge_to_1 with storage large_number:math
data modify storage large_number:math s1[3].a set string storage large_number:math y4 0 8
data remove storage large_number:math s1[3]
data remove storage large_number:math s1[3]

data modify storage large_number:math s1[{a:"00110000"}] set value {a:0}
data modify storage large_number:math s1[{a:"00110001"}] set value {a:1}
data modify storage large_number:math s1[{a:"00110010"}] set value {a:2}
data modify storage large_number:math s1[{a:"00110011"}] set value {a:3}
data modify storage large_number:math s1[{a:"00110100"}] set value {a:4}
data modify storage large_number:math s1[{a:"00110101"}] set value {a:5}
data modify storage large_number:math s1[{a:"00110110"}] set value {a:6}
data modify storage large_number:math s1[{a:"00110111"}] set value {a:7}
data modify storage large_number:math s1[{a:"00111000"}] set value {a:8}
data modify storage large_number:math s1[{a:"00111001"}] set value {a:9}
data modify storage large_number:timestamp timestamp_decoded_base64 append from storage large_number:math s1[].a

execute store result score #timestamp.num large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[0] 1000000000
execute store result score #temp1 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[1] 100000000
execute store result score #temp2 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[2] 10000000
execute store result score #temp3 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[3] 1000000
execute store result score #temp4 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[4] 100000
execute store result score #temp5 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[5] 10000
execute store result score #temp6 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[6] 1000
execute store result score #temp7 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[7] 100
execute store result score #temp8 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[8] 10
execute store result score #temp9 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[9]
scoreboard players operation #timestamp.num large_number.int += #temp1 large_number.int
scoreboard players operation #timestamp.num large_number.int += #temp2 large_number.int
scoreboard players operation #timestamp.num large_number.int += #temp3 large_number.int
scoreboard players operation #timestamp.num large_number.int += #temp4 large_number.int
scoreboard players operation #timestamp.num large_number.int += #temp5 large_number.int
scoreboard players operation #timestamp.num large_number.int += #temp6 large_number.int
scoreboard players operation #timestamp.num large_number.int += #temp7 large_number.int
scoreboard players operation #timestamp.num large_number.int += #temp8 large_number.int
scoreboard players operation #timestamp.num large_number.int += #temp9 large_number.int
