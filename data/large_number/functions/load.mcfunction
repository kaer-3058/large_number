##load

scoreboard objectives add const dummy
scoreboard objectives add int dummy
scoreboard objectives add if dummy
scoreboard objectives add ln_const dummy

#常量
scoreboard players set -1 const -1
scoreboard players set 0 const 0
scoreboard players set 1 const 1
scoreboard players set 2 const 2
scoreboard players set 3 const 3
scoreboard players set 4 const 4
scoreboard players set 5 const 5
scoreboard players set 6 const 6
scoreboard players set 7 const 7
scoreboard players set 8 const 8
scoreboard players set 9 const 9

scoreboard players set 10 const 10
scoreboard players set 100 const 100
scoreboard players set 1000 const 1000
scoreboard players set 10000 const 10000
scoreboard players set 100000 const 100000
scoreboard players set 1000000 const 1000000
scoreboard players set 10000000 const 10000000
scoreboard players set 100000000 const 100000000
scoreboard players set 1000000000 const 1000000000
scoreboard players set -10000 const -10000

scoreboard players set 16 const 16
scoreboard players set 17 const 17
scoreboard players set 18 const 18
scoreboard players set 20 const 20
scoreboard players set 24 const 24
scoreboard players set 25 const 25
scoreboard players set 40 const 40
scoreboard players set 45 const 45
scoreboard players set 60 const 60
scoreboard players set 72 const 72
scoreboard players set 119 const 119
scoreboard players set 180 const 180
scoreboard players set 250 const 250
scoreboard players set 256 const 256
scoreboard players set 360 const 360
scoreboard players set 400 const 400
scoreboard players set 405 const 405
scoreboard players set 425 const 425
scoreboard players set 559 const 559
scoreboard players set 600 const 600
scoreboard players set 1535 const 1535
scoreboard players set 1625 const 1625
scoreboard players set 2500 const 2500
scoreboard players set 2776 const 2776
scoreboard players set 3162 const 3162
scoreboard players set 3600 const 3600
scoreboard players set 4000 const 4000
scoreboard players set 4096 const 4096
scoreboard players set 4214 const 4214
scoreboard players set 4750 const 4750
scoreboard players set 5000 const 5000
scoreboard players set 20000 const 20000
scoreboard players set 24703 const 24703
scoreboard players set 32768 const 32768
scoreboard players set 40000 const 40000
scoreboard players set 50436 const 50436
scoreboard players set 62831 const 62831
scoreboard players set 65536 const 65536
scoreboard players set 79249 const 79249
scoreboard players set 400000 const 400000
scoreboard players set 1048576 const 1048576
scoreboard players set 16777216 const 16777216
scoreboard players set 268435456 const 268435456

#ntre
function ntre:init

execute in minecraft:overworld run function large_number:load.in_overworld

data modify storage large_number:const "π" set value 3.14159265358979323846264338327950288419716939937510d
data modify storage large_number:const "e" set value 2.71828182845904523536028747135266249775724709369995d


##函数初始化

#全局xyz变量
data modify storage large_number:math buffer_all_xyz set value [0.0,0.0,0.0]

#数位显示
data modify storage large_number:math buffer_digital_display_list set value [0,0,0,0,0,0,0,0]
data modify storage large_number:math buffer_digital_display_json set value ["","","","","","","",""]

#四元数
execute unless data storage large_number:math xyzw[3] run data modify storage large_number:math xyzw set value [0.0f,0.0f,0.0f,0.0f]

#int质因数分解
function large_number:prime_factorization/database
