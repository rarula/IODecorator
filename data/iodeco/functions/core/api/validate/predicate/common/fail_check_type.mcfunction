#> iodeco:core/api/validate/predicate/common/fail_check_type
#
# 実際の型と期待されている型が一致しないため TypeMismatchError を発生させる
# utilの戻り値をそのまま返すため、実行後は `iodeco:core/util/cleanup` を呼び出してください
#
# @input
#   storage iodeco:temp
#       ExpectedType: TextComponent
#           期待されていた型
#
# @output
#   storage iodeco:util out
#       Error: Error
#           発生したエラー
#
# @within function iodeco:core/api/validate/predicate/types/*/check_*

# エラーを発生させる
    data modify storage iodeco:util in.Name set from storage iodeco: in.name
    data modify storage iodeco:util in.ExpectedType set from storage iodeco:temp ExpectedType
    data modify storage iodeco:util in.ReceivedType set from storage iodeco:core ReceivedType
    function iodeco:core/api/validate/error/type_mismatch_error

# リセット
    data remove storage iodeco:temp ExpectedType
