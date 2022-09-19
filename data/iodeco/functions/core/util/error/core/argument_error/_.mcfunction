#> iodeco:core/util/error/core/argument_error/_
#
# @input
#   storage iodeco:util in
#       Name: string
#       Message: TextComponent
#       Detail?: compound
#
# @within function iodeco:core/util/error/argument_error

# エラーを組み立てる
    data modify storage iodeco:temp Error.name set value "ArgumentError"
    data modify storage iodeco:temp Error.message set from storage iodeco:util in.Message
    data modify storage iodeco:temp Error.nbtName set from storage iodeco:util in.Name
    data modify storage iodeco:temp Error.detail set from storage iodeco:util in.Detail
    function iodeco:core/util/error/core/build

# リセット
    data remove storage iodeco:util in
