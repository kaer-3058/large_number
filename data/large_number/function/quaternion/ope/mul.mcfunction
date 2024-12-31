##单位四元数乘法 q1*q2

#scoreboard players set #q1_x int 7445
#scoreboard players set #q1_y int 1234
#scoreboard players set #q1_z int 5423
#scoreboard players set #q1_w int 1023

#scoreboard players set #q2_x int 2323
#scoreboard players set #q2_y int 1423
#scoreboard players set #q2_z int 1525
#scoreboard players set #q2_w int 8383

#10000倍输入：{#q1_x, #q1_y, #q1_z, #q1_w}   {#q2_x, #q2_y, #q2_z, #q2_w}
#100000000倍输出：{#q3_x, #q3_y, #q3_z, #q3_w}

scoreboard players operation #q3_w int = #q1_w int
scoreboard players operation #q3_w int *= #q2_w int
scoreboard players operation #q3_x int = #q1_w int
scoreboard players operation #q3_x int *= #q2_x int
scoreboard players operation #q3_y int = #q1_w int
scoreboard players operation #q3_y int *= #q2_y int
scoreboard players operation #q3_z int = #q1_w int
scoreboard players operation #q3_z int *= #q2_z int

scoreboard players operation #sstempx1 int = #q1_x int
scoreboard players operation #sstempx1 int *= #q2_x int
scoreboard players operation #sstempx2 int = #q1_x int
scoreboard players operation #sstempx2 int *= #q2_w int
scoreboard players operation #sstempx3 int = #q1_x int
scoreboard players operation #sstempx3 int *= #q2_z int
scoreboard players operation #sstempx4 int = #q1_x int
scoreboard players operation #sstempx4 int *= #q2_y int

scoreboard players operation #sstempy1 int = #q1_y int
scoreboard players operation #sstempy1 int *= #q2_y int
scoreboard players operation #sstempy2 int = #q1_y int
scoreboard players operation #sstempy2 int *= #q2_z int
scoreboard players operation #sstempy3 int = #q1_y int
scoreboard players operation #sstempy3 int *= #q2_w int
scoreboard players operation #sstempy4 int = #q1_y int
scoreboard players operation #sstempy4 int *= #q2_x int

scoreboard players operation #sstempz1 int = #q1_z int
scoreboard players operation #sstempz1 int *= #q2_z int
scoreboard players operation #sstempz2 int = #q1_z int
scoreboard players operation #sstempz2 int *= #q2_y int
scoreboard players operation #sstempz3 int = #q1_z int
scoreboard players operation #sstempz3 int *= #q2_x int
scoreboard players operation #sstempz4 int = #q1_z int
scoreboard players operation #sstempz4 int *= #q2_w int

scoreboard players operation #q3_w int -= #sstempx1 int
scoreboard players operation #q3_w int -= #sstempy1 int
scoreboard players operation #q3_w int -= #sstempz1 int
scoreboard players operation #q3_x int += #sstempx2 int
scoreboard players operation #q3_x int += #sstempy2 int
scoreboard players operation #q3_x int -= #sstempz2 int
scoreboard players operation #q3_y int -= #sstempx3 int
scoreboard players operation #q3_y int += #sstempy3 int
scoreboard players operation #q3_y int += #sstempz3 int
scoreboard players operation #q3_z int += #sstempx4 int
scoreboard players operation #q3_z int -= #sstempy4 int
scoreboard players operation #q3_z int += #sstempz4 int
