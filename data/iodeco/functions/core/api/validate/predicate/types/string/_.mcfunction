#> iodeco:core/api/validate/predicate/types/string/_
#
# @input
#   storage iodeco:core Args
#       length?: int
#
# @within function
#   iodeco:core/api/validate/predicate/types/string/check_type
#   iodeco:core/api/validate/predicate/types/string/_

# 条件との合致を検証する
    execute if data storage iodeco:core Args.length run function iodeco:core/api/validate/predicate/types/string/length/_

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
