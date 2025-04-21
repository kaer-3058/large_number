scoreboard players reset * ln_const
scoreboard objectives remove ln_const
execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate":"large_number.database_uninstall","fallback": "\u00A77\u00A7o数据库卸载成功"}
