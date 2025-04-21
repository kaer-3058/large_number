#浮点数近似判断  1E-x
execute if score #implicit.accuracy.1ex int matches -8 store result score #sstempu int run data get storage large_number:math temp1 100000000
execute if score #implicit.accuracy.1ex int matches -9 store result score #sstempu int run data get storage large_number:math temp1 1000000000
execute if score #implicit.accuracy.1ex int matches -10 store result score #sstempu int run data get storage large_number:math temp1 10000000000
