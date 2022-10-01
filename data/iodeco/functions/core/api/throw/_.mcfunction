#> iodeco:core/api/throw/_
#
# @input
#   storage iodeco: in
#       errorList: Error[]
#
# @within function iodeco:api/throw

# 全てのエラーを出力する
    function iodeco:core/api/throw/loop

# リセット
    data remove storage iodeco: error
    data remove storage iodeco: in
