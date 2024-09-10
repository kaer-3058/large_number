##显示色相立方

execute if score #color_wheel.color_cube.particle_mode int matches 1 run function large_number:color_wheel/in/particle/1 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 2 run function large_number:color_wheel/in/particle/2 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 3 run function large_number:color_wheel/in/particle/3 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 4 run function large_number:color_wheel/in/particle/4 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 5 run function large_number:color_wheel/in/particle/5 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 6 run function large_number:color_wheel/in/particle/6 with storage large_number:math color_wheel_color_cube_RGB

particle dust 1 1 1.0 .6 ^ ^.45 ^-.45
particle dust .8862745 .8862745 .8862745 .6 ^ ^.35 ^-.45
particle dust .7764705 .7764705 .7764705 .6 ^ ^.25 ^-.45
particle dust .6666666 .6666666 .6666666 .6 ^ ^.15 ^-.45
particle dust .5529411 .5529411 .5529411 .6 ^ ^.05 ^-.45
particle dust .4431372 .4431372 .4431372 .6 ^ ^-.05 ^-.45
particle dust .3333333 .3333333 .3333333 .6 ^ ^-.15 ^-.45
particle dust .2196078 .2196078 .2196078 .6 ^ ^-.25 ^-.45
particle dust .1098039 .1098039 .1098039 .6 ^ ^-.35 ^-.45
particle dust 0 .0 0 .6 ^ ^-.45 ^-.45
particle dust 0 .0 0 .6 ^ ^-.45 ^-.35
particle dust 0 .0 0 .6 ^ ^-.45 ^-.25
particle dust 0 .0 0 .6 ^ ^-.45 ^-.15
particle dust 0 .0 0 .6 ^ ^-.45 ^-.05
particle dust 0 .0 0 .6 ^ ^-.45 ^.05
particle dust 0 .0 0 .6 ^ ^-.45 ^.15
particle dust 0 .0 0 .6 ^ ^-.45 ^.25
particle dust 0 .0 0 .6 ^ ^-.45 ^.35
particle dust 0 .0 0 .6 ^ ^-.45 ^.45
