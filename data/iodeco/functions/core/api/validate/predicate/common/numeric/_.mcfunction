#> iodeco:core/api/validate/predicate/common/numeric/_
#
# @input
#   storage iodeco:core Args
#       equal?: Numeric
#
# @output
#   storage iodeco:core NumericPredicate
#       equal?: ValidationResult
#
# @within function iodeco:core/api/validate/predicate/types/*/_

# 条件との合致を検証する
    execute if data storage iodeco:core Args.equal run function iodeco:core/api/validate/predicate/common/numeric/equal/_
