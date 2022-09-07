#> iodeco:core/api/validate/error/errors/type_mismatch
#
# TypeMismatchError を発生させる
#
# @input
#   storage iodeco:temp
#       ExpectedType: string
#           期待されていた型
#
# @within function iodeco:core/api/validate/predicate/predicates/*/check_type

# エラーを組み立てる
    data modify storage iodeco:temp Error.name set value "TypeMismatchError"
    data modify storage iodeco:temp Error.message set value '[{"text":"", "color":"red"}, {"translate":"Expected type of \'%1$s\' is \'%2$s\', but received type is \'%3$s\'.", "with":[{"storage":"iodeco:core", "nbt":"Error.nbtName"}, {"storage":"iodeco:core", "nbt":"Error.detail.expectedType"}, {"storage":"iodeco:core", "nbt":"Error.detail.receivedType"}]}]'
    data modify storage iodeco:temp Error.detail.expectedType set from storage iodeco:temp ExpectedType
    data modify storage iodeco:temp Error.detail.receivedType set from storage iodeco:core ReceivedType
    function iodeco:core/api/validate/error/common/base

# リセット
    data remove storage iodeco:temp ExpectedType
