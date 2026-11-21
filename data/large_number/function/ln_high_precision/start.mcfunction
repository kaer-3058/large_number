##高精度自然对数

#公式：ln(7.45*10^26)=ln(7.45)+26*ln(10)
#ln(7.45)=ln(745/100)=ln(745)-ln(100)
#输入：data modify storage large_number:math ln_high_precision.input set value 8.2184074E307d
#输入值必须为double型

#function large_number:ln_high_precision/start

#此算法参考：https://www.zhihu.com/question/333371020/answer/1686069171

#L1 = 0.6666666666666735130
#L2 = 0.3999999999940941908
#L3 = 0.2857142874366239149
#L4 = 0.2222219843214978396
#L5 = 0.1818357216161805012
#L6 = 0.1531383769920937332
#L7 = 0.1479819860511658591

#对小于1的值取倒数
data modify storage large_number:math store_ln_high_precision_inp set from storage large_number:math ln_high_precision.input
execute store result score #temp_input_is0 large_number.int run data get storage large_number:math store_ln_high_precision_inp
execute if score #temp_input_is0 large_number.int matches 0 run data modify storage large_number:math float_reciprocal.input set from storage large_number:math store_ln_high_precision_inp
execute if score #temp_input_is0 large_number.int matches 0 run function large_number:division/float_reciprocal_8_dici/start
execute if score #temp_input_is0 large_number.int matches 0 run data modify storage large_number:math store_ln_high_precision_inp set from storage large_number:math float_reciprocal.output

#拆出科学记数法的指数位

#判断是否为科学计数法
data modify storage large_number:math temp1 set string storage large_number:math store_ln_high_precision_inp 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX large_number.int run data get storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX large_number.int matches 1 run function large_number:double_sqrt.if/the_scientific_notation

execute store result storage large_number:math high_precision_stemp4 double 2.30258509299404568401799145 run function large_number:ln_high_precision/craft.1 with storage large_number:math

#把输入值分解为(2^k)*(1+f)的形式，其中k为整数，0≤f<1

execute store result score #loga.b.tempinp large_number.int run data get storage large_number:math store_ln_high_precision_inp
scoreboard players set #sstemp2 large_number.int 0
execute if score #loga.b.tempinp large_number.int matches 16777216.. store result score #sstemp2 large_number.int run function large_number:ln_high_precision/if.1
execute if score #loga.b.tempinp large_number.int matches 65536..16777215 store result score #sstemp2 large_number.int run function large_number:ln_high_precision/if.2
execute if score #loga.b.tempinp large_number.int matches 256..65535 store result score #sstemp2 large_number.int run function large_number:ln_high_precision/if.3
execute if score #loga.b.tempinp large_number.int matches ..255 store result score #sstemp2 large_number.int run function large_number:ln_high_precision/if.4
execute store result storage large_number:math sstemp_kln2 double .69314718055994530941723212 run scoreboard players get #sstemp2 large_number.int

#f=x/(2^[log2(x)])-1
data modify storage large_number:math float_division.input1 set from storage large_number:math store_ln_high_precision_inp
function large_number:ln_high_precision/float_div_1/start
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:ln_high_precision/as_entity_1

#中间变量，s=f/(f+2)
data modify storage large_number:math float_division.input1 set from storage large_number:math sstemp_f
function large_number:division/float/start
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
execute store success score #is_XXEXX large_number.int run data get storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX large_number.int matches 1 run function large_number:double_sqrt.if/the_scientific_notation

execute store result score #_exp large_number.int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp large_number.int 1
function large_number:sigmoid/macro4 with storage large_number:math

data modify storage large_number:math temp_ff2 set from storage large_number:math temp2

##雷米兹算法 ln(1+s)-ln(1-s)在s=0处展开的泰勒公式的近似值 R(z)

#雷米兹算法得到的多项式在高精度ln算法里起了最重要的误差修正的作用，理论上误差最小可达2^-58.45。
#此算法使用了大量的高精度浮点乘法，因此此算法的消耗约为查表法的30倍。

