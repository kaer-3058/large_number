##转换进制，任意进制转10进制

#data modify storage large_number:math number_base_conversion set value ["f","f","0","9","7"]
#scoreboard players set #conversion.10_to_any.radix int 27

#接受的进制为2~36，仅接受正整数

data modify storage large_number:math temp_s1 set value [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]
execute store result storage large_number:math temp_s1[-2] int 1 run scoreboard players operation #temp_n2 int = #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-3] int 1 store result score #temp_n3 int run scoreboard players operation #temp_n2 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-4] int 1 store result score #temp_n4 int run scoreboard players operation #temp_n3 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-5] int 1 store result score #temp_n5 int run scoreboard players operation #temp_n4 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-6] int 1 store result score #temp_n6 int run scoreboard players operation #temp_n5 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-7] int 1 store result score #temp_n7 int run scoreboard players operation #temp_n6 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-8] int 1 store result score #temp_n8 int run scoreboard players operation #temp_n7 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-9] int 1 store result score #temp_n9 int run scoreboard players operation #temp_n8 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-10] int 1 store result score #temp_n10 int run scoreboard players operation #temp_n9 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-11] int 1 store result score #temp_n11 int run scoreboard players operation #temp_n10 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-12] int 1 store result score #temp_n12 int run scoreboard players operation #temp_n11 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-13] int 1 store result score #temp_n13 int run scoreboard players operation #temp_n12 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-14] int 1 store result score #temp_n14 int run scoreboard players operation #temp_n13 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-15] int 1 store result score #temp_n15 int run scoreboard players operation #temp_n14 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-16] int 1 store result score #temp_n16 int run scoreboard players operation #temp_n15 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-17] int 1 store result score #temp_n17 int run scoreboard players operation #temp_n16 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-18] int 1 store result score #temp_n18 int run scoreboard players operation #temp_n17 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-19] int 1 store result score #temp_n19 int run scoreboard players operation #temp_n18 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-20] int 1 store result score #temp_n20 int run scoreboard players operation #temp_n19 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-21] int 1 store result score #temp_n21 int run scoreboard players operation #temp_n20 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-22] int 1 store result score #temp_n22 int run scoreboard players operation #temp_n21 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-23] int 1 store result score #temp_n23 int run scoreboard players operation #temp_n22 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-24] int 1 store result score #temp_n24 int run scoreboard players operation #temp_n23 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-25] int 1 store result score #temp_n25 int run scoreboard players operation #temp_n24 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-26] int 1 store result score #temp_n26 int run scoreboard players operation #temp_n25 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-27] int 1 store result score #temp_n27 int run scoreboard players operation #temp_n26 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-28] int 1 store result score #temp_n28 int run scoreboard players operation #temp_n27 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-29] int 1 store result score #temp_n29 int run scoreboard players operation #temp_n28 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-30] int 1 store result score #temp_n30 int run scoreboard players operation #temp_n29 int *= #conversion.10_to_any.radix int
execute store result storage large_number:math temp_s1[-31] int 1 run scoreboard players operation #temp_n30 int *= #conversion.10_to_any.radix int

data modify storage large_number:math temp_s2 set value [{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0}]

