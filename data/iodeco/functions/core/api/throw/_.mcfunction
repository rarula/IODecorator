#> iodeco:core/api/throw/_
#
# @input
#   storage iodeco: in
#       error: Error
#
# @within function iodeco:api/throw

# エラーのリストをコピーしておく
    data modify storage iodeco:temp ErrorList set from storage iodeco: in.errorList

# 全てのエラーを出力する
    function iodeco:core/api/throw/loop

# リセット
    data remove storage iodeco:temp ErrorList
    data remove storage iodeco:core Error
    data remove storage iodeco: in
