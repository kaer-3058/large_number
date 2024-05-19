data modify storage large_number:math temp1 set string storage large_number:math double_sqrt.output.double 0 -1
execute store result storage large_number:math temp3 int 1.0 run data get storage large_number:math double_sqrt.output.expon
function large_number:macro_operation/double_sqrt_integrate_to_scimath with storage large_number:math