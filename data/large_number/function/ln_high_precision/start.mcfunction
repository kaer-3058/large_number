##高精度自然对数 (全double)

#公式：ln(7.45*10^26)=ln(7.45)+26*ln(10)
#ln(7.45)=ln(745/100)=ln(745)-ln(100)
#输入：data modify storage large_number:math ln_high_precision.input set value 8.2184074E307d
#输入值必须为double型

#此算法参考：https://www.zhihu.com/question/333371020/answer/1686069171

#L1 = 0.6666666666666735130
#L2 = 0.3999999999940941908
#L3 = 0.2857142874366239149
#L4 = 0.2222219843214978396
#L5 = 0.1818357216161805012
#L6 = 0.1531383769920937332
#L7 = 0.1479819860511658591

#优先处理前导0
data modify storage large_number:math temp1 set string storage large_number:math ln_high_precision.input 0 -1
data modify storage large_number:math stemp1011 set value ""
data modify storage large_number:math stemp1011 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {stemp1011:"0"} run function large_number:ln_high_precision/input_is_0

#拆出科学记数法的指数位

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute unless data storage large_number:math {stemp1011:"0"} if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation

execute unless data storage large_number:math {stemp1011:"0"} store result storage large_number:math high_precision_stemp4 double 2.30258509299404568401799145 run function large_number:ln_high_precision/craft.1 with storage large_number:math

#把输入值分解为(2^k)*(1+f)的形式，其中k为整数，0≤f<1

execute store result score #loga.b.tempinp int run data get storage large_number:math ln_la_temp3
data modify storage large_number:math float_division.input2 set value 1.0d
data modify storage large_number:math sstemp2 set value 0
execute if score #loga.b.tempinp int matches 1073741824..2147483647 store success storage large_number:math sstemp2 int 30 run data modify storage large_number:math float_division.input2 set value 1073741824.0d
execute if score #loga.b.tempinp int matches 536870912..1073741823 store success storage large_number:math sstemp2 int 29 run data modify storage large_number:math float_division.input2 set value 536870912.0d
execute if score #loga.b.tempinp int matches 268435456..536870911 store success storage large_number:math sstemp2 int 28 run data modify storage large_number:math float_division.input2 set value 268435456.0d
execute if score #loga.b.tempinp int matches 134217728..268435455 store success storage large_number:math sstemp2 int 27 run data modify storage large_number:math float_division.input2 set value 134217728.0d
execute if score #loga.b.tempinp int matches 67108864..134217727 store success storage large_number:math sstemp2 int 26 run data modify storage large_number:math float_division.input2 set value 67108864.0d
execute if score #loga.b.tempinp int matches 33554432..67108863 store success storage large_number:math sstemp2 int 25 run data modify storage large_number:math float_division.input2 set value 33554432.0d
execute if score #loga.b.tempinp int matches 16777216..33554431 store success storage large_number:math sstemp2 int 24 run data modify storage large_number:math float_division.input2 set value 16777216.0d
execute if score #loga.b.tempinp int matches 8388608..16777215 store success storage large_number:math sstemp2 int 23 run data modify storage large_number:math float_division.input2 set value 8388608.0d
execute if score #loga.b.tempinp int matches 4194304..8388607 store success storage large_number:math sstemp2 int 22 run data modify storage large_number:math float_division.input2 set value 4194304.0d
execute if score #loga.b.tempinp int matches 2097152..4194303 store success storage large_number:math sstemp2 int 21 run data modify storage large_number:math float_division.input2 set value 2097152.0d
execute if score #loga.b.tempinp int matches 1048576..2097151 store success storage large_number:math sstemp2 int 20 run data modify storage large_number:math float_division.input2 set value 1048576.0d
execute if score #loga.b.tempinp int matches 524288..1048575 store success storage large_number:math sstemp2 int 19 run data modify storage large_number:math float_division.input2 set value 524288.0d
execute if score #loga.b.tempinp int matches 262144..524287 store success storage large_number:math sstemp2 int 18 run data modify storage large_number:math float_division.input2 set value 262144.0d
execute if score #loga.b.tempinp int matches 131072..262143 store success storage large_number:math sstemp2 int 17 run data modify storage large_number:math float_division.input2 set value 131072.0d
execute if score #loga.b.tempinp int matches 65536..131071 store success storage large_number:math sstemp2 int 16 run data modify storage large_number:math float_division.input2 set value 65536.0d
execute if score #loga.b.tempinp int matches 32768..65535 store success storage large_number:math sstemp2 int 15 run data modify storage large_number:math float_division.input2 set value 32768.0d
execute if score #loga.b.tempinp int matches 16384..32767 store success storage large_number:math sstemp2 int 14 run data modify storage large_number:math float_division.input2 set value 16384.0d
execute if score #loga.b.tempinp int matches 8192..16383 store success storage large_number:math sstemp2 int 13 run data modify storage large_number:math float_division.input2 set value 8192.0d
execute if score #loga.b.tempinp int matches 4096..8191 store success storage large_number:math sstemp2 int 12 run data modify storage large_number:math float_division.input2 set value 4096.0d
execute if score #loga.b.tempinp int matches 2048..4095 store success storage large_number:math sstemp2 int 11 run data modify storage large_number:math float_division.input2 set value 2048.0d
execute if score #loga.b.tempinp int matches 1024..2047 store success storage large_number:math sstemp2 int 10 run data modify storage large_number:math float_division.input2 set value 1024.0d
execute if score #loga.b.tempinp int matches 512..1023 store success storage large_number:math sstemp2 int 9 run data modify storage large_number:math float_division.input2 set value 512.0d
execute if score #loga.b.tempinp int matches 256..511 store success storage large_number:math sstemp2 int 8 run data modify storage large_number:math float_division.input2 set value 256.0d
execute if score #loga.b.tempinp int matches 128..255 store success storage large_number:math sstemp2 int 7 run data modify storage large_number:math float_division.input2 set value 128.0d
execute if score #loga.b.tempinp int matches 64..127 store success storage large_number:math sstemp2 int 6 run data modify storage large_number:math float_division.input2 set value 64.0d
execute if score #loga.b.tempinp int matches 32..63 store success storage large_number:math sstemp2 int 5 run data modify storage large_number:math float_division.input2 set value 32.0d
execute if score #loga.b.tempinp int matches 16..31 store success storage large_number:math sstemp2 int 4 run data modify storage large_number:math float_division.input2 set value 16.0d
execute if score #loga.b.tempinp int matches 8..15 store success storage large_number:math sstemp2 int 3 run data modify storage large_number:math float_division.input2 set value 8.0d
execute if score #loga.b.tempinp int matches 4..7 store success storage large_number:math sstemp2 int 2 run data modify storage large_number:math float_division.input2 set value 4.0d
execute if score #loga.b.tempinp int matches 2..3 store success storage large_number:math sstemp2 int 1 run data modify storage large_number:math float_division.input2 set value 2.0d
execute if score #loga.b.tempinp int matches 0..1 store success storage large_number:math sstemp2 int 0 run data modify storage large_number:math float_division.input2 set value 1.0d
execute store result storage large_number:math sstemp_kln2 double .69314718055994530941723212 run data get storage large_number:math sstemp2

