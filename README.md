## 卡儿的数学库

相关概念：万进制数组、分段存储、浮点型、double型、前导0、绝对值、常数、精度、科学记数法

如果万进制数组中的元素不足四位，则读数时应向前补0补足四位

　

♦ 六个基本三角函数：math_trifs/_of_entity

```
输入：entity b09e-44-fded-6-efa5ffffef64 Rotation[0] set value 0.0f
输出：#sin int，#cos int，#tan int，#cot int，#sec int，#csc int
```

♦ 双参数反正切(atan2d)：math_trifs/atan2

```
输入：#y int，#x int
公式：atan2d(y,x)*10000
运行：as b09e-44-fded-6-efa5ffffef64 run func.. 
输出：data get entity b09e-44-fded-6-efa5ffffef64 Rotation[0]
```

♦ 如果只想要正弦和余弦值的话，仅需四条命令：

```
#输入
data modify entity b09e-44-fded-6-efa5ffffef64 Rotation[0] set value 0.0f

#计算
execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 rotated as @s rotated ~ 0.0 positioned .0 .0 .0 run tp @s ^1.0 ^ ^ ~ ~

#sin
data get entity b09e-44-fded-6-efa5ffffef64 Pos[2]

#cos
data get entity b09e-44-fded-6-efa5ffffef64 Pos[0]
```

　

♦ 大数加法：addition/start

```
加数1：storage math addition.input1 [I;0,0,0]
加数2：storage math addition.input2 [I;0,0,0]
和：storage math addition.output
```

♦ 大数减法：subtraction/start

```
被减数：storage math subtraction.input1 [I;0,0,0,0]
减数：storage math subtraction.input2 [I;0,0,0,0]
差：storage math subtraction.output
```

♦ 展示实体法浮点数除法

```
输入   列表里第1、6、11个是被除数，最后一个数是除数
data modify entity 28529-0-3d00-0-2c4200ee8401 transformation set value [1.0f,0.0f,0.0f,0.0f,0.0f,1.0f,0.0f,0.0f,0.0f,0.0f,1.0f,0.0f,0.0f,0.0f,0.0f,1.0f]

输出
data get entity 28529-0-3d00-0-2c4200ee8401 transformation.scale
```

现有一个利用展示实体矩阵做的数组除法的案例：division/display_large_number/start

```
被除数
storage math display_div_large.input.dividend1 [I;0,0,0]
storage math display_div_large.input.dividend2 [I;0,0,0]
storage math display_div_large.input.dividend3 [I;0,0,0]

除数
storage math display_div_large.input.divisor [I;0,0,0]

输出
data get entity 28529-0-3d00-0-2c4200ee8401 transformation.scale
```

♦ 十进制浮点型除法：division/hpo/_div

[见附录]

　

♦ 对整数进行任意倍乘：int_mul_by_n/start

```
输入整数：storage math int_mul_by_n.input_int
输入倍率：math int_mul_by_n.input_n
要输出的数据类型：math int_mul_by_n.data_type "double"

输出：storage math int_mul_by_n.output
```
输入的"整数"可以为非整数，但会按照整数来处理，向下取整并把范围钳制在整型范围内

输入的"倍率"可以为任何数值，但计算时会忽略数据单位并转化为浮点型

可选的数据类型："byte"、"float"、"double"、"short"、"int"、"long"

　

♦ 任意整型数字相乘：int_int_multiply

```
因数1：input int
因数2：input.2 int
积：storage math int_int_multiply.output
```

♦ 任意整型数字平方：int_square

```
输入：input int
输出：storage math int_squ
```

♦ 12位数字相乘：1we_multiply

```
因数1：storage math 1we_multiply.input1 [I;0,0,0]
因数2：storage math 1we_multiply.input2 [I;0,0,0]
积：storage math 1we_multiply.output
```

♦ 12位数字平方：1we_square

```
输入：storage math 1we_squ.input [I;0,0,0]
输出：storage math 1we_squ.output
```

　

♦ 整型数字拆分为数组：cut_math_to_list

```
输入：input int
输出：#sign int (符号)，#1st int，#2nd int，#3rd int
```

　

♦ 整型数字开方：

1.取整：int_sqrt_simple

