#> iodeco:core/api/validate/error/errors/argument
#
# ArgumentError を発生させる
#
# @input
#   storage iodeco:temp
#       Message: TextComponent
#           エラーメッセージ
#       Detail?: any
#           (任意) エラーメッセージに使用する変数のデータ
#
# @within function
#   iodeco:core/api/validate/predicate/common/**
#   iodeco:core/api/validate/predicate/predicates/*/*/_

# エラーを組み立てる
    data modify storage iodeco:temp Error.name set value "ArgumentError"
    data modify storage iodeco:temp Error.message set from storage iodeco:temp Message
    data modify storage iodeco:temp Error.detail set from storage iodeco:temp Detail
    function iodeco:core/api/validate/error/common/base

# リセット
    data remove storage iodeco:temp Message
    data remove storage iodeco:temp Detail
