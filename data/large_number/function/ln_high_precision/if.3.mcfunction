execute if score #loga.b.tempinp large_number.int matches 32768..65535 run return 15
execute if score #loga.b.tempinp large_number.int matches 16384..32767 run return 14
execute if score #loga.b.tempinp large_number.int matches 8192..16383 run return 13
execute if score #loga.b.tempinp large_number.int matches 4096..8191 run return 12
execute if score #loga.b.tempinp large_number.int matches 2048..4095 run return 11
execute if score #loga.b.tempinp large_number.int matches 1024..2047 run return 10
execute if score #loga.b.tempinp large_number.int matches 512..1023 run return 9
execute if score #loga.b.tempinp large_number.int matches 256..511 run return 8