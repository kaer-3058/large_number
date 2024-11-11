execute positioned ^ ^ ^ run tp @s ^ ^ ^ ~ ~

execute as @e[tag=!large_number.fast_raycast] at @s positioned ~ ~1 ~ \
    rotated as b09e-44-fded-6-efa5ffffef64 \
    positioned ^ ^ ^1000 \
    facing entity b09e-44-fded-6-efa5ffffef64 feet \
    positioned ^ ^ ^1000 \
    facing entity @s feet positioned ^ ^ ^.15 \
    positioned ~-.2 ~-.15 ~-.2 \
    as @s[dx=0,dy=0,dz=0] \
    positioned ~-.6 ~.3 ~-.6 \
    at @s[dx=0,dy=0,dz=0] \
    run effect give @s glowing 1 0 true

tp .0 .0 .0

#这是目前最快的视线追踪！
#这是巧妙地利用了execute+朝向的精髓，几何学在游戏中的精彩应用！
