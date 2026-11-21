##load

scoreboard objectives add const dummy
scoreboard objectives add large_number.int dummy
scoreboard objectives add ln_const dummy
scoreboard objectives add sin_cos_const dummy
scoreboard objectives add lan.pi_information dummy

#运动抛物线
scoreboard objectives add vx dummy
scoreboard objectives add vy dummy
scoreboard objectives add vz dummy
scoreboard objectives add t dummy
scoreboard objectives add x dummy
scoreboard objectives add y dummy
scoreboard objectives add z dummy


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
scoreboard players set -2 const -2
scoreboard players set -3 const -3
scoreboard players set -4 const -4
scoreboard players set -360 const -360
scoreboard players set -100 const -100
scoreboard players set -1000 const -1000
scoreboard players set -10000 const -10000
scoreboard players set -2147483648 const -2147483648

scoreboard players set 12 const 12
scoreboard players set 16 const 16
scoreboard players set 17 const 17
scoreboard players set 18 const 18
scoreboard players set 20 const 20
scoreboard players set 22 const 22
scoreboard players set 24 const 24
scoreboard players set 25 const 25
scoreboard players set 30 const 30
scoreboard players set 36 const 36
scoreboard players set 40 const 40
scoreboard players set 45 const 45
scoreboard players set 60 const 60
scoreboard players set 72 const 72
scoreboard players set 119 const 119
scoreboard players set 180 const 180
scoreboard players set 240 const 240
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
scoreboard players set 1700 const 1700
scoreboard players set 2000 const 2000
scoreboard players set 2500 const 2500
scoreboard players set 2776 const 2776
scoreboard players set 3162 const 3162
scoreboard players set 3125 const 3125
scoreboard players set 3600 const 3600
scoreboard players set 4000 const 4000
scoreboard players set 4096 const 4096
scoreboard players set 4214 const 4214
scoreboard players set 4750 const 4750
scoreboard players set 5000 const 5000
scoreboard players set 20000 const 20000
scoreboard players set 24703 const 24703
scoreboard players set 25000 const 25000
scoreboard players set 32768 const 32768
scoreboard players set 40000 const 40000
scoreboard players set 50436 const 50436
scoreboard players set 57121 const 57121
scoreboard players set 62831 const 62831
scoreboard players set 65536 const 65536
scoreboard players set 79249 const 79249
scoreboard players set 90000 const 90000
scoreboard players set 400000 const 400000
scoreboard players set 520000 const 520000
scoreboard players set 900000 const 900000
scoreboard players set 1048576 const 1048576
scoreboard players set 1800000 const 1800000
scoreboard players set 3600000 const 3600000
scoreboard players set 15000000 const 15000000
scoreboard players set 16777216 const 16777216
scoreboard players set 36000000 const 36000000
scoreboard players set 268435456 const 268435456
scoreboard players set 360000000 const 360000000
scoreboard players set 2147483647 const 2147483647


#设置重力加速度的一半
scoreboard players set #g/2 const 122

#NTRE
function ntre:init

execute in minecraft:overworld run function large_number:load.in_overworld

data modify storage large_number:const "π" set value 3.14159265358979323846264338327950288419716939937510d
data modify storage large_number:const "e" set value 2.71828182845904523536028747135266249775724709369995d
data modify storage large_number:const "γ" set value 0.57721566490153286060651209008240243104215933593992d
data modify storage large_number:const "φ" set value 1.61803398874989484820458683436563811772030917980576d
data modify storage large_number:const "τ" set value 6.28318530717958647692528676655900576839433879875021d

data modify storage large_number:const double_min set value -1.797693134862315807E308d
data modify storage large_number:const double_max set value 1.797693134862315807E308d
data modify storage large_number:const double_abs_min set value 4.9E-324d

data modify storage large_number:math buffer_NaN set value "NaNd"

#版本号更改的位置有：数学库load函数、数学库文件夹名、Wiki里的标题、Wiki里的标识符、更新日志的大标题、Wiki索引的标题
data modify storage large_number:const version set value "large_number v.2.01"

scoreboard players set #k.la.version const 2001

#large_number:math q0 系列专门用于优化函数宏


##函数初始化

#全局xyz变量
execute unless data storage large_number:math buffer_all_xyz[2] run data modify storage large_number:math buffer_all_xyz set value [0d,0d,0d]

#四元数
execute unless data storage large_number:math xyzw[3] run data modify storage large_number:math xyzw set value [0f,0f,0f,0f]

