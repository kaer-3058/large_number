##调和级数前N项和 (公式法逼近)
#公式：定义f(x)=SUM(1/n,n=1,x)，则f(x)=Digamma(x+1)+γ，f(x)=ln(x)+γ+ε(x)
#Digamma(x)是伽玛函数的自然对数的导数，与调和级数有关
#γ是欧拉-马斯刻若尼常数，是调和级数和ln(x)的差的极限值，是调和级数的拉马努金和
#当x→∞时，ε(x)趋近于0，0.4995078/x是近似计算ε(x)的函数之一(欧拉给出的一个近似函数是1/(2x))
#所以本函数的计算公式就是：SUM(1/n,n=1,x)≈ln(x)+0.5772+0.4995078/x
#无递归
#输入：data modify storage math Harmonic_series_sum_input set value 20
#输入值的类型可以是：double/float/int，使用double/float型输入可以计算超出int范围的值

execute store result score #temp1 int run data get storage math Harmonic_series_sum_input
execute if score #temp1 int matches ..2147483646 run function large_number:harmonic_series/sum1-n.1
execute if score #temp1 int matches 2147483647 run function large_number:harmonic_series/sum1-n.2
