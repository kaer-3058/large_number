execute store result storage large_number:math temp1 int 3.162277660168 run scoreboard players get #d2.1 int
execute store result score #d2.1 int run data get storage large_number:math temp1
execute if score #d2.1 int matches ..9999999 run scoreboard players operation #d2.1 int *= 10 const
execute if score #d2.1 int matches 100000000.. run scoreboard players operation #d2.1 int /= 10 const