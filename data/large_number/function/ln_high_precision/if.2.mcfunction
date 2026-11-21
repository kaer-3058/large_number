
execute if score #loga.b.tempinp large_number.int matches 8388608..16777215 run return 23
execute if score #loga.b.tempinp large_number.int matches 4194304..8388607 run return 22
execute if score #loga.b.tempinp large_number.int matches 2097152..4194303 run return 21
execute if score #loga.b.tempinp large_number.int matches 1048576..2097151 run return 20
execute if score #loga.b.tempinp large_number.int matches 524288..1048575 run return 19
execute if score #loga.b.tempinp large_number.int matches 262144..524287 run return 18
execute if score #loga.b.tempinp large_number.int matches 131072..262143 run return 17
execute if score #loga.b.tempinp large_number.int matches 65536..131071 run return 16