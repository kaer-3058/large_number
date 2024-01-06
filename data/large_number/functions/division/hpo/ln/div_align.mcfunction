#math:hpo/float/div_align
scoreboard players operation #temp1 int *= 10000 const
scoreboard players operation #temp1 int += #temp2 int
scoreboard players operation #temp1 int /= 10 const
scoreboard players operation #temp2 int = #temp1 int
scoreboard players operation #temp1 int /= 10000 const
scoreboard players operation #temp2 int %= 10000 const
scoreboard players add #ln_expon int 1