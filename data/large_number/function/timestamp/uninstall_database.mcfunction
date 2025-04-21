data remove storage large_number:timestamp timestamp_baselist
data remove storage large_number:timestamp timestamp_ascii_list
data remove storage large_number:timestamp timestamp
data remove storage large_number:timestamp timestamp_decoded_base64
execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate":"large_number.database_uninstall","fallback": "\u00A77\u00A7o数据库卸载成功"}
