##解码base64的前置库

#data modify storage large_number:timestamp timestamp_baselist set value ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","+","/"]

#data modify storage large_number:timestamp timestamp_list set value ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""," ",'!','"','#','$','%','&','\'','(',')','*','+',',','-','.','/','0','1','2','3','4','5','6','7','8','9',':',';','<','=','>','?','@','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','[','\\',']','^','_','`','a','b','c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '{', '|', '}', '~']

data modify storage large_number:timestamp timestamp.= set value 0
data modify storage large_number:timestamp timestamp.A set value 0
data modify storage large_number:timestamp timestamp.B set value 1
data modify storage large_number:timestamp timestamp.C set value 10
data modify storage large_number:timestamp timestamp.D set value 11
data modify storage large_number:timestamp timestamp.E set value 100
data modify storage large_number:timestamp timestamp.F set value 101
data modify storage large_number:timestamp timestamp.G set value 110
data modify storage large_number:timestamp timestamp.H set value 111
data modify storage large_number:timestamp timestamp.I set value 1000
data modify storage large_number:timestamp timestamp.J set value 1001
data modify storage large_number:timestamp timestamp.K set value 1010
data modify storage large_number:timestamp timestamp.L set value 1011
data modify storage large_number:timestamp timestamp.M set value 1100
data modify storage large_number:timestamp timestamp.N set value 1101
data modify storage large_number:timestamp timestamp.O set value 1110
data modify storage large_number:timestamp timestamp.P set value 1111
data modify storage large_number:timestamp timestamp.Q set value 10000
data modify storage large_number:timestamp timestamp.R set value 10001
data modify storage large_number:timestamp timestamp.S set value 10010
data modify storage large_number:timestamp timestamp.T set value 10011
data modify storage large_number:timestamp timestamp.U set value 10100
data modify storage large_number:timestamp timestamp.V set value 10101
data modify storage large_number:timestamp timestamp.W set value 10110
data modify storage large_number:timestamp timestamp.X set value 10111
data modify storage large_number:timestamp timestamp.Y set value 11000
data modify storage large_number:timestamp timestamp.Z set value 11001
data modify storage large_number:timestamp timestamp.a set value 11010
data modify storage large_number:timestamp timestamp.b set value 11011
data modify storage large_number:timestamp timestamp.c set value 11100
data modify storage large_number:timestamp timestamp.d set value 11101
data modify storage large_number:timestamp timestamp.e set value 11110
data modify storage large_number:timestamp timestamp.f set value 11111
data modify storage large_number:timestamp timestamp.g set value 100000
data modify storage large_number:timestamp timestamp.h set value 100001
data modify storage large_number:timestamp timestamp.i set value 100010
data modify storage large_number:timestamp timestamp.j set value 100011
data modify storage large_number:timestamp timestamp.k set value 100100
data modify storage large_number:timestamp timestamp.l set value 100101
data modify storage large_number:timestamp timestamp.m set value 100110
data modify storage large_number:timestamp timestamp.n set value 100111
data modify storage large_number:timestamp timestamp.o set value 101000
data modify storage large_number:timestamp timestamp.p set value 101001
data modify storage large_number:timestamp timestamp.q set value 101010
data modify storage large_number:timestamp timestamp.r set value 101011
data modify storage large_number:timestamp timestamp.s set value 101100
data modify storage large_number:timestamp timestamp.t set value 101101
data modify storage large_number:timestamp timestamp.u set value 101110
data modify storage large_number:timestamp timestamp.v set value 101111
data modify storage large_number:timestamp timestamp.w set value 110000
data modify storage large_number:timestamp timestamp.x set value 110001
data modify storage large_number:timestamp timestamp.y set value 110010
data modify storage large_number:timestamp timestamp.z set value 110011
data modify storage large_number:timestamp timestamp.0 set value 110100
data modify storage large_number:timestamp timestamp.1 set value 110101
data modify storage large_number:timestamp timestamp.2 set value 110110
data modify storage large_number:timestamp timestamp.3 set value 110111
data modify storage large_number:timestamp timestamp.4 set value 111000
data modify storage large_number:timestamp timestamp.5 set value 111001
data modify storage large_number:timestamp timestamp.6 set value 111010
data modify storage large_number:timestamp timestamp.7 set value 111011
data modify storage large_number:timestamp timestamp.8 set value 111100
data modify storage large_number:timestamp timestamp.9 set value 111101
data modify storage large_number:timestamp timestamp.+ set value 111110
data modify storage large_number:timestamp timestamp./ set value 111111

tellraw @a {"translate":"large_number.timestamp_database.command_times","fallback": "已执行函数large_number:timestamp/database中的66条命令，录入了\u00A7e65\u00A7r条数据"}
