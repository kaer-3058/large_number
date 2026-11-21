scoreboard players set #color_wheel.color_cube.particle_mode large_number.int 2

scoreboard players set #t1 large_number.int 2550000
scoreboard players operation #temp1 large_number.int = #color_wheel.output.R large_number.int
scoreboard players operation #temp1 large_number.int *= 10000 const
scoreboard players operation #t1 large_number.int -= #temp1 large_number.int
scoreboard players operation #t1 large_number.int /= 9 const

scoreboard players set #stemp2 large_number.int 2550000
execute store result storage large_number:math color_wheel_color_cube_RGB.01 double 0.000000392156862745097 run scoreboard players operation #stemp2 large_number.int -= #t1 large_number.int
scoreboard players operation #stemp3 large_number.int = #stemp2 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.02 double 0.000000392156862745097 run scoreboard players operation #stemp3 large_number.int -= #t1 large_number.int
scoreboard players operation #stemp4 large_number.int = #stemp3 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.03 double 0.000000392156862745097 run scoreboard players operation #stemp4 large_number.int -= #t1 large_number.int
scoreboard players operation #stemp5 large_number.int = #stemp4 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.04 double 0.000000392156862745097 run scoreboard players operation #stemp5 large_number.int -= #t1 large_number.int
scoreboard players operation #stemp6 large_number.int = #stemp5 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.05 double 0.000000392156862745097 run scoreboard players operation #stemp6 large_number.int -= #t1 large_number.int
scoreboard players operation #stemp7 large_number.int = #stemp6 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.06 double 0.000000392156862745097 run scoreboard players operation #stemp7 large_number.int -= #t1 large_number.int
scoreboard players operation #stemp8 large_number.int = #stemp7 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.07 double 0.000000392156862745097 run scoreboard players operation #stemp8 large_number.int -= #t1 large_number.int
scoreboard players operation #stemp9 large_number.int = #stemp8 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.08 double 0.000000392156862745097 run scoreboard players operation #stemp9 large_number.int -= #t1 large_number.int
scoreboard players operation #stemp10 large_number.int = #stemp9 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.09 double 0.000000392156862745097 run scoreboard players operation #stemp10 large_number.int -= #t1 large_number.int

scoreboard players operation #t2 large_number.int = #stemp2 large_number.int
scoreboard players operation #t3 large_number.int = #stemp3 large_number.int
scoreboard players operation #t4 large_number.int = #stemp4 large_number.int
scoreboard players operation #t5 large_number.int = #stemp5 large_number.int
scoreboard players operation #t6 large_number.int = #stemp6 large_number.int
scoreboard players operation #t7 large_number.int = #stemp7 large_number.int
scoreboard players operation #t8 large_number.int = #stemp8 large_number.int
scoreboard players operation #t9 large_number.int = #stemp9 large_number.int
scoreboard players operation #t10 large_number.int = #stemp10 large_number.int

scoreboard players operation #t2 large_number.int /= 9 const
scoreboard players operation #t3 large_number.int /= 9 const
scoreboard players operation #t4 large_number.int /= 9 const
scoreboard players operation #t5 large_number.int /= 9 const
scoreboard players operation #t6 large_number.int /= 9 const
scoreboard players operation #t7 large_number.int /= 9 const
scoreboard players operation #t8 large_number.int /= 9 const
scoreboard players operation #t9 large_number.int /= 9 const
scoreboard players operation #t10 large_number.int /= 9 const

