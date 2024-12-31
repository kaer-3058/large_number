##旋转矩阵的乘法

#data modify storage large_number:math matrix_ope.input_a set value [7.0f,1.0f,2.0f,3.0f,4.0f,5.0f,6.0f,7.0f,8.0f,9.0f,10.0f,11.0f,12.0f,13.0f,14.0f,15.0f]
#data modify storage large_number:math matrix_ope.input_b set value [7.0f,15.0f,-3.0f,-17.0f,1.0f,16.0f,-9.0f,11.0f,8.0f,-1.0f,10.0f,-10.0f,5.0f,7.0f,16.0f,4.0f]

#input_a*input_b

#  0  1  2  3
#  4  5  6  7
#  8  9 10 11
# 12 13 14 15

#[ 第1行x第1列  第1行x第2列  第1行x第3列  第1行x第4列
#  第2行x第1列  第2行x第2列  第2行x第3列  第2行x第4列
#  第3行x第1列  第3行x第2列  第3行x第3列  第3行x第4列
#  第4行x第1列  第4行x第2列  第4行x第3列  第4行x第4列 ]

# {11}{11} + {12}{21} + {13}{31} + {14}{41} &
# {11}{12} + {12}{22} + {13}{32} + {14}{42} &
# {11}{13} + {12}{23} + {13}{33} + {14}{43} &
# {11}{14} + {12}{24} + {13}{34} + {14}{44} \
# {21}{11} + {22}{21} + {23}{31} + {24}{41} &
# {21}{12} + {22}{22} + {23}{32} + {24}{42} &
# {21}{13} + {22}{23} + {23}{33} + {24}{43} &
# {21}{14} + {22}{24} + {23}{34} + {24}{44} \
# {31}{11} + {32}{21} + {33}{31} + {34}{41} &
# {31}{12} + {32}{22} + {33}{32} + {34}{42} &
# {31}{13} + {32}{23} + {33}{33} + {34}{43} &
# {31}{14} + {32}{24} + {33}{34} + {34}{44} \
# {41}{11} + {42}{21} + {43}{31} + {44}{41} &
# {41}{12} + {42}{22} + {43}{32} + {44}{42} &
# {41}{13} + {42}{23} + {43}{33} + {44}{43} &
# {41}{14} + {42}{24} + {43}{34} + {44}{44} end


data modify storage large_number:math temp_matrix_ope_inp_a set from storage large_number:math matrix_ope.input_a
data modify storage large_number:math temp_matrix_ope_inp_b set from storage large_number:math matrix_ope.input_b

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_matrix_ope_inp_a[0]
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_matrix_ope_inp_b[0]
function large_number:float_multiply/of_score/start
data modify storage large_number:math temp_ set from storage large_number:math float_multiply.output