data modify storage large_number:math float_multiply.input1 set from storage large_number:math sstemp_s
function large_number:float_base_int_power/fast_mul/to_array
function large_number:float_base_int_power/fast_mul/squ
scoreboard players operation #temp_s_2__1 large_number.int = #double_to_int.1 large_number.int
scoreboard players operation #temp_s_2__2 large_number.int = #double_to_int.5 large_number.int
scoreboard players operation #temp_s_2__3 large_number.int = #double_to_int.9 large_number.int
scoreboard players operation #temp_s_2__4 large_number.int = #double_to_int.13 large_number.int
scoreboard players operation #temp_s_2__exp large_number.int = #double_to_int.expon.1 large_number.int
#L1 = 0. 6666 6666 6666 6735 130
scoreboard players set #float_mul.high_precision.input2.1 large_number.int 6666
scoreboard players set #float_mul.high_precision.input2.2 large_number.int 6666
scoreboard players set #float_mul.high_precision.input2.3 large_number.int 6666
scoreboard players set #float_mul.high_precision.input2.4 large_number.int 6735
scoreboard players set #float_mul.high_precision.input2.expon large_number.int 0
function large_number:float_base_int_power/fast_mul/start
function large_number:float_base_int_power/fast_mul/to_nbt
data modify storage large_number:math temp_item1 set from storage large_number:math q0
scoreboard players operation #double_to_int.1 large_number.int = #temp_s_2__1 large_number.int
scoreboard players operation #double_to_int.5 large_number.int = #temp_s_2__2 large_number.int
scoreboard players operation #double_to_int.9 large_number.int = #temp_s_2__3 large_number.int
scoreboard players operation #double_to_int.13 large_number.int = #temp_s_2__4 large_number.int
scoreboard players operation #double_to_int.expon.1 large_number.int = #temp_s_2__exp large_number.int
function large_number:float_base_int_power/fast_mul/squ
scoreboard players operation #temp_s_4__1 large_number.int = #double_to_int.1 large_number.int
scoreboard players operation #temp_s_4__2 large_number.int = #double_to_int.5 large_number.int
scoreboard players operation #temp_s_4__3 large_number.int = #double_to_int.9 large_number.int
scoreboard players operation #temp_s_4__4 large_number.int = #double_to_int.13 large_number.int
scoreboard players operation #temp_s_4__exp large_number.int = #double_to_int.expon.1 large_number.int
#L2 = 0. 3999 9999 9994 0941 908
scoreboard players set #float_mul.high_precision.input2.1 large_number.int 3999
scoreboard players set #float_mul.high_precision.input2.2 large_number.int 9999
scoreboard players set #float_mul.high_precision.input2.3 large_number.int 9994
scoreboard players set #float_mul.high_precision.input2.4 large_number.int 0941
scoreboard players set #float_mul.high_precision.input2.expon large_number.int 0
function large_number:float_base_int_power/fast_mul/start
function large_number:float_base_int_power/fast_mul/to_nbt
data modify storage large_number:math temp_item2 set from storage large_number:math q0
scoreboard players operation #double_to_int.1 large_number.int = #temp_s_4__1 large_number.int
scoreboard players operation #double_to_int.5 large_number.int = #temp_s_4__2 large_number.int
scoreboard players operation #double_to_int.9 large_number.int = #temp_s_4__3 large_number.int
scoreboard players operation #double_to_int.13 large_number.int = #temp_s_4__4 large_number.int
scoreboard players operation #double_to_int.expon.1 large_number.int = #temp_s_4__exp large_number.int
function large_number:float_base_int_power/fast_mul/squ
#L4 = 0. 2222 2198 4321 4978 396
scoreboard players set #float_mul.high_precision.input2.1 large_number.int 2222
scoreboard players set #float_mul.high_precision.input2.2 large_number.int 2198
scoreboard players set #float_mul.high_precision.input2.3 large_number.int 4321
scoreboard players set #float_mul.high_precision.input2.4 large_number.int 4978
scoreboard players set #float_mul.high_precision.input2.expon large_number.int 0
function large_number:float_base_int_power/fast_mul/start
function large_number:float_base_int_power/fast_mul/to_nbt
data modify storage large_number:math temp_item4 set from storage large_number:math q0
scoreboard players operation #double_to_int.1 large_number.int = #temp_s_2__1 large_number.int
scoreboard players operation #double_to_int.5 large_number.int = #temp_s_2__2 large_number.int
scoreboard players operation #double_to_int.9 large_number.int = #temp_s_2__3 large_number.int
scoreboard players operation #double_to_int.13 large_number.int = #temp_s_2__4 large_number.int
scoreboard players operation #double_to_int.expon.1 large_number.int = #temp_s_2__exp large_number.int
scoreboard players operation #float_mul.high_precision.input2.1 large_number.int = #temp_s_4__1 large_number.int
scoreboard players operation #float_mul.high_precision.input2.2 large_number.int = #temp_s_4__2 large_number.int
scoreboard players operation #float_mul.high_precision.input2.3 large_number.int = #temp_s_4__3 large_number.int
scoreboard players operation #float_mul.high_precision.input2.4 large_number.int = #temp_s_4__4 large_number.int
scoreboard players operation #float_mul.high_precision.input2.expon large_number.int = #temp_s_4__exp large_number.int
function large_number:float_base_int_power/fast_mul/start
scoreboard players operation #temp_s_6__1 large_number.int = #double_to_int.1 large_number.int
scoreboard players operation #temp_s_6__2 large_number.int = #double_to_int.5 large_number.int
scoreboard players operation #temp_s_6__3 large_number.int = #double_to_int.9 large_number.int
scoreboard players operation #temp_s_6__4 large_number.int = #double_to_int.13 large_number.int
scoreboard players operation #temp_s_6__exp large_number.int = #double_to_int.expon.1 large_number.int
#L3 = 0. 2857 1428 7436 6239 149
scoreboard players set #float_mul.high_precision.input2.1 large_number.int 2857
scoreboard players set #float_mul.high_precision.input2.2 large_number.int 1428
scoreboard players set #float_mul.high_precision.input2.3 large_number.int 7436
scoreboard players set #float_mul.high_precision.input2.4 large_number.int 6239
scoreboard players set #float_mul.high_precision.input2.expon large_number.int 0
function large_number:float_base_int_power/fast_mul/start
function large_number:float_base_int_power/fast_mul/to_nbt
data modify storage large_number:math temp_item3 set from storage large_number:math q0
scoreboard players operation #double_to_int.1 large_number.int = #temp_s_6__1 large_number.int
scoreboard players operation #double_to_int.5 large_number.int = #temp_s_6__2 large_number.int
scoreboard players operation #double_to_int.9 large_number.int = #temp_s_6__3 large_number.int
scoreboard players operation #double_to_int.13 large_number.int = #temp_s_6__4 large_number.int
scoreboard players operation #double_to_int.expon.1 large_number.int = #temp_s_6__exp large_number.int
scoreboard players operation #float_mul.high_precision.input2.1 large_number.int = #temp_s_4__1 large_number.int
scoreboard players operation #float_mul.high_precision.input2.2 large_number.int = #temp_s_4__2 large_number.int
scoreboard players operation #float_mul.high_precision.input2.3 large_number.int = #temp_s_4__3 large_number.int
scoreboard players operation #float_mul.high_precision.input2.4 large_number.int = #temp_s_4__4 large_number.int
scoreboard players operation #float_mul.high_precision.input2.expon large_number.int = #temp_s_4__exp large_number.int
function large_number:float_base_int_power/fast_mul/start
scoreboard players operation #temp_s_10__1 large_number.int = #double_to_int.1 large_number.int
scoreboard players operation #temp_s_10__2 large_number.int = #double_to_int.5 large_number.int
scoreboard players operation #temp_s_10__3 large_number.int = #double_to_int.9 large_number.int
scoreboard players operation #temp_s_10__4 large_number.int = #double_to_int.13 large_number.int
scoreboard players operation #temp_s_10__exp large_number.int = #double_to_int.expon.1 large_number.int
#L5 = 0. 1818 3572 1616 1805 012
scoreboard players set #float_mul.high_precision.input2.1 large_number.int 1818
scoreboard players set #float_mul.high_precision.input2.2 large_number.int 3572
scoreboard players set #float_mul.high_precision.input2.3 large_number.int 1616
scoreboard players set #float_mul.high_precision.input2.4 large_number.int 1805
scoreboard players set #float_mul.high_precision.input2.expon large_number.int 0
function large_number:float_base_int_power/fast_mul/start
function large_number:float_base_int_power/fast_mul/to_nbt
data modify storage large_number:math temp_item5 set from storage large_number:math q0
scoreboard players operation #double_to_int.1 large_number.int = #temp_s_10__1 large_number.int
scoreboard players operation #double_to_int.5 large_number.int = #temp_s_10__2 large_number.int
scoreboard players operation #double_to_int.9 large_number.int = #temp_s_10__3 large_number.int
scoreboard players operation #double_to_int.13 large_number.int = #temp_s_10__4 large_number.int
scoreboard players operation #double_to_int.expon.1 large_number.int = #temp_s_10__exp large_number.int
scoreboard players operation #float_mul.high_precision.input2.1 large_number.int = #temp_s_2__1 large_number.int
scoreboard players operation #float_mul.high_precision.input2.2 large_number.int = #temp_s_2__2 large_number.int
scoreboard players operation #float_mul.high_precision.input2.3 large_number.int = #temp_s_2__3 large_number.int
scoreboard players operation #float_mul.high_precision.input2.4 large_number.int = #temp_s_2__4 large_number.int
scoreboard players operation #float_mul.high_precision.input2.expon large_number.int = #temp_s_2__exp large_number.int
function large_number:float_base_int_power/fast_mul/start
#L6 = 0. 1531 3837 6992 0937 332
scoreboard players set #float_mul.high_precision.input2.1 large_number.int 1531
scoreboard players set #float_mul.high_precision.input2.2 large_number.int 3837
scoreboard players set #float_mul.high_precision.input2.3 large_number.int 6992
scoreboard players set #float_mul.high_precision.input2.4 large_number.int 0937
scoreboard players set #float_mul.high_precision.input2.expon large_number.int 0
function large_number:float_base_int_power/fast_mul/start
function large_number:float_base_int_power/fast_mul/to_nbt
data modify storage large_number:math temp_item6 set from storage large_number:math q0
scoreboard players operation #double_to_int.1 large_number.int = #temp_s_10__1 large_number.int
scoreboard players operation #double_to_int.5 large_number.int = #temp_s_10__2 large_number.int
scoreboard players operation #double_to_int.9 large_number.int = #temp_s_10__3 large_number.int
scoreboard players operation #double_to_int.13 large_number.int = #temp_s_10__4 large_number.int
scoreboard players operation #double_to_int.expon.1 large_number.int = #temp_s_10__exp large_number.int
scoreboard players operation #float_mul.high_precision.input2.1 large_number.int = #temp_s_4__1 large_number.int
scoreboard players operation #float_mul.high_precision.input2.2 large_number.int = #temp_s_4__2 large_number.int
scoreboard players operation #float_mul.high_precision.input2.3 large_number.int = #temp_s_4__3 large_number.int
scoreboard players operation #float_mul.high_precision.input2.4 large_number.int = #temp_s_4__4 large_number.int
scoreboard players operation #float_mul.high_precision.input2.expon large_number.int = #temp_s_4__exp large_number.int
function large_number:float_base_int_power/fast_mul/start
#L7 = 0. 1479 8198 6051 1658 591
scoreboard players set #float_mul.high_precision.input2.1 large_number.int 1479
scoreboard players set #float_mul.high_precision.input2.2 large_number.int 8198
scoreboard players set #float_mul.high_precision.input2.3 large_number.int 6051
scoreboard players set #float_mul.high_precision.input2.4 large_number.int 1658
scoreboard players set #float_mul.high_precision.input2.expon large_number.int 0
function large_number:float_base_int_power/fast_mul/start
function large_number:float_base_int_power/fast_mul/to_nbt
data modify storage large_number:math temp_item7 set from storage large_number:math q0

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:ln_high_precision/remez/as_entity_1

#ln(x)=kln2+f-ff/2+s(ff/2+R(z))
data modify storage large_number:math float_multiply.input1 set from storage large_number:math sstemp_s
function large_number:float_mul.high_precision/start
data modify storage large_number:math sstempcc set from storage large_number:math float_multiply.output
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:ln_high_precision/as_entity_3

execute if score #temp_input_is0 large_number.int matches 0 run function large_number:ln_high_precision/macro7 with storage large_number:math ln_high_precision
