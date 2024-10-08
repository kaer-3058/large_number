function large_number:round_double/macro3 with storage large_number:math round_double
data modify storage large_number:math sstemp1 set string storage large_number:math sstemp1 1
execute if function large_number:round_double/test1 run function large_number:round_double/3
