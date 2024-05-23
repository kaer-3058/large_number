##解码base64的前置库

data modify storage large_number:timestamp timestamp_baselist set value ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","+","/"]

data modify storage large_number:timestamp timestamp_ascii_list set value ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",'!','"','#','$','%','&','\'','(',')','*','+',',','-','.','/','0','1','2','3','4','5','6','7','8','9',':',';','<','=','>','?','@','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','[','\\',']','^','_','`','a','b','c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '{', '|', '}', '~']

#data modify storage large_number:timestamp timestamp_ascii_list set value ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""," ",'!','"','#','$','%','&','\'','(',')','*','+',',','-','.','/','0','1','2','3','4','5','6','7','8','9',':',';','<','=','>','?','@','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','[','\\',']','^','_','`','a','b','c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '{', '|', '}', '~']
#区别就是把空格给换成了空字符

data modify storage large_number:timestamp timestamp._binary_ascii_00000000 set from storage large_number:timestamp timestamp_ascii_list[0]
data modify storage large_number:timestamp timestamp._binary_ascii_00000001 set from storage large_number:timestamp timestamp_ascii_list[1]
data modify storage large_number:timestamp timestamp._binary_ascii_00000010 set from storage large_number:timestamp timestamp_ascii_list[2]
data modify storage large_number:timestamp timestamp._binary_ascii_00000011 set from storage large_number:timestamp timestamp_ascii_list[3]
data modify storage large_number:timestamp timestamp._binary_ascii_00000100 set from storage large_number:timestamp timestamp_ascii_list[4]
data modify storage large_number:timestamp timestamp._binary_ascii_00000101 set from storage large_number:timestamp timestamp_ascii_list[5]
data modify storage large_number:timestamp timestamp._binary_ascii_00000110 set from storage large_number:timestamp timestamp_ascii_list[6]
data modify storage large_number:timestamp timestamp._binary_ascii_00000111 set from storage large_number:timestamp timestamp_ascii_list[7]
data modify storage large_number:timestamp timestamp._binary_ascii_00001000 set from storage large_number:timestamp timestamp_ascii_list[8]
data modify storage large_number:timestamp timestamp._binary_ascii_00001001 set from storage large_number:timestamp timestamp_ascii_list[9]
data modify storage large_number:timestamp timestamp._binary_ascii_00001010 set from storage large_number:timestamp timestamp_ascii_list[10]
data modify storage large_number:timestamp timestamp._binary_ascii_00001011 set from storage large_number:timestamp timestamp_ascii_list[11]
data modify storage large_number:timestamp timestamp._binary_ascii_00001100 set from storage large_number:timestamp timestamp_ascii_list[12]
data modify storage large_number:timestamp timestamp._binary_ascii_00001101 set from storage large_number:timestamp timestamp_ascii_list[13]
data modify storage large_number:timestamp timestamp._binary_ascii_00001110 set from storage large_number:timestamp timestamp_ascii_list[14]
data modify storage large_number:timestamp timestamp._binary_ascii_00001111 set from storage large_number:timestamp timestamp_ascii_list[15]
data modify storage large_number:timestamp timestamp._binary_ascii_00010000 set from storage large_number:timestamp timestamp_ascii_list[16]
data modify storage large_number:timestamp timestamp._binary_ascii_00010001 set from storage large_number:timestamp timestamp_ascii_list[17]
data modify storage large_number:timestamp timestamp._binary_ascii_00010010 set from storage large_number:timestamp timestamp_ascii_list[18]
data modify storage large_number:timestamp timestamp._binary_ascii_00010011 set from storage large_number:timestamp timestamp_ascii_list[19]
data modify storage large_number:timestamp timestamp._binary_ascii_00010100 set from storage large_number:timestamp timestamp_ascii_list[20]
data modify storage large_number:timestamp timestamp._binary_ascii_00010101 set from storage large_number:timestamp timestamp_ascii_list[21]
data modify storage large_number:timestamp timestamp._binary_ascii_00010110 set from storage large_number:timestamp timestamp_ascii_list[22]
data modify storage large_number:timestamp timestamp._binary_ascii_00010111 set from storage large_number:timestamp timestamp_ascii_list[23]
data modify storage large_number:timestamp timestamp._binary_ascii_00011000 set from storage large_number:timestamp timestamp_ascii_list[24]
data modify storage large_number:timestamp timestamp._binary_ascii_00011001 set from storage large_number:timestamp timestamp_ascii_list[25]
data modify storage large_number:timestamp timestamp._binary_ascii_00011010 set from storage large_number:timestamp timestamp_ascii_list[26]
data modify storage large_number:timestamp timestamp._binary_ascii_00011011 set from storage large_number:timestamp timestamp_ascii_list[27]
data modify storage large_number:timestamp timestamp._binary_ascii_00011100 set from storage large_number:timestamp timestamp_ascii_list[28]
data modify storage large_number:timestamp timestamp._binary_ascii_00011101 set from storage large_number:timestamp timestamp_ascii_list[29]
data modify storage large_number:timestamp timestamp._binary_ascii_00011110 set from storage large_number:timestamp timestamp_ascii_list[30]
data modify storage large_number:timestamp timestamp._binary_ascii_00011111 set from storage large_number:timestamp timestamp_ascii_list[31]
data modify storage large_number:timestamp timestamp._binary_ascii_00100000 set from storage large_number:timestamp timestamp_ascii_list[32]
data modify storage large_number:timestamp timestamp._binary_ascii_00100001 set from storage large_number:timestamp timestamp_ascii_list[33]
data modify storage large_number:timestamp timestamp._binary_ascii_00100010 set from storage large_number:timestamp timestamp_ascii_list[34]
data modify storage large_number:timestamp timestamp._binary_ascii_00100011 set from storage large_number:timestamp timestamp_ascii_list[35]
data modify storage large_number:timestamp timestamp._binary_ascii_00100100 set from storage large_number:timestamp timestamp_ascii_list[36]
data modify storage large_number:timestamp timestamp._binary_ascii_00100101 set from storage large_number:timestamp timestamp_ascii_list[37]
data modify storage large_number:timestamp timestamp._binary_ascii_00100110 set from storage large_number:timestamp timestamp_ascii_list[38]
data modify storage large_number:timestamp timestamp._binary_ascii_00100111 set from storage large_number:timestamp timestamp_ascii_list[39]
data modify storage large_number:timestamp timestamp._binary_ascii_00101000 set from storage large_number:timestamp timestamp_ascii_list[40]
data modify storage large_number:timestamp timestamp._binary_ascii_00101001 set from storage large_number:timestamp timestamp_ascii_list[41]
data modify storage large_number:timestamp timestamp._binary_ascii_00101010 set from storage large_number:timestamp timestamp_ascii_list[42]
data modify storage large_number:timestamp timestamp._binary_ascii_00101011 set from storage large_number:timestamp timestamp_ascii_list[43]
data modify storage large_number:timestamp timestamp._binary_ascii_00101100 set from storage large_number:timestamp timestamp_ascii_list[44]
data modify storage large_number:timestamp timestamp._binary_ascii_00101101 set from storage large_number:timestamp timestamp_ascii_list[45]
data modify storage large_number:timestamp timestamp._binary_ascii_00101110 set from storage large_number:timestamp timestamp_ascii_list[46]
data modify storage large_number:timestamp timestamp._binary_ascii_00101111 set from storage large_number:timestamp timestamp_ascii_list[47]
data modify storage large_number:timestamp timestamp._binary_ascii_00110000 set from storage large_number:timestamp timestamp_ascii_list[48]
data modify storage large_number:timestamp timestamp._binary_ascii_00110001 set from storage large_number:timestamp timestamp_ascii_list[49]
data modify storage large_number:timestamp timestamp._binary_ascii_00110010 set from storage large_number:timestamp timestamp_ascii_list[50]
data modify storage large_number:timestamp timestamp._binary_ascii_00110011 set from storage large_number:timestamp timestamp_ascii_list[51]
data modify storage large_number:timestamp timestamp._binary_ascii_00110100 set from storage large_number:timestamp timestamp_ascii_list[52]
data modify storage large_number:timestamp timestamp._binary_ascii_00110101 set from storage large_number:timestamp timestamp_ascii_list[53]
data modify storage large_number:timestamp timestamp._binary_ascii_00110110 set from storage large_number:timestamp timestamp_ascii_list[54]
data modify storage large_number:timestamp timestamp._binary_ascii_00110111 set from storage large_number:timestamp timestamp_ascii_list[55]
data modify storage large_number:timestamp timestamp._binary_ascii_00111000 set from storage large_number:timestamp timestamp_ascii_list[56]
data modify storage large_number:timestamp timestamp._binary_ascii_00111001 set from storage large_number:timestamp timestamp_ascii_list[57]
data modify storage large_number:timestamp timestamp._binary_ascii_00111010 set from storage large_number:timestamp timestamp_ascii_list[58]
data modify storage large_number:timestamp timestamp._binary_ascii_00111011 set from storage large_number:timestamp timestamp_ascii_list[59]
data modify storage large_number:timestamp timestamp._binary_ascii_00111100 set from storage large_number:timestamp timestamp_ascii_list[60]
data modify storage large_number:timestamp timestamp._binary_ascii_00111101 set from storage large_number:timestamp timestamp_ascii_list[61]
data modify storage large_number:timestamp timestamp._binary_ascii_00111110 set from storage large_number:timestamp timestamp_ascii_list[62]
data modify storage large_number:timestamp timestamp._binary_ascii_00111111 set from storage large_number:timestamp timestamp_ascii_list[63]
data modify storage large_number:timestamp timestamp._binary_ascii_01000000 set from storage large_number:timestamp timestamp_ascii_list[64]
data modify storage large_number:timestamp timestamp._binary_ascii_01000001 set from storage large_number:timestamp timestamp_ascii_list[65]
data modify storage large_number:timestamp timestamp._binary_ascii_01000010 set from storage large_number:timestamp timestamp_ascii_list[66]
data modify storage large_number:timestamp timestamp._binary_ascii_01000011 set from storage large_number:timestamp timestamp_ascii_list[67]
data modify storage large_number:timestamp timestamp._binary_ascii_01000100 set from storage large_number:timestamp timestamp_ascii_list[68]
data modify storage large_number:timestamp timestamp._binary_ascii_01000101 set from storage large_number:timestamp timestamp_ascii_list[69]
data modify storage large_number:timestamp timestamp._binary_ascii_01000110 set from storage large_number:timestamp timestamp_ascii_list[70]
data modify storage large_number:timestamp timestamp._binary_ascii_01000111 set from storage large_number:timestamp timestamp_ascii_list[71]
data modify storage large_number:timestamp timestamp._binary_ascii_01001000 set from storage large_number:timestamp timestamp_ascii_list[72]
data modify storage large_number:timestamp timestamp._binary_ascii_01001001 set from storage large_number:timestamp timestamp_ascii_list[73]
data modify storage large_number:timestamp timestamp._binary_ascii_01001010 set from storage large_number:timestamp timestamp_ascii_list[74]
data modify storage large_number:timestamp timestamp._binary_ascii_01001011 set from storage large_number:timestamp timestamp_ascii_list[75]
data modify storage large_number:timestamp timestamp._binary_ascii_01001100 set from storage large_number:timestamp timestamp_ascii_list[76]
data modify storage large_number:timestamp timestamp._binary_ascii_01001101 set from storage large_number:timestamp timestamp_ascii_list[77]
data modify storage large_number:timestamp timestamp._binary_ascii_01001110 set from storage large_number:timestamp timestamp_ascii_list[78]
data modify storage large_number:timestamp timestamp._binary_ascii_01001111 set from storage large_number:timestamp timestamp_ascii_list[79]
data modify storage large_number:timestamp timestamp._binary_ascii_01010000 set from storage large_number:timestamp timestamp_ascii_list[80]
data modify storage large_number:timestamp timestamp._binary_ascii_01010001 set from storage large_number:timestamp timestamp_ascii_list[81]
data modify storage large_number:timestamp timestamp._binary_ascii_01010010 set from storage large_number:timestamp timestamp_ascii_list[82]
data modify storage large_number:timestamp timestamp._binary_ascii_01010011 set from storage large_number:timestamp timestamp_ascii_list[83]
data modify storage large_number:timestamp timestamp._binary_ascii_01010100 set from storage large_number:timestamp timestamp_ascii_list[84]
data modify storage large_number:timestamp timestamp._binary_ascii_01010101 set from storage large_number:timestamp timestamp_ascii_list[85]
data modify storage large_number:timestamp timestamp._binary_ascii_01010110 set from storage large_number:timestamp timestamp_ascii_list[86]
data modify storage large_number:timestamp timestamp._binary_ascii_01010111 set from storage large_number:timestamp timestamp_ascii_list[87]
data modify storage large_number:timestamp timestamp._binary_ascii_01011000 set from storage large_number:timestamp timestamp_ascii_list[88]
data modify storage large_number:timestamp timestamp._binary_ascii_01011001 set from storage large_number:timestamp timestamp_ascii_list[89]
data modify storage large_number:timestamp timestamp._binary_ascii_01011010 set from storage large_number:timestamp timestamp_ascii_list[90]
data modify storage large_number:timestamp timestamp._binary_ascii_01011011 set from storage large_number:timestamp timestamp_ascii_list[91]
data modify storage large_number:timestamp timestamp._binary_ascii_01011100 set from storage large_number:timestamp timestamp_ascii_list[92]
data modify storage large_number:timestamp timestamp._binary_ascii_01011101 set from storage large_number:timestamp timestamp_ascii_list[93]
data modify storage large_number:timestamp timestamp._binary_ascii_01011110 set from storage large_number:timestamp timestamp_ascii_list[94]
data modify storage large_number:timestamp timestamp._binary_ascii_01011111 set from storage large_number:timestamp timestamp_ascii_list[95]
data modify storage large_number:timestamp timestamp._binary_ascii_01100000 set from storage large_number:timestamp timestamp_ascii_list[96]
data modify storage large_number:timestamp timestamp._binary_ascii_01100001 set from storage large_number:timestamp timestamp_ascii_list[97]
data modify storage large_number:timestamp timestamp._binary_ascii_01100010 set from storage large_number:timestamp timestamp_ascii_list[98]
data modify storage large_number:timestamp timestamp._binary_ascii_01100011 set from storage large_number:timestamp timestamp_ascii_list[99]
data modify storage large_number:timestamp timestamp._binary_ascii_01100100 set from storage large_number:timestamp timestamp_ascii_list[100]
data modify storage large_number:timestamp timestamp._binary_ascii_01100101 set from storage large_number:timestamp timestamp_ascii_list[101]
data modify storage large_number:timestamp timestamp._binary_ascii_01100110 set from storage large_number:timestamp timestamp_ascii_list[102]
data modify storage large_number:timestamp timestamp._binary_ascii_01100111 set from storage large_number:timestamp timestamp_ascii_list[103]
data modify storage large_number:timestamp timestamp._binary_ascii_01101000 set from storage large_number:timestamp timestamp_ascii_list[104]
data modify storage large_number:timestamp timestamp._binary_ascii_01101001 set from storage large_number:timestamp timestamp_ascii_list[105]
data modify storage large_number:timestamp timestamp._binary_ascii_01101010 set from storage large_number:timestamp timestamp_ascii_list[106]
data modify storage large_number:timestamp timestamp._binary_ascii_01101011 set from storage large_number:timestamp timestamp_ascii_list[107]
data modify storage large_number:timestamp timestamp._binary_ascii_01101100 set from storage large_number:timestamp timestamp_ascii_list[108]
data modify storage large_number:timestamp timestamp._binary_ascii_01101101 set from storage large_number:timestamp timestamp_ascii_list[109]
data modify storage large_number:timestamp timestamp._binary_ascii_01101110 set from storage large_number:timestamp timestamp_ascii_list[110]
data modify storage large_number:timestamp timestamp._binary_ascii_01101111 set from storage large_number:timestamp timestamp_ascii_list[111]
data modify storage large_number:timestamp timestamp._binary_ascii_01110000 set from storage large_number:timestamp timestamp_ascii_list[112]
data modify storage large_number:timestamp timestamp._binary_ascii_01110001 set from storage large_number:timestamp timestamp_ascii_list[113]
data modify storage large_number:timestamp timestamp._binary_ascii_01110010 set from storage large_number:timestamp timestamp_ascii_list[114]
data modify storage large_number:timestamp timestamp._binary_ascii_01110011 set from storage large_number:timestamp timestamp_ascii_list[115]
data modify storage large_number:timestamp timestamp._binary_ascii_01110100 set from storage large_number:timestamp timestamp_ascii_list[116]
data modify storage large_number:timestamp timestamp._binary_ascii_01110101 set from storage large_number:timestamp timestamp_ascii_list[117]
data modify storage large_number:timestamp timestamp._binary_ascii_01110110 set from storage large_number:timestamp timestamp_ascii_list[118]
data modify storage large_number:timestamp timestamp._binary_ascii_01110111 set from storage large_number:timestamp timestamp_ascii_list[119]
data modify storage large_number:timestamp timestamp._binary_ascii_01111000 set from storage large_number:timestamp timestamp_ascii_list[120]
data modify storage large_number:timestamp timestamp._binary_ascii_01111001 set from storage large_number:timestamp timestamp_ascii_list[121]
data modify storage large_number:timestamp timestamp._binary_ascii_01111010 set from storage large_number:timestamp timestamp_ascii_list[122]
data modify storage large_number:timestamp timestamp._binary_ascii_01111011 set from storage large_number:timestamp timestamp_ascii_list[123]
data modify storage large_number:timestamp timestamp._binary_ascii_01111100 set from storage large_number:timestamp timestamp_ascii_list[124]
data modify storage large_number:timestamp timestamp._binary_ascii_01111101 set from storage large_number:timestamp timestamp_ascii_list[125]
data modify storage large_number:timestamp timestamp._binary_ascii_01111110 set from storage large_number:timestamp timestamp_ascii_list[126]

