function large_number:complex_operation/macro2 with storage large_number:math temp_complex_ope_z2
data modify storage large_number:math temp_complex_ope_z1.x set from storage large_number:math temp_complex_ope_z2.x
data modify storage large_number:math complex_operation.output set from storage large_number:math temp_complex_ope_z1