execute store result storage large_number:math color_wheel_color_cube_RGB.11 double 0.000000392156862745097 run scoreboard players operation #stemp2 large_number.int -= #t2 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.12 double 0.000000392156862745097 run scoreboard players operation #stemp3 large_number.int -= #t3 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.13 double 0.000000392156862745097 run scoreboard players operation #stemp4 large_number.int -= #t4 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.14 double 0.000000392156862745097 run scoreboard players operation #stemp5 large_number.int -= #t5 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.15 double 0.000000392156862745097 run scoreboard players operation #stemp6 large_number.int -= #t6 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.16 double 0.000000392156862745097 run scoreboard players operation #stemp7 large_number.int -= #t7 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.17 double 0.000000392156862745097 run scoreboard players operation #stemp8 large_number.int -= #t8 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.18 double 0.000000392156862745097 run scoreboard players operation #stemp9 large_number.int -= #t9 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.19 double 0.000000392156862745097 run scoreboard players operation #stemp10 large_number.int -= #t10 large_number.int

execute store result storage large_number:math color_wheel_color_cube_RGB.21 double 0.000000392156862745097 run scoreboard players operation #stemp2 large_number.int -= #t2 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.22 double 0.000000392156862745097 run scoreboard players operation #stemp3 large_number.int -= #t3 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.23 double 0.000000392156862745097 run scoreboard players operation #stemp4 large_number.int -= #t4 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.24 double 0.000000392156862745097 run scoreboard players operation #stemp5 large_number.int -= #t5 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.25 double 0.000000392156862745097 run scoreboard players operation #stemp6 large_number.int -= #t6 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.26 double 0.000000392156862745097 run scoreboard players operation #stemp7 large_number.int -= #t7 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.27 double 0.000000392156862745097 run scoreboard players operation #stemp8 large_number.int -= #t8 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.28 double 0.000000392156862745097 run scoreboard players operation #stemp9 large_number.int -= #t9 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.29 double 0.000000392156862745097 run scoreboard players operation #stemp10 large_number.int -= #t10 large_number.int

execute store result storage large_number:math color_wheel_color_cube_RGB.31 double 0.000000392156862745097 run scoreboard players operation #stemp2 large_number.int -= #t2 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.32 double 0.000000392156862745097 run scoreboard players operation #stemp3 large_number.int -= #t3 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.33 double 0.000000392156862745097 run scoreboard players operation #stemp4 large_number.int -= #t4 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.34 double 0.000000392156862745097 run scoreboard players operation #stemp5 large_number.int -= #t5 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.35 double 0.000000392156862745097 run scoreboard players operation #stemp6 large_number.int -= #t6 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.36 double 0.000000392156862745097 run scoreboard players operation #stemp7 large_number.int -= #t7 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.37 double 0.000000392156862745097 run scoreboard players operation #stemp8 large_number.int -= #t8 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.38 double 0.000000392156862745097 run scoreboard players operation #stemp9 large_number.int -= #t9 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.39 double 0.000000392156862745097 run scoreboard players operation #stemp10 large_number.int -= #t10 large_number.int

execute store result storage large_number:math color_wheel_color_cube_RGB.41 double 0.000000392156862745097 run scoreboard players operation #stemp2 large_number.int -= #t2 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.42 double 0.000000392156862745097 run scoreboard players operation #stemp3 large_number.int -= #t3 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.43 double 0.000000392156862745097 run scoreboard players operation #stemp4 large_number.int -= #t4 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.44 double 0.000000392156862745097 run scoreboard players operation #stemp5 large_number.int -= #t5 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.45 double 0.000000392156862745097 run scoreboard players operation #stemp6 large_number.int -= #t6 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.46 double 0.000000392156862745097 run scoreboard players operation #stemp7 large_number.int -= #t7 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.47 double 0.000000392156862745097 run scoreboard players operation #stemp8 large_number.int -= #t8 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.48 double 0.000000392156862745097 run scoreboard players operation #stemp9 large_number.int -= #t9 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.49 double 0.000000392156862745097 run scoreboard players operation #stemp10 large_number.int -= #t10 large_number.int

