#> iodeco:core/api/validate/predicate/common/base/_
#
# @input
#   storage iodeco:core Args
#       oneOf?: any[]
#
# @output
#   storage iodeco:core Predicate
#       oneOf?: ValidationResult
#
# @within function iodeco:core/api/validate/predicate/types/*/_

# 条件との合致を検証する
    execute if data storage iodeco:core Args.oneOf run function iodeco:core/api/validate/predicate/common/base/one_of/_

# 戻り値を設定する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:core Predicate set from storage iodeco:core ValidationResult
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:core Predicate.not set from storage iodeco:core ValidationResult

# リセット
    data remove storage iodeco:core ValidationResult
