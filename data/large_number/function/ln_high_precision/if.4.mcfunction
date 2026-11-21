execute if score #loga.b.tempinp large_number.int matches 128..255 run return 7
execute if score #loga.b.tempinp large_number.int matches 64..127 run return 6
execute if score #loga.b.tempinp large_number.int matches 32..63 run return 5
execute if score #loga.b.tempinp large_number.int matches 16..31 run return 4
execute if score #loga.b.tempinp large_number.int matches 8..15 run return 3
execute if score #loga.b.tempinp large_number.int matches 4..7 run return 2
execute if score #loga.b.tempinp large_number.int matches 2..3 run return 1
execute if score #loga.b.tempinp large_number.int matches 0..1 run return 0