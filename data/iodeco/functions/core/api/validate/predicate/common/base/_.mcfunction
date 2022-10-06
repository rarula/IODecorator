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

# ValidationResult を組み立てる
    function iodeco:core/api/validate/predicate/common/build_validation_result
