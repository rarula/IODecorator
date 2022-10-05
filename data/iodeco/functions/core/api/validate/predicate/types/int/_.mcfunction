#> iodeco:core/api/validate/predicate/types/int/_
# @within function
#   iodeco:core/api/validate/predicate/types/int/check_type
#   iodeco:core/api/validate/predicate/types/int/_

# NumericPredicate
    function iodeco:core/api/validate/predicate/common/numeric/_
    data modify storage iodeco: out.int merge from storage iodeco:core Predicate
    data remove storage iodeco:core Predicate

# BasePredicate
    function iodeco:core/api/validate/predicate/common/base/_
    data modify storage iodeco: out.int merge from storage iodeco:core Predicate
    data remove storage iodeco:core Predicate


# not
    function iodeco:core/api/validate/predicate/common/base/not

# 以降の条件を反転して検証する
    execute if data storage iodeco:core {Not:true} run function iodeco:core/api/validate/predicate/types/int/_
