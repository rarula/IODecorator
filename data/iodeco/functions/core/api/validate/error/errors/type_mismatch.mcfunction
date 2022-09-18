#> iodeco:core/api/validate/error/errors/type_mismatch
#
# TypeMismatchError を発生させる
#
# @input
#   storage iodeco:temp
#       ExpectedType: string
#           期待されていた型
#       Detail?: any
#           (任意) エラーメッセージに使用する変数のデータ
#
# @within function iodeco:core/api/validate/**

# エラーを組み立てる
    data modify storage iodeco:temp Error.name set value "TypeMismatchError"
    data modify storage iodeco:temp Error.message set value '[{"text":"", "color":"red"}, {"translate":"Expected type of \'%1$s\' is \'%2$s\', but received type is \'%3$s\'.", "with":[{"storage":"iodeco:core", "nbt":"Error.nbtName"}, {"storage":"iodeco:core", "nbt":"Error.detail.expectedType", "interpret":true}, {"storage":"iodeco:core", "nbt":"Error.detail.receivedType"}]}]'
    data modify storage iodeco:temp Error.detail set from storage iodeco:temp Detail
    data modify storage iodeco:temp Error.detail.expectedType set from storage iodeco:temp ExpectedType
    data modify storage iodeco:temp Error.detail.receivedType set from storage iodeco:core ReceivedType
    function iodeco:core/api/validate/error/common/base

# リセット
    data remove storage iodeco:temp ExpectedType
    data remove storage iodeco:temp Detail
