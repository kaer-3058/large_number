## ka__er's math lib

For minecraft 1.20.4

Related concepts: 16-bit BCD array, segmented storage, floating-point type, double type, leading zero, absolute value, const, precision, scientific notation. If an element in a 16-bit BCD array has less than four digits, it should be padded with 0s to make up four digits when reading the number. 

Entities in this datapack, such as world entities, display entities, and temporary entities, are all in the overworld. 

> World entity: Marker with a fixed UUID, This type of entity is usually unique worldwide, so it is called a world entity.
>
> 16-bit BCD array: If it contains 12 digits, the maximum value should be represented as [I; 9999,9999,9999], and the minimum value should be represented as [I; 0,0,0].

Recommended settings: `gamerule maxCommandChainLength 2147483647`

　

♦ Const

```
π：storage large_number:const "π"
e：storage large_number:const "e"
NaN：storage large_number:math buffer_NaN
```

　

♦ Trigonometric functions：large_number:math_trifs/_of_entity

```
Input：entity b09e-44-fded-6-efa5ffffef64 Rotation[0] 0.0f
Output：#sin int，#cos int，#tan int，#cot int，#sec int，#csc int
```

♦ sin and cos

```
#input
entity b09e-44-fded-6-efa5ffffef64 Rotation[0] 0.0f

#operation
execute in overworld as b09e-44-fded-6-efa5ffffef64 rotated as @s rotated ~ 0.0 positioned .0 .0 .0 run tp @s ^1.0 ^ ^ ~ ~

#sin
entity b09e-44-fded-6-efa5ffffef64 Pos[2]

#cos
entity b09e-44-fded-6-efa5ffffef64 Pos[0]
```

♦ atan2d：large_number:math_trifs/atan2

```
Input：#y int，#x int
Formula：atan2d(y,x)
Execute：as b09e-44-fded-6-efa5ffffef64 run func.. 
Output (degrees)：entity b09e-44-fded-6-efa5ffffef64 Rotation[0]
```

♦ arcsin and arccos

arcsin：large_number:math_trifs/arcsin

arccos：large_number:math_trifs/arccos

Formula：arcsin(x)=atan2(x,√(1-x^2))，arccos(x)=atan2(√(1-x^2),x)

```
Input：#arcsin_cos.input int
Enlarging the input by a factor of 10000, the input range are: [-10000, 10000]

Output (degrees)：entity b09e-44-fded-6-efa5ffffef64 Rotation[0]
```

　

♦ Large number addition：large_number:addition/start

```
Addend1：storage large_number:math addition.input1 [I;0,0,0]
Addend2：storage large_number:math addition.input2 [I;0,0,0]
Sum：storage large_number:math addition.output
```

♦ Large number subtraction：large_number:subtraction/start

```
Minuend：storage large_number:math subtraction.input1 [I;0,0,0,0]
Subtrahend：storage large_number:math subtraction.input2 [I;0,0,0,0]
Difference：storage large_number:math subtraction.output
```

　

♦ Displaying entity law for floating-point division

Note: Due to the matrix SVD, if all input values are positive, the output will always be positive. However, if the input values are negative, the output may not necessarily be positive or negative.

```
Input: The 1st, 6th, and 11th elements of the list are the dividends, and the last number is the divisor.
entity 28529-0-3d00-0-2c4200ee8401 transformation [1.0f,0.0f,0.0f,0.0f,0.0f,1.0f,0.0f,0.0f,0.0f,0.0f,1.0f,0.0f,0.0f,0.0f,0.0f,1.0f]

Output:
entity 28529-0-3d00-0-2c4200ee8401 transformation.scale
```

♦ Displaying entity law for large number division：large_number:division/display_large_number/start

Only dealing with positive numbers.

```
Dividend
storage large_number:math display_div_large.input.dividend1 [I;0,0,0]
storage large_number:math display_div_large.input.dividend2 [I;0,0,0]
storage large_number:math display_div_large.input.dividend3 [I;0,0,0]

Divisor
storage large_number:math display_div_large.input.divisor [I;0,0,0]

Quotient list
entity 28529-0-3d00-0-2c4200ee8401 transformation.scale
```

♦ Floating-point division - Data from the score

1. 8 significant digits：large_number:division/hpo/_div

```
Dividend
#float_sign int (Sign, options: -1, 0, 1, representing negative sign, zero, positive sign)
#float_int0 int (The first eight significant digits of the input value. Range is from 10000000 to 99999999 or 0)
#float_exp int (Exponent, range is a full int)

Divisor
#Divisor_float_sign int (Sign, options: -1, 0, 1, representing negative sign, zero, positive sign)
#Divisor_float_int0 int (The first eight significant digits of the input value. Range is from 10000000 to 99999999)
#Divisor_float_exp int (Exponent, range is a full int)

Example:
set #float_sign int 1
set #float_int0 int 44553375
set #float_exp int 23
It represents the number: 1*0.44553375*10^23

Output in a way that changes the dividend
```

2. 12 significant digits：large_number:division/multi_times_modulo

```
Dividend
#float_sign int (Sign, options: -1, 0, 1, representing negative sign, zero, positive sign)
#float_int0 int (The first eight significant digits of the input value. Range is from 10000000 to 99999999 or 0)
#float_exp int (Exponent, range is a full int)

Divisor
#Divisor_float_sign int (Sign, options: -1, 0, 1, representing negative sign, zero, positive sign)
#Divisor_float_int0 int (The first eight significant digits of the input value. Range is from 10000000 to 99999999)
#Divisor_float_exp int (Exponent, range is a full int)

Quotient
#float_sign int (Sign)
#float_int0 int(First 8 digits) + #float_int1 int(9~12 digits)
#float_exp int (Exponent)

If the fractional part of #float_int1 int is less than four digits, zeros should be added at the beginning of the number to make it a four-digit number when reading it.
```

♦ Floating-point division - Data from the nbt

8 significant digits：large_number:division/float/start

12 significant digits：large_number:division/float_12dicimal/start

Input float or double

```
Dividend：storage large_number:math float_division.input1 0.0
Divisor：storage large_number:math float_division.input2 0.0
Quotient：storage large_number:math float_division.output
```

♦ Divide a 12-digit array by a const (with 4 decimal)：large_number:division/list_div_const

Principle: Long division

The fourth number in the output array will be a decimal, and the const cannot exceed five digits.

```
Input：
Dividend：storage large_number:math list_div_const.dividend [I;0,0,0]
Divisor：#list_div_const_divisor int

Output：
Quotient：storage large_number:math list_div_const.output
Quotient sign：storage large_number:math list_div_const.output_sign
```

♦ Division with an infinite number of significant digits：large_number:division/loop_more_more_dicimal/start

Principle: Recursive modulo division

```
Dividend
#float_sign int (Sign, options: -1, 0, 1, representing negative sign, zero, positive sign)
#float_int0 int (The first eight significant digits of the input value. Range is from 10000000 to 99999999 or 0)
#float_exp int (Exponent, range is a full int)

Divisor
#Divisor_float_sign int (Sign, options: -1, 0, 1, representing negative sign, zero, positive sign)
#Divisor_float_int0 int (The first eight significant digits of the input value. Range is from 10000000 to 99999999)
#Divisor_float_exp int (Exponent, range is a full int)

Number of significant digits：#loop_more_more_dicimal_times int

Quotient
#float_sign int (Sign)
storage large_number:math loop_more_more_dicimal_base (Base)
#float_exp int (Exponent)

The output base is a array, and the reading method involves writing each element from front to back, with a 0 added at the beginning. For example, if the values of #float_sign int and #float_exp int are 1 and 12 respectively, and the base is [0,0,1,9,0,3,7,0], then they represent the number 1*0.00190370*10^12.
```

