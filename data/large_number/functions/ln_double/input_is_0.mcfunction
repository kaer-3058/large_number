scoreboard players set #leading_zeros int 0
data modify storage math stemp10 set string storage math ln_double.input 0 1
execute if data storage math {stemp10:"0"} run scoreboard players set #leading_zeros int 1
data modify storage math stemp10 set string storage math ln_double.input 0 3
execute if data storage math {stemp10:"0.0"} run scoreboard players set #leading_zeros int 2
data modify storage math stemp10 set string storage math ln_double.input 0 4
execute if data storage math {stemp10:"0.00"} run scoreboard players set #leading_zeros int 3
execute if score #leading_zeros int matches 1 store success storage math temp1 int 207232 store result score #loga.b.tempinp int run data get storage math ln_double.input 1000000000
execute if score #leading_zeros int matches 2 store success storage math temp1 int 230258 store result score #loga.b.tempinp int run data get storage math ln_double.input 10000000000
execute if score #leading_zeros int matches 3 store success storage math temp1 int 253284 store result score #loga.b.tempinp int run data get storage math ln_double.input 100000000000
