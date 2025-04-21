#浮点数近似判断  1E-x
execute if score #implicit.accuracy.1ex int matches 4 store result score #sstempu int run data get storage large_number:math temp1 .0001
execute if score #implicit.accuracy.1ex int matches 3 store result score #sstempu int run data get storage large_number:math temp1 .001
execute if score #implicit.accuracy.1ex int matches 2 store result score #sstempu int run data get storage large_number:math temp1 .01
execute if score #implicit.accuracy.1ex int matches 1 store result score #sstempu int run data get storage large_number:math temp1 .1
