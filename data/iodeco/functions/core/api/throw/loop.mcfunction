#> iodeco:core/api/throw/loop
# @within function
#   iodeco:core/api/throw/_
#   iodeco:core/api/throw/loop

# 配列先頭の要素を抜き出す
    data modify storage iodeco:core Error set from storage iodeco:temp ErrorList[0]
    data remove storage iodeco:temp ErrorList[0]

# | {error.name}
# |  {error.message}

# エラーを出力する
    tellraw @a [{"text":"", "color":"red"}, {"text":""},   {"storage":"iodeco:core", "nbt":"Error.name", "bold":true}]
    tellraw @a [{"text":"", "color":"red"}, {"text":"  "}, {"storage":"iodeco:core", "nbt":"Error.message", "interpret":true}]

# 全てを出力し終えるまで再帰
    execute if data storage iodeco:temp ErrorList[0] run function iodeco:core/api/throw/loop
