#math:hpo/float/div_align
scoreboard players operation #float_int0 int *= 10000 const
scoreboard players operation #float_int0 int += #float_int1 int
scoreboard players operation #float_int0 int /= 10 const
scoreboard players operation #float_int1 int = #float_int0 int
scoreboard players operation #float_int0 int /= 10000 const
scoreboard players operation #float_int1 int %= 10000 const
scoreboard players add #float_exp int 1