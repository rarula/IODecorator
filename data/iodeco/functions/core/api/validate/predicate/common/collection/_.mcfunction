#> iodeco:core/api/validate/predicate/common/collection/_
#
# @input
#   storage iodeco:core Args
#       length?: int
#
# @output
#   storage iodeco:core Predicate
#       length?: ValidationResult
#
# @within function iodeco:core/api/validate/predicate/types/*/_

# 条件との合致を検証する
    execute if data storage iodeco:core Args.length run function iodeco:core/api/validate/predicate/common/collection/length/_
