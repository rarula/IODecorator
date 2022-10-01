#> iodeco:core/api/throw/loop
# @within function
#   iodeco:core/api/throw/_
#   iodeco:core/api/throw/loop

# 配列先頭の要素を抜き出す
    data modify storage iodeco: error set from storage iodeco: in.errorList[0]
    data remove storage iodeco: in.errorList[0]

# | {error.name}
# |  {error.message}

# エラーを出力する
    tellraw @a [{"color":"red", "text":""},  {"storage":"iodeco:", "nbt":"error.name", "bold":true}]
    tellraw @a [{"color":"red", "text":" "}, {"storage":"iodeco:", "nbt":"error.message", "interpret":true}]

# 全てを出力し終えるまで再帰
    execute if data storage iodeco: in.errorList[0] run function iodeco:core/api/throw/loop
