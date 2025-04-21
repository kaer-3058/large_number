##表达式求值 - 科学计算

#输入：data modify storage large_number:math expression_evaluation.input set value "(12+14)*(106－32)"
#运算符可接受+－*·/().E-^²。为了在转化为逆波兰式的过程中区分减法与负数，"－"(全角减号)表示减法，"-"(半角减号)表示负数。"·"等价于"*"。数字只能是double，不需要带单位。注意，即使是变量与数字相乘，乘号也必须要写。

#函数列表：log exp sin cos arcsin arccos arctan ln √ Γ ┕ ºLambertW ¹LambertW || sgn [] — atan ψ Σ[1/n]n→ eunorm₂ eunorm₃ [0] >= <= == ≈≈ >/< >-< >> << ≥≥ ≤≤ nroot ºsinh ºcosh ºtanh tan hign┕ hignºW hign¹W 。
#函数命名规则：不能含有0123456789.E-^²·αβδεηλμξτωｘｙｚ，不能与其他函数名称的前几个字母一样
#每个函数和它的参数都必须单独放在一个括号里，支持复合函数

# α、β和δ都是函数的参数，若参数为一个数字，则不应放在括号里，若参数不为一个数字，则应放在括号里

# αlogβ = 以α为底β的对数
# αatanβ = atan2(α,β) 弧度制
# αeunorm₂β = √(α²+β²)，二维向量(α,β)的欧氏范数，必须都是非负数
# αnrootβ = 对β开α次根

# α>=β = 逻辑运算，取较大值
# α<=β = 逻辑运算，取较小值
# α==β = 逻辑运算，严格判断是否相等，相等为1，否则为0
# α>>β = 逻辑运算，是否大于
# α<<β = 逻辑运算，是否小于
# α≥≥β = 逻辑运算，是否大于等于
# α≤≤β = 逻辑运算，是否小于等于
# α>/<β = 交换除，β除以α
# α>-<β = 交换减，β减α

# αeunorm₃β,δ = √(α²+β²+δ²)，三维向量(α,β,δ)的欧氏范数，必须都是非负数
# α≈≈β,δ = 逻辑运算，误差判断，判断α和β的距离是否在δ的绝对值以内，是为1，否则为0
#注：可能会因浮点误差导致判断失误，例如0.02在计算时变为0.020000000000000018

# expβ = e^β，指数运算
# sinβ = sin(β) 弧度制
# cosβ = cos(β) 弧度制
# tanβ = tan(β) 弧度制
# arcsinβ = arcsin(β) 弧度制
# arccosβ = arccos(β) 弧度制
# arctanβ = arctan(β) 弧度制
# lnβ = ln(β)，自然对数
# √β = √β，开根号
# Γβ = gamma(β)，输入范围为区间：(0, 171.6271]
# ┕β = 逆gamma(β)，gamma(x)主分支的反函数，逆gamma(β)-1相当于阶乘的逆运算，输入范围：β≥1
# αhign┕β = 高精度 逆gamma(β)，牛顿迭代次数为α次
# ºLambertWβ = LambertWº(β)，主分支，输入范围：[-1/e,∞)
# ¹LambertWβ = LambertW¹(β)，-1的分支，输入范围：[-1/e,0)
# αhignºWβ = 高精度 LambertWº(β) 主分支，牛顿迭代次数为α次
# αhign¹Wβ = 高精度 LambertW¹(β) -1的分支，牛顿迭代次数为α次
# ||β = β的绝对值
# sgnβ = sgn(β)，符号函数
# []β = 把β向下取整
# [0]β = 把β向0取整
# —β = 破折号的一半，表示β的相反数
# ψβ = ψ(β) digamma函数，又叫双伽玛函数，伽玛函数的对数的导数
# Σ[1/n]n→β = 调和级数前β项和
# ºsinhβ = sinh(β)
# ºcoshβ = cosh(β)
# ºtanhβ = tanh(β)

#拆字符串，把符号和数字拆开，然后转化为逆波兰式
#逆波兰式算法：https://blog.csdn.net/zm_miner/article/details/115324206

#function large_number:expression_evaluation_scientific/to_rev_polish_notation
#function large_number:expression_evaluation_scientific/ope

#temp_s1和temp_s2是事先分配的两个栈
data modify storage large_number:math temp_s1 set value []
data modify storage large_number:math temp_s2 set value []
data modify storage large_number:math sstemp1 set from storage large_number:math expression_evaluation.input
execute unless data storage large_number:math {sstemp1:""} run function large_number:expression_evaluation_scientific/loop1

#如果s1栈里还有剩余字符则一并取出
execute if data storage large_number:math temp_s1[-1] run function large_number:expression_evaluation_scientific/loop5

data modify storage large_number:math expression_evaluation.rev_polish_notation set from storage large_number:math temp_s2


execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate":"large_number.expression_evaluation.to_rev_polish_notation.end","fallback": "\u00A77\u00A7o表达式转换完成"}

#tellraw @a {"nbt":"expression_evaluation.rev_polish_notation[]","storage":"large_number:math","separator":" "}
