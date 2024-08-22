data modify storage large_number:math stemp1 set from storage large_number:math sstempr[0]
execute store success score #temp1 int run data remove storage large_number:math sstempr[0]
execute if score #temp1 int matches 0 run function large_number:definite_integral/riemann_integral/loop2.if
#execute if score #temp1 int matches 1 as b09e-44-fded-6-efa5ffffef64 run function large_number:definite_integral/riemann_integral/as_3
execute if score #temp1 int matches 1 run function large_number:definite_integral/riemann_integral/macro4 with storage large_number:math
