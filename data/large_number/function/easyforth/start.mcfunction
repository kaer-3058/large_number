##MC版Forth编译器

#关于Forth：
#https://chengjianwen.github.io/easyforth/
#https://github.com/cforth/myforth

#输入命令：data modify storage large_number:math Forth_input set value ""

#Forth的核心 - 栈
#storage large_number:math Forth_s1 [[12],[33],["加"]]
#为了让栈能容纳不同类型的输入值，栈的每一项都必须单独放在一个子列表里。

#四则运算
execute if data storage large_number:math {Forth_input:"加"}
execute if data storage large_number:math {Forth_input:"减"}
execute if data storage large_number:math {Forth_input:"乘"}
execute if data storage large_number:math {Forth_input:"除"}


