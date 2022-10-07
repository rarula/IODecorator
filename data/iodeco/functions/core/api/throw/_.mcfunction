#> iodeco:core/api/throw/_
#
# @input
#   storage iodeco: in
#       errorList: Error[]
#
# @within function iodeco:api/throw

# 配列の長さが1以上 -> 全てのエラーを出力する
    execute if data storage iodeco: in.errorList[0] run function iodeco:core/api/throw/loop

# リセット
    data remove storage iodeco: error
    data remove storage iodeco: in
