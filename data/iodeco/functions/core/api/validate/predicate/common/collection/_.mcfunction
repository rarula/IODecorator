#> iodeco:core/api/validate/predicate/common/collection/_
#
# @input
#   storage iodeco:core Args
#       length?: int
#       minLength?: int
#       maxLength?: int
#       equal?: Collection
#
# @output
#   storage iodeco:core Predicate
#       length?: ValidationResult
#       minLength?: ValidationResult
#       maxLength?: ValidationResult
#       equal?: ValidationResult
#
# @within function iodeco:core/api/validate/predicate/types/*/_

# 条件との合致を検証する
    execute if data storage iodeco:core Args.length run function iodeco:core/api/validate/predicate/common/collection/length/_
    execute if data storage iodeco:core Args.minLength run function iodeco:core/api/validate/predicate/common/collection/min_length/_
    execute if data storage iodeco:core Args.maxLength run function iodeco:core/api/validate/predicate/common/collection/max_length/_
    execute if data storage iodeco:core Args.equal run function iodeco:core/api/validate/predicate/common/collection/equal/_

# 戻り値を設定する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:core Predicate set from storage iodeco:core ValidationResult
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:core Predicate.not set from storage iodeco:core ValidationResult

# リセット
    data remove storage iodeco:core ValidationResult
