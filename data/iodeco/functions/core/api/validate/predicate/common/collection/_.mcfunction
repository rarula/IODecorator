#> iodeco:core/api/validate/predicate/common/collection/_
#
# @input
#   storage iodeco:core Args
#       length?: int
#       minLength?: int
#       maxLength?: int
#       equal?: Collection
#       empty?: true
#       includes?: any[]
#       includesAny?: any[]
#
# @output
#   storage iodeco:core Predicate
#       length?: ValidationResult
#       minLength?: ValidationResult
#       maxLength?: ValidationResult
#       equal?: ValidationResult
#       empty?: ValidationResult
#       includes?: ValidationResult
#       includesAny?: ValidationResult
#
# @within function iodeco:core/api/validate/predicate/types/*/_

# 条件との合致を検証する
    execute if data storage iodeco:core Args.length run function iodeco:core/api/validate/predicate/common/collection/length/_
    execute if data storage iodeco:core Args.minLength run function iodeco:core/api/validate/predicate/common/collection/min_length/_
    execute if data storage iodeco:core Args.maxLength run function iodeco:core/api/validate/predicate/common/collection/max_length/_
    execute if data storage iodeco:core Args.equal run function iodeco:core/api/validate/predicate/common/collection/equal/_
    execute if data storage iodeco:core Args.empty run function iodeco:core/api/validate/predicate/common/collection/empty/_
    execute if data storage iodeco:core Args.includes run function iodeco:core/api/validate/predicate/common/collection/includes/_
    execute if data storage iodeco:core Args.includesAny run function iodeco:core/api/validate/predicate/common/collection/includes_any/_

# ValidationResult を組み立てる
    function iodeco:core/api/validate/predicate/common/build_validation_result
