function large_number:gamma_function/fundamental_factorial/loop.macro with storage math
scoreboard players remove #stemp1 int 2
execute if score #stemp1 int matches 2.. run function large_number:gamma_function/fundamental_factorial/double_factorial.loop