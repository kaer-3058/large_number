##显示色相立方

execute if score #color_wheel.color_cube.particle_mode int matches 1 run function large_number:color_wheel/in/particle/1 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 2 run function large_number:color_wheel/in/particle/2 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 3 run function large_number:color_wheel/in/particle/3 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 4 run function large_number:color_wheel/in/particle/4 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 5 run function large_number:color_wheel/in/particle/5 with storage large_number:math color_wheel_color_cube_RGB
execute if score #color_wheel.color_cube.particle_mode int matches 6 run function large_number:color_wheel/in/particle/6 with storage large_number:math color_wheel_color_cube_RGB


particle dust{color:[1f,1f,1f],scale:.6} ^ ^.45 ^-.45
particle dust{color:[.8862745f,.8862745f,.8862745f],scale:.6} ^ ^.35 ^-.45
particle dust{color:[.7764705f,.7764705f,.7764705f],scale:.6} ^ ^.25 ^-.45
particle dust{color:[.6666666f,.6666666f,.6666666f],scale:.6} ^ ^.15 ^-.45
particle dust{color:[.5529411f,.5529411f,.5529411f],scale:.6} ^ ^.05 ^-.45
particle dust{color:[.4431372f,.4431372f,.4431372f],scale:.6} ^ ^-.05 ^-.45
particle dust{color:[.3333333f,.3333333f,.3333333f],scale:.6} ^ ^-.15 ^-.45
particle dust{color:[.2196078f,.2196078f,.2196078f],scale:.6} ^ ^-.25 ^-.45
particle dust{color:[.1098039f,.1098039f,.1098039f],scale:.6} ^ ^-.35 ^-.45
particle dust{color:[0f,0f,0f],scale:.6} ^ ^-.45 ^-.45
particle dust{color:[0f,0f,0f],scale:.6} ^ ^-.45 ^-.35
particle dust{color:[0f,0f,0f],scale:.6} ^ ^-.45 ^-.25
particle dust{color:[0f,0f,0f],scale:.6} ^ ^-.45 ^-.15
particle dust{color:[0f,0f,0f],scale:.6} ^ ^-.45 ^-.05
particle dust{color:[0f,0f,0f],scale:.6} ^ ^-.45 ^.05
particle dust{color:[0f,0f,0f],scale:.6} ^ ^-.45 ^.15
particle dust{color:[0f,0f,0f],scale:.6} ^ ^-.45 ^.25
particle dust{color:[0f,0f,0f],scale:.6} ^ ^-.45 ^.35
particle dust{color:[0f,0f,0f],scale:.6} ^ ^-.45 ^.45
