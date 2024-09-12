data modify storage large_number:math temp1 set from storage large_number:math determinant_evaluate.input
execute if score #determinant.order int matches 1 store result storage large_number:math determinant_evaluate.output double 1 run data get storage large_number:math temp1[0][0]
execute if score #determinant.order int matches 2 run function large_number:determinant/evaluate/2/start
execute if score #determinant.order int matches 3 run function large_number:determinant/evaluate/3/start
execute if score #determinant.order int matches 4 run function large_number:determinant/evaluate/4/start
execute if score #determinant.order int matches 5 run function large_number:determinant/evaluate/5/start
execute if score #determinant.order int matches 6 run function large_number:determinant/evaluate/6/start
execute if score #determinant.order int matches 7 run function large_number:determinant/evaluate/7/start
