$execute if score #ln(x).dicimal int matches 1000..9999 run data modify storage math ln_output set value $(temp1).$(temp2)d
$execute if score #ln(x).dicimal int matches 100..999 run data modify storage math ln_output set value $(temp1).0$(temp2)d
$execute if score #ln(x).dicimal int matches 10..99 run data modify storage math ln_output set value $(temp1).00$(temp2)d
$execute if score #ln(x).dicimal int matches 0..9 run data modify storage math ln_output set value $(temp1).000$(temp2)d