♦ Taking the reciprocal of a floating-point number：large_number:division/float_reciprocal/start

Input float or double

```
Input：storage large_number:math float_reciprocal.input 0.0
output：storage large_number:math float_reciprocal.output
```

　

♦ Int division

8 significant digits：large_number:division/int_8dicimal/start

12 significant digits：large_number:division/int_12dicimal/start

As a generalization of float division, although it accepts the entire int value, in practice, only the first eight digits of the dividend and divisor are considered.

```
Dividend：#int_+dicimal.input1 int
Divisor：#int_+dicimal.input2 int

Quotient：storage large_number:math int_more_dicimal_out
```

♦ Array division by an int (multiple significant digits)：large_number:division/list_div_int/start

The dividend must be a 16-bit BCD array, and all elements of the dividend array as well as the divisor must be positive.

Only the first eight digits of the divisor are considered.

Principle: Segment division, (a+b+c)/m = a/m+b/m+c/m

No iteration, trial division, recursion, or variable number of commands.

```
Dividend：storage large_number:math list_div_int.list [I;0,0,0]
Divisor：storage large_number:math list_div_int.int 1

Quotient (double type)：storage large_number:math list_div_int.output
```

　

♦ Arbitrary integer multiplication：large_number:int_mul_by_n/start

Principle：execute store + data get，It can be used to store integers using a multiplier and import dynamic multipliers using function macros.

```
Input integer：storage large_number:math int_mul_by_n.input_int
Input multiplier：storage large_number:math int_mul_by_n.input_n
The desired output data type：storage large_number:math int_mul_by_n.data_type "double"

output：storage large_number:math int_mul_by_n.output
```
The "integer" input can be a non-integer, but it will be processed as an integer by rounding down and limiting the range to the integer type. The "multiplier" input can be any numerical value, but the unit of data will be ignored during computation and converted into a double type. Optional data types："byte"、"float"、"double"、"short"、"int"、"long".

♦ Float multiply：large_number:float_multiply/start

Principle：execute store + data get，It can be used to store integers using a multiplier and import dynamic multipliers using function macros.

```
Factor1：storage large_number:math float_multiply.input1 0.0
Factor2：storage large_number:math float_multiply.input2 0.0
Input float or double.

Product：storage large_number:math float_multiply.output
```

　

♦ High-precision float multiply：large_number:float_mul.high_precision/start

Principle: A new architecture is adopted, which converts all input values into arrays using the algorithm of converting double to int arrays, and then performs large number multiplication. The exponent is calculated based on the information read from the input values.

It can be accurate up to the level of double type.

```
Factor1：storage large_number:math float_multiply.input1 0.0
Factor2：storage large_number:math float_multiply.input2 0.0
Input float or double.

Product：storage large_number:math float_multiply.output
```

　

♦ Float addition and subtraction：`execute in minecraft:overworld run function large_number:float_add_subtra/start`

Input float or double, but the output is always of double type.

Principle：execute positioned + loot spawn, input parameters using function macros. Since "loot spawn" has no coordinate upper or lower limits, this algorithm can perform addition and subtraction of all floating-point numbers.

```
Input：
storage large_number:math float_add_subtra.input1 0.0
storage large_number:math float_add_subtra.input2 0.0

Operation mode：set #float_add_subtra_ope_mode int
1 stands for addition, and 2 stands for subtraction.
If it is addition, it is the sum of the two numbers. If it is subtraction, it is input1 minus input2

Output：storage large_number:math float_add_subtra.output
```

　

♦ Int multiply：large_number:int_int_multiply

Principle: Array multiplication using vertical multiplication method.

```
Factor1：input int
Factor2：input.2 int
Product：storage large_number:math int_int_multiply.output
```

♦ Int square：large_number:int_square

```
Input：input int
Output：storage large_number:math int_squ
```

♦ 12 digits number multiply：large_number:1we_multiply

```
Factor1：storage large_number:math 1we_multiply.input1 [I;0,0,0]
Factor2：storage large_number:math 1we_multiply.input2 [I;0,0,0]
Product：storage large_number:math 1we_multiply.output
```

♦ 12 digits number square：large_number:1we_square

```
Input：storage large_number:math 1we_squ.input [I;0,0,0]
Output：storage large_number:math 1we_squ.output
```

♦ Infinite digit number multiply：large_number:infinite_digit_multiply/start

```
Factor1：storage large_number:math Infinite_digit_multiply.input1 [I;0,0]
Factor2：storage large_number:math Infinite_digit_multiply.input2 [I;0,0]
Input format: The factor must be a 16-bit BCD array, and all elements of the array must be positive.

output：storage large_number:math Infinite_digit_multiply.output
```

　

♦ Splitting an int into an array：large_number:cut_math_to_list

```
Input：input int
output：#sign int (Sign)，#1st int，#2nd int，#3rd int
```

　

♦ Int sqrt

Floor (16 pure scoreboard commands)：large_number:int_sqrt_simple

4 dicimals (32 pure scoreboard commands)：large_number:int_sqrt

Retain multiple decimals：large_number:test_int_more_dicimal

#If the input value is 1 to 5 digits, output 9 decimal places; if the input value is 6 to 7 digits, output 8 decimal places; if the input value is 8 to 10 digits, output 7 decimal places.

#Sometimes there may be a slight loss of precision in the last decimal digit obtained.

#If the retained decimal places are not sufficient for the expected number of digits, leading zeros should be added to complete the number when reading.

Principle: Initial estimation + Newton iteration, see reference for details.

```
Input：input.sqrt int

Floor output：output.sqrt int
4 dicimals output (Increase by a factor of ten thousand)：output.sqrt int

Retain multiple decimals output：
Integer part：output.sqrt int
Decimal part：output.dicimal int
```

♦ Int sqrt - Continued Fraction Iteration Method：large_number:sqrt_continued_fraction/start

Accuracy can reach 14 decimal places.

The decimal part of the continued fraction iteration method is output in the form of a fraction.

Built-in overflow check, it automatically stops before overflowing in either the numerator or denominator.

For example, when calculating the square root of 10, the output after 50 iterations is the same as after 11 iterations.

Since both the numerator and the denominator are stored in single segments of the scoreboard, the actual allowable number of iterations should not exceed 32.

It is recommended to have an understanding of what a continued fraction is before use.

For the algorithm to generate continued fractions, please refer to the cited literature.

```
The number to be square rooted：#conti_frac.sqrt.input int
Iteration count：#conti_frac.sqrt.loops int
Simplification：set #conti_frac.sqrt.reduction_fraction int 1
Display continued fraction expression：set #conti_frac.sqrt.tellraw int 1

Output：
Integer part：#conti_frac.sqrt.inte int

Decimal partv (fraction)：
Numerator：#conti_frac.sqrt.A int
Denominator：#conti_frac.sqrt.N int

Continued fraction expression：storage large_number:math conti_frac_sqrt_expression
```

