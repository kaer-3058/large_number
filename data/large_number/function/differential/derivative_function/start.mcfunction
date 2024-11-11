##导函数

#data modify storage large_number:math derivative_function.input set value "3*ｘ^4+(sinｘ)"


#导数表
execute if data storage large_number:math {temp1:"sinｘ"} run data modify storage large_number:math temp1 set value "cosｘ"
execute if data storage large_number:math {temp1:"ｘ"} run data modify storage large_number:math temp1 set value "1"
execute if data storage large_number:math {temp1:"ｘ²"} run data modify storage large_number:math temp1 set value "2ｘ"
execute if data storage large_number:math {temp1:"cosｘ"} run data modify storage large_number:math temp1 set value "—(sinｘ)"
execute if data storage large_number:math {temp1:"tanｘ"} run data modify storage large_number:math temp1 set value "（secｘ)²"
execute if data storage large_number:math {temp1:"cotｘ"} run data modify storage large_number:math temp1 set value "—((cscｘ)²)"
execute if data storage large_number:math {temp1:"1^ｘ"} run data modify storage large_number:math temp1 set value "0"
execute if data storage large_number:math {temp1:"ｅ^ｘ"} run data modify storage large_number:math temp1 set value "expｘ"
execute if data storage large_number:math {temp1:"expｘ"} run data modify storage large_number:math temp1 set value "expｘ"
execute if data storage large_number:math {temp1:"lnｘ"} run data modify storage large_number:math temp1 set value "1/ｘ"
execute if data storage large_number:math {temp1:"arcsinｘ"} run data modify storage large_number:math temp1 set value "1/(√(1-ｘ²))"
execute if data storage large_number:math {temp1:"arccosｘ"} run data modify storage large_number:math temp1 set value "-1/(√(1-ｘ²))"
execute if data storage large_number:math {temp1:"arctanｘ"} run data modify storage large_number:math temp1 set value "1/(1+ｘ²)"
execute if data storage large_number:math {temp1:"arccotｘ"} run data modify storage large_number:math temp1 set value "-1/(1+ｘ²)"
execute if data storage large_number:math {temp1:"√ｘ"} run data modify storage large_number:math temp1 set value "1/(2*(√ｘ))"
execute if data storage large_number:math {temp1:"1/ｘ"} run data modify storage large_number:math temp1 set value "-1/ｘ²"
execute if data storage large_number:math {temp1:"ºLambertWｘ"} run data modify storage large_number:math temp1 set value "(ºLambertWｘ)/((ºLambertWｘ+1)*ｘ)"
execute if data storage large_number:math {temp1:"||ｘ"} run data modify storage large_number:math temp1 set value "(||ｘ)/ｘ"
execute if data storage large_number:math {temp1:"sgnｘ"} run data modify storage large_number:math temp1 set value "0"
execute if data storage large_number:math {temp1:"[]ｘ"} run data modify storage large_number:math temp1 set value "0"
execute if data storage large_number:math {temp1:"—ｘ"} run data modify storage large_number:math temp1 set value "-1"
execute if data storage large_number:math {temp1:"ｘ"} run data modify storage large_number:math temp1 set value "ｘ"
execute if data storage large_number:math {temp1:"ｘ"} run data modify storage large_number:math temp1 set value "ｘ"
execute if data storage large_number:math {temp1:"ｘ"} run data modify storage large_number:math temp1 set value "ｘ"
execute if data storage large_number:math {temp1:"ｘ"} run data modify storage large_number:math temp1 set value "ｘ"


