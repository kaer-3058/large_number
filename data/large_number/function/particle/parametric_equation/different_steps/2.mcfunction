scoreboard players set #temp_parametric_equation_particle.loops int 0
execute if score #parametric_equation_particle.t_start int <= #parametric_equation_particle.t_end int run function large_number:particle/parametric_equation/different_steps/loop1


execute unless score #large_number.all_tellraw_set int matches 1 unless score #parametric_equation_particle.t_start int <= #parametric_equation_particle.t_end int run tellraw @a {"translate":"large_number.parametric_equation_particle.ope.end","fallback": "\u00A77\u00A7o参数方程：图像绘制完成"}
execute unless score #parametric_equation_particle.t_start int <= #parametric_equation_particle.t_end int run scoreboard players set #parametric_equation_particle.start int 3