♦ Int sqrt - Newton iteration (retain 4 decimals)：large_number:newton.s_method_sqrt/int_dicimal.4

The idea is to divide by a constant using an array, without trial division, recursion, or binary tree, utilizing 41 pure scoreboard commands.

```
Input：#Newton's-method_sqrt.input int
Output (Increase by a factor of ten thousand)：#Newton's-method_sqrt.output int
```

♦ Sqrt of a 10 to 16 digit number

Principle: High-precision estimation method. Only the first eight digits are considered when calculating the first four digits of the square root. The remaining digits of the result are calculated using an estimation algorithm for decimals.

Floor：large_number:large_sqrt_digit16

Estimation method for decimals：large_number:large_sqrt_digit16_with_dicimal

Long division method for decimals：large_number:large_sqrt_digit16_vertical_method

```
Input：storage large_number:math large_sqrt_digit16.input [I;0,0,0,0]

High-precision mode：set #large_sqrt16.test16 int 1

Output：
Integer part：storage large_number:math large_sqrt_digit16.output
Decimal partv：storage large_number:math large_sqrt_digit16.output_dicimal
Merge the integer and decimal parts：storage large_number:math large_sqrt_digit16.output_with_dicimal
```

The high-precision mode is a feature of the 16-digit integer square root algorithm. In order to pursue efficiency, a high-precision estimation method is used, at the cost of a slight loss of precision in the last digit. This characteristic only occurs when dealing with 16-digit numbers.

In the high-precision mode, the algorithm validates its result by comparing the square of the calculated square root to the original number, for yourself decides whether to open it. The estimation method for decimals defaults to enabling the high-precision mode.

The long division method for decimals adopts an approach to square root extraction without precision fluctuations, but it can only extract four decimal places.

♦ Sqrt of a 1 to 24 digit number (floor)：large_number:large_sqrt

Principle: Newton iteration+long division method

```
Input：storage large_number:math large_sqrt.input [I;0,0,0,0,0,0]
Output：storage large_number:math large_sqrt.output
```

To avoid wasting computing resources, please use the following priorities: Choose "Int sqrt" for numbers within the integer range, select "Sqrt of a 10 to 16 digit number" for 10 to 16 digit numbers, and consider "Sqrt of a 1 to 24 digit number" as a last resort.

　

♦ Cube root of an int

Principle: Cube root estimation algorithm. Take a constant x, where n is the integer part of the cube root of x, and z is the decimal part of the cube root. Then, (x-n\^3)/(3n\^2 +3n+1)≈z. The integer part is obtained using binary search.

Floor：large_number:cube_root/floor

Keep 4 decimal places：large_number:cube_root/4dicimal

```
Input：#cbrt.input int
Output：#cbrt.output int
If four decimal places are to be retained, the output be multiplied by ten thousand.
```

　

♦ Euclidean norm of a double

The input data type must be double and only positive values are accepted.

1.Two-dimensional norm

Trigonometric method：`execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:double_norm/trif_2d`

Formula：`√(x²+y²)=x/cos(atan2(y,x))`

Unit vector method：`execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:double_norm/unit_vector_2d`

```
Input：
storage large_number:math double_norm_2d.x 1.0d
storage large_number:math double_norm_2d.y 1.0d

Output：storage large_number:math double_norm_2d.output
```

2.Three-dimensional norm

Trigonometric method：`execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:double_norm/trif_3d`

Formula：`√(x²+y²+z²)=λ/cos(atan2(z,λ))`，where λ is the two-dimensional norm with respect to x and y.

Unit vector method：`execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:double_norm/unit_vector_3d`

```
Input：
storage large_number:math double_norm_3d.x 1.0d
storage large_number:math double_norm_3d.y 1.0d
storage large_number:math double_norm_3d.z 1.0d

Output：storage large_number:math double_norm_3d.output
```

　

♦ Converting double to an int array

Input double or float.

Principle: Extracting numerical information from the string representation and then converting it to an integer using a digit-by-digit method.

Normal conversion：large_number:double_to_int

Consideration for scientific notation conversion：large_number:double_to_int_sci

Macro function for conversion：large_number:macro_operation/double_to_int_macro

Consideration for scientific notation in macro function conversion：large_number:macro_operation/double_to_int_macro_sci

```
Input：storage large_number:math double_to_int.input 0.0d
Output：storage large_number:math double_to_int.output
```

Parameter description: "math" for numerical value, "sign" for sign, "expon" for exponent, "point" for decimal point position, "leading_zeros" for the number of leading zeros.

Reading order: numerical value > leading zeros > decimal point position > exponent > sign.

The macro function only saves commands, and whether it saves overhead still needs to be verified.

Reading method: For each number, there must be a sign and a numerical value. For floating-point numbers in MC, the exponent, decimal point position, and number of leading zeros do not change simultaneously. If one of them changes, the other two parameters are fixed. In other words, for the converted numerical information:

If the exponent is not 0, then the decimal point position must be 2 (after the first number), and there must be 0 leading zeros.

If the decimal point position is not 2, then the exponent must be 0, and there must be 0 leading zeros.

If the number of leading zeros is between 1 and 3 (MC floating-point numbers can have a maximum of three leading zeros), then the decimal point position must be 2, and the exponent must be 0.

　

♦ double sqrt (high-precision floating-point numbers sqrt)

Input double or float.

Principle: After converting to an int array, square root is performed using the 16-bit number method.

Normal square root：large_number:double_sqrt

Consideration for square root of numbers in scientific notation：large_number:double_sqrt_sci

```
Input：storage large_number:math double_sqrt.input 0.0d
Output：storage large_number:math double_sqrt.output
High-precision mode：set #large_sqrt16.test16 int 1

For the square root in scientific notation form, the base and the exponent of the result are combined：
set #double_sqrt.integrate_sci_math int 1
```

Parameter description: "int" represents the result in integer, "double" represents the result in decimal point form, "expon" represents the exponent of the decimal form result, "double_sci" represents the final result integrating the decimal part and the exponent part.

♦ Fast floating-point square root：large_number:new_double_ope/double_sqrt_sci

The new architecture sacrifices a bit of accuracy and adopts a more efficient algorithm. 59 basic commands, plus 12 if the input is in scientific notation, plus 9 if the precision is increased by four digits, up to a maximum of 80 commands.

Principle: Using the magnification storage method to obtain the base of the double, using the string extraction method to obtain the exponent. The result is calculated using integer square root method, and the output is adjusted based on the exponent.

```
Input：storage large_number:math double_sqrt.input
Input double or float.
Increase precision by four digits：set #New_double_sqrt.dicimal_add int 1

Output：storage large_number:math double_sqrt.output.double_sci
```

　

♦ Display of a 24-digit number

Display the number of digits entered：large_number:digital_display

Always ensure that the displayed number is 24 digits long：large_number:24_digital_display

Difference: The latter automatically adds leading zeros to make the number 24 digits long if the input number is less than 24 digits.

Separate every three digits with a comma. If any number in the array is negative, consider the entire array as negative.

```
Input (16-bit BCD array)：storage large_number:math math_display [I;0,0,0,0,0,0]

Displaying the following JSON text will show the numbers：
[{"nbt":"math_display_json_is-","storage":"large_number:math"},{"nbt":"math_display_json[]","storage":"large_number:math","separator":{"text":","}}]
```

　