execute store result storage large_number:math color_wheel_color_cube_RGB.51 double 0.000000392156862745097 run scoreboard players operation #stemp2 large_number.int -= #t2 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.52 double 0.000000392156862745097 run scoreboard players operation #stemp3 large_number.int -= #t3 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.53 double 0.000000392156862745097 run scoreboard players operation #stemp4 large_number.int -= #t4 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.54 double 0.000000392156862745097 run scoreboard players operation #stemp5 large_number.int -= #t5 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.55 double 0.000000392156862745097 run scoreboard players operation #stemp6 large_number.int -= #t6 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.56 double 0.000000392156862745097 run scoreboard players operation #stemp7 large_number.int -= #t7 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.57 double 0.000000392156862745097 run scoreboard players operation #stemp8 large_number.int -= #t8 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.58 double 0.000000392156862745097 run scoreboard players operation #stemp9 large_number.int -= #t9 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.59 double 0.000000392156862745097 run scoreboard players operation #stemp10 large_number.int -= #t10 large_number.int

execute store result storage large_number:math color_wheel_color_cube_RGB.61 double 0.000000392156862745097 run scoreboard players operation #stemp2 large_number.int -= #t2 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.62 double 0.000000392156862745097 run scoreboard players operation #stemp3 large_number.int -= #t3 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.63 double 0.000000392156862745097 run scoreboard players operation #stemp4 large_number.int -= #t4 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.64 double 0.000000392156862745097 run scoreboard players operation #stemp5 large_number.int -= #t5 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.65 double 0.000000392156862745097 run scoreboard players operation #stemp6 large_number.int -= #t6 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.66 double 0.000000392156862745097 run scoreboard players operation #stemp7 large_number.int -= #t7 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.67 double 0.000000392156862745097 run scoreboard players operation #stemp8 large_number.int -= #t8 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.68 double 0.000000392156862745097 run scoreboard players operation #stemp9 large_number.int -= #t9 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.69 double 0.000000392156862745097 run scoreboard players operation #stemp10 large_number.int -= #t10 large_number.int

execute store result storage large_number:math color_wheel_color_cube_RGB.71 double 0.000000392156862745097 run scoreboard players operation #stemp2 large_number.int -= #t2 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.72 double 0.000000392156862745097 run scoreboard players operation #stemp3 large_number.int -= #t3 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.73 double 0.000000392156862745097 run scoreboard players operation #stemp4 large_number.int -= #t4 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.74 double 0.000000392156862745097 run scoreboard players operation #stemp5 large_number.int -= #t5 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.75 double 0.000000392156862745097 run scoreboard players operation #stemp6 large_number.int -= #t6 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.76 double 0.000000392156862745097 run scoreboard players operation #stemp7 large_number.int -= #t7 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.77 double 0.000000392156862745097 run scoreboard players operation #stemp8 large_number.int -= #t8 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.78 double 0.000000392156862745097 run scoreboard players operation #stemp9 large_number.int -= #t9 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.79 double 0.000000392156862745097 run scoreboard players operation #stemp10 large_number.int -= #t10 large_number.int

execute store result storage large_number:math color_wheel_color_cube_RGB.81 double 0.000000392156862745097 run scoreboard players operation #stemp2 large_number.int -= #t2 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.82 double 0.000000392156862745097 run scoreboard players operation #stemp3 large_number.int -= #t3 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.83 double 0.000000392156862745097 run scoreboard players operation #stemp4 large_number.int -= #t4 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.84 double 0.000000392156862745097 run scoreboard players operation #stemp5 large_number.int -= #t5 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.85 double 0.000000392156862745097 run scoreboard players operation #stemp6 large_number.int -= #t6 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.86 double 0.000000392156862745097 run scoreboard players operation #stemp7 large_number.int -= #t7 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.87 double 0.000000392156862745097 run scoreboard players operation #stemp8 large_number.int -= #t8 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.88 double 0.000000392156862745097 run scoreboard players operation #stemp9 large_number.int -= #t9 large_number.int
execute store result storage large_number:math color_wheel_color_cube_RGB.89 double 0.000000392156862745097 run scoreboard players operation #stemp10 large_number.int -= #t10 large_number.int
