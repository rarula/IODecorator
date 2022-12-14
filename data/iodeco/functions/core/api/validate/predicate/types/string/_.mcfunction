#> iodeco:core/api/validate/predicate/types/string/_
#
# @input
#   storage iodeco:core Args
#       length?: int
#       minLength?: int
#       maxLength?: int
#       equals?: string
#       empty?: true
#
# @within function
#   iodeco:core/api/validate/predicate/types/string/check_type
#   iodeco:core/api/validate/predicate/types/string/_

# 条件との合致を検証する
    execute if data storage iodeco:core Args.length run function iodeco:core/api/validate/predicate/types/string/length/_
    execute if data storage iodeco:core Args.minLength run function iodeco:core/api/validate/predicate/types/string/min_length/_
    execute if data storage iodeco:core Args.maxLength run function iodeco:core/api/validate/predicate/types/string/max_length/_
    execute if data storage iodeco:core Args.equals run function iodeco:core/api/validate/predicate/types/string/equals/_
    execute if data storage iodeco:core Args.empty run function iodeco:core/api/validate/predicate/types/string/empty/_

# 戻り値を設定する
    function iodeco:core/api/validate/predicate/common/build_validation_result
    data modify storage iodeco: out.string merge from storage iodeco:core Predicate
    data remove storage iodeco:core Predicate

# BasePredicate
    function iodeco:core/api/validate/predicate/common/base/_
    data modify storage iodeco: out.string merge from storage iodeco:core Predicate
    data remove storage iodeco:core Predicate


# not
    function iodeco:core/api/validate/predicate/common/base/not

# 以降の条件を反転して検証する
    execute if data storage iodeco:core {Not:true} run function iodeco:core/api/validate/predicate/types/string/_