♦ Distance measurement using unit vector method

1.Enter any two points：large_number:unit_vector_for_distance
Range of the difference between the coordinates of two points：100\*|x|+100\*|y|+100\*|z| ≤2147483

```
Input
P1： storage large_number:math unit_vector.P1 [0.0,0.0,0.0]
P2：storage large_number:math unit_vector.P2 [0.0,0.0,0.0]
Operation：as b09e-44-fded-6-efa5ffffef64 run func...
Output (already magnified by 10 times)：#distance int
```

2.Enter the absolute difference of the coordinates of the two points：large_number:unit_vector_for_distance_modu

Players need to calculate and enter the difference themselves.

Input value range：100x+100y+100z ≤2147483

```
Input：storage large_number:math unit_vector_modu.input [0.0,0.0,0.0]
Operation：as b09e-44-fded-6-efa5ffffef64 run func...
Output (already magnified by 10 times)：#distance int
```

　

♦ List Algorithm - Shuffle：large_number:list_operation/shuffle/start

Randomly shuffle the order of a list.

Principle：@e[sort=random]

```
Input：storage large_number:math list_ope_shuffle.input []
Output：storage large_number:math list_ope_shuffle.output

Clean up temp markers generated by the list algorithm：
execute in minecraft:overworld run kill @e[type=minecraft:marker,tag=large_number.list_operation]
```

♦ List Algorithm - Draw a Card：large_number:list_operation/random_index_once/start

Randomly draw an element from a list.

Principle：set from list[$(random)]

```
Input：storage large_number:math list_ope_random_index_once.input []
Remove the drawn item from the original list：set #list_ope_random_index_once.del int 1

Output：storage large_number:math list_ope_random_index_once.output
```

♦ List Algorithm - Deduplicate Elements (Return Value Method)：large_number:list_operation/deduplicate/start

```
Input：storage large_number:math list_dedup.input []
Output：storage large_number:math list_dedup.output
```

　

♦ Convert UUID array to hyphenated hexadecimal format：large_number:uuid_list_for_hyphen/start

For example：[I; 30583058, 20172024, 31415926, -3059] to "01d2a912-0133-ccf8-01df-5e76fffff40d"

```
Input：storage large_number:math uuid_list_for_hyphen.input [I;0,0,0,0]
Output：storage large_number:math uuid_list_for_hyphen.output
```

♦ Convert hyphenated hexadecimal UUID to array

Arithmetic method：large_number:uuid_list_for_hyphen/back

Entity attribute method：`execute in minecraft:overworld run function large_number:uuid_list_for_hyphen/back_for_attribute with storage large_number:math uuid_hyphen_back_list`

For example："00000035-ffff-f910-0000-00fffffffffd" to [I; 53, -1776, 255, -3]

The complete 32-bit UUID must be entered, and the 0 in front of each section cannot be omitted. The hexadecimal UUID has a total of 32 digits, with the number of characters in each section fixed at 8, 4, 4, 4, and 12.

```
Input：storage large_number:math uuid_hyphen_back_list.input ""
Output：storage large_number:math uuid_hyphen_back_list.output
```

　

♦ Probability Simulation - Binomial Distribution

Test 1： large_number:random/binomial_distribution/test1

Test Content: If the input values contain powers of 2, there is a 50% chance of subtracting the power of 2. Perform the test 31 times from 2^30 to 2^0 and return the modified input values.

```
Input (Only positive values are accepted)：set #binomial_distribution.test1.input int
Output：#binomial_distribution.test1.output int
```

Test 2： large_number:random/binomial_distribution/test2

Test Content: Perform n trials of Bernoulli experiments with a success probability of p. Test if a random number between 0 and 10^9 is less than the given value, and output the number of successful trials.

```
Number of Trials：set #binomial_distribution.test2.n int
Input range is [0,536870911]

Given Value：set #binomial_distribution.test2.p int
The success probability for each trial is p/(10^9)

Output：#binomial_distribution.test2.output int
```

When n is large enough, the result approaches a normal distribution. The approximation works better when n is larger (at least 20) and p is not close to 0 or 1. Different empirical rules can be used to determine if n is large enough and if p is sufficiently far from 0 or 1. One commonly used rule is that both np and n(1-p) must be greater than 5.

♦ Probability Simulation - Normal Distribution：large_number:random/normal_distribution/test1/start

Test Content: Input an upper limit value n. Generate a random int32 number and repeatedly check its sign and multiply it by 2. If the number of times it is multiplied by 2 reaches 32, generate another random number and continue this operation until the number of checks reaches n. Then sum the results of the checks (0 or 1), and the result will approximate a normal distribution between 0 and n.

```
Upper Limit Value：set #normal_distribution.input int
Output：#normal_distribution.output int
```

♦ Probability Simulation - Uniform Distribution

This module is taken from the NTRE datapack written by xwjcool.

It uses the PCG algorithm, which is more elegant than the LCG algorithm provided by Java.

The random range is -2147483648..2147483647.

Select an entity A for generating random numbers：

```
Init：as <entity A> run func ntre:randomize
Note: Each entity only needs to be init once when loading the datapack.

Generate Random Numbers：as <entity A> run func ntre:next
The output results are stored on the ntre_output scoreboard of entity A.
```

♦ Probability Simulation - Hypergeometric Distribution：large_number:random/hypergeometric_distribution/start

Test content: Drawing n objects without replacement from a finite set of N objects, which contains M specified types of objects, and counting the number of times that the specified type of object is successfully drawn.

```
Sample Pool：storage large_number:math hypergeometric_distribution_list [1,2]
Must input a list of positive integers. The elements in the input list are automatically assigned IDs based on their positions. For example, the ID of the first element is 1, and the ID of the fifth element is 5. Each number represents the quantity of the element with that ID.
ID of the elements to be drawn：#hypergeometric_distribution.target int
Number of draws：#hypergeometric_distribution.times int

Output：#hypergeometric_distribution.output int

Clean up temp markers generated during testing：
execute in minecraft:overworld run kill @e[type=minecraft:marker,tag=large_number.list_operation]
```

♦ Generate "a" random numbers, and sum to "n"：large_number:random/sum_to_x/start

The addition operation here uses the built-in overflow/underflow addition on the scoreboard.

```
n：#random.sum_to_x.n int
a：#random.sum_to_x.a int
Output：storage large_number:math random_sum_to_x_out
```

　

♦ Exponential Function

1. e^x ：large_number:exp_e.x/start

Principle: For the integer part of the exponent and the first three decimal places, table lookup is used for calculation, and Taylor series is used for the four decimal places and beyond.

e is the base of the natural logarithm, it is an irrational number, e ≈ 2.718281828459045.

Example: Input 4.231123, output 68.79444.

```
Preload library required：function large_number:exp_e.x/database
Unload preload library：data remove storage large_number:exp database

Input：storage large_number:math exp_e^x.input 2.0d
The input value must be of type double
Input range is within the interval: (-709, 709.7828)

Output：storage large_number:math exp_e^x.output
```

2. Arbitrary Power of a Positive Number：large_number:exp_any/start

Principle:：a^b = e^(b*ln(a))

Example: Input 5.7322^2.1123，output 39.976065

