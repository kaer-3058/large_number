function large_number:complex_operation/macro1 with storage large_number:math temp_complex_ope_z2
data modify storage large_number:math temp_complex_ope_z1.i set from storage large_number:math temp_complex_ope_z2.i
data modify storage large_number:math complex_operation.output set from storage large_number:math temp_complex_ope_z1
