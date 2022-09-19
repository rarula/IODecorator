#> iodeco:core/api/validate/predicate/common/fail_check_type
#
# 実際の型と期待されている型が一致しないため TypeMismatchError を発生させる
#
# @input
#   storage iodeco:temp
#       ExpectedType: TextComponent
#           期待されていた型
#
# @within function iodeco:core/api/validate/predicate/types/*/check_type

# エラーを発生させる
    data modify storage iodeco:util in.Name set from storage iodeco: in.name
    data modify storage iodeco:util in.ExpectedType set from storage iodeco:temp ExpectedType
    data modify storage iodeco:util in.ReceivedType set from storage iodeco:core ReceivedType
    function iodeco:core/util/error/type_mismatch_error

# 戻り値を設定する
    data modify storage iodeco: out.errorList append from storage iodeco:util out.Error

# リセット
    function iodeco:core/util/cleanup
    data remove storage iodeco:temp ExpectedType