```
Preload lib for e^x：function large_number:exp_e.x/database
Initial database for ln[1,2]：function large_number:ln_high_precision/database
Unload initial database for：data remove storage large_number:ln_const database

Input：
Base：storage large_number:math exp_any.input.base 2.0d
Exponent：storage large_number:math exp_any.input.expon 3.0d
The input value must be of type double

Output：storage large_number:math exp_any.output
```

♦ Int Exponentiation：large_number:int_base_int_power/start

Can calculate negative base or negative exponent.

```
Input：
Base：#int_base_int_power.base int
Exponent：#int_base_int_power.expon int

Output：storage large_number:math int_base_int_power_out
```

♦ Exponentiation of Floating-Point Numbers (input value can be negative).：large_number:float_base_int_power/start

```
Input：
Base：storage large_number:math float_base_int_power.base 0.0
Exponent：storage large_number:math float_base_int_power.expon 0

Output：storage large_number:math float_base_int_power.output
```

　

♦ Int natural logarithm  ln(x)：large_number:ln/start

Precision: The error should not exceed 0.0009, and return the result with the first four decimal places.

```
Loading initial database is required before performing calculations：function large_number:ln/ln_database

Input：#ln(x) int
Output (Increase by a factor of ten thousand)：#ln(x).output int
Double output：storage large_number:math ln_output

Unloading initial database：function large_number:ln/uninstall_ln_database
```

♦ Double natural logarithm  ln(x)：large_number:ln_double/start

Logarithmic formula：`ln(7.25)=ln(725/100)=ln(725)-ln(100)`，`ln(7.45*10^26)=ln(7.45)+26*ln(10)`

Return the result with the first four decimal places.

```
Loading initial database：function large_number:ln/ln_database

Input：storage large_number:math ln_double.input 0.0d
Output (Increase by a factor of ten thousand)：#ln_double.output int
Double output：storage large_number:math ln_double.output
```

♦ Int logarithm  log.a(b)：large_number:loga.b/start

Return the result with the first four decimal places.

Change of base formula：`log.a(b)=ln(b)/ln(a)`

Special cases: 

The logarithm of a number that is not 1 with a base of 0 or 1 does not exist, therefore the output value is also non-existent. 

The logarithm of 1 with any base is always 0. 

The logarithm of 0 with a base other than 0 or 1 is negative infinity, therefore the output double value is negative infinity, and the scoreboard value is -2147483648.

```
Loading initial database：function large_number:ln/ln_database

Input：
base：#loga.b_a int
antilogarithm：#loga.b_b int

Output (Increase by a factor of ten thousand)：#loga.b.output int
Double output：storage large_number:math "log.a(b).output"
```

♦ Double logarithm  log.a(b)：large_number:loga.b_double/start

```
Loading initial database：function large_number:ln/ln_database

Input：
base：storage large_number:math log(a,b)_double.a 0.0
antilogarithm：storage large_number:math log(a,b)_double.b 0.0

Output：storage large_number:math log(a,b)_double.output
```

♦ Int common logarithm  lg(x)：large_number:lg/start

Return the result with the first four decimal places.

Formula：`lg(x) = ln(x)/ln(10)`

```
Loading initial database：function large_number:ln/ln_database

Input：#lg(x) int

Output (Increase by a factor of ten thousand)：#lg(x)_output int
Double output：storage large_number:math lg(x)_output
```

　

♦ Factorial of a natural number：large_number:gamma_function/fundamental_factorial/start

The input range is within the interval ：[0,170]

```
Input：#natural_num.factorial.input int
Output：storage large_number:math natural_num_factorial
```

♦ Double factorial of a natural number：large_number:gamma_function/fundamental_factorial/double_factorial

The input range is within the interval ：[0,300]
Here, double factorial is defined in its original infinite product form.

```
Input：#natural_num.double_factorial.inp int
Output：storage large_number:math natural_num_double_factorial
```

♦ Gamma function - Stirling formula：large_number:gamma_function/stirling/start

Stirling formula：Γ(x+1) ∽ (sqrt(2πx)·(x/e)^x)·(1+0.0845072303119/x)

The input range is within the interval ：[0.1, 170.6271]

The gamma function is mainly used for calculating the factorial of real numbers.

```
Pre-library for e^x：function large_number:exp_e.x/database
Initial database for ln[1,2]：function large_number:ln_high_precision/database
Unloading initial database for ln[1,2]：data remove storage large_number:ln_const database

Input：storage large_number:math gamma_function.input 0.0d
Input value must be of type double

Output：storage large_number:math gamma_function.output
```

♦ Gamma function - recurrence formula：large_number:gamma_function/recursion/start

Recurrence formula：Γ(x+1) = x·Γ(x) = Γ(x+1-a)·Π(x+1-n, n=1, a)

Note: Π represents the product symbol. "a" can be any positive integer, depending on which interval x is to be restricted to.

The input range is within the interval : [0.001, 170.6026)

```
Loading pre-library：function large_number:gamma_function/recursion/database
Unloading pre-library：data remove storage large_number:math gamma_databse

Input：storage large_number:math gamma_function.input 0.0d
Input value must be of type double.

Output：storage large_number:math gamma_function.output
```

　

♦ Convert direction to quaternion with four components (xyzw)：large_number:quaternion/facing/2tostoxyzw

The direction to be converted must be passed in.

```
Execute：as b09e-44-fded-6-efa5ffffef64 run func...

Output：
List：storage large_number:math xyzw
Scores：#qrot_x int, #qrot_y int, #qrot_z int, #qrot_w int
```

♦ Euler angles to quaternion：`execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:quaternion/euler_angles_to_xyzw`

```
Input：storage large_number:math euler_angles_input [0.0,0.0,0.0]
1st is roll, 2nd is pitch, 3rt is yaw.

Output：storage large_number:math xyzw
```

　

♦ Local coordinate to relative coordinate conversion：large_number:uvw/uvwtoxyz

The direction to be converted must be passed in.

```
Input：#u int，#v int，#w int
Execute：as b09e-44-fded-6-efa5ffffef64 run func...

Output (Increase by a factor of ten thousand)：#x int，#y int，#z int
```

♦ Relative coordinate to local coordinate conversion：large_number:uvw/xyztouvw

The direction to be converted must be passed in.

```
Input：#x int，#y int，#z int
Execute：as b09e-44-fded-6-efa5ffffef64 run func...

Output (Increase by a factor of ten thousand)：#u int，#v int，#w int
```

　

♦ Solve a monic quadratic equation with integer coefficients：large_number:quadratic_equation/start

The equation must be input in general form, where "a", "b", "c" have absolute values that are preferably not greater than 20724. Zero-coefficient "a" is supported.

More accurate: the range of values for Δ (b²-4ac) is the entire integer range, that is, -2147483648 ≤ b²-4ac ≤ 2147483647.

Solve using formula method.

```
Input：
#X_squ_equ.a int
#X_squ_equ.b int
#X_squ_equ.c int

Output (Increase by a factor of ten thousand)：
#X_squ_equ.x1 int
#X_squ_equ.x2 int

Expression form (un-simplified)：storage large_number:math quadratic_equation_out.expression
Double output：storage large_number:math quadratic_equation_out.double

Determine the number of real roots：#X_squ_equ.roots int

Display the results of solving the equation：set #X_squ_equ.tellraw int 1
Displaying this JSON text will show the results：
[{"nbt":"quadratic_equation_out_json_tellraw.json1","storage":"large_number:math","interpret":true},{"nbt":"quadratic_equation_out_json_tellraw.json2","storage":"large_number:math","interpret":true}]
```