2.带结果验证的取整(结果总是会向下取整)：int_sqrt_simple_vali

3.保留四位小数：int_sqrt

4.保留7\~9位小数：test_int_more_dicimal

#开1\~5位，保留9位；开6\~7位，保留8位；开8~10位，保留7位

5.保留4\~8位小数：int_sqrt_expansive

#开1位，保留8位，开2\~3位，保留7位，开4\~5位时，保留6位，开6\~7位，保留5位，开8\~10位，保留4位

#有时求得的最后一位小数会有稍许的精度损失

#如果保留小数位数不足期望的位数，则读数时应在数的前面补0补足数位

```
输入：input.sqrt int
开根整数部分：output.sqrt int
开根小数部分：output.dicimal int
```

♦ 整型数字开方 - 连分数迭代法：sqrt_continued_fraction/start

适用于万以内的数，精确度可达12位小数。

因分子分母都是以单段计分板存储，并非大数数组格式，因此要小心数值溢出。

连分数迭代法的小数部分是以分式形式输出的。

整合后输出的分式就是整个开根结果的分式形式。

数值溢出的标志：分子分母至少有一个是负数。

```
输入：#conti_frac.sqrt.input int
迭代次数：#conti_frac.sqrt.loops int
整合：set #conti_frac.sqrt.merge int 1
约分：set #conti_frac.sqrt.reduction_fraction int 1

输出：
整数部分：#conti_frac.sqrt.inte int
分子：#conti_frac.sqrt.A
分母：#conti_frac.sqrt.N
```

♦ 16位数字开方(取整)：large_sqrt_digit16

```
输入：storage math large_sqrt_digit16.input [I;0,0,0,0]
输出：storage math large_sqrt_digit16.output2
高精度模式：set #large_sqrt16.test16 int 1
```

♦ 24位数字开方(取整)：large_sqrt

```
输入：storage math large_sqrt.input [I;0,0,0,0,0,0]
输出：storage math large_sqrt.output
```

为了避免浪费算力，请按照如下优先级使用：整型范围内选整型数字开方，10~16位数字选16位数字开方，最后再考虑24位数字开方。

高精度模式是16位整数开方算法的特性，为了追求高效率选用了高精度猜测法，代价是最后一位会有稍许的精度损失。仅在处理16位数的时候会有这种特性。

高精度模式就是通过平方根自我平方对比原数来验证大小，自己决定要不要开。

　

♦ 立方体求对角线 (欧几里得范数，三维向量模长)：

普通立方体求对角线 (保留四位小数)：int_3d_vector

```
输入：x int，y int，z int
开根整数部分：vec_.output int
开根小数部分：vec_.dicimal int
取值范围：x²+y²+z² ≤ 2147483647
```

大立方体求对角线 (取整)：vast_3d_vector

```
输入：
storage math vast_3d_vector.input.x [I;0,0]
storage math vast_3d_vector.input.y [I;0,0]
storage math vast_3d_vector.input.z [I;0,0]
输出：math vast_3d_vector.output
取值范围：10^9 ≤ x²+y²+z² ≤ 10^16 -1

高精度模式：set #large_sqrt16.test16 int 1
```

　

♦ double转int数组：

普通转化：double_to_int

考虑到科学记数法的转化：double_to_int_sci

函数宏法转化：macro_operation/double_to_int_macro

考虑到科学记数法的函数宏法转化：macro_operation/double_to_int_macro_sci

```
输入：storage math double_to_int.input 0.0d
输出：math double_to_int.output
```

参数介绍：math 数值，sign 符号，expon 指数，point 小数点位置，leading_zeros 前导零数量

读数顺序：数值>前导零数量>小数点位置>指数>符号

函数宏仅是节省了命令数，是否节省了开销还需验证。

　

♦ double型开方：

普通开方：double_sqrt

考虑到科学记数法的开方：double_sqrt_sci

```
输入：math double_sqrt.input 0.0d
输出：storage math double_sqrt.output
高精度模式：set #large_sqrt16.test16 int 1

对于科学记数法形式的开方，把结果的底数和指数合并：
set #double_sqrt.integrate_sci_math int 1
```

