execute store result storage large_number:math expression_evaluation_variables."ｔ" double .001 run scoreboard players get #parametric_equation_particle.t_start large_number.int

#解析逆波兰式 - 实函数
data modify storage large_number:math expression_evaluation.rev_polish_notation set from storage large_number:math parametric_equation_particle.rev_polish_notation_X
function large_number:expression_evaluation_scientific/ope_no_tell
data modify storage large_number:math temp_xy[0] set from storage large_number:math expression_evaluation.output

#解析逆波兰式 - 实函数
data modify storage large_number:math expression_evaluation.rev_polish_notation set from storage large_number:math parametric_equation_particle.rev_polish_notation_Y
function large_number:expression_evaluation_scientific/ope_no_tell
data modify storage large_number:math temp_xy[1] set from storage large_number:math expression_evaluation.output

data modify storage large_number:math parametric_equation_particle_Pos append from storage large_number:math temp_xy


scoreboard players add #temp_parametric_equation_particle.loops large_number.int 1
scoreboard players operation #parametric_equation_particle.t_start large_number.int += #parametric_equation_particle.t_step large_number.int
execute if score #parametric_equation_particle.t_start large_number.int <= #parametric_equation_particle.t_end large_number.int if score #temp_parametric_equation_particle.loops large_number.int < #parametric_equation_particle.loops large_number.int run function large_number:particle/parametric_equation/different_steps/loop1
