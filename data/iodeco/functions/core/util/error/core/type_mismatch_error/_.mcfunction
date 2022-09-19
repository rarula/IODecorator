#> iodeco:core/util/error/core/type_mismatch_error/_
#
# @input
#   storage iodeco:util in
#       Name: string
#       ExpectedType: TextComponent
#       ReceivedType: string
#       Detail?: compound
#
# @output
#   storage iodeco:util out
#       Error: Error
#
# @within function iodeco:core/util/error/type_mismatch_error

# エラーを組み立てる
    data modify storage iodeco:temp Error.name set value "TypeMismatchError"
    data modify storage iodeco:temp Error.message set value '[{"text":"", "color":"red"}, {"translate":"Expected type of \'%1$s\' is \'%2$s\', but received type is \'%3$s\'.", "with":[{"storage":"iodeco:core", "nbt":"Error.nbtName"}, {"storage":"iodeco:core", "nbt":"Error.detail.expectedType", "interpret":true}, {"storage":"iodeco:core", "nbt":"Error.detail.receivedType"}]}]'
    data modify storage iodeco:temp Error.nbtName set from storage iodeco:util in.Name
    data modify storage iodeco:temp Error.detail set from storage iodeco:util in.Detail
    data modify storage iodeco:temp Error.detail.expectedType set from storage iodeco:util in.ExpectedType
    data modify storage iodeco:temp Error.detail.receivedType set from storage iodeco:util in.ReceivedType
    function iodeco:core/util/error/core/build

# リセット
    data remove storage iodeco:util in