#f=x/(2^[log2(x)])-1
data modify storage large_number:math float_division.input1 set from storage large_number:math ln_la_temp3
function large_number:division/float_12decimal/start
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:ln_high_precision/as_entity_1

#中间变量，s=f(2+f)
data modify storage large_number:math float_division.input1 set from storage large_number:math sstemp_f
function large_number:division/float_12decimal/start
data modify storage large_number:math sstemp_s set from storage large_number:math float_division.output

#ff/2
data modify storage large_number:math float_multiply.input1 set from storage large_number:math sstemp_f
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math sstemp3 set from storage large_number:math float_multiply.output

function large_number:ln_high_precision/macro1 with storage large_number:math
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation

execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 1
function large_number:sigmoid/macro4 with storage large_number:math

data modify storage large_number:math temp_ff2 set from storage large_number:math temp2

##雷米兹算法  ln(1+s)-ln(1-s)在s=0处展开的泰勒公式的近似值 R(z)

#雷米兹算法得到的多项式在高精度ln算法里起了最重要的误差修正的作用，理论上误差最小可达2^-58.45。
#此算法使用了大量的高精度浮点乘法，因此此算法的消耗约为查表法的60倍。

#s^2和s^4
data modify storage large_number:math float_multiply.input1 set from storage large_number:math sstemp_s
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math sstemp_s2 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input1 set from storage large_number:math sstemp_s2
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math sstemp_s4 set from storage large_number:math float_multiply.output

#计算t1
data modify storage large_number:math float_multiply.input1 set from storage large_number:math sstemp_s4
function large_number:ln_high_precision/remez/mul_with_const_1
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:ln_high_precision/remez/as_entity_1
function large_number:float_mul.high_precision/start
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:ln_high_precision/remez/as_entity_2
function large_number:float_mul.high_precision/start
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:ln_high_precision/remez/as_entity_3
data modify storage large_number:math float_multiply.input1 set from storage large_number:math sstemp_s2
function large_number:float_mul.high_precision/start
data modify storage large_number:math sstemp_t1 set from storage large_number:math float_multiply.output

#计算t2，R(z)=t1+t2
data modify storage large_number:math float_multiply.input1 set from storage large_number:math sstemp_s4
function large_number:ln_high_precision/remez/mul_with_const_2
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:ln_high_precision/remez/as_entity_4
function large_number:float_mul.high_precision/start
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:ln_high_precision/remez/as_entity_5
function large_number:float_mul.high_precision/start
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:ln_high_precision/remez/as_entity_6

#ln(x)=kln2+f-ff/2+s(ff/2+R(z))
data modify storage large_number:math float_multiply.input1 set from storage large_number:math sstemp_s
function large_number:float_mul.high_precision/start
data modify storage large_number:math sstempcc set from storage large_number:math float_multiply.output
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:ln_high_precision/as_entity_3
