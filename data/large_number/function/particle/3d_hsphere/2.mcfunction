function large_number:particle/3d_hsphere/macro1 with storage large_number:math
execute positioned .0 .0 .0 facing entity @s feet run function large_number:particle/3d_hsphere/macro2 with storage large_number:math
data modify storage large_number:math 3d_hsphere_pos append from entity @s Pos

tp @s ~ ~ ~ ~222.492235949962145353651260371629722379311 ~
