## 大数运算

相关概念：数组、分段存储、浮点型、double型、前导0、绝对值、常数、精度、科学记数法

`

♦ 三角函数：math_trifs/_of_entity

♦ 双参数反正切(atan2)：math_trifs/atan2

`as b09e-44-fded-6-efa5ffffef64 run func..`  输入数的绝对值不要大于160000-1

`

♦ 大数加法：addition/start

♦ 大数减法：subtraction/start

♦ 浮点型除法：division/hpo/_div

直至1.20.2-pre1，大数除法除了迭代法并没有好的方法，此浮点型除法来自小豆数学库，是已知效率最高的除法。

`

♦ 任意整型数字相乘：int_int_multiply

♦ 任意整型数字平方：int_square

♦ 12位数字相乘：1we_multiply

♦ 12位数字平方：1we_square

♦ 整型数字拆分为数组：cut_math_to_list

`

♦ 整型数字开方：

取整：int_sqrt_simple

保留四位小数：int_sqrt

保留多位小数：test_int_more_dicimal

#开1\~5位，保留9位；开6\~7位，结果保留8位；开8~10位，保留7位

#有时求得的最后一位小数会有稍许的精度损失

`

♦ 16位数字开方(取整)：large_sqrt_digit16

高精度模式：`set #large_sqrt16.test16 int 1`

♦ 24位数字开方(取整)：large_sqrt

为了避免浪费算力，请按照如下优先级使用：整型范围内选整型数字开方，10~16位数字选16位数字开方，最后再考虑24位数字开方。

高精度模式是16位整数开方算法的特性，为了追求高效率选用了高精度猜测法，代价是最后一位会有稍许的精度损失。仅在处理16位数的时候会有这种特性。

高精度模式就是通过平方根自我平方对比原数来验证大小，自己决定要不要开。

`

♦ 立方体求对角线 (欧几里得范数，三维向量模长)：

普通立方体求对角线 (x²+y²+z² ≤ 2147483647)：int_3d_vector      (保留四位小数)

大立方体求对角线：(10^2 -1 ≤ x²+y²+z² ≤ 10^16 -1)：vast_3d_vector      (取整)

高精度模式：`set #large_sqrt16.test16 int 1`

`

♦ double转int数组  (需要版本1.20，函数宏法需要版本1.20.2)：

普通转化：double_to_int

考虑到科学记数法的转化：double_to_int_sci

函数宏法转化：macro_operation/double_to_int_macro

考虑到科学记数法的函数宏法转化：macro_operation/double_to_int_macro_sci

`

♦ double型开方:

普通开方：double_sqrt

考虑到科学记数法的开方：double_sqrt_sci

高精度模式：`set #large_sqrt16.test16 int 1`

考虑到科学计数法的double转化与double开方也会处理正常表示的double型。

函数宏仅是节省了命令数，是否节省了开销还需验证

对于科学记数法形式的开方，把结果的底数和指数合并：

`set #double_sqrt.integrate_sci_math int 1`   (需要版本1.20.2)

`

理论参考：

> 小豆数学库：https://github.com/xiaodou8593/math2.0
> 
> 知乎.手动开根——牛顿迭代法：https://zhuanlan.zhihu.com/p/497508702
>
> 知乎.手动开根——竖式开方法：https://zhuanlan.zhihu.com/p/517358606
> 
> 小豆.用命令做一个简易的开根号：https://www.bilibili.com/read/cv5789989
> 
> 卡儿.基于记分板向下取整特性的开根算法：https://www.mcbbs.net/thread-1468393-1-1.html
> 
> 天起源.T算法库：https://www.mcbbs.net/thread-1389089-1-1.html
> 
> 计算机系统数学原理：http://mathmu.github.io/publications/mathematical-theory-of-computer-algebra-system
>
> 
> 工具：GeoGebra，Desmos
>

`

【附】浮点除法用法讲解：

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

如果整个数字不是0，int0的范围是\[1000,9999\]，int1的范围是\[0,9999\]。

指数位可以从-2147483648到2147483647，也就是说这种表示方法可能表示的数非常大，但是越大精度越低。

这个除法的有效精度范围就是八位，整数部分如果用完了八位精度，小数部分就难以保证精度了。


输出的话，就是以改变被除数的方式输出。
