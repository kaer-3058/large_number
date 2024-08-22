#调和级数前n项和

data modify storage large_number:math Harmonic_series_sum_input set from storage large_number:math _expressionss2
function large_number:harmonic_series/sum1-n
execute store result storage large_number:math _expressionss3 double .0001 run scoreboard players get #Harmonic_series.sum.output int