#单位向量
execute unless data storage large_number:math unit_vector[2] run data modify storage large_number:math unit_vector set value [0f,0f,0f]

#base64解析
scoreboard players set #cb_run_func:"timestamp/cb_start" large_number.int 0

#函数表格
scoreboard players set #buffer_expre_sign_+ large_number.int 1
scoreboard players set #buffer_expre_sign_- large_number.int 2
scoreboard players set #buffer_expre_sign_* large_number.int 3
scoreboard players set #buffer_expre_sign_· large_number.int 3
scoreboard players set #buffer_expre_sign_² large_number.int 27
scoreboard players set #buffer_expre_sign_/ large_number.int 4
scoreboard players set #buffer_expre_sign_^ large_number.int 5
scoreboard players set #buffer_expre_sign_exp large_number.int 6
scoreboard players set #buffer_expre_sign_log large_number.int 7
scoreboard players set #buffer_expre_sign_sin large_number.int 8
scoreboard players set #buffer_expre_sign_cos large_number.int 9
scoreboard players set #buffer_expre_sign_tan large_number.int 44
scoreboard players set #buffer_expre_sign_arcsin large_number.int 10
scoreboard players set #buffer_expre_sign_arccos large_number.int 11
scoreboard players set #buffer_expre_sign_ln large_number.int 12
scoreboard players set #buffer_expre_sign_√ large_number.int 13
scoreboard players set #buffer_expre_sign_Γ large_number.int 14
scoreboard players set #buffer_expre_sign_gamma large_number.int 14
scoreboard players set #buffer_expre_sign_┕ large_number.int 15
scoreboard players set #buffer_expre_sign_$┕ large_number.int 45
scoreboard players set #buffer_expre_sign_LambertW large_number.int 16
scoreboard players set #buffer_expre_sign_$LambertW large_number.int 46
scoreboard players set #buffer_expre_sign_|| large_number.int 18
scoreboard players set #buffer_expre_sign_abs large_number.int 18
scoreboard players set #buffer_expre_sign_sgn large_number.int 19
scoreboard players set #buffer_expre_sign_[] large_number.int 20
scoreboard players set #buffer_expre_sign_floor large_number.int 20
scoreboard players set #buffer_expre_sign_[c] large_number.int 49
scoreboard players set #buffer_expre_sign_ceil large_number.int 49
scoreboard players set #buffer_expre_sign_[0] large_number.int 29
scoreboard players set #buffer_expre_sign_— large_number.int 21
scoreboard players set #buffer_expre_sign_atan large_number.int 22
scoreboard players set #buffer_expre_sign_ψ large_number.int 23
scoreboard players set #buffer_expre_sign_Σ[1/n]n→ large_number.int 24
scoreboard players set #buffer_expre_sign_eunorm₂ large_number.int 25
scoreboard players set #buffer_expre_sign_eunorm₃ large_number.int 26
scoreboard players set #buffer_expre_sign_arctan large_number.int 28
scoreboard players set #buffer_expre_sign_<= large_number.int 30
scoreboard players set #buffer_expre_sign_>= large_number.int 31
scoreboard players set #buffer_expre_sign_== large_number.int 32
scoreboard players set #buffer_expre_sign_≈≈ large_number.int 33
scoreboard players set #buffer_expre_sign_>/< large_number.int 34
scoreboard players set #buffer_expre_sign_>-< large_number.int 35
scoreboard players set #buffer_expre_sign_>> large_number.int 36
scoreboard players set #buffer_expre_sign_<< large_number.int 37
scoreboard players set #buffer_expre_sign_≥≥ large_number.int 38
scoreboard players set #buffer_expre_sign_≤≤ large_number.int 39
scoreboard players set #buffer_expre_sign_nroot large_number.int 40
scoreboard players set #buffer_expre_sign_sinh large_number.int 41
scoreboard players set #buffer_expre_sign_cosh large_number.int 42
scoreboard players set #buffer_expre_sign_tanh large_number.int 43
scoreboard players set #buffer_expre_sign_erf large_number.int 48
scoreboard players set #buffer_expre_sign_ζ large_number.int 50
scoreboard players set #buffer_expre_sign_lnΓ large_number.int 51
scoreboard players set #buffer_expre_sign_beta large_number.int 52

#复数计算器专属函数
scoreboard players set #buffer_expre_sign_conju large_number.int 53
scoreboard players set #buffer_expre_sign_arg large_number.int 54
scoreboard players set #buffer_expre_sign_re large_number.int 55
scoreboard players set #buffer_expre_sign_im large_number.int 56
