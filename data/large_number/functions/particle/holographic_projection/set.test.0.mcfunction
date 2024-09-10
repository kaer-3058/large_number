$data modify storage large_number:math stemp1 set string storage large_number:math holographic_projection_database.$(sstemp0)x -3 -1
$data modify storage large_number:math stemp1 set string storage large_number:math holographic_projection_database.$(sstemp0)y -3 -1
$data modify storage large_number:math stemp1 set string storage large_number:math holographic_projection_database.$(sstemp0)z -3 -1
execute if data storage large_number:math {stemp1:".0"} run function large_number:particle/holographic_projection/set.test.0.2 with storage large_number:math