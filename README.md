![](https://s21.ax1x.com/2024/09/13/pAnhYrt.jpg)

　

## 卡儿的数学库 v.1.17

- [English](README_English.md)

- [简体中文](README.md)

对应MC版本1.21.3

相关概念：万进制数组、分段存储、浮点型、double型、前导0、绝对值、常数、精度、科学记数法

如果万进制数组中的元素不足四位，则读数时应向前补0补足四位

本数据包里的世界实体、展示实体、临时实体等都在主世界

存档文件夹下<u>data</u>文件夹里的<u>command_storage_large_number.dat</u>文件便是本数据包产生的所有storage数据存储的位置。

推荐设置：`gamerule maxCommandChainLength 2147483647`，`gamerule maxCommandForkCount 2147483647`

　

#### 本数据包唯一标识符

```
storage large_number:const version
当前内容是："large_number v.1.17"

协议版本：#k.la.version const
当前为：1017
```

　

#### 常数

```
圆周率 π：storage large_number:const "π"
自然常数 e：storage large_number:const "e"
欧拉常数 γ：storage large_number:const "γ"
黄金比例 φ：storage large_number:const "φ"
非数 NaN：storage large_number:math buffer_NaN
```

　

#### 需要用户自行载入的表格

单个存档只需载入一次

```
e^x的前置库(指数算法的基础)：
载入：function large_number:exp_e.x/database
卸载：data remove storage large_number:exp database

ln的初始数据库：
载入：function large_number:ln/ln_database
卸载：function large_number:ln/uninstall_ln_database

高精度三角函数的数据库：
载入：function large_number:math_trifs/sin_cos_high_precision/database
卸载：function large_number:math_trifs/sin_cos_high_precision/uninstall_databse
```

　

#### [三角函数] 六个基本三角函数

```
输入[float]：entity b09e-44-fded-6-efa5ffffef64 Rotation[0]
计算：function large_number:math_trifs/_of_entity

输出：#sin int，#cos int，#tan int，#cot int，#sec int，#csc int
```

　

#### [三角函数] 正弦与余弦

```
输入[float]：entity b09e-44-fded-6-efa5ffffef64 Rotation[0]

计算：execute as b09e-44-fded-6-efa5ffffef64 rotated as @s rotated ~ 0.0 positioned .0 .0 .0 run tp @s ^1.0 ^ ^ ~ ~

sin：entity b09e-44-fded-6-efa5ffffef64 Pos[2]

cos：entity b09e-44-fded-6-efa5ffffef64 Pos[0]
```

　

#### [三角函数] 反正弦与反余弦

反正弦：large_number:math_trifs/arcsin

反余弦：large_number:math_trifs/arccos

公式：`arcsin(x)=atan2(x,√(1-x²))`，`arccos(x)=atan2(√(1-x²),x)`

```
输入：#arcsin_cos.input int
放大一万倍输入，输入范围：[-10000,10000]

输出 (角度，放大一万倍)：#arcsin_cos.output int
```

　

#### [三角函数] 反正切

公式：`arctan(x)=atan2(x,1)`

```
输入[浮点数]：storage large_number:math arctan.input
输入可以是double或float，输出的是float

计算：execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:math_trifs/arctan/start with storage large_number:math arctan

输出 (角度)：storage large_number:math arctan.output
```

　

#### [三角函数] 双参数反正切 (atan2d)

公式：atan2d(y,x)

1.数据来自记分板：`execute as b09e-44-fded-6-efa5ffffef64 run function large_number:math_trifs/atan2`

```
输入：#y int，#x int
输出 (角度，放大一万倍)：#atan2d int
```

2.数据来自nbt：`execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:math_trifs/atan2_double/start with storage large_number:math atan2_double`

```
输入[浮点数]：
y：storage large_number:math atan2_double.y
x：storage large_number:math atan2_double.x
输入可以是double或float，输出的是float

输出 (角度)：storage large_number:math atan2_double.output
```

　

#### [三角函数] 高精度正弦与余弦

查表+三角函数和角公式，因此正弦和余弦是一起计算的

```
输入[float，角度制]：storage large_number:math sin_cos_high_precision.input 0.0f
输入范围：[-16777216, 16777216]

输出
正弦：storage large_number:math sin_cos_high_precision.sin
余弦：storage large_number:math sin_cos_high_precision.cos
```

　

#### [整数四则] 整数除法

4位有效数字：large_number:division/int_4decimal/start

8位有效数字：large_number:division/int_8decimal/start

12位有效数字：large_number:division/int_12decimal/start

作为浮点除法的推广，虽然可接受全int，但实际上只取被除数和除数的前八位

```
被除数：#int_+decimal.input1 int
除数：#int_+decimal.input2 int

商：storage large_number:math int_more_decimal_out
```

　

#### [整数四则] 对整数进行任意倍乘

```
输入整数：storage large_number:math int_mul_by_n.input_int
输入的"整数"可以为非整数，但会按照整数来处理，向下取整并把范围钳制在整型范围内

输入倍率：storage large_number:math int_mul_by_n.input_n
输入的"倍率"可以为任何数值，但计算时会忽略数据单位并转化为double型

要输出的数据类型：storage large_number:math int_mul_by_n.data_type "double"
可选的数据类型："byte"、"float"、"double"、"short"、"int"、"long"

计算：function large_number:int_mul_by_n/start

输出：storage large_number:math int_mul_by_n.output
```

　

#### [数组四则] 整型数字拆分为数组

```
输入：input int
计算：function large_number:cut_math_to_list

输出：#sign int (符号)，#1st int，#2nd int，#3rd int
```

　

#### [数组四则] 任意整型数字相乘

1.数组相乘法：large_number:int_int_multiply

```
因数1：input int
因数2：input.2 int
积[万进制数组]：storage large_number:math int_int_multiply.output
```

2.函数宏乘法：large_number:int_mul2/start

```
因数1：#input1 int
因数2：#input2 int
积[long型]：storage large_number:math int_mult2_out
```

　

#### [数组四则] 任意整型数字平方

```
输入：input int
计算：function large_number:int_square

输出：storage large_number:math int_squ
```

　

#### [数组四则] 大数加法

```
加数1：storage large_number:math addition.input1 [I;0,0,0]
加数2：storage large_number:math addition.input2 [I;0,0,0]
计算：function large_number:addition/start

和：storage large_number:math addition.output
```

　

#### [数组四则] 大数减法

```
被减数：storage large_number:math subtraction.input1 [I;0,0,0,0]
减数：storage large_number:math subtraction.input2 [I;0,0,0,0]
计算：function large_number:subtraction/start

差：storage large_number:math subtraction.output
```

　

#### [数组四则] 12位数字相乘

```
因数1：storage large_number:math 1we_multiply.input1 [I;0,0,0]
因数2：storage large_number:math 1we_multiply.input2 [I;0,0,0]
计算：function large_number:1we_multiply

积：storage large_number:math 1we_multiply.output
```

　

#### [数组四则] 12位数字平方

```
输入：storage large_number:math 1we_squ.input [I;0,0,0]
计算：function large_number:1we_square

输出：storage large_number:math 1we_squ.output
```

　

#### [数组四则] 无穷位数字相乘

```
因数1：storage large_number:math Infinite_digit_multiply.input1 [I;0,0]
因数2：storage large_number:math Infinite_digit_multiply.input2 [I;0,0]
输入格式：因数必须为万进制int数组，且数组元素全都是非负数。因数的数组可以含有很多个数。

计算：function large_number:infinite_digit_multiply/start

输出：storage large_number:math Infinite_digit_multiply.output
```

　

#### [数组四则] 展示实体法大数除法

仅处理正数，此算法可以一次性算三个被除数

```
被除数
storage large_number:math display_div_large.input.dividend1 [I;0,0,0]
storage large_number:math display_div_large.input.dividend2 [I;0,0,0]
storage large_number:math display_div_large.input.dividend3 [I;0,0,0]

除数
storage large_number:math display_div_large.input.divisor [I;0,0,0]

计算
function large_number:division/display_large_number/start

输出
entity 28529-0-3d00-0-2c4200ee8401 transformation.scale
```

　

#### [数组四则] 数组除以一~六位整数 (保留四位小数)

竖式除法，16条命令。

```
被除数：storage large_number:math list_div_const.dividend [I;0,0,0]
输入格式：被除数必须是万进制int数组，且数组元素都是非负数。被除数数组支持输入1~3个数。

除数：#list_div_const_divisor int
除数的允许输入范围：[1,214748]。

计算：function large_number:division/list_div_const

商：storage large_number:math list_div_const.output
输出的数组的第四个数是小数
```

　

#### [数组四则] 数组除以八位整数 (多位有效数字)

被除数必须为的万进制int数组，被除数的数组元素和除数必须全都是正数。被除数数组支持输入1~3个数。

分段除法，(a+b+c)/m = a/m+b/m+c/m

无迭代，无试除，无递归，命令数固定

目前无迭代大数除法理论上可以实现除数为任意多位，但除数的输入还是个难题，如能实现超过八位的除数输入即可解决大数除法

```
被除数：storage large_number:math list_div_int.list [I;0,0,0]
除数[int]：storage large_number:math list_div_int.int

计算：function large_number:division/list_div_int/start

商[double]：storage large_number:math list_div_int.output
```

　

♦ 展示实体法浮点数除法

注：由于矩阵SVD，若输入值都是正数则输出的是必为正数，若输入值是负数则输出值不一定为正或负

```
输入   列表里第1、6、11个是被除数，最后一个数是除数
entity 28529-0-3d00-0-2c4200ee8401 transformation [1.0f,0.0f,0.0f,0.0f,0.0f,1.0f,0.0f,0.0f,0.0f,0.0f,1.0f,0.0f,0.0f,0.0f,0.0f,1.0f]

输出
entity 28529-0-3d00-0-2c4200ee8401 transformation.scale
```

　

♦ 浮点除法 - 数据来自记分板

1. 八位有效数字：large_number:division/hpo/_div

  这是目前所有的非迭代法的高精度除法的核心，算法著作人：小豆 https://github.com/xiaodou8593

```
设置被除数
#float_sign int (符号，可选：-1，0，1，分别表示负号，0，正号)
#float_int0 int (输入值的前八位有效数字。取值为10000000~99999999或0)
#float_exp int (指数，范围是全int)

设置除数
#Divisor_float_sign int (符号，可选：-1，0，1，分别表示负号，0，正号)
#Divisor_float_int0 int (输入值的前八位有效数字。取值为10000000~99999999或0)
#Divisor_float_exp int (指数，范围是全int)

示例：
set #float_sign int 1
set #float_int0 int 44553375
set #float_exp int 23
则表示的数为: 1*0.44553375*10^23

以改变被除数的方式输出
```

2. 12位有效数字：large_number:division/multi_times_modulo

```
被除数
#float_sign int (符号，可选：-1，0，1，分别表示负号，0，正号)
#float_int0 int (输入值的前八位有效数字。取值为10000000~99999999或0)
#float_exp int (指数，范围是全int)

除数
#Divisor_float_sign int (符号，可选：-1，0，1，分别表示负号，0，正号)
#Divisor_float_int0 int (输入值的前八位有效数字。取值为10000000~99999999或0)
#Divisor_float_exp int (指数，范围是全int)

商：
#float_sign int (符号)
#float_int0 int(前八位) + #float_int1 int(九~十二位)
#float_exp int (指数)

若#float_int1 int的分数不足四位数，则读数时应在数的前面补0补足四位
```

♦ 浮点除法 - 数据来自nbt

8位有效数字：large_number:division/float/start

12位有效数字：large_number:division/float_12decimal/start

皆可输入float或double型

```
被除数[浮点数]：storage large_number:math float_division.input1
除数[浮点数]：storage large_number:math float_division.input2
商：storage large_number:math float_division.output
```



♦ 无穷多位有效数字的浮点除法：large_number:division/loop_more_more_decimal/start

```
被除数
#float_sign int (符号，可选：-1，0，1，分别表示负号，0，正号)
#float_int0 int (输入值的前八位有效数字。取值为10000000~99999999或0)
#float_exp int (指数，范围是全int)

除数
#Divisor_float_sign int (符号，可选：-1，0，1，分别表示负号，0，正号)
#Divisor_float_int0 int (输入值的前八位有效数字。取值为10000000~99999999或0)
#Divisor_float_exp int (指数，范围是全int)

有效数字的位数：#loop_more_more_decimal_times int

商：
#float_sign int (符号)
storage large_number:math loop_more_more_decimal_base (底数)
#float_exp int (指数)

输出的底数是个列表，读数方式是把每个元素从前往后写出来，在最前面加上0.
比如我得到的#float_sign int的值是1，#float_exp int的值是12，底数是[0,0,1,9,0,3,7,0]
则它们表示的数字就是1*0.00190370*10^12
```

♦ 对浮点数取倒数

8位小数：large_number:division/float_reciprocal_8_dici/start

12位小数：large_number:division/float_reciprocal/start

可输入float或double型

```
输入[浮点数]：storage large_number:math float_reciprocal.input
输出：storage large_number:math float_reciprocal.output
```



♦ 迭代法无穷位大数除法

计算完成会有提示

1. 递归相减法：large_number:division/large_division/start

```
被除数：storage large_number:math large_division.input1 [0,0]
除数：storage large_number:math large_division.input2 [0,0]
输入格式：被除数和除数必须都是万进制int数组，且数组元素都是非负数，被除数的位数不能多于除数，需用户自行检查除数是否为0，被除数不能带有前导0。被除数和除数的数组可以含很多个数。

商的位数[int]：storage large_number:math large_division.times

去掉商的后缀0：storage large_number:math large_division.del_zeros set value 1
不想去掉就设为其他值

商：storage large_number:math large_division.output
输出的数组的每一个数代表一位。数组第一个数是商的整数部分，第二个数是十分位，第三个数是百分位……以此类推。
例如输出了[0,0,3,1,0,2,7,5,0]，则表示：0.03102750
```

2. 无穷位数组整除一~六位整数：large_number:division/large_list_div_const/start

```
被除数：storage large_number:math large_list_div_const.dividend [0,0]
输入格式：被除数必须是万进制int数组，且数组元素都是非负数。被除数数组支持输入很多个数。

除数：#large_list_div_const.divisor int
除数的允许输入范围：[1,214748]。

商：storage large_number:math large_list_div_const.output
```



♦ 浮点乘法

算法1：large_number:float_multiply/start

原理：execute store + data get，可实现用倍率存储整数，用函数宏导入动态倍率

算法2 (性能最好的浮点乘法)：large_number:float_multiply/of_score/start

原理：浮点转化为记分板格式后取前八位进行大数乘法

```
因数1[浮点数]：storage large_number:math float_multiply.input1
因数2[浮点数]：storage large_number:math float_multiply.input2
可以为float或double型

积：storage large_number:math float_multiply.output
```

♦ 高精度浮点乘法：large_number:float_mul.high_precision/start

原理：采用了全新架构，用double转int数组的算法把输入值全都转化成数组然后进行大数乘法，再根据读出来的输入值的信息计算指数

可精确到双精度浮点数级

```
因数1[浮点数]：storage large_number:math float_multiply.input1
因数2[浮点数]：storage large_number:math float_multiply.input2
可以为float或double型

积：storage large_number:math float_multiply.output
```

♦ 高精度浮点数平方：large_number:float_mul.high_precision/squ/start

```
输入[浮点数]：storage large_number:math float_multiply.input1
可以为float或double型

输出：storage large_number:math float_multiply.output
```

♦ 高精度浮点数立方：large_number:float_mul.high_precision/cube/start

```
输入[浮点数]：storage large_number:math float_multiply.input1
可以为float或double型

输出：storage large_number:math float_multiply.output
```

　

♦ 浮点加减法

1. 实体坐标法：large_number:float_add_subtra/start

输入可以是float或double型，但是输出的一定是double型

原理：loot spawn无坐标上下限，故此算法可以计算全浮点数的加减法。

2. 记分板算法：large_number:float_add_subtra/new/start

```
输入[浮点数]：
storage large_number:math float_add_subtra.input1
storage large_number:math float_add_subtra.input2

计算模式：set #float_add_subtra_ope_mode int
1为加法，2为减法
若是加法，则为两数相加，若为减法，则是input1减input2

输出：storage large_number:math float_add_subtra.output
```

　

♦ 浮点数比大小：large_number:float_comparison_sizes/start

把输入值代入浮点减法，判断输出值的符号

```
输入[浮点数]：
storage large_number:math float_comparison_sizes.A
storage large_number:math float_comparison_sizes.B

输出比较结果：storage large_number:math float_comparison_sizes.output
"A"比较"B"，"+"为更大，"-"为更小，"="为相等
```

♦ 对浮点数取整：large_number:round_double/start

execute align+实体tp只能处理区间 (-30000000.0, 30000000.0) 的数，而此算法采用了函数宏+字符串递归找小数点的方法，可以处理全部浮点数

```
输入[浮点数]：storage large_number:math round_double.input
可以是float或double

向0取整：set #round_towards_zero int 1
此值不为1就是向下取整，默认是向下取整

输出：storage large_number:math round_double.output
```

♦ 对浮点数进行10进制位移：large_number:double_displacement/decimal.start

```
输入[浮点数]：storage large_number:math double_displacement.input
可以是double或float

位移的次数：storage large_number:math double_displacement.shift 2
可以是任意整数

输出：storage large_number:math double_displacement.output
```

　

♦ 整型数字开方

取整 (16条纯记分板命令)：large_number:int_sqrt_simple

保留四位小数 - 估值法 (32条纯记分板命令)：large_number:int_sqrt

保留四位小数 - 牛顿法 (31条纯记分板命令)：large_number:int_sqrt_newton

保留多位小数：large_number:test_int_more_decimal

开1\~5位，保留9位；开6\~7位，保留8位；开8~10位，保留7位

有时求得的最后一位小数会有稍许的精度损失

如果保留小数位数不足期望的位数，则读数时应在数的前面补0补足数位

目前开方算法的核心：https://github.com/Triton365/fast_integer_sqrt/blob/main/functions/isqrt_nofunction.mcfunction

```
输入：input.sqrt int

取整输出：output.sqrt int
保留四位小数输出(放大一万倍)：output.sqrt int

保留多位小数的输出：
整数部分：output.sqrt int
小数部分：output.decimal int
```

♦ 整型数字开方 - 连分数迭代法：large_number:sqrt_continued_fraction/start

精确度可达14位小数。

连分数迭代法的小数部分是以分数形式输出的。

内置溢出检查，可在分子/分母其中一个溢出前自动停下。

例如在计算√10时，迭代50次和11次的输出是一样的。

因分子分母都是以单段计分板存储，所以实际可允许的迭代次数不超过32次。

使用前建议了解一下什么是连分数。

连分数开根号公式：

$$
\sqrt{x}\ =\cfrac{x-\left\lfloor\sqrt{x}\right\rfloor^2}{2\left\lfloor\sqrt{x}\right\rfloor+\cfrac{x-\left\lfloor\sqrt{x}\right\rfloor^2}{2\left\lfloor\sqrt{x}\right\rfloor+\cfrac{x-\left\lfloor\sqrt{x}\right\rfloor^2}{2\left\lfloor\sqrt{x}\right\rfloor+...}}}+\left\lfloor\sqrt{x}\right\rfloor
$$

此为无限连分数，算的层数越多越接近。

```
被开方数：#conti_frac.sqrt.input int
迭代次数：#conti_frac.sqrt.loops int
约分：set #conti_frac.sqrt.reduction_fraction int 1
显示连分数表达式：set #conti_frac.sqrt.tellraw int 1

输出：
整数部分：#conti_frac.sqrt.inte int

小数部分：
分子：#conti_frac.sqrt.A int
分母：#conti_frac.sqrt.N int

连分数表达式：storage large_number:math conti_frac_sqrt_expression
```

♦ 10~16位数字开方

原理：高精度猜测法。只对前八位数开方算结果的前四位。结果的后面几位用估小数的算法来算

取整：large_number:large_sqrt_digit16

估值法取小数：large_number:large_sqrt_digit16_with_decimal

竖式法取小数：large_number:large_sqrt_digit16_vertical_method

```
输入：storage large_number:math large_sqrt_digit16.input [I;0,0,0,0]

高精度模式：set #large_sqrt16.test16 int 1

输出：
整数部分：storage large_number:math large_sqrt_digit16.output
小数部分：storage large_number:math large_sqrt_digit16.output_decimal
整数和小数两部分合并：storage large_number:math large_sqrt_digit16.output_with_decimal
```

高精度模式是16位整数开方算法的特性，为了追求高效率选用了高精度猜测法，代价是最后一位会有稍许的精度损失。仅在处理16位数的时候会有这种特性。

高精度模式就是通过平方根自我平方对比原数来验证大小，自己决定要不要开。估值法取小数默认开启高精度模式。

而竖式法取小数是采取无精度波动的竖式开方法，但只能取出四位小数

♦ 1~24位数字开方 (取整)：large_number:large_sqrt

原理：牛顿迭代+竖式开方

```
输入：storage large_number:math large_sqrt.input [I;0,0,0,0,0,0]
输出：storage large_number:math large_sqrt.output
```

为了避免浪费算力，请按照如下优先级使用：整型范围内选整型数字开方，10~16位数字选16位数字开方，最后再考虑24位数字开方。

　

♦ 整型数字求立方根

原理：立方根估值算法。取一个常数x，n是x的立方根整数部分，z是立方根小数部分，则 (x-n\^3)/(3n^2 +3n+1)≈z。整数部分是二分法。

取整：large_number:cube_root/floor

保留四位小数：large_number:cube_root/4decimal

```
输入：#cbrt.input int
输出：#cbrt.output int
若保留四位小数则放大一万倍输出
```

♦ 对double开立方根：large_number:cube_root_double/start

```
输入[double]：storage large_number:math cube_root.input
输出：storage large_number:math cube_root.output
```

　

♦ double的欧氏范数

输入的数据类型必须为double型，只接受正值

1.二维范数

三角函数法：`execute as b09e-44-fded-6-efa5ffffef64 run function large_number:double_norm/trif_2d`

公式：`√(x²+y²)=x/cos(atan2(y,x))`

单位向量法：`execute as b09e-44-fded-6-efa5ffffef64 run function large_number:double_norm/unit_vector_2d`

```
输入[double]：
storage large_number:math double_norm_2d.x
storage large_number:math double_norm_2d.y

输出：storage large_number:math double_norm_2d.output
```

2.三维范数

三角函数法：`execute as b09e-44-fded-6-efa5ffffef64 run function large_number:double_norm/trif_3d`

公式：`√(x²+y²+z²)=λ/cos(atan2(z,λ))`，其中λ是关于x和y的二维范数

单位向量法：`execute as b09e-44-fded-6-efa5ffffef64 run function large_number:double_norm/unit_vector_3d`

```
输入[double]：
storage large_number:math double_norm_3d.x
storage large_number:math double_norm_3d.y
storage large_number:math double_norm_3d.z

输出：storage large_number:math double_norm_3d.output
```

　

♦ double转int - 数组格式，精度为16位有效数字：large_number:double_to_int

对float型数值也有效

```
输入[浮点数]：storage large_number:math double_to_int.input
输出：storage large_number:math double_to_int.output
```

参数介绍：`math` 是尾数，16位int万进制数组。`sign` 是符号，byte型，取整为1或-1。`expon` 是指数，short型。

读数方法：以S*0.AEB形式读数，S是符号，A是尾数，B是指数。

示例：`{sign:1b, math:[I;1623,13,3007,6000], expon:2s}` 表示的数为`1*0.1623001330076000*10^2`，也就是`16.23001330076`。

　

♦ 附：SNBT的浮点数规律

对于每一个数字，必定存在符号和数值。对于MC里的浮点数，指数、小数点位置和前导0数量这三个信息并不会同时变动，若其中一个变了，其他两个参数一定是固定值。也就是说，对于转化后的数字信息：

- 如果指数不为0，则小数点位置必定为2(在第一个数后面)，前导0必定是0个。
- SNBT的浮点数整数部分达到8位或小数的前导0数量多于3个就会以科学记数法形式显示。

- 如果小数点位置不为2，则指数必定为0，前导0必定是0个。

- 如果前导0数量为1到3个(MC浮点数最多存在三个前导0)，则小数点位置必定为2，指数必定为0。

此外，SNBT的浮点数也可以以科学记数法的形式输入，比如1.2E3d，以科学记数法形式输入时必须带数据单位。

double上下限的精确值是±1.797693134862315807E308

double的绝对值最小值是4.9E-324

　

♦ double转int - 记分板格式，精度为8位有效数字

宏命令取数法：large_number:float_nbt_to_score

四叉树取数法：large_number:float_nbt_to_score/start

```
输入[浮点数]：storage large_number:math float_nbt_to_score_input

输出：
符号：#float_sign int
尾数：#float_int0 int
指数：#float_exp int

示例：
#float_sign int 1
#float_int0 int 44553375
#float_exp int 23
则表示的数为: 1*0.44553375*10^23

转换后的尾数始终是八位
```

　

♦ double型开方 (高精度浮点数开方)

对float型数值也有效

8\~9位有效数字：large_number:double_sqrt

12\~14位有效数字：large_number:double_sqrt_more_decimal

用24位数组开根法取出了double开根号的12位有效数字

"8\~9位有效数字"的命令数约为180，"12\~14位有效数字"的命令数约为1430，后者的消耗约为前者的8倍。

```
输入：[浮点数]storage large_number:math double_sqrt.input
输出：storage large_number:math double_sqrt.output
```

　

♦ 快速浮点数开方：large_number:new_double_ope/double_sqrt

新架构牺牲了一点精度，采用了性能更佳的算法

基础59条命令，如果输入的是科学记数法则加12条，如果选择精度增加四位则加9条，最多80条命令

原理：使用放大倍率存储法来获取double的底数，使用字符串取数法来获取指数。用整型开方法算结果后根据指数来调整输出。

```
输入[浮点数]：storage large_number:math double_sqrt.input
可输入double型/float型
精度增加四位：set #New_double_sqrt.decimal_add int 1

输出：storage large_number:math double_sqrt.output
```

　

♦ 数位显示(千位分隔)

int数位显示：large_number:digital_display/digital_display_int

```
输入：#digital_display_int.input int

显示以下JSON文本便可显示数字：
{"nbt":"digital_display_int[]","storage":"large_number:math","separator":","}
```

　

♦ 单位向量法测距

1.输入任意两点：large_number:unit_vector_for_distance

```
输入
P1： storage large_number:math unit_vector2.P1 [0.0,0.0,0.0]
P2：storage large_number:math unit_vector2.P2 [0.0,0.0,0.0]
运行：as b09e-44-fded-6-efa5ffffef64 run func...
输出(已放大10倍)：#distance int
```

2.输入两点坐标差的绝对值：large_number:unit_vector_for_distance_modu

```
输入：storage large_number:math unit_vector_modu.input [0.0,0.0,0.0]
执行：as b09e-44-fded-6-efa5ffffef64 run func...
输出 (已放大10倍)：#distance int
```

♦ 三角函数法快速测距：large_number:fast_distance_trigonometry/start

算法来源：https://github.com/SuperSwordTW/Distance-Trig-Calc-3d

```
初始信息表
载入：function large_number:fast_distance_trigonometry/load
清空：data remove storage large_number:const fdtri_sin

输入(放大1000倍)：#dx int，#dy int，#dz int
'dy'和'dz'都必须是正数

输出 (放大1000倍)：#distance int
```

　

♦ 列表算法 - 洗牌：large_number:list_operation/shuffle/start

随机打乱列表顺序

```
输入：storage large_number:math list_ope_shuffle.input []
输出：storage large_number:math list_ope_shuffle.output

清理列表算法产生的临时marker：
kill @e[type=minecraft:marker,tag=large_number.list_operation]
```

♦ 列表算法 - 抽牌：large_number:list_operation/random_index_once/start

从列表中随机抽取一个元素

列表长度不可超过2147483583

```
输入：storage large_number:math list_ope_random_index_once.input []
把抽到的项从原列表移除：set #list_ope_random_index_once.del int 1

输出：storage large_number:math list_ope_random_index_once.output
```

♦ 列表算法 - 元素去重 (暴力搜索)：large_number:list_operation/deduplicate/start

```
输入：storage large_number:math list_dedup.input []
输出：storage large_number:math list_dedup.output
```

♦ 列表算法 - 数值排序

整数排序 - 冒泡排序法 - 正序：large_number:list_operation/sort/int_ascending_order/start

整数排序 - 冒泡排序法 - 逆序：large_number:list_operation/sort/int_descending_order/start

double排序 - 冒泡排序法 - 正序：large_number:list_operation/sort/double_ascending_order/start

double排序 - 冒泡排序法 - 逆序：large_number:list_operation/sort/double_descending_order/start

```
整数排序
输入：storage large_number:math sort_int.input
输出：storage large_number:math sort_int.output

double排序
输入：storage large_number:math sort_double.input
输出：storage large_number:math sort_double.output
```

♦ 列表算法 - 字符串排序

基础字符串排序 - 字典序 - 冒泡排序法 - 正序：large_number:list_operation/sort/string_dictionary_order_basic/start

排序方法：仅检查字符串第一个字符。从前往后依次是：0~9、a~z、A~Z、其他字符、空串。

```
字符顺序表：function large_number:list_operation/sort/string_dictionary_order_basic/datapack

输入：storage large_number:math string_dictionary_order_basic.input
输出：storage large_number:math string_dictionary_order_basic.output
```

♦ 列表算法 - 平均数：large_number:list_operation/average_number/start

```
输入：storage large_number:math average_number.input
输出：storage large_number:math average_number.output
```

♦ 列表算法 - 总和：large_number:list_operation/sum/start

```
输入：storage large_number:math list_sum.input
输出：storage large_number:math list_sum.output
```

　

♦ UUID数组转为带连字符的16进制：large_number:uuid_list_for_hyphen/start

例如：[I; 30583058, 20172024, 31415926, -3059] 转为 "01d2a912-0133-ccf8-01df-5e76fffff40d"

```
输入：storage large_number:math uuid_list_for_hyphen.input [I;0,0,0,0]
输出：storage large_number:math uuid_list_for_hyphen.output
```

♦ 带连字符的16进制UUID转为数组：large_number:uuid_list_for_hyphen/back

例如："00000035-ffff-f910-0000-00fffffffffd" 转为：[I; 53, -1776, 255, -3]

必须输入完整的32位UUID，每一段前面的0不能省

16进制UUID一共有32位，每一段的字符数固定为 8,4,4,4,12

```
输入：storage large_number:math uuid_hyphen_back_list.input ""
输出：storage large_number:math uuid_hyphen_back_list.output
```

　

♦ 离散随机数 - 二项分布

测试1：large_number:random/binomial_distribution/test1

测试内容：若输入值里包含2的幂，则有50%概率减去2的幂，从2^30到2^0测试31次，返回测试后的输入值

```
输入(只接受正值)：#binomial_distribution.test1.input int
输出：#binomial_distribution.test1.output int
```

测试2：large_number:random/binomial_distribution/test2

测试内容：做n次成功概率为p的伯努利试验，输出成功次数

```
试验次数[int]：storage large_number:math binomial_distribution.n
成功概率[float]：storage large_number:math binomial_distribution.p

输出[int]：storage large_number:math binomial_distribution.output
```

当n足够大时，结果接近于正态分布。当n越大（至少20）且p不接近0或1时近似效果更好。不同的经验法则可以用来决定n是否足够大,以及p是否距离0或1足够远,其中一个常用的规则是np和n(1 −p)都必须大于 5。

♦ 离散随机数 - 正态分布：large_number:random/normal_distribution/test1/start

测试内容：输入上限值n，先生成一个int32的随机数，然后不断判断正负并x2，如果x2次数达到32次就再生成一个随机数继续这个操作，直到判断次数达到n次。然后把判断正负的结果(0或1)加起来，结果就趋近于0到n的正态分布。

```
上限值：#normal_distribution.input int
输出：#normal_distribution.output int
```

♦ 离散随机数 - 均匀分布 (PCG算法)

此模块取自xwjcool写的NTRE数据包。

采用的是PCG算法，比Java自带的LCG算法漂亮一些。

随机范围是 -2147483648..2147483647

选定一个用于生成随机数的实体A：

```
初始化：as 实体A run func ntre:randomize
注：每个实体只需要在载入数据包时初始化一次

生成随机数：as 实体A run func ntre:next
结果输出在实体A的ntre_output记分板
```

♦ 离散随机数 - 几何分布：large_number:random/geometric_distribution/start

测试内容：做n次成功概率为p的伯努利试验，返回首次成功时的试验次数

```
单次事件的概率[浮点数]：storage large_number:math geometric_distribution_chance
试验次数：#geometric_distribution.times int

输出：#geometric_distribution.output int
```

♦ 离散随机数 - 超几何分布：large_number:random/hypergeometric_distribution/start

测试内容：从有限N个物件（其中包含M个指定种类的物件）中抽出n个物件，成功抽出该指定种类的物件的次数（不放回）。

```
样本池：storage large_number:math hypergeometric_distribution_list [1,2]
必须输入int型正整数列表。输入列表里的元素按照它所在的位置，自动分配ID。比如第1个元素的ID为1，第五个元素ID为5。每一项的数字表示这个ID的元素有几个。
要抽取的元素ID：#hypergeometric_distribution.target int
抽取次数：#hypergeometric_distribution.times int

输出：#hypergeometric_distribution.output int

清理测试产生的临时marker：
kill @e[type=minecraft:marker,tag=large_number.list_operation]
```

♦ 离散随机数 - 帕斯卡分布：large_number:random/pascal_distribution/start

测试内容：测试概率为p的伯努利实验直到出现r次成功，返回实际测试的次数

```
目标成功次数[int]：storage large_number:math pascal_distribution.r
单次试验成功概率[float]：storage large_number:math pascal_distribution.p
最大测试次数[int]：storage large_number:math pascal_distribution.max

输出[int]：storage large_number:math pascal_distribution.output
```

　

♦ 连续随机数 - [0,1]区间

PCG算法：`execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/pcg`

LCG算法：`function large_number:random/number_0_1/lcg`

```
输出：storage large_number:math random_number_0_1
```

♦ 连续随机数 - 标准正态分布：large_number:random/normal_distribution/test2-standard

范围：[-6,6]

概率密度函数：

$$
f(x)=\frac{1}{\sqrt{2\pi}}\mathrm{e}^{-\frac{x^2}{2\ \ }}
$$

测试内容：生成12个[0,1]区间的随机数相加然后减6

```
输出：storage large_number:math random_as_standard_normal_distribution
```

♦ 连续随机数 - 指数分布：large_number:random/exponential_distribution/start

当λ=1时的范围：[0,20.7232]

概率密度函数：

$$
f(x;\lambda)=
\left\{\begin{matrix}
\lambda\mathrm{e}^{-\lambda x} &,\ x\ge 0\\
0 &,\ x< 0
\end{matrix}\right.
$$

概率分布函数 (用于生成随机数)：

$$
g(x)=-\frac{\ln(1-x)}{\lambda}
$$

测试内容：设随机变量U为(0,1)区间的均匀分布随机数，则g(U)服从指数分布

```
λ(放大一千倍)：#random.λ int

输出：storage large_number:math random_as_exponential_distribution
```

♦ 连续随机数 - 伽玛分布：large_number:random/gamma_distribution/start

概率密度函数：

$$
f(x)=
\left\{\begin{matrix}
\frac{\lambda^\alpha}{\Gamma(\alpha)}x^{\alpha-1}\mathrm{e}^{-\lambda x} &,\ x\ge 0\\
0 &,\ x< 0
\end{matrix}\right.
$$

测试内容：伽玛分布就是α个指数分布的总和

```
λ(尺度参数，放大一千倍)：#random.λ int
α(形状参数)：#random.α int

输出：storage large_number:math random_as_gamma_distribution
```

♦ 连续随机数 - 偏匀分布：large_number:random/skewed_distribution/start

概率分布函数 (用于生成随机数)：

$$
f(x)=(1-(1-x)^p)^{\frac{1}{p}}(b-a)+a, x\in [0,1]
$$

测试内容：设随机变量U为(0,1)区间的均匀分布随机数，则f(U)服从(a,b)区间的偏匀分布。参数p称为"偏峰指标"。

当p>1时，p越大结果越靠近区间上限；当0<p<1时，p越小结果越靠近区间下限。均匀分布是偏匀分布在p=1时的特殊情况。

相关情形：有一些在一定范围内随机位置洒下来的金币，以一定高度同时下落，它们接触了地面就会消失。若我早些上去接住，则有大概率接住更多，若我晚些去接住，则有大概率接不住几个。

则我接住的金币的数量服从偏匀分布，P就是我去接金币的时间。

概率密度函数：

$$
g(x)=\left\{\begin{matrix}
\frac{1}{b-a}\left ( 1-\left ( \frac{x-a}{b-a}  \right )^p  \right ) ^{\frac{1}{p}-1 }\left ( \frac{x-a}{b-a}  \right )^{p-1} & ,\ x\in [a,b]\\
\\
0& ,\ x\notin [a,b]
\end{matrix}\right.
$$

累积分布函数 (值域为[0,1])：

$$
h(x)=\left\{\begin{matrix}
0& ,\ x< a\\
1-\left ( 1-\left ( \frac{x-a}{b-a}  \right )^p  \right )^{\frac{1}{p} }& ,\ x\in [a,b]\\
1& ,\ x>b
\end{matrix}\right.
$$

数学期望：(感谢泰勒猫爱丽丝的解答)
$$
\begin{aligned}
& \mathrm{beta函数形式：}\frac{b-a}{p}\ \mathrm{Β}\left( \frac{1}{p}+1,\frac{1}{p} \right)+a \\
\\
& \mathrm{gamma函数形式：}\frac{(b-a)\left ( \Gamma\left( \frac{1}{p} \right) \right )^2 }{2p\Gamma\left( \frac{2}{p} \right)} +a
\end{aligned}
$$
方差：
$$
\mathrm{beta函数形式：}\frac{(b-a)^2}{p}\ \mathrm{Β}\left( \frac{2}{p}+1,\frac{1}{p} \right)-\left( \frac{b-a}{p}\ \mathrm{Β}\left( \frac{1}{p}+1,\frac{1}{p} \right)  \right)^2
$$

> 这个分布是我自己人为构造的，严格来说这个分布并不能叫偏匀分布，应该有一个更好的名词。

```
区间下限[int]：storage large_number:math skewed_distribution.min
区间上限[int]：storage large_number:math skewed_distribution.max
偏峰指标[double]：storage large_number:math skewed_distribution.p
```

　

♦ 指数函数

1. e^x ：large_number:exp_e.x/start

e是自然对数的底，是一个无理数，e ≈2.718281828459045

例：输入 4.231123，输出 68.79444497242804

输入范围为区间：(-709, 709.7828)

```
输入[double]：storage large_number:math exp_e^x.input
输出：storage large_number:math exp_e^x.output
```

2. 任意正数的幂：large_number:exp_any/start


公式：`a^b = e^(b*ln(a))` 。

例：输入 5.7322^2.1123，输出 39.97625953186048

```
输入[double]：
底数：storage large_number:math exp_any.input.base
指数：storage large_number:math exp_any.input.expon
指数范围：[0,2147483647]

输出：storage large_number:math exp_any.output
```

3. 开n次方：large_number:exp_any/n_root

公式：`a^(1/b) = e^(ln(a)/b)`

```
输入[double]：
底数：storage large_number:math exp_any.input.base
指数：storage large_number:math exp_any.input.expon
底数仅支持正数，指数支持全double。

输出：storage large_number:math exp_any.output
```

♦ 整数的整数次幂：large_number:int_base_int_power/start

可计算负底数或负指数

指数范围：[-2147483647, 2147483647]

传统的递归相乘法

```
输入：
底数：#int_base_int_power.base int
指数：#int_base_int_power.expon int

输出：storage large_number:math int_base_int_power_out
```

♦ 浮点数的整数次幂：large_number:float_base_int_power/start

可计算负底数或负指数

指数范围：[-2147483647, 2147483647]

传统的递归相乘法

```
输入：
底数[double]：storage large_number:math float_base_int_power.base
指数[int]：storage large_number:math float_base_int_power.expon

输出：storage large_number:math float_base_int_power.output
```

♦ 浮点数的整数次幂 - 快速幂：large_number:float_base_int_power/fast_power/start

快速幂算法性能稳定，无论多大的指数，都最多使用30次浮点乘法和30次浮点平方，全面优于递归相乘法。

快速幂算法原理：https://baike.baidu.com/item/%E5%BF%AB%E9%80%9F%E5%B9%82

```
输入：
底数[double]：storage large_number:math float_base_int_power.base
指数[int]：storage large_number:math float_base_int_power.expon

输出：storage large_number:math float_base_int_power.output
```

　

♦ 整数的自然对数 ln(x)：large_number:ln/start

精度：误差不超过0.0009，保留四位小数

```
输入：#ln(x) int
输出(放大一万倍)：#ln(x).output int
double型输出：storage large_number:math ln_output
```

♦ 对浮点数取自然对数 ln(x)：large_number:ln_double/start

对数公式：`ln(7.25)=ln(725/100)=ln(725)-ln(100)`，`ln(7.45*10^26)=ln(7.45)+26*ln(10)`

保留四位小数

```
输入[double]：storage large_number:math ln_double.input
输出(放大一万倍)：#ln_double.output int
double型输出：storage large_number:math ln_double.output
```

♦ 任意正整数的对数：large_number:loga.b/start

保留四位小数

换底公式：`log.a(b)=ln(b)/ln(a)`

特殊情况：

以0或1为底的"不为1的数"的对数不存在，故而输出的值也不存在；

任何数为底的1的对数都是0；

非0且非1的底数的0的对数都是负无穷，故而输出的double为负无穷，输出的计分板值是-2147483648。

```
输入：
底数：#loga.b_a int
真数：#loga.b_b int

输出(放大一万倍)：#loga.b.output int
double型输出：storage large_number:math "log.a(b).output"
```

♦ 对浮点数取对数：large_number:loga.b_double/start

```
输入[double]：
底数：storage large_number:math log(a,b)_double.a
真数：storage large_number:math log(a,b)_double.b

输出：storage large_number:math log(a,b)_double.output
```

♦ 整数的常用对数：large_number:lg/start

保留四位小数

公式：`lg(x) = ln(x)/ln(10)`

```
输入：#lg(x) int

输出(放大一万倍)：#lg(x)_output int
double型输出：storage large_number:math lg(x)_output
```

　

♦ 高精度自然对数 (全double)：large_number:ln_high_precision/start

此算法参考：https://www.zhihu.com/question/333371020/answer/1686069171

公式：
$$
\begin{aligned}
& k=\lfloor \log_2(x) \rfloor \\
& f=\frac{x}{2^k} -1 \\
& s=\frac{f}{f+2} \\
& L_1=0.6666666666666735130 \\
& L_2=0.3999999999940941908 \\
& L_3=0.2857142874366239149 \\
& L_4=0.2222219843214978396 \\
& L_5=0.1818357216161805012 \\
& L_6=0.1531383769920937332 \\
& L_7=0.1479819860511658591 \\
\\
& R(z)≈s^2·(L_1+s^4·(L_3+s^4·(L_5+s^4·L_7 )))+s^4·(L_2+s^4·(L_4+s^4·L_6 )) \\
\\
& \ln(x)=k·\ln(2)+f-\frac{f^2}{2}+s·(\frac{f^2}{2}+R(z)) \\
\end{aligned}
$$
雷米兹算法得到的多项式在高精度ln算法里起了最重要的误差修正的作用，理论上误差可低至2^-58.45。

此算法使用了大量的高精度浮点乘法，因此此算法的消耗约为查表法的60倍。

```
输入[double]：storage large_number:math ln_high_precision.input

输出：storage large_number:math ln_high_precision.output
```

　

♦ 自然数的阶乘：large_number:gamma_function/fundamental_factorial/start

输入范围为区间：[0,170]

区间[0,12]的自然数的阶乘以int型输出，区间[13,170]的自然数的阶乘以double型输出。

```
输入：#natural_num.factorial.input int
输出：storage large_number:math natural_num_factorial
```

♦ 自然数的双阶乘：large_number:gamma_function/fundamental_factorial/double_factorial

输入范围为区间：[0, 300]

区间[0,19]的自然数的双阶乘以int型输出，区间[20,300]的自然数的双阶乘以double型输出。

这里的双阶乘是原始的无穷乘积形式定义的

```
输入：#natural_num.double_factorial.inp int
输出：storage large_number:math natural_num_double_factorial
```

♦ 伽玛函数 - 斯特林公式：large_number:gamma_function/stirling/start

斯特林公式：

$$
\Gamma\left ( {x+1} \right )\sim \sqrt {2πx}\left ( {\frac {x} {\mathrm{e}}} \right )^{x}\left ( {1+\frac {0.0845072303119} {x}} \right )
$$

Γ(x+1)在(-1, 0.2216) 区间的近似：

$$
\Gamma\left ( {x+1} \right )\sim\frac{1}{x+1}+\frac{25}{49}x
$$

输入范围为区间：(-1, 170.6271]

这里计算的是Γ(x+1)，主要用于计算实数的阶乘

```
输入[double]：storage large_number:math gamma_function.input
输出：storage large_number:math gamma_function.output
```

♦ 伽玛函数 - 递推公式：large_number:gamma_function/recursion/start

递推公式：

$$
\Gamma\left(x+1\right)=x\Gamma\left(x\right)=\Gamma\left(x+1-a\right)\cdot\prod_{n=1}^{a}x+1-n,\ a\in\mathbf{N}
$$

注：Π为连乘符号。a的取值取决于要把x钳制到哪个区间。

输入范围为区间: [0.001, 170.6026)

```
载入前置库：function large_number:gamma_function/recursion/database
卸载前置库：data remove storage large_number:math gamma_databse

输入[double]：storage large_number:math gamma_function.input

输出：storage large_number:math gamma_function.output
```

　

♦ LambertW函数

LambertW(x)：large_number:lambertw/start

LambertW.(-1) (x)：large_number:lambertw/-1/start

LambertW(x)是x\*e\^x的反函数

公式1：`LambertW(x) ~ ln(x)-ln(ln(x))+ln(ln(x))/ln(x) x≥3`

公式2：`LambertW(x) ~ ln(x+1)/1.3 0≤x≤3`

公式3：`LambertW(x) ~ tan(3.365x)/3.2 (-1/e)≤x≤0`

公式4：`LambertW.(-1) (x) ~ ln(-x)-ln(-ln(-x))+ln(-ln(-x))/ln(-x)`

输入范围：

LambertW(x)：[-1/e, ∞)

LambertW.(-1) (x)：[-1/e, 0]

-1/e≈-0.3678794411714

```
输入[double]：storage large_number:math lambertw.input
输出：storage large_number:math lambertw.output
```

　

♦ 逆伽玛函数 - F.K.Amenyou公式：large_number:inverse_gamma_function/start

这里计算的是Γ(x+1)的反函数，就是已知x的阶乘求x。

伽玛函数的函数值与𝑥并不是单射关系，因此需要限制定义域。

取Γ(x+1)在x≥0的部分，可以发现这一段函数存在一个极小值𝜆，𝜆≈0.8856031944109。

定义一个常数𝜑，满足Γ(𝜑+1)=𝜆，𝜑≈0.4616321449684。

在[𝜑,∞)区间内，Γ(x+1)严格单调，所以在𝑥∈[𝜑,∞)时，Γ(x+1)存在反函数。

定义隐式x=Γ(𝑦+1) (𝑦≥𝜆)，满足此关系式的点集就是正实数的反阶乘函数。称为逆Γ(x+1)，定义域为[𝜆,∞)。

F.K.Amenyou公式：

$$
逆\Gamma\left ( {x+1} \right )\sim \frac {\ln {\left ( {\frac {x} {\sqrt {2π}}} \right )}} {\mathrm{LambertW}\left ( {\frac {\ln {\left ( {\frac {x} {\sqrt {2π}}} \right )}} {\mathrm{e}}} \right )}-\frac {1} {2}+\frac {1} {30x}
$$

相关论文：https://ir.lib.uwo.ca/etd/5365/，https://www.ams.org/journals/proc/2012-140-04/S0002-9939-2011-11023-2/

逆Γ(x+1)在(𝜆, 1.13)区间的近似：

$$
逆\Gamma\left ( {x+1} \right )\sim\arcsin\left ( 1.23099326x-2.08932555 \right ) +\frac{\pi }{2} +\varphi
$$

𝜑≈0.4616321449684，𝜆≈0.8856031944109

输入范围：x≥𝜆

```
输入[double]：storage large_number:math inverse_gamma_function.input
输出：storage large_number:math inverse_gamma_function.output
```

　

♦ 执行朝向转为四元数四分量xyzw：large_number:quaternion/facing/2tostoxyzw

需要传入执行朝向

```
执行：as b09e-44-fded-6-efa5ffffef64 run func...

输出：
列表形式：storage large_number:math xyzw
记分板分数：#qrot_x int, #qrot_y int, #qrot_z int, #qrot_w int
```

♦ 欧拉角转四元数：`execute as b09e-44-fded-6-efa5ffffef64 run function large_number:quaternion/euler_angles_to_xyzw`

```
输入：storage large_number:math euler_angles_input [0.0,0.0,0.0]
第一个是横滚(roll)，第二个是俯仰(pitch)，第三个是偏航(yaw)

输出：storage large_number:math xyzw
```

♦ 执行朝向转单位向量：large_number:quaternion/facing/facing_to_unit_vector

需要传入执行朝向

```
执行：as b09e-44-fded-6-efa5ffffef64 run func...
输出：storage large_number:math unit_vector
```

♦ 横滚角转四元数：`execute as b09e-44-fded-6-efa5ffffef64 run function large_number:quaternion/euler_angles_roll`

```
输入[浮点数]：storage large_number:math euler_angles_roll
输出：storage large_number:math xyzw
```

　

♦ 局部坐标转相对坐标

方法1 (向量点乘)：large_number:uvw/uvwtoxyz

需要传入执行朝向，需要以世界实体为执行者

```
输入：#u int，#v int，#w int
输出(放大一万倍)：#x int，#y int，#z int
```

方法2 (宏)：large_number:uvw/uvwtoxyz_2

输入执行坐标，执行高度(anchored eyes|feet)，执行朝向

需要以世界实体为执行者

```
输入：#u int，#v int，#w int
输出：#vec_x int，#vec_y int，#vec_z int
```

♦ 相对坐标转局部坐标

方法1 (向量点乘)：large_number:uvw/xyztouvw

需要传入执行朝向，需要以世界实体为执行者

```
输入：#x int，#y int，#z int
输出(放大一万倍)：#u int，#v int，#w int
```

方法2 (宏)：large_number:uvw/xyztouvw_2

输入执行坐标，执行高度(anchored eyes|feet)，执行朝向

需要以世界实体为执行者

```
输入：#vec_x int，#vec_y int，#vec_z int
输出：#u int，#v int，#w int
```

　

♦ 解整系数一元二次方程：large_number:quadratic_equation/start

需要把一元二次方程化为一般形式输入，a b c 的绝对值尽量不大于20724

支持a=0的情况

更精确的：支持的Δ的值的范围为全int，即 `-2147483648 ≤ b²-4ac ≤ 2147483647`

公式法求解：

$$
x={-b\pm\sqrt{b^2-4ac}\over2a}
$$

```
输入：
#X_squ_equ.a int
#X_squ_equ.b int
#X_squ_equ.c int

输出：
放大一万倍的分数形式：
#X_squ_equ.x1 int
#X_squ_equ.x2 int

表达式形式(未化简)：storage large_number:math quadratic_equation_out.expression
double型形式：storage large_number:math quadratic_equation_out.double

实数根的数量：#X_squ_equ.roots int

显示解方程的结果：set #X_squ_equ.tellraw int 1
显示这个JSON文本便可显示结果：
[{"nbt":"quadratic_equation_out_json_tellraw.json1","storage":"large_number:math","interpret":true},{"nbt":"quadratic_equation_out_json_tellraw.json2","storage":"large_number:math","interpret":true}]
```

注：

1. 若方程有两个不相等的实数根，则x1和x2的记分板分数都存在，表达式形式和double型形式都是列表，列表的第一项对应x1，第二项对应x2。

2. 若方程有两个相等的实数根，则x1和x2的记分板分数都存在且相等，表达式形式是一个单独的字符串，double型形式是一个单独的double型数值。

3. 若方程没有实数根，则x1和x2的记分板分数都不存在，表达式形式和double型形式也都不存在，`storage large_number:math quadratic_equation_out `会是一个空的复合标签。

　

♦ 解浮点系数一元二次方程（全double）：large_number:quadratic_equation_double/start

需要把一元二次方程化为一般形式输入，支持a=0的情况。

公式法求解：

$$
x={-b\pm\sqrt{b^2-4ac}\over2a}
$$

```
输入[double列表]：storage large_number:math quadratic_equation_double.input [0.0,0.0,0.0]
列表三项分别表示一元二次方程系数里的[a,b,c]

输出：
表达式形式(未化简)：storage large_number:math quadratic_equation_double.expression
数值形式：storage large_number:math quadratic_equation_double.output

实数根的数量：storage large_number:math quadratic_equation_double.roots

显示解方程的结果：storage large_number:math quadratic_equation_double.tell set value 1
如果不想显示就设为其他值

显示这个JSON文本便可显示结果：
[{"nbt":"quadratic_equation_double.tellraw.json","storage":"large_number:math","interpret":true}]
```

注：

1. 若方程有两个不相等的实数根，则表达式形式和数值形式都是列表，列表的第一项对应x1，第二项对应x2。

2. 若方程有两个相等的实数根，则表达式形式是一个单独的字符串，数值形式是一个单独的值。

3. 若方程没有实数根，则表达式形式和数值形式对应的标签也都不存在。

　

♦ 一元三次方程计算器：large_number:cubic_equation/start

原理：盛金公式。见：https://baike.baidu.com/item/%E7%9B%9B%E9%87%91%E5%85%AC%E5%BC%8F

只给出实数根。

```
输入[double列表]：storage large_number:math cubic_equation.input [0.0,0.0,0.0,0.0]
列表四项分别表示一元三次方程系数里的[a,b,c,d]，要求a≠0。

输出：storage large_number:math cubic_equation.output
一元三次方程会有1~3个不同的实数根，若不同的实数根多于一个则此项为列表。

实数根的数量：storage large_number:math cubic_equation.roots

显示这个JSON文本便可显示结果：
[{"nbt":"cubic_equation.tellraw.json","storage":"large_number:math","interpret":true}]
```

　

♦ 获取当前日期和时间：large_number:timestamp/start

【此功能需要联网使用】

原理：解码正版玩家头颅里的Base64后会获得一个json对象，里面包含一个unix时间戳。

因获取玩家头颅里的Base64需要等待方块更新，所以解码会稍有延迟

已知bug：如果执行后，观察到执行后无输出，则表示头颅皮肤未正确加载，解决方法是延迟几tick再执行一次本函数

用命令判断就是测试此命令是否能通过，通过就表示解析不正确：`execute unless data storage large_number:timestamp timestamp_base64`

```
需要的前置库：
载入：function large_number:timestamp/database
卸载：function large_number:timestamp/uninstall_database

输入GMT时区 (仅用于时区校准)：set #GMT-time_zone int 8
例如北京时间是GMT+8，所以输入8，默认为8

设置模式
仅获取时间：#timestamp.get_num int 分数不为1也不为2
同时输出时间戳：set #timestamp.get_num int 1
仅获取时间戳：set #timestamp.get_num int 2
默认是"仅获取时间"

输出
时间戳：#timestamp.num int

年：#timestamp_year int
月：#timestamp_month int
日：#timestamp_day int
时：storage large_number:timestamp output_day_Hour
分：storage large_number:timestamp output_day_Minute
秒：storage large_number:timestamp output_day_Second

显示以下JSON文本便可显示时间：
{"nbt":"output_base64_json_tellraw","storage":"large_number:math","interpret":true}

更换正版玩家ID：storage large_number:math player_head_cache_list ["<玩家名>","<玩家名>"]
注：列表里可存多个玩家名，但读取时只读取列表里的第一个
初始列表：["MHF_Alex","MHF_Blaze","MHF_CaveSpider","MHF_Chicken","MHF_Cow","MHF_Creeper","MHF_Enderman","MHF_Ghast","MHF_Golem","MHF_Herobrine","MHF_LavaSlime","MHF_MushroomCow","MHF_Ocelot","MHF_Pig","MHF_PigZombie","MHF_Sheep","MHF_Skeleton","MHF_Slime","MHF_Spider","MHF_Squid","MHF_Steve","MHF_Villager","MHF_WSkeleton","MHF_Zombie","MHF_Cactus","MHF_Cake","MHF_Chest","MHF_CoconutB","MHF_CoconutG","MHF_Melon","MHF_OakLog","MHF_Present1","MHF_Present2","MHF_Pumpkin","MHF_TNT","MHF_TNT2","MHF_ArrowUp","MHF_ArrowDown","MHF_ArrowLeft","MHF_ArrowRight","MHF_Exclamation","MHF_Question"]
当列表为空时会自动设回初始值
```

因为<u>每个正版玩家名仅能在进入单人存档/服务器时获取两次时间戳，一次是放置成方块，一次是放置在实体的物品栏里</u>，然后时间戳就

存在了缓存里不再更新，想要更新时间戳只有三个方法：

1.重进存档/重开服务器；2.一个月后头颅缓存自动过期；3.更换一个新的正版玩家ID

所以想要长期开着服务器，建议配合内部打表计时使用，每两小时用命令方块同步一次时间，每24小时更换一个新的正版玩家id来同步一次日期，更换30次后，第一次使用的玩家id的头颅缓存就过期了。

　

♦ Unix时间戳解析 (32位)：large_number:timestamp/parse_timestamp

```
输入[int]：storage large_number:math parse_timestamp.input

输入GMT时区：set #GMT-time_zone int 8
例如北京时间是GMT+8，所以输入8，默认为8

输出：
年：#parse_timestamp.year int
月：#parse_timestamp.month int
日：#parse_timestamp.day int
时：storage large_number:math parse_timestamp.hour
分：storage large_number:math parse_timestamp.minute
秒：storage large_number:math parse_timestamp.second

显示以下JSON文本便可显示解析结果：
{"nbt":"parse_timestamp.tellraw","storage":"large_number:math","interpret":true}
```

　

♦ 玩家经验公式 - 根据经验等级和经验数推出经验总数：large_number:xp_formula/levels_to_points/start

当经验等级≥32时，玩家的经验数为：

$$
f\left ( {x} \right )=1507+\sum ^{x-1}_{n=31} {9n-158}\, =\ 4.5{x}^{2}-162.5x+2220
$$

输出的数值一般情况下不可直接用于逆推玩家已有的经验等级，因为mc内部的一些特殊算法，这个数与玩家此时真正拥有的经验数有些出入。

能差多少呢？举个例子："用xp命令一次性给予1628点经验"和"用xp命令分别给予一次1507点经验和一次121点经验"，玩家得到的经验数会差出1点。 

原因是mc在计算玩家升级到下一级所需的经验数时使用了玩家nbt里的XpP参数，这是一个浮点型存储的百分比数，浮点误差导致了玩家实际拥有的经验与理论拥有的经验数略有出入。

```
输入：
等级：#xp_formula.levels int
经验数：#xp_formula.points int
经验数就是 /xp query @s points 获得的

输出：storage large_number:math xp.output
```

♦ 玩家经验公式 - 经验总数逆推经验等级和经验余数：large_number:xp_formula/points_ope_levels/start

当经验数≥1628时，逆推经验等级公式：

$$
g\left ( {x} \right )=\frac {\sqrt {72x-54215}+325} {18}
$$

经验公式是个一元二次方程，对其用求根公式反推，然后只保留x≥0的根，得到了这个反向经验公式

理论上输入值不应大于 2.07526*10^19

```
输入：storage large_number:math xp_points_ope_levels.input [I;0,0,0,0,0]
本算法自适应位数，不必每次都输入满5个数

输出：
经验等级数：storage large_number:math xp_points_ope_levels.output_levels
经验余数：storage large_number:math xp_points_ope_levels.remaining_points

若用于给予玩家经验，应先给予经验等级再给予经验余数
```

♦ 玩家经验公式 - 扣除玩家前N级经验：large_number:xp_formula/subtra_top_n_lvl/start

确保玩家现有的经验等级大于等于你要扣除的前N级经验等级，然后让被扣除经验的玩家执行此函数

先算出玩家现有的经验数，再根据给定的等级算出要扣除的经验数，两者相减获得玩家剩余的经验数，然后换算为经验等级和经验数赋予给玩家。

根据浮点数算不准原理，此算法给出的结果可能和预想中的略有出入

```
要扣除的经验等级：#xp_formula.top_n_lvl.input int
```

　

♦ 颜色RGB转16进制：large_number:rgb_to_hexadecimal/start

```
输入(RGB值范围均为 0~255)：
#rgb_to_hexadecimal.R int
#rgb_to_hexadecimal.G int
#rgb_to_hexadecimal.B int

输出：storage large_number:math rgb_to_hexadecimal_output
```

　

♦ 调和级数前N项和：large_number:harmonic_series/sum1-n

公式法逼近，无递归。

公式：

$$
H_{x}=\sum ^{x}_{n=1} {\frac {1} {n}}=\psi\left ( {x+1} \right )+\gamma\approx \ln {\left ( {x} \right )}+0.5772+\frac {0.4995078} {x}
$$

注：Σ为级数求和，ψ为Digamma函数，即伽玛函数的自然对数的导数，γ是欧拉-马歇若尼常数，也是调和级数的拉马努金和，约为0.5772156649

在输入值为负数时，输出5772，即调和级数的拉马努金和

```
输入：storage large_number:math Harmonic_series_sum_input
输入值的类型可以是：double/float/int，使用double/float型输入可以计算超出int范围的值

输出(放大一万倍)：#Harmonic_series.sum.output int
```

　

♦ Sigmoid函数

Sigmoid(x)=1/(1+e^(-x))

直接计算法：large_number:sigmoid/direct_calculation/start

线性近似法：large_number:sigmoid/start

线性近似法的原理：https://zhuanlan.zhihu.com/p/318423774

```
输入[double]：storage large_number:math sigmoid.input
输出：storage large_number:math sigmoid.output
```

　

♦ Digamma函数：large_number:digamma_function/start

公式：`ψ(x)~ln(x)-1/(2x)`

在输入值为1时输出特殊值： -γ

```
输入[double]：storage large_number:math digamma_function.input
输入范围：x>0

输出：storage large_number:math digamma_function.output
```

　

♦ 双曲函数

公式：

$$
\begin{aligned}
& \sinh(x)=\frac{\mathrm{e}^x-\mathrm{e}^{-x}}{2} \\
& \cosh(x)=\frac{\mathrm{e}^x+\mathrm{e}^{-x}}{2} \\
& \tanh(x)=\frac{\sinh(x)}{\cosh(x)} =\frac{2}{\mathrm{e}^{-2x}+1}-1
\end{aligned}
$$

双曲正弦：large_number:hyperbolic_function/sinh

双曲余弦：large_number:hyperbolic_function/cosh

双曲正切：large_number:hyperbolic_function/tanh

```
输入[double]：storage large_number:math hyperbolic_function.input
输出：storage large_number:math hyperbolic_function.output
```

　

♦ 整数质因数分解：large_number:prime_factorization/start

```
初始信息表
载入：function large_number:prime_factorization/database
清空：data remove storage large_number:math prime_factorization

输入：#prime_factorization.input int
输出：storage large_number:math prime_factorization_output

如果输出的列表只有一项那么输入值就是一个质数
```

　

♦ 整数约分：large_number:int_simplify/start

原理：欧几里得算法，辗转相除法

只接受正数

```
输入值1：#int_simplify.input1 int
输入值2：#int_simplify.input2 int

约分后的输入值1：#int_simplify.output1 int
约分后的输入值2：#int_simplify.output2 int

两数的最大公约数：#int_simplify.greatest_common_divisor int
如果最大公约数为1，则两数互质
```

　

♦ 整数转二进制：large_number:convert_decimal_to_binary

按照32位有符号整数的存储规则进行转换，输出的列表为固定32个整数，每个整数表示这一位的二进制数，对于负数会进行补码

```
输入：#convert_decimal_to_binary.input int
输出：storage large_number:math convert_decimal_to_binary_out

显示以下JSON文本可显示输出结果：
{"nbt":"convert_decimal_to_binary_out[]","storage":"large_number:math","separator":""}
```

　

♦ 整数的进制转换

1. 10进制转2~36进制：large_number:number_base_conversion/10_to_any

```
输入：#conversion.10_to_any.input int
只接受正数

进制基数：#conversion.10_to_any.radix int
接受的进制基数为2~36

输出：storage large_number:math number_base_conversion
输出的是一个列表，列表的每一项表示在该进制下这一位的数
```

2. 2~36进制转10进制：large_number:number_base_conversion/any_to_10

```
输入：storage large_number:math number_base_conversion ["f","f","0","9","7"]

进制基数：#conversion.10_to_any.radix int
接受的进制基数为2~36

输出：#conversion.any_to_10.output int
```

　

♦ 表达式求值 - 四则运算

符号仅接受 `+－*/().E-` 。为了在转化为逆波兰式的过程中区分减法与负数，`－` (全角减号) 表示减法，`-` (半角减号) 表示负数。数字只能是int或double。double型数值可以是科学记数法且不需要单位，double型数值只能使用浮点数算法计算。

注：不要单独把一个数放在括号里，如有需求，请写成 (a+0) 的形式。此算法的表达式里没有 "负数要单独放在括号里" 这种规则。

逆波兰式算法：https://blog.csdn.net/zm_miner/article/details/115324206

转换完成与计算完成均有提示

1.表达式转换为逆波兰式：large_number:expression_evaluation/to_rev_polish_notation

```
输入：storage large_number:math expression_evaluation.input "(12+14)*(106－32)"
输出逆波兰式 (可直接用于解析求值)：storage large_number:math expression_evaluation.rev_polish_notation
```

2.解析逆波兰式

使用整数算法来求值：large_number:expression_evaluation/ope_of_inte

使用浮点数算法来求值：large_number:expression_evaluation/ope_of_float

```
输入逆波兰式：storage large_number:math expression_evaluation.rev_polish_notation ["51E-2","3","+"]
输出计算结果：storage large_number:math expression_evaluation.output

显示逆波兰式 (JSON文本)：
{"nbt":"expression_evaluation.rev_polish_notation[]","storage":"large_number:math","separator":" "}
```

　

♦ 表达式求值 - 科学计算

运算符可接受 `+－*·/().E-^²` (加减乘除、括号、小数点、科学记数法、负号、幂运算，平方)。`·` 等价于`*` 。

对于幂运算，整数幂是递归相乘，非整数幂是查表算法。对于除法，若被除数为1，则执行专门的取倒数算法。

为了在转化为逆波兰式的过程中区分减法与负数，`－` (全角减号)表示减法，`-` (半角减号)表示负数。

数字只能是double，不需要带单位。

注：不要单独把一个数放在括号里，如有需求，请写成 (a+0) 的形式。此算法的表达式里没有 "负数要单独放在括号里" 这种规则。即使是变量与数字相乘，乘号也必须要写。

转换完成与计算完成均有提示。

函数列表 (已支持37种函数) ：

> 每个函数和它的参数都必须单独放在一个括号里，支持复合函数。
>
> α、β和δ都是函数的参数，若参数为一个数字，则不应放在括号里，若参数不为一个数字，则应放在括号里。
>
> 例如sin7+2应写成"(sin7)+2"，ln(2+9)·2-3应写成"(ln(2+9))·2－3"

```
函数名称：exp; sin; cos; arcsin; arccos; arctan; ln; √; Γ; ┕; ºLambertW; ¹LambertW; ||; sgn; []; [0]; —; ψ; Σ[1/n]n→; log; atan; nroot; eunorm₂; eunorm₃; >=; <=; ==; ≈≈; >/<; >-<; >>; <<; ≥≥; ≤≤; ºsinh; ºcosh; ºtanh

介绍：

一元运算
expβ = e^β，指数运算，整数幂是递归相乘，非整数幂是查表算法。
sinβ = sin(β) 弧度制，输入范围：[-292817.6585183, 292817.6585183]
cosβ = cos(β) 弧度制，输入范围：[-292817.6585183, 292817.6585183]
arcsinβ = arcsin(β) 弧度制
arccosβ = arccos(β) 弧度制
arctanβ = arctan(β) 弧度制
lnβ = ln(β)，自然对数
√β = √β，平方根
Γβ = 伽玛函数，gamma(β)，输入范围为区间：(0, 171.6271]，对于整数是阶乘算法，非整数是斯特林公式。
┕β = 逆伽玛函数，gamma(x)主分支的反函数，逆gamma(β)-1相当于阶乘的逆运算，输入范围：β≥𝜆，𝜆≈0.8856031944109。
ºLambertWβ = LambertWº(β)，主分支，输入范围：[-1/e,∞)
¹LambertWβ = LambertW¹(β)，-1的分支，输入范围：[-1/e,0)
||β = β的绝对值
sgnβ = sgn(β)，符号函数
[]β = 把β向下取整
[0]β = 把β向0取整
—β = 破折号的一半，表示β的相反数。注：此符号与负号并不等价，此符号表示的是"取相反数"的函数。
ψβ = ψ(β) digamma函数，又叫双伽玛函数，伽玛函数的对数的导数
Σ[1/n]n→β = 调和级数前β项和
ºsinhβ = sinh(β)
ºcoshβ = cosh(β)
ºtanhβ = tanh(β)

二元运算
αlogβ = 以α为底β的对数
αatanβ = atan2(α,β) 弧度制
αnrootβ = 对β开α次根
αeunorm₂β = √(α²+β²)，二维向量(α,β)的欧氏范数，必须都是非负数，计算方法是三角函数法。
α>/<β = 交换除，β除以α
α>-<β = 交换减，β减α

逻辑运算
α>=β = 取较大值
α<=β = 取较小值
α==β = 严格判断是否相等，相等为1，否则为0
α>>β = α是否大于β
α<<β = α是否小于β
α≥≥β = α是否大于等于β
α≤≤β = α是否小于等于β
α≈≈β,δ = 误差判断，判断α和β的的绝对值的距离是否在δ的绝对值以内，是为1，否则为0
注：可能会因浮点误差导致判断失误，例如0.02在计算时变为0.020000000000000018

三元运算
αeunorm₃β,δ = √(α²+β²+δ²)，三维向量(α,β,δ)的欧氏范数，必须都是非负数。此处的逗号仅作为把数字分开的占位符。计算方法是单位向量法。
```

1. 表达式转换为逆波兰式：large_number:expression_evaluation_scientific/to_rev_polish_notation

```
输入：storage large_number:math expression_evaluation.input "(12+14)*(106－32)"

支持代入变量，解析时可自动把变量视为指定路径的数字。对只有变量存在的式子也可解析，例如计算["π"]会输出3.141592653589793

目前支持的变量名：α; β; δ; ε; η; λ; μ; ξ; τ; ω; ｘ; ｙ; ｚ
此处的ｘｙｚ是全角字母
分别对应路径 (目标值只能是double)：
α：storage large_number:math expression_evaluation_variables."α"
β：storage large_number:math expression_evaluation_variables."β"
δ：storage large_number:math expression_evaluation_variables."δ"
ε：storage large_number:math expression_evaluation_variables."ε"
η：storage large_number:math expression_evaluation_variables."η"
λ：storage large_number:math expression_evaluation_variables."λ"
μ：storage large_number:math expression_evaluation_variables."μ"
ξ：storage large_number:math expression_evaluation_variables."ξ"
τ：storage large_number:math expression_evaluation_variables."τ"
ω：storage large_number:math expression_evaluation_variables."ω"
ｘ：storage large_number:math expression_evaluation_variables."ｘ"
ｙ：storage large_number:math expression_evaluation_variables."ｙ"
ｚ：storage large_number:math expression_evaluation_variables."ｚ"

支持输入数学常数符号，解析时自动替换为对应数值：π，ｅ，γ
为了区分，此处应输入全角字母ｅ

输出逆波兰式 (可直接用于解析求值)：storage large_number:math expression_evaluation.rev_polish_notation
```

2. 解析逆波兰式：large_number:expression_evaluation_scientific/ope

列表具有取出特定编号的项的功能，因此借助列表可以用逆波兰式定义非二元运算。

```
输入逆波兰式：storage large_number:math expression_evaluation.rev_polish_notation ["51E-2","3","+","ºcos"]
输出计算结果：storage large_number:math expression_evaluation.output

显示逆波兰式 (JSON文本)：
{"nbt":"expression_evaluation.rev_polish_notation[]","storage":"large_number:math","separator":" "}
```

　

♦ 定积分

"表达式求值 - 科学计算" 的拓展。

求出来的结果只能是个数（是数值积分，而且无法处理含参结果）。

被积函数直接取 "表达式求值 - 科学计算" 解析出来的逆波兰式，取积分变量为ｘ。

1. 黎曼积分法

在区间里平均距离取样，把采样得到的值乘上小区间宽度。被积函数在积分区间内必须"黎曼可积"。

公式 (梯形法则)：

$$
\int ^b_a {f(x)\ \mathrm{d}x\ \approx}\ \frac {b-a} {k}\left ( {\frac {f\left (a \right )+f\left (b \right )} {2}+\sum ^{k-1}_{n=1} {f\left ( {a+\frac {b-a} {k}n} \right )}} \right )
$$

其中k是区间内小矩形的数量。这里的小矩形的高度取的是小区间右端的函数值。

> [0,1]区间的积分：large_number:definite_integral/riemann_integral/0_1/start
>
> 其他区间的积分：large_number:definite_integral/riemann_integral/start

2. 蒙特卡洛积分法

在[0,1]区间上对被积函数随机取样，当取样足够多时，取样值的数学期望就是被积函数在[0,1]上的积分。

对于非[0,1]区间的积分，则有变换公式：

$$
\int_a^bf(x)\mathrm{d}x=(b-a)\int_0^1f(a+(b-a)t)\mathrm{d}t
$$

详见：https://zhuanlan.zhihu.com/p/659412180

> [0,1]区间的积分：large_number:definite_integral/monte_carlo_method/0_1/start
>
> 其他区间的积分：large_number:definite_integral/monte_carlo_method/start

求解完成会有提示。

```
积分区域 下限[double]：storage large_number:math expression_evaluation.definite_integral.a 1.0
积分区域 上限[double]：storage large_number:math expression_evaluation.definite_integral.b 2.0
积分区间内小矩形的数量[int]：storage large_number:math expression_evaluation.definite_integral.dx_times 200
取正整数，上限是1000000000，不宜太多，一般取100~500。如果是蒙特卡洛积分法则此参数为取样次数。

输出：storage large_number:math expression_evaluation.definite_integral.output
如果算完后此路径不存在，则表明计算量过大，超出了单tick的命令执行量，需要异步计算。
```

　

♦ 曲线长度 - 一元函数在[a,b]内的图像长度：large_number:curve_length/univariate_function/start

"表达式求值 - 科学计算" 的拓展

采用折线拟合的方法，只能处理连续函数

函数表达式直接取 "表达式求值 - 科学计算" 解析出来的逆波兰式

```
区域 下限(double)：storage large_number:math expression_evaluation.definite_integral.a 2.0
区域 上限(double)：storage large_number:math expression_evaluation.definite_integral.b 3.0
区间内取样数量(int)：storage large_number:math expression_evaluation.definite_integral.dx_times 200
取正整数，上限是1000000000，不宜太多，一般取100~500。

输出：storage large_number:math expression_evaluation.univariate_function_length
```

　

♦ 数值导数

采用差商求导法

一阶导数中点公式：

$$
f'\left ( x_i \right )\approx\frac{f\left ( x_i+\Delta x \right )-f\left ( x_i-\Delta x \right )}{2\Delta x} 
$$

二阶导数公式：

$$
f''\left ( x_i \right )\approx\frac{f\left ( x_i+\Delta x \right )+f\left ( x_i-\Delta x \right )-2f\left ( x_i \right )}{\left(\Delta x\right)^2}
$$

所求导的函数直接取"表达式求值 - 科学计算"解析出来的逆波兰式

一阶导数值：large_number:differential/difference_quotient_method/1/start

二阶导数值：large_number:differential/difference_quotient_method/1/start

```
求导点的x值：storage large_number:math expression_evaluation.differential.input 1.0

Δx的大小：storage large_number:math expression_evaluation.differential.dx 0.04
Δx是一个较小的值，取值范围是[1, 1E-9]，因浮点误差的存在，此值不可太小，一般选0.01~0.001

一阶导数值：storage large_number:math expression_evaluation.differential.1output
二阶导数值：storage large_number:math expression_evaluation.differential.2output
```

　

♦ 圆

```
圆的半径(1000倍输入)：#3d.circle.r int
例如输入3000就是半径3

粒子密度：#3d.circle.angle int
粒子密度就是每隔"n/10"度描一个点，范围为1~3600

计算坐标：
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_rotation_circle/start

输出相对坐标列表：
x：storage large_number:math 3d_ar_rotation_circle_posX
y：storage large_number:math 3d_ar_rotation_circle_posY

显示粒子：
execute positioned x y z rotated x y run function large_number:particle/3d_ar_rotation_circle/particle
执行朝向就是圆的朝向，执行位置就是圆的原点
```

```
把圆染色成色环：function large_number:particle/rainbow_circle/start

输出颜色列表：storage large_number:math rainbow_circle_color

显示染色后的圆：
execute positioned x y z rotated x y run function large_number:particle/rainbow_circle/particle.macro1

通过旋转颜色列表可以实现霓虹灯那样的轮转闪烁效果，这是一个例子：
初始化：
data modify storage large_number:math rainbow_circle_color_list_rotate set from storage large_number:math rainbow_circle_color
显示粒子：
execute positioned x y z rotated x y run function large_number:particle/rainbow_circle/particle_list_rotate
```

♦ 五角星

两个算法均出自：https://www.bilibili.com/read/readlist/rl651851

算法一：公式法绘制

```
半径(100倍输入)：#3d.pentagram.r int
例如输入500就是半径5

粒子密度：#3d.pentagram.density int
粒子密度就是每隔"n/10"度描一个点，范围为1~3600

五角星的横滚角(1000倍输入)：#3d.pentagram.roll.θ int

计算坐标：
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_rotation_pentagram/start
```

算法二：摆线法绘制

就是把高频的盔甲架旋转变成了函数递归

```
半径(10000倍输入)：#3d.pentagram_epi.r int

摆线进行圆周运动时的转速：#3d.pentagram_epi.speed int
范围[1,7200000]。参考值：输入20000适中
函数递归的次数与转速相关，为了确保绘制出完整的图形，转速越慢得到的粒子坐标越多，转速越快粒子坐标越少。递归次数上限=7200000/转速

五角星的横滚角(10000倍输入)：#3d.pentagram_epi.roll.θ int

计算坐标：
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_rotation_pentagram/epicycloid/start
```

图形显示

```
输出相对坐标列表：
storage large_number:math 3d_ar_rotation_pentagram_pos
其中每一个子列表的第一项是x，第二项是y

显示粒子：
execute positioned x y z rotated x y run function large_number:particle/3d_ar_rotation_pentagram/particle
执行朝向就是五角星的朝向，执行位置就是五角星的位置
```

♦ 椭圆

```
1000倍输入 a：#3d.ellipse.a int
1000倍输入 b：#3d.ellipse.b int
1000倍放大后的粒子圆的输入区间为[1,2147483]

粒子密度：#3d.ellipse.density int
粒子密度就是每隔"n/10"度描一个点，范围为1~3600

横滚角(1000倍输入)：#3d.ellipse.roll.θ int

计算坐标：
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_ellipse/start

输出相对坐标列表：storage large_number:math 3d_ar_ellipse_pos
其中每一个子列表的第一项是x，第二项是y

显示粒子：
execute positioned x y z rotated x y run function large_number:particle/3d_ar_ellipse/particle
执行朝向就是椭圆的朝向，执行位置就是椭圆的位置
```

　

♦ 粒子球 (斐波那契网格)

球面均匀取点方法：若是从球面上取n个点，则是把球横着切成n层，让这些点沿着球面从球底爬到球顶，每爬一层就绕着这一层的圆心转0.618圈。

相关链接：https://zhuanlan.zhihu.com/p/25988652

```
球的半径：storage large_number:math 3d_hsphere_pos_R 0.0

在球面上取的点的数量：#3d.hsphere.points int
输入区间为[1,40000]

计算坐标：
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_hsphere/start

输出相对坐标列表：storage large_number:math 3d_hsphere_pos
其中每一个子列表的第一项是x，第二项是y，第三项是z

显示粒子：
execute positioned x y z rotated x y run function large_number:particle/3d_hsphere/particle/start
传入执行位置和执行朝向
```

另可在球面上的点上执行其他命令：

```
在球面上的点上要执行的命令：
storage large_number:math 3d_block_hsphere_execute "setblock ~ ~ ~ glass"

执行命令：
execute positioned x y z rotated x y run function large_number:particle/3d_block_hsphere/set/start
传入执行位置和执行朝向
```

　

♦ 全息粒子投影 - 16x16x16投影至1x1x1

把染色混凝土投影为dust粒子

扫描一次后，粒子颜色和坐标等信息会存入数据库，就算扫描区清空了也一样可以投影

添加可解析方块：

在函数 "particle/holographic_projection/if" 里的第18行开始添加如下格式的命令：

`execute if block ~ ~ ~ <方块ID|方块标签>[方块状态]{数据标签} run data modify storage large_number:math temp_particle set value "<dust粒子的四个特殊参数>"`

方块状态和数据标签都是可选的

```
先扫描：execute positioned x y z run function large_number:particle/holographic_projection/scan.start
执行位置需要在扫描区域的西北下角
聊天栏出现"全息粒子投影：扫描完成！"时即为扫描完成。

投影：execute rotated 0.0 0.0 positioned x y z run function large_number:particle/holographic_projection/execute with storage large_number:math holographic_projection_database
需要传入投影点和投影角度，投影的位移和旋转的基点在投影的底面中心
会触发函数宏的缓存机制，可高频执行

清空数据库：data remove storage large_number:math holographic_projection_database
```

　

♦ 抛物线 (二次函数)

1.把三点坐标解析为二次函数表达式的abc：large_number:parabola/3point_ope_coef.abc

原理：加减消元法求解三点对应的三元一次方程组。

```
输入：storage large_number:math parabola_points [[0.0,0.0],[0.0,0.0],[0.0,0.0]]
输入二维坐标点，取整数和第一位小数

输出(放大一千倍)：#coef.a int，#coef.b int，#coef.c int
```

2.解析二次函数的表达式为点的相对坐标：large_number:parabola/analysis.start

公式：`f(x)=ax²+bx+c`

解析后坐标会存入列表里，不用每次都解析

```
以一千倍输入系数：#coef.a int，#coef.b int，#coef.c int
以一百倍输入起始X值：#parabola_expre_x.start int
输入步数：#parabola_expre_x.length int
以100倍输入步长：#parabola_expre_x.step_size int

输出相对坐标列表：
x：storage large_number:math parabola_expre_x
y：storage large_number:math parabola_expre_y

显示抛物线表达式：set #parabola_.tellraw int 1
显示以下JSON文本便可显示抛物线表达式：
["f(x)=",{"nbt":"parabola_tellraw.a","storage":"large_number:math"},"x²",{"nbt":"parabola_tellraw.1","storage":"large_number:math"},{"nbt":"parabola_tellraw.b","storage":"large_number:math"},"x",{"nbt":"parabola_tellraw.2","storage":"large_number:math"},{"nbt":"parabola_tellraw.c","storage":"large_number:math"}]
```

3.显示抛物线的轨迹：`execute positioned x y z rotated 0.0 0.0 run function large_number:parabola/particle`

需要传入执行位置和执行朝向

```
模式：#parabola_expr_particl_mode int
可选1或2，区别就是粒子的参考系不同，可以应对不同的旋转需求
模式1粒子是从执行朝向的左方向出发，模式2是粒子从执行朝向的前方出发

抛物线的位移和旋转基点是它的起始点
```

　

♦ 阿基米德螺线 (等速螺线)

公式：`r=a+bθ`

```
1000倍输入a：#archimedean_spiral.a int
1000倍输入b：#archimedean_spiral.b int
100倍输入起始角度：#archimedean_spiral.startθ int
100倍输入弧长步长：#archimedean_spiral.arc_size int
100倍输入角度步长：#archimedean_spiral.θ_size int
步数：#archimedean_spiral.length int
n步后使用弧长来计算点的间隔：#archimedean_spiral.to_arc int

计算坐标：function large_number:particle/archimedean_spiral/start

输出相对坐标列表：
x：storage large_number:math archimedean_spiral_out_listX
y：storage large_number:math archimedean_spiral_out_listY

显示粒子：execute positioned x y z rotated x y run function large_number:particle/archimedean_spiral/particle
需要传入执行位置和执行朝向
```

一个较好的预设：a为100，b为8，起始角度为0，弧度步长35，角度步长1000，30步后使用弧长

　

♦ 等角螺线 (对数螺线)

公式：`θ=a*ln(b*r)`

```
a：#equiangular_spiral.a int
b：#equiangular_spiral.b int
1000倍输入起始半径：#equiangular_spiral.start_r int
1000倍输入半径步长：#equiangular_spiral.r_size int
步数：#equiangular_spiral.length int

计算坐标：function large_number:particle/equiangular_spiral/start

输出相对坐标列表：
x：storage large_number:math equiangular_spiral_out_listX
y：storage large_number:math equiangular_spiral_out_listY

显示粒子：execute positioned x y z rotated x y run function large_number:particle/equiangular_spiral/particle
需要传入执行位置和执行朝向
```

一个范例：a为5000，b为560，起始半径是0，步长是50，步数是250

　

♦ 二维网格排列

```
1000倍输入 行间隔：#Matrix_arrangement.rsize int
1000倍输入 列间隔：#Matrix_arrangement.csize int
1000倍输入 偶数行偏移：#Matrix_arrangement.tab int
行数：#Matrix_arrangement.Rows int
列数：#Matrix_arrangement.Columns int
计算坐标：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:matrix_arrangement/start

输出的是阵列的x和z的相对坐标列表
坐标的相对x值列表：storage large_number:math matrix_arrangement_X
坐标的相对z值列表：storage large_number:math matrix_arrangement_Z

一个使用函数宏访问坐标列表的范例：execute positioned x y z rotated x y run function large_number:matrix_arrangement/summon
需要传入执行位置和执行朝向
```

　

♦ 二阶贝塞尔曲线

公式：

$$
B\left ( t \right )=\left ( 1-t \right )^2P_0+2t\left ( 1-t \right )P_1+t^2P_2,\ t\in \left [ 0,1 \right ]
$$

```
输入

一千倍输入三点坐标：
#bezier_curve_II.P0.x int
#bezier_curve_II.P0.y int
#bezier_curve_II.P0.z int

#bezier_curve_II.P1.x int
#bezier_curve_II.P1.y int
#bezier_curve_II.P1.z int

#bezier_curve_II.P2.x int
#bezier_curve_II.P2.y int
#bezier_curve_II.P2.z int

一万倍输入t的步长：#bezier_curve_II.t.size int

计算坐标：function large_number:particle/bezier_curve_2/start

输出相对坐标列表：
storage large_number:math bezier_curve_II_list

显示粒子：execute positioned x y z rotated x y run function large_number:particle/bezier_curve_2/particle
传入执行位置和执行朝向
```

　

♦ 心形线

公式：

$$
\begin{aligned}
& \mathrm{上半段：}\sqrt {r\left | {x} \right |-{x}^{2}} \\
& \mathrm{下半段：}\frac {r} {2}\left ( {\arccos {\left ( {1-\left | {\frac {2x} {r}} \right |} \right )}-\pi} \right )
\end{aligned}
$$

对于上半段，实际计算中并不会开根号，而是直接用局部坐标法画圆。

对于下半段，实际计算中并不会计算arccos，而是用y值代入公式的反函数逆推x，所以实际上计算的是cos。

```
半径 (10000倍输入)：#heart-shaped_line.r int
上半段粒子密度 (单位为角度度数，10000倍输入)：#heart-shaped_line.t_d int
下半段粒子密度 (单位为格，10000倍输入)：#heart-shaped_line.t int

计算坐标：
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/heart-shaped_line/start

输出相对坐标列表：storage large_number:math heart-shaped_line_Pos
其中每一个子列表的第一项是x，第二项是y

显示粒子：execute positioned x y z rotated x y run function large_number:particle/heart-shaped_line/particle
传入执行位置和执行朝向
```

　

♦ 色轮

```
显示色环：execute positioned x y z rotated x y run function large_number:color_wheel/particle1
传入执行位置和执行朝向

10000倍输入色环上的颜色指针角度(逆时针方向)：#color_wheel.angle.input int
输入区间为：[0,3600000]
用粒子标记色环指针指向的位置：set #color_wheel.see_marker int 1
计算色相立方的颜色信息：function large_number:color_wheel/in/start

输出色环指针处的RGB值：
#color_wheel.output.R int
#color_wheel.output.G int
#color_wheel.output.B int
色相立方的粒子信息表：storage large_number:math color_wheel_color_cube_RGB

显示色相立方：execute positioned x y z rotated x y run function large_number:color_wheel/in/particle/start
传入执行位置和执行朝向

10000倍输入色相立方的颜色坐标：
#color_cube.u int
#color_cube.v int
这是两个百分比，u表示颜色坐标和色相立方右上角起始点的横向距离，v表示颜色坐标和色相立方右上角起始点的纵向距离
输入区间皆为[0,10000]

计算颜色坐标：function large_number:color_wheel/in/ope_uv_color/start

输出RGB值：
#color_cube.R int
#color_cube.G int
#color_cube.B int
```

　

♦ 直线

```
1000倍输入 总长度：#3d_straight_line.length int
1000倍输入 点的间隔：#3d_straight_line.density int

计算坐标：function large_number:particle/3d_straight_line/start

输出相对坐标列表：storage large_number:math 3d_straight_line_Pos
直线是一维图形，所以只有一个变量

显示粒子：execute positioned x y z rotated x y run function large_number:particle/3d_straight_line/particle
传入执行位置和执行朝向
```

　

♦ 正多边形

```
1000倍输入 图形的横滚角：#regular_polygon.startθ int
当角度为-90时，图形的第一个顶点是垂直向上的
1000倍输入 图形的半径：#regular_polygon.r int
1000倍输入 粒子的间隔：#regular_polygon.size int
图形的边数：#regular_polygon.n int

计算坐标：
内接正多边形：execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:particle/regular_polygon/start
外切正多边形：execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:particle/regular_polygon/tangent_start

输出相对坐标列表：storage large_number:math regular_polygon_Pos
其中每一个一级子列表表示多边形的一条边，每个二级子列表的第一项是x，第二项是y
控制列表内的一级子列表数量可以自由定义要显示哪条边

显示粒子：execute positioned x y z rotated x y run function large_number:particle/regular_polygon/particle
传入执行位置和执行朝向
```

　

♦ N阶贝塞尔曲线

公式：

$$
B(t)=\sum_{i=0}^{n}P_i
\begin{pmatrix}
n \\
i
\end{pmatrix}
(1-t)^{n-i}t^i,\ t\in[0,1]
$$

说明：Pi表示点的坐标。Pi是按顺序把控制点的各个坐标轴的信息代入算出曲线在该坐标的信息。也就是说，贝塞尔曲线是以"参数方程"的形式计算的，参变量为t。

也就是说。例如有三个控制点：[[x0, y0, z0],[x1, y1, z1],[x2, y2, z2]]

则先代入x0、x1、x2计算出曲线的x坐标，然后y0、y1、y2计算出曲线的y坐标……以此类推。

n是阶数。(n,i)是二项式系数，也就是从n个物品里取出i个物品的组合数。公式：

$$
\begin{pmatrix}
n \\
i
\end{pmatrix}
=\frac{n!}{i!(n-i)!}
$$

```
输入：large_number:math bezier_curve_N_input []
按顺序输入各个控制点的三维坐标，阶数=点数-1
支持1~33阶

一万倍输入t的步长：#bezier_curve_N.t.size int

计算坐标：function large_number:particle/bezier_curve_n/start
解析完成会有提示

输出相对坐标列表：
storage large_number:math bezier_curve_n_Pos
阶数：#bezier_curve_N.order int

显示粒子：execute positioned x y z rotated x y run function large_number:particle/bezier_curve_n/particle
传入执行位置和执行朝向，位移和旋转的基点是曲线的第一个点
```

　

♦ 星形线

第一类：P范数定义

此类星形线的本质是P范数下的等距图形

公式：

$$
|x| ^ p+|y| ^ p=r ^ p
$$

参见：https://zhuanlan.zhihu.com/p/702594704，https://zhuanlan.zhihu.com/p/591627726

```
半径：#star_line.r int
粒子间距(单位：格)：#star_line.step int
横滚角：#star_line.roll int
P：#star_line.p int
除了横滚角都必须是正数，皆放大一万倍输入

计算坐标：function large_number:particle/star_line/start
星形线可分成八个相同的部分，因此星形线只有其中1/8是算P范数得到的，其余都是依此部分变换得到

输出相对坐标列表：storage large_number:math star_line_Pos

显示粒子：execute positioned x y z rotated x y run function large_number:particle/star_line/particle
传入执行位置和执行朝向，位移和旋转的基点是星形的中心
```

第二类：四圆拼接定义

公式：

$$
\begin{aligned}
& (x+r)^2+(y+r)^2=r^2\\
& (x+r)^2+(y-r)^2=r^2\\
& (x-r)^2+(y+r)^2=r^2\\
& (x-r)^2+(y-r)^2=r^2\\
\end{aligned}
$$

这四个圆中间的间隙便是第二类星形线

已用算法验证，此类星形线无法用P范数定义，详见：https://www.zhihu.com/question/660564331

比第一类自由度差，但计算消耗更低

```
半径：#star_line.r int
粒子间距(单位：度)：#star_line.step.θ int
横滚角：#star_line.roll int
除了横滚角都必须是正数，皆放大一万倍输入

计算坐标：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/star_line/2/start

显示粒子：execute positioned x y z rotated x y run function large_number:particle/star_line/particle
传入执行位置和执行朝向，位移和旋转的基点是星形的中心
```

　

♦ 模拟闪电

参考自：https://www.bilibili.com/video/BV1BBtVeaEWv

```
端点间距 (放大一千倍，正数)：#lightning_bolt.length int
给定单段长度最大值 (放大一百倍，必须为小于等于端点间距的正数)：#lightning_bolt.a_segment int
k值（放大一万倍）：#lightning_bolt.k int
k值类似于波动倍率，能直接控制闪电波动的强度，范围是[0,0.5]。当k为0时闪电是一条直线段。推荐设置值为2376。

计算坐标：function large_number:particle/lightning_bolt/start

输出相对坐标列表：
storage large_number:math lightning_bolt_Pos

显示粒子：execute positioned x y z rotated x y run function large_number:particle/lightning_bolt/particle
传入执行位置和执行朝向，位移和旋转的基点是曲线的第一个点

另有瞬时闪电：
execute positioned x y z rotated x y run function large_number:particle/lightning_bolt_instant/start
直接把计算出来的坐标用于显示粒子。传入执行位置和执行朝向，位移和旋转的基点是曲线的第一个点
```

　

♦ 发射抛射物使其命中目标点

原理：https://www.bilibili.com/read/cv14512834

```
抛射方法一：根据dt计算初速度
设置从起始点到达目标点所需时间(单位：tick)：#dt int
计算：function large_number:parabola/fire/shoot
需要传入抛射目标为执行者，传入目标点为执行位置，定义抛射目标在执行时的位置为抛物线的起始点
同时可计算出抛射角：#para.launch_angle.x int，#para.launch_angle.y int

抛射方法二：根据抛射角计算dt和初速度
计算：function large_number:parabola/fire/degree_to_dt
需要传入抛射目标为执行者，传入目标点为执行位置，定义抛射目标在执行时的位置为抛物线的起始点，而且还需传入抛射角为执行朝向
在计算过程中为保证对应的dt为正整数，会把抛射角进行一定的修正
输出修正后的抛射角：#para.launch_angle.x int，#para.launch_angle.y int

进行抛射
计算好初速度的抛射物会被加上tag：missile_shot
高频执行：execute as @e[tag=missile_shot] unless score @s t >= @s int run function large_number:parabola/fire/motion

判断是否命中目标点：execute as <抛射物> if score @s t >= @s int
```

已知问题：抛射方法二由于计算过程中会进行小数位数取舍，因此多次计算会导致抛射角不断偏离输入值，因此需要在计算前留存一份输入的抛射角以供校准。

　

♦ 圆锥选区

1. 动态参数的圆锥选区：large_number:geometry/conical_selection_area/start

传入执行位置、执行高度和执行朝向

```
圆锥长度：storage large_number:math conical_selection_area.distance
可以是任意数值类型

圆锥顶角的一半：storage large_number:math conical_selection_area.angle
可以是任意数值类型

被选中的实体执行的命令：storage large_number:math conical_selection_area.command "effect give @s glowing 1 0 true"
```

2. 静态参数的圆锥选区

```
创建一个函数a，内写：
execute positioned .0 .0 .0 run tp <世界实体> ^ ^ ^1
execute as @e[distance=..<圆锥长度>] facing entity @s feet positioned .0 .0 .0 positioned ^ ^ ^1 run function b

把以下两条命令放在函数b里
execute as <世界实体> store success score #temp1 int if entity @s[distance=..<2*|sin(α/2)|>]
execute if score #temp1 int matches 1 run <被选中的实体执行的命令>

α是圆锥顶角的一半，2*|sin(α/2)|的值域为[0,2]，表示圆锥夹角张开的幅度，其中||表示绝对值
传入执行位置、执行高度和执行朝向后执行函数a
```

　

♦ 扇形选区

1. 动态参数的扇形选区：large_number:geometry/conical_selection_area/fan-shaped/start

传入执行位置、执行高度和执行朝向

```
扇形半径：storage large_number:math conical_selection_area.distance
可以是任意数值类型

扇形顶角的一半：storage large_number:math conical_selection_area.angle
可以是任意数值类型

被选中的实体执行的命令：storage large_number:math conical_selection_area.command "effect give @s glowing 1 0 true"
```

2. 静态参数的扇形选区

```
创建一个函数a，内写：
execute rotated ~ .0 positioned .0 .0 .0 run tp <世界实体> ^ ^ ^1
execute as @e[distance=..<扇形半径>] facing entity @s feet rotated ~ .0 positioned .0 .0 .0 positioned ^ ^ ^1 run function b

把以下两条命令放在函数b里
execute as <世界实体> store success score #temp1 int if entity @s[distance=..<2*|sin(α/2)|>]
execute if score #temp1 int matches 1 run <被选中的实体执行的命令>

α是扇形顶角的一半，2*|sin(α/2)|的值域为[0,2]，表示扇形夹角张开的幅度，其中||表示绝对值
传入执行位置、执行高度和执行朝向后执行函数a
```

　

♦ 圆柱选区

1. 动态参数的圆柱选区：`execute as b09e-44-fded-6-efa5ffffef64 run function large_number:geometry/cyl_selection/dynamic/start`

传入执行位置

```
圆柱半径：storage large_number:math cyl_selection.distance 1.0
被选中的实体执行的命令：storage large_number:math cyl_selection.command "effect give @s glowing 1 0 true"
```

2. 静态参数的圆柱选区

```
创建一个函数a，内写：
tp ~ .0 ~
execute as @e at @s positioned ~ .0 ~ run function b
tp .0 .0 .0

把以下两条命令放在函数b里
execute as <世界实体> store success score #temp1 int if entity @s[distance=..<圆柱半径>]
execute if score #temp1 int matches 1 run <被选中的实体执行的命令>

传入执行位置后让世界实体执行函数a
```



♦ 快速取中点——三维两点的粗略中点：`execute as b09e-44-fded-6-efa5ffffef64 run function large_number:geometry/3d_2point_midpoint/start`

```
点1：storage large_number:math 3d_2point_midpoint.p1 [0.0, 0.0, 0.0]
点2：storage large_number:math 3d_2point_midpoint.p2 [0.0, 0.0, 0.0]

输出：storage large_number:math 3d_2point_midpoint.output
```

　

♦ 快速视线追踪

```
创建一个函数a，内写：
tag @s add large_number.fast_raycast
execute as b09e-44-fded-6-efa5ffffef64 run function b
tag @s remove large_number.fast_raycast

函数b里写：
execute positioned ^ ^ ^ run tp @s ^ ^ ^ ~ ~
execute as @e[tag=!large_number.fast_raycast] at @s positioned ~ ~1 ~ \
    rotated as b09e-44-fded-6-efa5ffffef64 \
    positioned ^ ^ ^1000 \
    facing entity b09e-44-fded-6-efa5ffffef64 feet \
    positioned ^ ^ ^1000 \
    facing entity @s feet positioned ^ ^ ^.15 \
    positioned ~-.2 ~-.15 ~-.2 \
    as @s[dx=0,dy=0,dz=0] \
    positioned ~-.6 ~.3 ~-.3 \
    at @s[dx=0,dy=0,dz=0] \
    run <视追捕捉到的实体执行的命令>
tp .0 .0 .0
```

一个案例：`execute at <实体> anchored eyes run function large_number:fast_ray/start`

视追捕捉到的实体会发光

　

♦ 行列式

1.判断输入值是否为行列式：large_number:determinant/order

行列式输入规则：必须有两层列表，每个子列表表示一行。如果该行某个元素为0也必须输入0，不支持元素省略。

例如 [[4,15,7],[6,13,4],[28,2,12]] = 

$$
\begin{vmatrix}
 4 & 15 & 7 \\
 6 & 13 & 4 \\
 28 & 2 &12
\end{vmatrix}
$$

```
输入：storage large_number:math determinant_evaluate.input [[4,15,7],[6,13,4],[28,2,12]]

阶数：#determinant.order int
-1表示输入的行列式错误
```

2.基础行列式求值：large_number:determinant/evaluate/start

仅支持1~7阶，输入值仅接受int

用代数余子式一层层按行展开，最终把高阶行列式展开成多个三阶行列式

```
输入：storage large_number:math determinant_evaluate.input [[4,15,7],[6,13,4],[28,2,12]]

输出：storage large_number:math determinant_evaluate.output
阶数：storage large_number:math determinant_evaluate.order
```

3.整数列表的逆序数：large_number:determinant/inversion_number/start

规定正序排列为从小到大

```
输入：storage large_number:math invers_num_inp [0,1,7,9,6,14,28,5]

输出：#invers_num.output int
若输入的列表没有重复项，且逆序数=(元素数-1)*元素数/2，则列表元素为从大到小排列。
```

　

♦ 组合数：large_number:combinations/start

从n个元素中选择k个元素的组合数

```
n：#combinations.n int  范围：[0,33]
k：#combinations.k int

输出：函数的返回值
```

　

♦ 计算圆周率π

我们mcf也有自己的计算圆周率的算法了。最高支持10000位。

原理：https://zhuanlan.zhihu.com/p/114320417

1. 单刻计算：large_number:ope_pi/single_use/start

感觉单tick算5000位差不多就是mcf的上限了，我算5000位跑了4分17秒。

2. 分步计算：

适用于大于等于1000位。

需要按tick执行 `large_number:ope_pi/different_steps/block/tick` 函数，然后以命令 `scoreboard players set #pi.different_steps.mode lan.pi_information 1` 为开始信号，结束信号是屏幕播报出 “[圆周率 π]：计算完成！”。

分步计算是把计算任务分配给多个tick来降低单tick的游戏负载。计算产生的信息都存在命令存储 `large_number:pi_information` 和记分板 `lan.pi_information` 里。计算过程中不要动这里面的内容。算一万位大概耗时11分40秒。

```
位数：set #ope_pi.digit int

输出：storage large_number:pi_information pi
是一个字符串列表，数位自动靠后对齐。是使用大数格式计算的，所以格式类似万进制数组。

显示以下JSON文本可显示输出：
[{"text":"[\u00A7e卡儿的数学库\u00A7r]\n圆周率π ["},{"score":{"name":"#ope_pi.digit","objective":"int"}},{"text":"位]：\n"},{"nbt":"pi[]","storage":"large_number:pi_information","separator":""}]

关于输出：
1.为什么是列表？因为是用万进制数组计算的
2.为什么是字符串？为了能显示每个万进制数字的前导0
3.为什么不拼一起？因为拼一起要用递归+宏，那是额外的开销
```



♦ 参考文献：

> 小豆数学库：https://github.com/xiaodou8593/math2.0
>
> 知乎.手动开根——牛顿迭代法：https://zhuanlan.zhihu.com/p/497508702
>
> 知乎.手动开根——竖式开方法：https://zhuanlan.zhihu.com/p/517358606
>
> 小豆.用命令做一个简易的开根号：https://www.bilibili.com/read/cv5789989
>
> 天起源.T算法库：https://www.mcmod.cn/class/11569.html
>
> 计算机系统数学原理：http://mathmu.github.io/publications/mathematical-theory-of-computer-algebra-system
>
> 【动画密码学】Base64编码&解码算法：https://www.bilibili.com/video/BV1Hp4y1g7Ex
>
> 卡儿.实数平方根的估值与连分数展开 (提取码 sr8j)：https://pan.baidu.com/s/1eoeChhk7xukIIYxexmMwJQ?pwd=sr8j
>
> 知乎.最大公约数GCD算法：https://zhuanlan.zhihu.com/p/38100838
>
> 卡儿.《我的世界》【1.16.5】Java版实用粒子教程：https://www.bilibili.com/read/readlist/rl651851
>
> 数值分析 第五版 (李庆扬 王能超 易大义) (提取码：dker)：https://pan.baidu.com/s/17aYm5onfSbsxH4TmL00mmQ?pwd=dker 

工具：GeoGebra，Desmos，Excel，Python

