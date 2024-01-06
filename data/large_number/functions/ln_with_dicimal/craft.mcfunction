$execute if score #ln_wd.out.dicimal int matches 0..9 run data modify storage math ln_with_dicimal.output set value $(temp5)$(temp3).000$(temp4)d
$execute if score #ln_wd.out.dicimal int matches 10..99 run data modify storage math ln_with_dicimal.output set value $(temp5)$(temp3).00$(temp4)d
$execute if score #ln_wd.out.dicimal int matches 100..999 run data modify storage math ln_with_dicimal.output set value $(temp5)$(temp3).0$(temp4)d
$execute if score #ln_wd.out.dicimal int matches 1000.. run data modify storage math ln_with_dicimal.output set value $(temp5)$(temp3).$(temp4)d