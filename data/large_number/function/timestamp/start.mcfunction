##获取今日的日期和时间 - base64解码

#使用前需要载入前置库：function large_number:timestamp/database
#因获取玩家头颅里的base64需要等待方块更新，所以解码会稍有延迟
#若玩家在单人存档使用本功能，则需要联网

#已知bug：如果执行后，下面这条命令测试成功，则表示玩家头颅加载不正确，解决方法是延迟1tick或1秒再执行一次本函数
#execute unless data storage large_number:timestamp timestamp_base64
#bug产生原因：多种因素造成的网络扰动

setblock -29999982 -60 22022222 minecraft:air
setblock -29999982 -60 22022222 minecraft:player_head
execute unless data storage large_number:math player_head_cache_list[0] run data modify storage large_number:math player_head_cache_list set value ["MHF_Alex","MHF_Blaze","MHF_CaveSpider","MHF_Chicken","MHF_Cow","MHF_Creeper","MHF_Enderman","MHF_Ghast","MHF_Golem","MHF_Herobrine","MHF_LavaSlime","MHF_MushroomCow","MHF_Ocelot","MHF_Pig","MHF_PigZombie","MHF_Sheep","MHF_Skeleton","MHF_Slime","MHF_Spider","MHF_Squid","MHF_Steve","MHF_Villager","MHF_WSkeleton","MHF_Zombie","MHF_Cactus","MHF_Cake","MHF_Chest","MHF_CoconutB","MHF_CoconutG","MHF_Melon","MHF_OakLog","MHF_Present1","MHF_Present2","MHF_Pumpkin","MHF_TNT","MHF_TNT2","MHF_ArrowUp","MHF_ArrowDown","MHF_ArrowLeft","MHF_ArrowRight","MHF_Exclamation","MHF_Question"]
data modify block -29999982 -60 22022222 profile.name set from storage large_number:math player_head_cache_list[0]
data modify storage large_number:timestamp timestamp_decoded_base64 set value []
data remove storage large_number:timestamp timestamp_base64

scoreboard players set #timestamp_year int 1970
scoreboard players set #timestamp_month int 1
scoreboard players set #timestamp_day int 1
scoreboard players set #timestamp.num int 0

#带前导0的时分秒
data modify storage large_number:timestamp output_day_Second set value "00"
data modify storage large_number:timestamp output_day_Minute set value "00"
data modify storage large_number:timestamp output_day_Hour set value "00"

#发送信号，由侦测器检测到方块更新后，会由后面的命令方块测试到此信号然后执行"cb_start"函数
scoreboard players set #cb_run_func:"timestamp/cb_start" int 1


#原理：https://www.bilibili.com/video/BV1Hp4y1g7Ex