Note:

1.If the equation has two distinct real roots, the scoreboard scores for x1 and x2 both exist, and the expression form and double form are both lists, where the first item corresponds to x1 and the second item corresponds to x2.

2.If the equation has two equal real roots, the scoreboard scores for x1 and x2 both exist and are equal, the expression form is a single string, and the double form is a single double value.

3.If the equation has no real roots, the scoreboard scores for x1 and x2 do not exist, and both the expression form and the double form do not exist. `storage large_number:math quadratic_equation_out` will be an empty compound tag.

　

♦ Get the current date and time：large_number:timestamp/start

This function requires an internet connection to use.

Principle: Decoding the Base64 in the head of a genuine player will yield a JSON object containing a Unix timestamp.

Since obtaining the Base64 in the player head requires waiting for block updates, decoding may have some delay.

Known bug: If no output is observed after execution, it means that the head skin has not been loaded correctly. The solution is to delay one tick or one second and then execute this function again.

If it passes, it means that the parsing is incorrect.：`execute unless data storage large_number:timestamp output_base64_json.timestamp`

```
To use this function, you need to load the prerequisite library：function large_number:timestamp/database
Unload the prerequisite library：function large_number:timestamp/uninstall_database

Output
Year：#timestamp_year int
Month：#timestamp_month int
Day：#timestamp_day int
Hour：#timestamp_Hour int
Minute：#timestamp_Minute int
Second：#timestamp_Second int

The number of digits for hour, minute, and second is always two
Hour：storage large_number:timestamp output_day_Hour
Minute：storage large_number:timestamp output_day_Minute
Second：storage large_number:timestamp output_day_Second

Displaying the following JSON text will show the time：
{"nbt":"output_base64_json_tellraw","storage":"large_number:math","interpret":true}

Replace the genuine player ID：storage large_number:math player_head_cache_list ["<玩家名>","<玩家名>"]
Note：
Multiple player names can be stored in the list, but only the first name in the list will be read.
Initial input of genuine player ID：ka__er
```

Because each genuine player name can only obtain two timestamps when entering a single-player archive/server, one when placed as a block and one when placed in an entity's inventory. Then the timestamp exists in the cache and is no longer updated. To update the timestamp, there are only three methods:

1. Re-enter the archive/restart the server; 
2. The head cache expires automatically after one month; 
3. Replace with a new genuine player ID. 

Therefore, if you want to keep the server running for a long time, it is recommended to use internal timing with command blocks, synchronize the time once every two hours, and synchronize the date by replacing a new genuine player ID once every 24 hours. After 30 replacements, the head cache of the first used player ID will expire.

　

♦ Unix Timestamp Parser (32-bit)：large_number:timestamp/parse_timestamp/start

```
Input (int or string)：storage large_number:math parse_timestamp.input

Input GMT time zone：set #GMT-time_zone int 8
For example, Beijing time is GMT+8, so input 8, default is 8

Output：
Year：#parse_timestamp.year int
Month：#parse_timestamp.month int
Day：#parse_timestamp.day int
Hour：#parse_timestamp.Hour int
Minute：#parse_timestamp.Minute int
Second：#parse_timestamp.Second int

Display the following JSON text to show the parsing result：
{"nbt":"parse_timestamp.tellraw","storage":"large_number:math","interpret":true}
```

　

♦ Player Experience Formula - Calculate total experience based on experience level and experience points：large_number:xp_formula/levels_to_points/start

Player Experience Formula：`y=4.5x^2 -162.5x +2099`

When the experience level is greater than or equal to 32, the player's experience is given by: f(x) = 1507+Σ(9n-158, n=32, x-1).

The output value generally cannot be directly used to reverse-engineer a player's existing experience level, due to some special algorithms within Minecraft. There may be some discrepancies between this value and the actual experience points the player has at the moment.

How much difference is there? For example, giving a player 1628 experience points with the "xp" command and giving them 1507 experience points once and 121 experience points once with the same command will result in a difference of 1 point in the total experience gained.

The reason for this is that Minecraft uses the XpP parameter from the player's NBT data when calculating the experience required for the player to level up. This parameter is a floating-point number stored as a percentage, and floating-point errors lead to slight discrepancies between the actual experience the player has and the theoretical experience amount.

```
Input：
Levels：#xp_formula.levels int
Points：#xp_formula.points int
The points number can be obtained using /xp query @s points.

Output：storage large_number:math xp.output
```

♦ Player Experience Formula - Reverse calculation of experience level and experience remainder from total experience：large_number:xp_formula/points_ope_levels/start

Reverse Experience Formula：`y=[√(72x-45503) +325] / 18 (x≥1758)`

The experience formula is a quadratic equation. By using the quadratic formula to reverse it, and keeping only the roots where x ≥ 0, we obtain this reverse experience formula.

Theoretically, the input value should not exceed 2.07526 * 10^19.

```
Input：storage large_number:math xp_points_ope_levels.input [I;0,0,0,0,0]
This algorithm adapts to the number of digits automatically, so there's no need to input a full set of five numbers each time.

Output：
Levels：storage large_number:math xp_points_ope_levels.output_levels
Points：storage large_number:math xp_points_ope_levels.remaining_points

If used to give experience to a player, the experience level should be given first, followed by the points remainder.
```

　

♦ RGB to hexadecimal conversion：large_number:rgb_to_hexadecimal/start

```
Input (The RGB values range from 0 to 255)：
#rgb_to_hexadecimal.R int
#rgb_to_hexadecimal.G int
#rgb_to_hexadecimal.B int

Output：storage large_number:math rgb_to_hexadecimal_output
```

　

♦ Sum of the first N terms of a harmonic series：large_number:harmonic_series/sum1-n

Approximation by formula, no recursion.

Formula：`Σ(1/n,n=1,x)=ψ(x+1)+γ≈ln(x)+0.5772+0.4995078/x`

Note: Σ denotes the sum of a series, ψ represents the Digamma function, the natural logarithm derivative of the gamma function, γ is the Euler-Mascheroni constant, also known as the sum of Ramanujin of the harmonic series, approximately 0.5772156649.

When the input value is negative, the output is 5772, which is the sum of Ramanujin of the harmonic series.

```
Loading initial database：function large_number:ln/ln_database

Input：storage large_number:math Harmonic_series_sum_input 3.0
Input double, float or int, using double or float type inputs can calculate values beyond the int range.

Output (Increase by a factor of ten thousand)：#Harmonic_series.sum.output int
```

　

♦ Int prime factorization：large_number:prime_factorization/start

```
Input：#prime_factorization.input int
Output：storage large_number:math prime_factorization_output

If the output list has only one item, then the input value is a prime number.
```

　

♦ Particle circle in any direction in three-dimensional space

