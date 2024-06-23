##显示色相立方

execute if score #color_wheel.color_cube.particle_mode int matches 1 run function large_number:color_wheel/in/particle/1 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 2 run function large_number:color_wheel/in/particle/2 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 3 run function large_number:color_wheel/in/particle/3 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 4 run function large_number:color_wheel/in/particle/4 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 5 run function large_number:color_wheel/in/particle/5 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 6 run function large_number:color_wheel/in/particle/6 with storage large_number:math color_wheel_color_cube_RGB

particle dust 1 1 1.0 .6 ^ ^.45 ^-.45
particle dust .886274509803922 .886274509803922 .886274509803922 .6 ^ ^.35 ^-.45
particle dust .776470588235294 .776470588235294 .776470588235294 .6 ^ ^.25 ^-.45
particle dust .666666666666667 .666666666666667 .666666666666667 .6 ^ ^.15 ^-.45
particle dust .552941176470588 .552941176470588 .552941176470588 .6 ^ ^.05 ^-.45
particle dust .443137254901961 .443137254901961 .443137254901961 .6 ^ ^-.05 ^-.45
particle dust .333333333333333 .333333333333333 .333333333333333 .6 ^ ^-.15 ^-.45
particle dust .219607843137255 .219607843137255 .219607843137255 .6 ^ ^-.25 ^-.45
particle dust .109803921568627 .109803921568627 .109803921568627 .6 ^ ^-.35 ^-.45
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
