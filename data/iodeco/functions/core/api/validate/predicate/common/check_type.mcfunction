#> iodeco:core/api/validate/predicate/common/check_type
#
# 実際の型と期待されている型が一致するかを検証する
#
# @input
#   storage iodeco:temp
#       Type: string
#           期待されている型
#
# @output
#   storage iodeco:temp
#       Matched: boolean
#           一致しているかどうか
#   storage iodeco:core
#       Checked: boolean
#           検証済みかどうか
#
# @within function iodeco:core/api/validate/predicate/predicates/*/check_type

# 一致するかを検証し、結果を反転する
    execute store success storage iodeco:temp Matched byte 1.0 run data modify storage iodeco:temp Type set from storage iodeco:core ReceivedType
    execute store success storage iodeco:temp Matched byte 1.0 if data storage iodeco:temp {Matched:false}

# フラグを立てる
    data modify storage iodeco:core Checked set value true

# リセット
    data remove storage iodeco:temp Type