```
Radius (1000 times the input)：#3d.circle.r int
For example, entering 3000 corresponds to a radius of 3

Particle density：#3d.circle.angle int
Particle density refers to plotting a point every "n/10" degrees, where n ranges from 1 to 3600.

Calculate coordinates：
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_rotation_circle/start

Output relative coordinate list：
x：storage large_number:math 3d_ar_rotation_circle_posX
y：storage large_number:math 3d_ar_rotation_circle_posY

Display particles：
execute positioned x y z rotated x y run function large_number:particle/3d_ar_rotation_circle/particle
The execution orientation corresponds to the direction of the circle, and the execution position corresponds to the center of the circle.
```

```
Dye the circle into a color ring: function large_number:particle/rainbow_circle/start

Output the list of colors: storage large_number:math rainbow_circle_color

Display the circle after dyeing: 
execute positioned x y z rotated x y run function large_number:particle/rainbow_circle/particle.macro1

You can achieve a rotating blinking effect like a neon light by rotating the color list. Here's an example: 
Initialize: 
data modify storage large_number:math rainbow_circle_color_list_rotate set from storage large_number:math rainbow_circle_color
Display particles: 
execute positioned x y z rotated x y run function large_number:particle/rainbow_circle/particle_list_rotate
```

♦ Five-pointed star in any direction in three-dimensional space

```
Radius (100 times the input)：#3d.pentagram.r int
For example, entering 500 corresponds to a radius of 5

Particle density：#3d.pentagram.density int
Particle density refers to plotting a point every "n/10" degrees, where n ranges from 1 to 3600.

Roll degrees of the five-pointed star (1000 times the input)：#3d.pentagram.roll.θ int

Calculate coordinates：
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_rotation_pentagram/start

Output relative coordinate list：
x：storage large_number:math 3d_ar_rotation_pentagram_posX
y：storage large_number:math 3d_ar_rotation_pentagram_posY

Display particles：
execute positioned x y z rotated x y run function large_number:particle/3d_ar_rotation_pentagram/particle
The execution orientation corresponds to the direction of the five-pointed star, and the execution position corresponds to the location of the five-pointed star.
```

♦ Ellipse in any direction in three-dimensional space

```
100 times the input, a：#3d.ellipse.a int
100 times the input, b：#3d.ellipse.b int
The input, magnified by 1000, ranges from [1,2147483]

Particle density：#3d.ellipse.density int
Particle density refers to plotting a point every "n/10" degrees, where n ranges from 1 to 3600.

Roll angle (1000 times the input)：#3d.ellipse.roll.θ int

Calculate coordinates：
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_ellipse/start

Output relative coordinate list：storage large_number:math 3d_ar_ellipse_pos
Each sublist contains x as the first item and y as the second item.

Display particles：
execute positioned x y z rotated x y run function large_number:particle/3d_ar_ellipse/particle
The execution orientation corresponds to the direction of the ellipse, and the execution position corresponds to the center of the ellipse.
```

♦ Particle sphere (Fibonacci grid)

Tiling method: If n points are taken from the surface of the sphere, it involves slicing the sphere horizontally into n layers. These points then climb from the bottom to the top of the sphere along its surface. Each layer climbed corresponds to rotating 0.618 revolutions around the center of that layer.

```
Radius：storage large_number:math 3d_hsphere_pos_R 0.0

Number of points taken on the sphere's surface
Input range from [1,40000]

Calculate coordinates：
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_hsphere/start

Output relative coordinate list：storage large_number:math 3d_hsphere_pos
Each sublist contains x as the first item and y as the second item.

Display particles：
execute positioned x y z rotated x y run function large_number:particle/3d_hsphere/particle/start
Pass in the execution position and execution orientation.
```

Additional commands can be executed on the points on the sphere's surface：

```
Commands to be executed on the points on the sphere's surface：
storage large_number:math 3d_block_hsphere_execute "setblock ~ ~ ~ glass"

Execute command：
execute positioned x y z rotated x y run function large_number:particle/3d_block_hsphere/set/start
Pass in the execution position and execution orientation.
```

　

♦ Holographic Particle Projection - 16x16x16 projection to 1x1x1

Project colored concrete as dust particles.

After one scan, particle color, coordinates, and other information will be stored in the database, so projection is still possible even if the scan area is cleared.

Adding resolvable blocks：

In the function "particle/holographic_projection/if" starting from line 18, add commands in the following format：`execute if block ~ ~ ~ xxx run data modify storage large_number:math temp_particle set value "<four special parameters of dust particles>"`

```
Scan：execute positioned x y z run function large_number:particle/holographic_projection/scan.start
Execution position needs to be at the northwest bottom corner of the scanning area.
When "全息粒子投影：扫描完成！" appears in the chat, the scan is complete.

Projection：execute rotated 0.0 0.0 positioned x y z run function large_number:particle/holographic_projection/execute with storage large_number:math holographic_projection_database
Projection requires input of projection point and angle; the base point for displacement and rotation is at the center of the bottom of the projection.
Will trigger the function macro caching mechanism; can be executed at high frequency.

Clear database：data remove storage large_number:math holographic_projection_database
```

　

♦ Parabola

1.Parse the coordinates of three points into the abc of a quadratic function expression：large_number:parabola/3point_ope_coef.abc

Principle: Solve the system of three linear equations corresponding to the three points using addition-subtraction elimination method.

```
Input：storage large_number:math parabola_points [[0.0,0.0],[0.0,0.0],[0.0,0.0]]
Input two-dimensional coordinate points, with integers and the first decimal place.

Output (scaled by a factor of one thousand)：#coef.a int，#coef.b int，#coef.c int
```

2.The expression of the quadratic function is analyzed for the relative coordinates of the points：large_number:parabola/analysis.start

Formula：`f(x)=ax²+bx+c`

The parsed coordinates will be stored in a list, no need to parse every time.

```
Input coefficients multiplied by one thousand：#coef.a int，#coef.b int，#coef.c int
Input starting X value multiplied by one hundred：#parabola_expre_x.start int
Input number of steps：#parabola_expre_x.length int
Input step size multiplied by one hundred：#parabola_expre_x.step_size int

Output list of relative coordinates：
x：storage large_number:math parabola_expre_x
y：storage large_number:math parabola_expre_y

Display the parabola expression：set #parabola_.tellraw int 1
The following JSON text can be used to display the parabola expression：
["f(x)=",{"nbt":"parabola_tellraw.a","storage":"large_number:math"},"x²",{"nbt":"parabola_tellraw.1","storage":"large_number:math"},{"nbt":"parabola_tellraw.b","storage":"large_number:math"},"x",{"nbt":"parabola_tellraw.2","storage":"large_number:math"},{"nbt":"parabola_tellraw.c","storage":"large_number:math"}]
```

3.Display the trajectory of the parabola：`execute positioned x y z rotated 0.0 0.0 run function large_number:parabola/particle`

Pass in the execution position and execution orientation.

```
Mode：#parabola_expr_particl_mode int
Choose between 1 or 2; the difference lies in the reference frame of the particles, which can accommodate different rotation requirements.
In Mode 1, particles originate from the left direction of execution; in Mode 2, particles originate from the front direction of execution.

The displacement and rotation base point of the parabola is its starting point.
```

　

♦ Archimedean Spiral (Constant-Speed Spiral)

Formula：`r=a+bθ`

