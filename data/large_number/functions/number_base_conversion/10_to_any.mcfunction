##转换进制，10进制转任意进制

#scoreboard players set #conversion.10_to_any.input int 75535
#scoreboard players set #conversion.10_to_any.radix int 8

#接受的输入值为[-2147483647, 2147483647]
#接受的进制为2~36

data modify storage large_number:math temp1 set value [{a:0}]
execute store result score #temp2 int run scoreboard players operation #temp1 int = #conversion.10_to_any.input int
execute store result storage large_number:math temp1[0].a int 1 run scoreboard players operation #temp2 int %= #conversion.10_to_any.radix int
execute if score #temp2 int matches 0..9 unless score #conversion.10_to_any.radix int matches ..10 run data modify storage large_number:math temp1[0].a set string storage large_number:math temp1[0].a
data modify storage large_number:math stemp1 set value {a:0}
execute if score #temp1 int >= #conversion.10_to_any.radix int run function large_number:number_base_conversion/loop1

execute if data storage large_number:math temp1[{a:10}] run data modify storage large_number:math temp1[{a:10}].a set value "a"
execute if data storage large_number:math temp1[{a:11}] run data modify storage large_number:math temp1[{a:11}].a set value "b"
execute if data storage large_number:math temp1[{a:12}] run data modify storage large_number:math temp1[{a:12}].a set value "c"
execute if data storage large_number:math temp1[{a:13}] run data modify storage large_number:math temp1[{a:13}].a set value "d"
execute if data storage large_number:math temp1[{a:14}] run data modify storage large_number:math temp1[{a:14}].a set value "e"
execute if data storage large_number:math temp1[{a:15}] run data modify storage large_number:math temp1[{a:15}].a set value "f"
execute if data storage large_number:math temp1[{a:16}] run data modify storage large_number:math temp1[{a:16}].a set value "g"
execute if data storage large_number:math temp1[{a:17}] run data modify storage large_number:math temp1[{a:17}].a set value "h"
execute if data storage large_number:math temp1[{a:18}] run data modify storage large_number:math temp1[{a:18}].a set value "i"
execute if data storage large_number:math temp1[{a:19}] run data modify storage large_number:math temp1[{a:19}].a set value "j"
execute if data storage large_number:math temp1[{a:20}] run data modify storage large_number:math temp1[{a:20}].a set value "k"
execute if data storage large_number:math temp1[{a:21}] run data modify storage large_number:math temp1[{a:21}].a set value "l"
execute if data storage large_number:math temp1[{a:22}] run data modify storage large_number:math temp1[{a:22}].a set value "m"
execute if data storage large_number:math temp1[{a:23}] run data modify storage large_number:math temp1[{a:23}].a set value "n"
execute if data storage large_number:math temp1[{a:24}] run data modify storage large_number:math temp1[{a:24}].a set value "o"
execute if data storage large_number:math temp1[{a:25}] run data modify storage large_number:math temp1[{a:25}].a set value "p"
execute if data storage large_number:math temp1[{a:26}] run data modify storage large_number:math temp1[{a:26}].a set value "q"
execute if data storage large_number:math temp1[{a:27}] run data modify storage large_number:math temp1[{a:27}].a set value "r"
execute if data storage large_number:math temp1[{a:28}] run data modify storage large_number:math temp1[{a:28}].a set value "s"
execute if data storage large_number:math temp1[{a:29}] run data modify storage large_number:math temp1[{a:29}].a set value "t"
execute if data storage large_number:math temp1[{a:30}] run data modify storage large_number:math temp1[{a:30}].a set value "u"
execute if data storage large_number:math temp1[{a:31}] run data modify storage large_number:math temp1[{a:31}].a set value "v"
execute if data storage large_number:math temp1[{a:32}] run data modify storage large_number:math temp1[{a:32}].a set value "w"
execute if data storage large_number:math temp1[{a:33}] run data modify storage large_number:math temp1[{a:33}].a set value "x"
execute if data storage large_number:math temp1[{a:34}] run data modify storage large_number:math temp1[{a:34}].a set value "y"
execute if data storage large_number:math temp1[{a:35}] run data modify storage large_number:math temp1[{a:35}].a set value "z"

data modify storage large_number:math number_base_conversion set value []
data modify storage large_number:math number_base_conversion append from storage large_number:math temp1[].a
