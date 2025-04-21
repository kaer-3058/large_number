#浮点数近似判断  1E-x
execute if score #implicit.accuracy.1ex int matches -4 store result score #sstempu int run data get storage large_number:math temp1 10000
execute if score #implicit.accuracy.1ex int matches -5 store result score #sstempu int run data get storage large_number:math temp1 100000
execute if score #implicit.accuracy.1ex int matches -6 store result score #sstempu int run data get storage large_number:math temp1 1000000
execute if score #implicit.accuracy.1ex int matches -7 store result score #sstempu int run data get storage large_number:math temp1 10000000
