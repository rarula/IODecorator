#> iodeco:core/api/validate/predicate/types/boolean/_
#
# @input
#   storage iodeco:core Args
#       true?: true
#       false?: true
#
# @within function
#   iodeco:core/api/validate/predicate/types/boolean/check_boolean
#   iodeco:core/api/validate/predicate/types/boolean/_

# 条件との合致を検証する
    execute if data storage iodeco:core Args.true run function iodeco:core/api/validate/predicate/types/boolean/true/_
    execute if data storage iodeco:core Args.false run function iodeco:core/api/validate/predicate/types/boolean/false/_

# 戻り値を設定する
    function iodeco:core/api/validate/predicate/common/build_validation_result
    data modify storage iodeco: out.boolean merge from storage iodeco:core Predicate
    data remove storage iodeco:core Predicate

# BasePredicate
    function iodeco:core/api/validate/predicate/common/base/_
    data modify storage iodeco: out.boolean merge from storage iodeco:core Predicate
    data remove storage iodeco:core Predicate


# not
    function iodeco:core/api/validate/predicate/common/base/not

# 以降の条件を反転して検証する
    execute if data storage iodeco:core {Not:true} run function iodeco:core/api/validate/predicate/types/boolean/_
