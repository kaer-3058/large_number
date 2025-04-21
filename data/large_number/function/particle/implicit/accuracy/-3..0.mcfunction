#浮点数近似判断  1E-x
execute if score #implicit.accuracy.1ex int matches 0 store result score #sstempu int run data get storage large_number:math temp1
execute if score #implicit.accuracy.1ex int matches -1 store result score #sstempu int run data get storage large_number:math temp1 10
execute if score #implicit.accuracy.1ex int matches -2 store result score #sstempu int run data get storage large_number:math temp1 100
execute if score #implicit.accuracy.1ex int matches -3 store result score #sstempu int run data get storage large_number:math temp1 1000