```
Input a multiplied by one thousand：#archimedean_spiral.a int
Input b multiplied by one thousand：#archimedean_spiral.b int
Input starting degrees multiplied by one hundred：#archimedean_spiral.startθ int
Input arc length step size multiplied by one hundred：#archimedean_spiral.arc_size int
Input degrees step size multiplied by one hundred.：#archimedean_spiral.θ_size int
Number of steps：#archimedean_spiral.length int
Use arc length to calculate the interval between points after n steps：#archimedean_spiral.to_arc int

Calculate coordinates：function large_number:particle/archimedean_spiral/start

Output relative coordinate list：
x：storage large_number:math archimedean_spiral_out_listX
y：storage large_number:math archimedean_spiral_out_listY

Display particles：
execute positioned x y z rotated x y run function large_number:particle/archimedean_spiral/particle
Pass in the execution position and execution orientation.
```

A preset: a is 100, b is 8, starting angle is 0, arc length step is 35, angle step size is 1000, use arc length after 30 steps.

　

♦ Equiangular Spiral (Logarithmic Spiral)

Formula: `θ=a*ln(b*r)`

```
a: #equiangular_spiral.a int
b: #equiangular_spiral.b int
Input initial radius multiplied by one thousand: #equiangular_spiral.start_r int
Input radius step multiplied by one thousand: #equiangular_spiral.r_size int
Number of steps: #equiangular_spiral.length int

Calculate coordinates: function large_number:particle/equiangular_spiral/start

Output relative coordinate list: 
x: storage large_number:math equiangular_spiral_out_listX
y: storage large_number:math equiangular_spiral_out_listY

Display particles: 
execute positioned x y z rotated x y run function large_number:particle/equiangular_spiral/particle
Pass in the execution position and execution orientation.
```

A preset: the "a" is 5000, the "b" is 560, the "initial radius" is 0, the "radius step" is 50, and the "number of steps" is 250.

　

♦ 2D Grid Arrangement

```
Input row spacing multiplied by one thousand：#Matrix_arrangement.rsize int
Input column spacing multiplied by one thousand：#Matrix_arrangement.csize int
Input even row offset multiplied by one thousand：#Matrix_arrangement.tab int
Number of rows.：#Matrix_arrangement.Rows int
Number of columns：#Matrix_arrangement.Columns int
Calculate coordinates：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:matrix_arrangement/start

The output is a list of relative coordinates for x and z of the list.
List of relative x values of coordinates.：storage large_number:math matrix_arrangement_X
List of relative z values of coordinates：storage large_number:math matrix_arrangement_Z

An example using function macros to access the coordinate list：execute positioned x y z rotated x y run function large_number:matrix_arrangement/summon
Pass in the execution position and execution orientation.
```

　

♦ Second Order Bezier Curve

Formula：`B(t)=(1-t)²P0+2t(1-t)P1+t²P2，t∈[0,1]`

```
Input

Input coordinates of three points multiplied by one thousand：
#bezier_curve_II.P0.x int
#bezier_curve_II.P0.y int
#bezier_curve_II.P0.z int

#bezier_curve_II.P1.x int
#bezier_curve_II.P1.y int
#bezier_curve_II.P1.z int

#bezier_curve_II.P2.x int
#bezier_curve_II.P2.y int
#bezier_curve_II.P2.z int

Input step size of t multiplied by ten thousand：#bezier_curve_II.t.size int

Calculate coordinates：function large_number:particle/bezier_curve_2/start

Output relative coordinate list：
x：storage large_number:math bezier_curve_II_list_X
y：storage large_number:math bezier_curve_II_list_Y
z：storage large_number:math bezier_curve_II_list_Z

Display particles：execute positioned x y z rotated x y run function large_number:particle/bezier_curve_2/particle
Pass in the execution position and execution orientation.
```

　

♦ Heart Shape Curve

Heart Shape Curve：

Upper Half：`f(x)=√(r·|x|-x²)`，Lower Half：`g(x)=(r/2)·(arccos(1-|(2x)/r|)-π)`

```
Radius (multiplied by ten thousand)：#heart-shaped_line.r int
Particle density for upper segment (in degrees, multiplied by one hundred)：#heart-shaped_line.t_d int
Particle density for lower segment (in units, multiplied by ten thousand)：#heart-shaped_line.t int

Connect the points at the break in the heart shape curve to join the image (number of points to connect)：#heart-shaped_line.extra int
Adjust the width of the points drawn to fix the image (in units of grids, multiplied by ten thousand)：#heart-shaped_line.t_x int
The discontinuity between the upper and lower segments of the heart shape curve is due to calculation errors.

Calculate coordinates：
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/heart-shaped_line/start

Output relative coordinate list：storage large_number:math heart-shaped_line_Pos
Each sublist contains x as the first item and y as the second item.

Display particles：execute positioned x y z rotated x y run function large_number:particle/heart-shaped_line/particle
Pass in the execution position and execution orientation.
```

　

♦ Color Wheel

```
Displaying the Color Circle：execute positioned x y z rotated x y run function large_number:color_wheel/particle1
Pass in the execution position and execution orientation.

Input angle of the color pointer on the Color Circle (in degrees, counterclockwise, multiplied by ten thousand)：#color_wheel.angle.input int
Input range from [0,3600000]
Mark the position pointed by the Color Circle pointer with particles：set #color_wheel.see_marker int 1
Calculate the color information of the hue cube：function large_number:color_wheel/in/start

Output RGB value at the position of the Color Circle pointer：
#color_wheel.output.R int
#color_wheel.output.G int
#color_wheel.output.B int
Table of particle information for the hue cube：storage large_number:math color_wheel_color_cube_RGB

Displaying the Hue Cube：execute positioned x y z rotated x y run function large_number:color_wheel/in/particle/start
Pass in the execution position and execution orientation.

Input color coordinates of the hue cube multiplied by ten thousand (both in percentages)：
#color_cube.u int
#color_cube.v int
Here, 'u' represents the horizontal distance between the color coordinates and the top-right starting point of the hue cube, while 'v' represents the vertical distance between the color coordinates and the top-right starting point of the hue cube. 
Input range is [0, 10000] for both.

Calculate color coordinates：function large_number:color_wheel/in/ope_uv_color/start

Output RGB value：
#color_cube.R int
#color_cube.G int
#color_cube.B int
```

　

♦ Reference：

> 小豆数学库：https://github.com/xiaodou8593/math2.0
> 
> 知乎.手动开根——牛顿迭代法：https://zhuanlan.zhihu.com/p/497508702
> 
> 知乎.手动开根——竖式开方法：https://zhuanlan.zhihu.com/p/517358606
> 
> 小豆.用命令做一个简易的开根号：https://www.bilibili.com/read/cv5789989
> 
> 天起源.T算法库：https://www.mcmod.cn/class/11569.html
> 
> 计算机系统数学原理：http://mathmu.github.io/publications/mathematical-theory-of-computer-algebra-system
> 
> 【动画密码学】Base64编码&解码算法：https://www.bilibili.com/video/BV1Hp4y1g7Ex
> 
> 卡儿.实数平方根的估值与连分数展开 (提取码 sr8j)：https://pan.baidu.com/s/1eoeChhk7xukIIYxexmMwJQ?pwd=sr8j
> 
> 知乎.最大公约数GCD算法：https://zhuanlan.zhihu.com/p/38100838
> 
> 卡儿.《我的世界》【1.16.5】Java版实用粒子教程：https://www.bilibili.com/read/readlist/rl651851

Tool：GeoGebra，Desmos，Excel，Python

