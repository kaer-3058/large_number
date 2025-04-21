execute store result storage large_number:math expression_evaluation_variables."ｔ" double .001 run scoreboard players get #parametric_equation_particle.t_start int

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math parametric_equation_particle.rev_polish_notation_X
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:definite_integral/riemann_integral/fa_addi_fb_div2/macro1 with storage large_number:math
data modify storage large_number:math temp_xy[0] set from storage large_number:math stemp09

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math parametric_equation_particle.rev_polish_notation_Y
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:definite_integral/riemann_integral/fa_addi_fb_div2/macro1 with storage large_number:math
data modify storage large_number:math temp_xy[1] set from storage large_number:math stemp09

data modify storage large_number:math parametric_equation_particle_Pos append from storage large_number:math temp_xy

scoreboard players add #temp_parametric_equation_particle.loops int 1
scoreboard players operation #parametric_equation_particle.t_start int += #parametric_equation_particle.t_step int
execute if score #parametric_equation_particle.t_start int <= #parametric_equation_particle.t_end int if score #temp_parametric_equation_particle.loops int < #parametric_equation_particle.loops int run function large_number:particle/parametric_equation/different_steps/loop1
