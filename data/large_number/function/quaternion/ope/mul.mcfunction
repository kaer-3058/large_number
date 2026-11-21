##单位四元数乘法 q1*q2

#scoreboard players set #q1_x large_number.int 7445
#scoreboard players set #q1_y large_number.int 1234
#scoreboard players set #q1_z large_number.int 5423
#scoreboard players set #q1_w large_number.int 1023

#scoreboard players set #q2_x large_number.int 2323
#scoreboard players set #q2_y large_number.int 1423
#scoreboard players set #q2_z large_number.int 1525
#scoreboard players set #q2_w large_number.int 8383

#10000倍输入：{#q1_x, #q1_y, #q1_z, #q1_w}   {#q2_x, #q2_y, #q2_z, #q2_w}
#100000000倍输出：{#q3_x, #q3_y, #q3_z, #q3_w}

scoreboard players operation #q3_w large_number.int = #q1_w large_number.int
scoreboard players operation #q3_w large_number.int *= #q2_w large_number.int
scoreboard players operation #q3_x large_number.int = #q1_w large_number.int
scoreboard players operation #q3_x large_number.int *= #q2_x large_number.int
scoreboard players operation #q3_y large_number.int = #q1_w large_number.int
scoreboard players operation #q3_y large_number.int *= #q2_y large_number.int
scoreboard players operation #q3_z large_number.int = #q1_w large_number.int
scoreboard players operation #q3_z large_number.int *= #q2_z large_number.int

scoreboard players operation #sstempx1 large_number.int = #q1_x large_number.int
scoreboard players operation #sstempx1 large_number.int *= #q2_x large_number.int
scoreboard players operation #sstempx2 large_number.int = #q1_x large_number.int
scoreboard players operation #sstempx2 large_number.int *= #q2_w large_number.int
scoreboard players operation #sstempx3 large_number.int = #q1_x large_number.int
scoreboard players operation #sstempx3 large_number.int *= #q2_z large_number.int
scoreboard players operation #sstempx4 large_number.int = #q1_x large_number.int
scoreboard players operation #sstempx4 large_number.int *= #q2_y large_number.int

scoreboard players operation #sstempy1 large_number.int = #q1_y large_number.int
scoreboard players operation #sstempy1 large_number.int *= #q2_y large_number.int
scoreboard players operation #sstempy2 large_number.int = #q1_y large_number.int
scoreboard players operation #sstempy2 large_number.int *= #q2_z large_number.int
scoreboard players operation #sstempy3 large_number.int = #q1_y large_number.int
scoreboard players operation #sstempy3 large_number.int *= #q2_w large_number.int
scoreboard players operation #sstempy4 large_number.int = #q1_y large_number.int
scoreboard players operation #sstempy4 large_number.int *= #q2_x large_number.int

scoreboard players operation #sstempz1 large_number.int = #q1_z large_number.int
scoreboard players operation #sstempz1 large_number.int *= #q2_z large_number.int
scoreboard players operation #sstempz2 large_number.int = #q1_z large_number.int
scoreboard players operation #sstempz2 large_number.int *= #q2_y large_number.int
scoreboard players operation #sstempz3 large_number.int = #q1_z large_number.int
scoreboard players operation #sstempz3 large_number.int *= #q2_x large_number.int
scoreboard players operation #sstempz4 large_number.int = #q1_z large_number.int
scoreboard players operation #sstempz4 large_number.int *= #q2_w large_number.int

scoreboard players operation #q3_w large_number.int -= #sstempx1 large_number.int
scoreboard players operation #q3_w large_number.int -= #sstempy1 large_number.int
scoreboard players operation #q3_w large_number.int -= #sstempz1 large_number.int
scoreboard players operation #q3_x large_number.int += #sstempx2 large_number.int
scoreboard players operation #q3_x large_number.int += #sstempy2 large_number.int
scoreboard players operation #q3_x large_number.int -= #sstempz2 large_number.int
scoreboard players operation #q3_y large_number.int -= #sstempx3 large_number.int
scoreboard players operation #q3_y large_number.int += #sstempy3 large_number.int
scoreboard players operation #q3_y large_number.int += #sstempz3 large_number.int
scoreboard players operation #q3_z large_number.int += #sstempx4 large_number.int
scoreboard players operation #q3_z large_number.int -= #sstempy4 large_number.int
scoreboard players operation #q3_z large_number.int += #sstempz4 large_number.int
