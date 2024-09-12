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

execute if data storage large_number:math temp_s2[{a:"0"}] run data modify storage large_number:math temp_s2[{a:"0"}].a set value 0
execute if data storage large_number:math temp_s2[{a:"1"}] run data modify storage large_number:math temp_s2[{a:"1"}].a set value 1
execute if data storage large_number:math temp_s2[{a:"2"}] run data modify storage large_number:math temp_s2[{a:"2"}].a set value 2
execute if data storage large_number:math temp_s2[{a:"3"}] run data modify storage large_number:math temp_s2[{a:"3"}].a set value 3
execute if data storage large_number:math temp_s2[{a:"4"}] run data modify storage large_number:math temp_s2[{a:"4"}].a set value 4
execute if data storage large_number:math temp_s2[{a:"5"}] run data modify storage large_number:math temp_s2[{a:"5"}].a set value 5
execute if data storage large_number:math temp_s2[{a:"6"}] run data modify storage large_number:math temp_s2[{a:"6"}].a set value 6
execute if data storage large_number:math temp_s2[{a:"7"}] run data modify storage large_number:math temp_s2[{a:"7"}].a set value 7
execute if data storage large_number:math temp_s2[{a:"8"}] run data modify storage large_number:math temp_s2[{a:"8"}].a set value 8
execute if data storage large_number:math temp_s2[{a:"9"}] run data modify storage large_number:math temp_s2[{a:"9"}].a set value 9
execute if data storage large_number:math temp_s2[{a:"a"}] run data modify storage large_number:math temp_s2[{a:"a"}].a set value 10
execute if data storage large_number:math temp_s2[{a:"b"}] run data modify storage large_number:math temp_s2[{a:"b"}].a set value 11
execute if data storage large_number:math temp_s2[{a:"c"}] run data modify storage large_number:math temp_s2[{a:"c"}].a set value 12
execute if data storage large_number:math temp_s2[{a:"d"}] run data modify storage large_number:math temp_s2[{a:"d"}].a set value 13
execute if data storage large_number:math temp_s2[{a:"e"}] run data modify storage large_number:math temp_s2[{a:"e"}].a set value 14
execute if data storage large_number:math temp_s2[{a:"f"}] run data modify storage large_number:math temp_s2[{a:"f"}].a set value 15
execute if data storage large_number:math temp_s2[{a:"g"}] run data modify storage large_number:math temp_s2[{a:"g"}].a set value 16
execute if data storage large_number:math temp_s2[{a:"h"}] run data modify storage large_number:math temp_s2[{a:"h"}].a set value 17
execute if data storage large_number:math temp_s2[{a:"i"}] run data modify storage large_number:math temp_s2[{a:"i"}].a set value 18
execute if data storage large_number:math temp_s2[{a:"j"}] run data modify storage large_number:math temp_s2[{a:"j"}].a set value 19
execute if data storage large_number:math temp_s2[{a:"k"}] run data modify storage large_number:math temp_s2[{a:"k"}].a set value 20
execute if data storage large_number:math temp_s2[{a:"l"}] run data modify storage large_number:math temp_s2[{a:"l"}].a set value 21
execute if data storage large_number:math temp_s2[{a:"m"}] run data modify storage large_number:math temp_s2[{a:"m"}].a set value 22
execute if data storage large_number:math temp_s2[{a:"n"}] run data modify storage large_number:math temp_s2[{a:"n"}].a set value 23
execute if data storage large_number:math temp_s2[{a:"o"}] run data modify storage large_number:math temp_s2[{a:"o"}].a set value 24
execute if data storage large_number:math temp_s2[{a:"p"}] run data modify storage large_number:math temp_s2[{a:"p"}].a set value 25
execute if data storage large_number:math temp_s2[{a:"q"}] run data modify storage large_number:math temp_s2[{a:"q"}].a set value 26
execute if data storage large_number:math temp_s2[{a:"r"}] run data modify storage large_number:math temp_s2[{a:"r"}].a set value 27
execute if data storage large_number:math temp_s2[{a:"s"}] run data modify storage large_number:math temp_s2[{a:"s"}].a set value 28
execute if data storage large_number:math temp_s2[{a:"t"}] run data modify storage large_number:math temp_s2[{a:"t"}].a set value 29
execute if data storage large_number:math temp_s2[{a:"u"}] run data modify storage large_number:math temp_s2[{a:"u"}].a set value 30
execute if data storage large_number:math temp_s2[{a:"v"}] run data modify storage large_number:math temp_s2[{a:"v"}].a set value 31
execute if data storage large_number:math temp_s2[{a:"w"}] run data modify storage large_number:math temp_s2[{a:"w"}].a set value 32
execute if data storage large_number:math temp_s2[{a:"x"}] run data modify storage large_number:math temp_s2[{a:"x"}].a set value 33
execute if data storage large_number:math temp_s2[{a:"y"}] run data modify storage large_number:math temp_s2[{a:"y"}].a set value 34
execute if data storage large_number:math temp_s2[{a:"z"}] run data modify storage large_number:math temp_s2[{a:"z"}].a set value 35

scoreboard players set #conversion.any_to_10.output int 0
execute if data storage large_number:math temp_s2[-1] run function large_number:number_base_conversion/loop2
