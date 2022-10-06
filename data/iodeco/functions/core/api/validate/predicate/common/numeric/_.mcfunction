#> iodeco:core/api/validate/predicate/common/numeric/_
#
# @input
#   storage iodeco:core Args
#       equal?: Numeric
#
# @output
#   storage iodeco:core Predicate
#       equal?: ValidationResult
#
# @within function iodeco:core/api/validate/predicate/types/*/_

# 条件との合致を検証する
    execute if data storage iodeco:core Args.equal run function iodeco:core/api/validate/predicate/common/numeric/equal/_

# 戻り値を設定する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:core Predicate set from storage iodeco:core ValidationResult
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:core Predicate.not set from storage iodeco:core ValidationResult

# リセット
    data remove storage iodeco:core ValidationResult