data modify storage large_number:math temp_s2[-1].a set from storage large_number:math number_base_conversion[-1]
data modify storage large_number:math temp_s2[-2].a set from storage large_number:math number_base_conversion[-2]
data modify storage large_number:math temp_s2[-3].a set from storage large_number:math number_base_conversion[-3]
data modify storage large_number:math temp_s2[-4].a set from storage large_number:math number_base_conversion[-4]
data modify storage large_number:math temp_s2[-5].a set from storage large_number:math number_base_conversion[-5]
data modify storage large_number:math temp_s2[-6].a set from storage large_number:math number_base_conversion[-6]
data modify storage large_number:math temp_s2[-7].a set from storage large_number:math number_base_conversion[-7]
data modify storage large_number:math temp_s2[-8].a set from storage large_number:math number_base_conversion[-8]
data modify storage large_number:math temp_s2[-9].a set from storage large_number:math number_base_conversion[-9]
data modify storage large_number:math temp_s2[-10].a set from storage large_number:math number_base_conversion[-10]
data modify storage large_number:math temp_s2[-11].a set from storage large_number:math number_base_conversion[-11]
data modify storage large_number:math temp_s2[-12].a set from storage large_number:math number_base_conversion[-12]
data modify storage large_number:math temp_s2[-13].a set from storage large_number:math number_base_conversion[-13]
data modify storage large_number:math temp_s2[-14].a set from storage large_number:math number_base_conversion[-14]
data modify storage large_number:math temp_s2[-15].a set from storage large_number:math number_base_conversion[-15]
data modify storage large_number:math temp_s2[-16].a set from storage large_number:math number_base_conversion[-16]
data modify storage large_number:math temp_s2[-17].a set from storage large_number:math number_base_conversion[-17]
data modify storage large_number:math temp_s2[-18].a set from storage large_number:math number_base_conversion[-18]
data modify storage large_number:math temp_s2[-19].a set from storage large_number:math number_base_conversion[-19]
data modify storage large_number:math temp_s2[-20].a set from storage large_number:math number_base_conversion[-20]
data modify storage large_number:math temp_s2[-21].a set from storage large_number:math number_base_conversion[-21]
data modify storage large_number:math temp_s2[-22].a set from storage large_number:math number_base_conversion[-22]
data modify storage large_number:math temp_s2[-23].a set from storage large_number:math number_base_conversion[-23]
data modify storage large_number:math temp_s2[-24].a set from storage large_number:math number_base_conversion[-24]
data modify storage large_number:math temp_s2[-25].a set from storage large_number:math number_base_conversion[-25]
data modify storage large_number:math temp_s2[-26].a set from storage large_number:math number_base_conversion[-26]
data modify storage large_number:math temp_s2[-27].a set from storage large_number:math number_base_conversion[-27]
data modify storage large_number:math temp_s2[-28].a set from storage large_number:math number_base_conversion[-28]
data modify storage large_number:math temp_s2[-29].a set from storage large_number:math number_base_conversion[-29]
data modify storage large_number:math temp_s2[-30].a set from storage large_number:math number_base_conversion[-30]
data modify storage large_number:math temp_s2[-31].a set from storage large_number:math number_base_conversion[-31]

data modify storage large_number:math temp_s2[{a:"0"}] set value {a:0}
data modify storage large_number:math temp_s2[{a:"1"}] set value {a:1}
data modify storage large_number:math temp_s2[{a:"2"}] set value {a:2}
data modify storage large_number:math temp_s2[{a:"3"}] set value {a:3}
data modify storage large_number:math temp_s2[{a:"4"}] set value {a:4}
data modify storage large_number:math temp_s2[{a:"5"}] set value {a:5}
data modify storage large_number:math temp_s2[{a:"6"}] set value {a:6}
data modify storage large_number:math temp_s2[{a:"7"}] set value {a:7}
data modify storage large_number:math temp_s2[{a:"8"}] set value {a:8}
data modify storage large_number:math temp_s2[{a:"9"}] set value {a:9}
data modify storage large_number:math temp_s2[{a:"a"}] set value {a:10}
data modify storage large_number:math temp_s2[{a:"b"}] set value {a:11}
data modify storage large_number:math temp_s2[{a:"c"}] set value {a:12}
data modify storage large_number:math temp_s2[{a:"d"}] set value {a:13}
data modify storage large_number:math temp_s2[{a:"e"}] set value {a:14}
data modify storage large_number:math temp_s2[{a:"f"}] set value {a:15}
data modify storage large_number:math temp_s2[{a:"g"}] set value {a:16}
data modify storage large_number:math temp_s2[{a:"h"}] set value {a:17}
data modify storage large_number:math temp_s2[{a:"i"}] set value {a:18}
data modify storage large_number:math temp_s2[{a:"j"}] set value {a:19}
data modify storage large_number:math temp_s2[{a:"k"}] set value {a:20}
data modify storage large_number:math temp_s2[{a:"l"}] set value {a:21}
data modify storage large_number:math temp_s2[{a:"m"}] set value {a:22}
data modify storage large_number:math temp_s2[{a:"n"}] set value {a:23}
data modify storage large_number:math temp_s2[{a:"o"}] set value {a:24}
data modify storage large_number:math temp_s2[{a:"p"}] set value {a:25}
data modify storage large_number:math temp_s2[{a:"q"}] set value {a:26}
data modify storage large_number:math temp_s2[{a:"r"}] set value {a:27}
data modify storage large_number:math temp_s2[{a:"s"}] set value {a:28}
data modify storage large_number:math temp_s2[{a:"t"}] set value {a:29}
data modify storage large_number:math temp_s2[{a:"u"}] set value {a:30}
data modify storage large_number:math temp_s2[{a:"v"}] set value {a:31}
data modify storage large_number:math temp_s2[{a:"w"}] set value {a:32}
data modify storage large_number:math temp_s2[{a:"x"}] set value {a:33}
data modify storage large_number:math temp_s2[{a:"y"}] set value {a:34}
data modify storage large_number:math temp_s2[{a:"z"}] set value {a:35}

scoreboard players set #conversion.any_to_10.output int 0
execute if data storage large_number:math temp_s2[-1] run function large_number:number_base_conversion/loop2
