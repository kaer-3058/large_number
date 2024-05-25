readme目录索引

当前共有：102种算法
♦ 常数
♦ 六个基本三角函数
♦ 正弦与余弦
♦ 双参数反正切 (atan2d)
♦ 反正弦与反余弦 [2个子算法]
♦ 大数加法
♦ 大数减法
♦ 展示实体法浮点数除法
♦ 展示实体法大数除法
♦ 浮点除法 - 数据来自记分板 [2个子算法]
♦ 浮点除法 - 数据来自nbt [2个子算法]
♦ 12位数组除以常数 (保留四位小数)
♦ 无穷多位有效数字的除法
♦ 对浮点数取倒数
♦ 整数除法 [2个子算法]
♦ 数组除以整数 (多位有效数字)
♦ 对整数进行任意倍乘
♦ 浮点乘法
♦ 高精度浮点乘法
♦ 浮点加减法
♦ 任意整型数字相乘
♦ 任意整型数字平方
♦ 12位数字相乘
♦ 12位数字平方
♦ 无穷位数字相乘
♦ 整型数字拆分为数组
♦ 整型数字开方 [3个子算法]
♦ 整型数字开方 - 连分数迭代法
♦ 整型数字开方 - 牛顿迭代法 (保留四位小数)
♦ 10~16位数字开方 [3个子算法]
♦ 1~24位数字开方
♦ 整型数字求立方根 [2个子算法]
♦ double的欧氏范数 [4个子算法]
♦ double转int数组 [4个子算法]
♦ double型开方 (高精度浮点数开方) [2个子算法]
♦ 快速浮点数开方
♦ 24位数字显示 [2个子算法]
♦ 单位向量法测距 [2个子算法]
♦ 列表算法 - 洗牌
♦ 列表算法 - 抽牌
♦ 列表算法 - 元素去重 (返回值法)
♦ UUID数组转为带连字符的16进制
♦ 带连字符的16进制UUID转为数组 [2个子算法]
♦ 概率模拟 - 二项分布 [2个子算法]
♦ 概率模拟 - 正态分布
♦ 概率模拟 - 均匀分布
♦ 概率模拟 - 超几何分布
♦ 生成总和为n的a个随机数
♦ 指数函数 [2个子算法]
♦ 整数的整数次幂
♦ 浮点数的整数次幂
♦ 整数的自然对数 ln(x)
♦ 对浮点数取自然对数 ln(x)
♦ 任意正整数的对数 log.a(b)
♦ 对浮点数取对数 log.a(b)
♦ 整数的常用对数 lg(x)
♦ 自然数的阶乘
♦ 自然数的双阶乘
♦ 伽玛函数 - 斯特林公式
♦ 伽玛函数 - 递推公式
♦ 执行朝向转为四元数四分量xyzw
♦ 欧拉角转四元数
♦ 局部坐标转相对坐标
♦ 相对坐标转局部坐标
♦ 解整系数一元二次方程
♦ 获取当前日期和时间
♦ Unix时间戳解析 (32位)
♦ 玩家经验公式 - 根据经验等级和经验数推出经验总数
♦ 玩家经验公式 - 经验总数逆推经验等级和经验余数
♦ 颜色RGB转16进制
♦ 调和级数前N项和
♦ 整数质因数分解
♦ 三维空间任意方向的粒子圆
♦ 三维空间任意方向的五角星
♦ 三维空间任意方向的椭圆
♦ 粒子球 (斐波那契网格)
♦ 全息粒子投影 - 16x16x16投影至1x1x1
♦ 抛物线 [2个子算法]
♦ 阿基米德螺线 (等速螺线)
♦ 二维网格排列
♦ 二阶贝塞尔曲线
♦ 心形线
♦ 色轮
♦ 参考文献



数学库里的吃消耗大户

高精度浮点乘法
无穷位数字相乘
1~24位数字开方
大立方体求对角线
double型开方
指数函数
任意整数的整数次方
对浮点数取对数
伽玛函数
玩家经验公式
粒子球
全息粒子投影
抛物线


数学库里的表格

解码base64的前置库：
载入：function large_number:timestamp/database
卸载：function large_number:timestamp/uninstall_database

e^x的前置库：
载入：function large_number:exp_e.x/database
卸载：data remove storage large_number:exp database

ln的初始数据库：
载入：function large_number:ln/ln_database
卸载：function large_number:ln/uninstall_ln_database

ln[1,2]的初始数据库：
载入：function large_number:ln_high_precision/database
卸载：data remove storage large_number:ln_const database

全息粒子投影的粒子信息表：
清空：data remove storage large_number:math holographic_projection_database

伽玛函数递推公式的前置库：
载入：function large_number:gamma_function/recursion/database
卸载：data remove storage large_number:math gamma_databse


卡儿的数学库
科学计算
图形库
数据处理