参数介绍：int 用整型表示的结果，double 小数点还原的结果，expon 小数形式的结果的指数，double_sci 把小数部分和指数部分整合起来的最终结果

考虑到科学计数法的double转化与double开方也会处理正常表示的double型。

double转int、double型开方对float型数值也有效。

　

♦ 整数的自然对数 ln(x)：ln/start

精度：误差不超过0.0009，保留四位小数，若小数部分数位不足四位，则在前面补前导0补足数位

```
计算前需要载入初始数据库：function large_number:ln/ln_database
输入：#ln(x) int
结果的整数部分：#ln(x).integer int
结果的小数部分：#ln(x).dicimal int
double型输出：storage math ln_output

卸载初始数据库：function large_number:ln/uninstall_ln_database
```

♦ 非整数的自然对数 ln(x)：ln_with_dicimal/start

限取输入值的前九位(整数部分+小数部分一共最多取九位)

若输入值为科学计数法，则取的值是展开后的前九位，若整数部分达到了九位则只取整数部分

数值范围为区间：[1,2147483647]，保留四位小数

```
计算前需要载入初始数据库：function large_number:ln/ln_database

输入：storage math ln_with_dicimal.input 12.334d

输出：
整数部分：#ln_wd.out.inte int
小数部分：#ln_wd.out.dicimal int
double型输出：storage math ln_with_dicimal.output
```

♦ 任意正整数的对数：loga.b/start

保留八位小数，若小数部分数位不足八位，则在前面补前导0补足数位

```
计算前需要载入初始数据库：function large_number:ln/ln_database

输入：
底数：#loga.b_a int
真数：#loga.b_b int

输出：
整数部分：#loga.b.inte int
小数部分：#loga.b.dicimal int
double型输出：storage math "log.a(b).output"
```

♦ 整数的常用对数：lg/start

保留八位小数，若小数部分数位不足八位，则在前面补前导0补足数位

```
计算前需要载入初始数据库：function large_number:ln/ln_database

输入：#lg(x) int

输出：
整数部分：#lg(x)_out_inte int
小数部分：#lg(x)_out_dicimal int
double型输出：storage math lg(x)_output
```

　

♦ 24位数字显示

有自适应数位：digital_display

没有自适应数位：24_digital_display

区别：后者必须在数组内输入六个数才能正常显示数位，而前者不必

每三位数一组用逗号隔开。若数组中任意一个数为负数，则视为整个数组为负

```
输入(万进制数组)：storage math math_display [I;0,0,0,0,0,0]

显示以下JSON文本便可显示数字：
{"nbt":"math_display_json_string","storage":"math","interpret":true}
```

　

♦ 单位向量法测距

1.输入任意两点：unit_vector_for_distance

两个点的坐标差的范围：100\*|x|+100\*|y|+100\*|z| ≤2147483

```
输入
P1： storage math unit_vector.P1 [0.0,0.0,0.0]
P2：storage math unit_vector.P2 [0.0,0.0,0.0]
运行：as b09e-44-fded-6-efa5ffffef64 run func...
输出(输出值为结果的10倍)：#distance int
```

2.输入两点坐标差的绝对值：unit_vector_for_distance_modu

需要玩家自己作差输入

输入值范围：100x+100y+100z ≤2147483

```
输入：storage math unit_vector_modu.input [0.0,0.0,0.0]
执行：as b09e-44-fded-6-efa5ffffef64 run func...
输出 (输出值为结果的10倍)：#distance int
```

　

♦ 获取当前日期和时间：timestamp/start

【此功能需要联网使用】

使用前需要载入前置库：`function large_number:timestamp/database`

因获取玩家头颅里的Base64需要等待方块更新，所以解码会稍有延迟

已知bug：如果执行后，观察到执行后无输出，则表示头颅皮肤未正确加载，解决方法是延迟1tick或1秒再执行一次本函数

用命令判断就是测试此命令是否能通过，通过就表示解析不正确：`execute unless data storage timestamp output_base64_json.timestamp`