data modify storage large_number:timestamp timestamp._binary_A set value "000000"
data modify storage large_number:timestamp timestamp._binary_B set value "000001"
data modify storage large_number:timestamp timestamp._binary_C set value "000010"
data modify storage large_number:timestamp timestamp._binary_D set value "000011"
data modify storage large_number:timestamp timestamp._binary_E set value "000100"
data modify storage large_number:timestamp timestamp._binary_F set value "000101"
data modify storage large_number:timestamp timestamp._binary_G set value "000110"
data modify storage large_number:timestamp timestamp._binary_H set value "000111"
data modify storage large_number:timestamp timestamp._binary_I set value "001000"
data modify storage large_number:timestamp timestamp._binary_J set value "001001"
data modify storage large_number:timestamp timestamp._binary_K set value "001010"
data modify storage large_number:timestamp timestamp._binary_L set value "001011"
data modify storage large_number:timestamp timestamp._binary_M set value "001100"
data modify storage large_number:timestamp timestamp._binary_N set value "001101"
data modify storage large_number:timestamp timestamp._binary_O set value "001110"
data modify storage large_number:timestamp timestamp._binary_P set value "001111"
data modify storage large_number:timestamp timestamp._binary_Q set value "010000"
data modify storage large_number:timestamp timestamp._binary_R set value "010001"
data modify storage large_number:timestamp timestamp._binary_S set value "010010"
data modify storage large_number:timestamp timestamp._binary_T set value "010011"
data modify storage large_number:timestamp timestamp._binary_U set value "010100"
data modify storage large_number:timestamp timestamp._binary_V set value "010101"
data modify storage large_number:timestamp timestamp._binary_W set value "010110"
data modify storage large_number:timestamp timestamp._binary_X set value "010111"
data modify storage large_number:timestamp timestamp._binary_Y set value "011000"
data modify storage large_number:timestamp timestamp._binary_Z set value "011001"
data modify storage large_number:timestamp timestamp._binary_a set value "011010"
data modify storage large_number:timestamp timestamp._binary_b set value "011011"
data modify storage large_number:timestamp timestamp._binary_c set value "011100"
data modify storage large_number:timestamp timestamp._binary_d set value "011101"
data modify storage large_number:timestamp timestamp._binary_e set value "011110"
data modify storage large_number:timestamp timestamp._binary_f set value "011111"
data modify storage large_number:timestamp timestamp._binary_g set value "100000"
data modify storage large_number:timestamp timestamp._binary_h set value "100001"
data modify storage large_number:timestamp timestamp._binary_i set value "100010"
data modify storage large_number:timestamp timestamp._binary_j set value "100011"
data modify storage large_number:timestamp timestamp._binary_k set value "100100"
data modify storage large_number:timestamp timestamp._binary_l set value "100101"
data modify storage large_number:timestamp timestamp._binary_m set value "100110"
data modify storage large_number:timestamp timestamp._binary_n set value "100111"
data modify storage large_number:timestamp timestamp._binary_o set value "101000"
data modify storage large_number:timestamp timestamp._binary_p set value "101001"
data modify storage large_number:timestamp timestamp._binary_q set value "101010"
data modify storage large_number:timestamp timestamp._binary_r set value "101011"
data modify storage large_number:timestamp timestamp._binary_s set value "101100"
data modify storage large_number:timestamp timestamp._binary_t set value "101101"
data modify storage large_number:timestamp timestamp._binary_u set value "101110"
data modify storage large_number:timestamp timestamp._binary_v set value "101111"
data modify storage large_number:timestamp timestamp._binary_w set value "110000"
data modify storage large_number:timestamp timestamp._binary_x set value "110001"
data modify storage large_number:timestamp timestamp._binary_y set value "110010"
data modify storage large_number:timestamp timestamp._binary_z set value "110011"
data modify storage large_number:timestamp timestamp._binary_0 set value "110100"
data modify storage large_number:timestamp timestamp._binary_1 set value "110101"
data modify storage large_number:timestamp timestamp._binary_2 set value "110110"
data modify storage large_number:timestamp timestamp._binary_3 set value "110111"
data modify storage large_number:timestamp timestamp._binary_4 set value "111000"
data modify storage large_number:timestamp timestamp._binary_5 set value "111001"
data modify storage large_number:timestamp timestamp._binary_6 set value "111010"
data modify storage large_number:timestamp timestamp._binary_7 set value "111011"
data modify storage large_number:timestamp timestamp._binary_8 set value "111100"
data modify storage large_number:timestamp timestamp._binary_9 set value "111101"
data modify storage large_number:timestamp timestamp._binary_+ set value "111110"
data modify storage large_number:timestamp timestamp._binary_/ set value "111111"


tellraw @a {"text":"已执行函数large_number:timestamp/database中的194条命令，录入了\u00A7e383\u00A7r条数据"}
