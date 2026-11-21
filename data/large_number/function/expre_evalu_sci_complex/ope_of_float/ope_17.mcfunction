#lambertw(x) -1的分支

data modify storage large_number:math lambertw.input set from storage large_number:math _expressionss2
data modify storage large_number:math lambertw.branch set value -1
function large_number:lambertw/start
data modify storage large_number:math _expressionss3 set from storage large_number:math lambertw.output
