execute store result score #u2 lan.pi_information run data get storage large_number:pi_information temp1[-1]
execute store result score #v2 lan.pi_information run data get storage large_number:pi_information temp2[-1]

execute store result storage large_number:pi_information stemp2 int 1 run scoreboard players operation #u2 lan.pi_information -= #v2 lan.pi_information
data modify storage large_number:pi_information temp9 prepend from storage large_number:pi_information stemp2
