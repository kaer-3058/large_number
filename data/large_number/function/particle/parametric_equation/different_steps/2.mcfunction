scoreboard players set #temp_parametric_equation_particle.loops large_number.int 0
execute if score #parametric_equation_particle.t_start large_number.int <= #parametric_equation_particle.t_end large_number.int run function large_number:particle/parametric_equation/different_steps/loop1

data modify storage large_number:math expression_evaluation.rev_polish_notation set from storage large_number:math store_expres_rev_polish_notation


execute unless score #large_number.all_tellraw_set large_number.int matches 1 unless score #parametric_equation_particle.t_start large_number.int <= #parametric_equation_particle.t_end large_number.int run tellraw @a {"translate":"large_number.parametric_equation_particle.ope.end","fallback": "\u00A77\u00A7o参数方程：图像绘制完成"}
execute unless score #parametric_equation_particle.t_start large_number.int <= #parametric_equation_particle.t_end large_number.int run scoreboard players set #parametric_equation_particle.start large_number.int 3
