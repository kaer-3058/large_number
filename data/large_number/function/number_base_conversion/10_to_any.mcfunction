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

data modify storage large_number:math temp1[{a:10}] set value {a:"a"}
data modify storage large_number:math temp1[{a:11}] set value {a:"b"}
data modify storage large_number:math temp1[{a:12}] set value {a:"c"}
data modify storage large_number:math temp1[{a:13}] set value {a:"d"}
data modify storage large_number:math temp1[{a:14}] set value {a:"e"}
data modify storage large_number:math temp1[{a:15}] set value {a:"f"}
data modify storage large_number:math temp1[{a:16}] set value {a:"g"}
data modify storage large_number:math temp1[{a:17}] set value {a:"h"}
data modify storage large_number:math temp1[{a:18}] set value {a:"i"}
data modify storage large_number:math temp1[{a:19}] set value {a:"j"}
data modify storage large_number:math temp1[{a:20}] set value {a:"k"}
data modify storage large_number:math temp1[{a:21}] set value {a:"l"}
data modify storage large_number:math temp1[{a:22}] set value {a:"m"}
data modify storage large_number:math temp1[{a:23}] set value {a:"n"}
data modify storage large_number:math temp1[{a:24}] set value {a:"o"}
data modify storage large_number:math temp1[{a:25}] set value {a:"p"}
data modify storage large_number:math temp1[{a:26}] set value {a:"q"}
data modify storage large_number:math temp1[{a:27}] set value {a:"r"}
data modify storage large_number:math temp1[{a:28}] set value {a:"s"}
data modify storage large_number:math temp1[{a:29}] set value {a:"t"}
data modify storage large_number:math temp1[{a:30}] set value {a:"u"}
data modify storage large_number:math temp1[{a:31}] set value {a:"v"}
data modify storage large_number:math temp1[{a:32}] set value {a:"w"}
data modify storage large_number:math temp1[{a:33}] set value {a:"x"}
data modify storage large_number:math temp1[{a:34}] set value {a:"y"}
data modify storage large_number:math temp1[{a:35}] set value {a:"z"}

data modify storage large_number:math number_base_conversion set value []
data modify storage large_number:math number_base_conversion append from storage large_number:math temp1[].a