```
输出
年：#timestamp_year int
月：#timestamp_month int
日：#timestamp_day int
时：#timestamp_Hour int
分：#timestamp_Minute int
秒：#timestamp_Second int

数位始终为两位的时分秒
时：storage timestamp output_day_Hour
分：storage timestamp output_day_Minute
秒：storage timestamp output_day_Second

显示以下JSON文本便可显示时间：
{"nbt":"output_base64_json_tellraw","storage":"math","interpret":true}

更换正版玩家ID：storage math player_head_cache_list ["<玩家名>","<玩家名>"]
注：
列表里可存多个玩家名，但读取时只读取列表里的第一个
初始输入的正版玩家ID：ka__er
```

因为每个正版玩家名仅能在进入单人存档/服务器时获取两次时间戳，一次是放置成方块，一次是给生物戴头上，然后时间戳就存在了缓存里不再更新，想要更新时间戳只有三个方法：

1.重进存档/重开服务器；2.一个月后头颅缓存自动过期；3.更换一个新的正版玩家ID

所以想要长期开着服务器，建议配合内部打表计时使用，每两小时用命令方块同步一次时间，每24小时更换一个新的正版玩家id来同步一次日期，更换30次后，第一次使用的玩家id的头颅缓存就过期了。

　

♦ Unix时间戳解析 (32位)：timestamp/parse_timestamp/start

```
输入 (可为整型或字符串)：storage math parse_timestamp.input

输入GMT时区：set #GMT-time_zone int 8
例如北京时间是GMT+8，所以输入8，默认为8

输出：
年：#parse_timestamp.year int
月：#parse_timestamp.month int
日：#parse_timestamp.day int
时：#parse_timestamp.Hour int
分：#parse_timestamp.Minute int
秒：#parse_timestamp.Second int

显示以下JSON文本便可显示解析结果：
{"nbt":"parse_timestamp.tellraw","storage":"math","interpret":true}
```

　

♦ 理论参考：

> 小豆数学库：https://github.com/xiaodou8593/math2.0
> 
> 知乎.手动开根——牛顿迭代法：https://zhuanlan.zhihu.com/p/497508702
> 
> 知乎.手动开根——竖式开方法：https://zhuanlan.zhihu.com/p/517358606
> 
> 小豆.用命令做一个简易的开根号：https://www.bilibili.com/read/cv5789989
> 
> 天起源.T算法库：https://www.mcbbs.net/thread-1389089-1-1.html
> 
> 计算机系统数学原理：http://mathmu.github.io/publications/mathematical-theory-of-computer-algebra-system
> 
> 【动画密码学】Base64编码&解码算法：https://www.bilibili.com/video/BV1Hp4y1g7Ex
> 
> 卡儿.基于完全平方公式的平方根估值算法 (提取码 sr8j)：https://pan.baidu.com/s/1eoeChhk7xukIIYxexmMwJQ?pwd=sr8j
> 
> 知乎.最大公约数GCD算法：https://zhuanlan.zhihu.com/p/38100838

工具：GeoGebra，Desmos

　


【附】十进制浮点除法用法讲解：

```
设置被除数
set #float_sign int 1
set #float_int0 int 8593
set #float_int1 int 3528
set #float_exp int 2
```

```
设置除数
set #Divisor_float_sign int 1
set #Divisor_float_int0 int 3162
set #Divisor_float_int1 int 2776
set #Divisor_float_exp int 1
```

第一个计分板是符号位，可选项为-1，0，1

1表示正数，-1表示负数，0表示纯零

这里出现了纯零这个概念。因为计算机表示数的时候，有时候会出现正负0，正负零表示一个很小的数。

正负0是有几何意义的。加减法可以得到纯0，乘除法可能得到正0 负0。

就比如除法得到的0.00000000012，可能就被表示为≈0，这就是一个正0，表示极小的正数。

中间是两个有效数字，最后是指数。

就比如这个示例里设置的被除数的值，它表示1×0.85933538×10^2。

这里的有效数字部分是有限制的，首先int0和int1都是非负数，由符号位决定正负。

如果整个数字不是0，int0的范围是[1000,9999]，int1的范围是[0,9999]。

指数位可以从-2147483648到2147483647，也就是说这种表示方法可能表示的数非常大，但是越大精度越低。
这个除法的有效精度范围就是八位，整数部分如果用完了八位精度，小数部分就难以保证精度了。


输出的话，就是以改变被除数的方式输出。
