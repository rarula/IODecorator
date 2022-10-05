#> iodeco:core/api/validate/predicate/types/float/_
# @within function
#   iodeco:core/api/validate/predicate/types/float/check_type
#   iodeco:core/api/validate/predicate/types/float/_

# NumericPredicate
    function iodeco:core/api/validate/predicate/common/numeric/_
    data modify storage iodeco: out.float merge from storage iodeco:core Predicate
    data remove storage iodeco:core Predicate

# BasePredicate
    function iodeco:core/api/validate/predicate/common/base/_
    data modify storage iodeco: out.float merge from storage iodeco:core Predicate
    data remove storage iodeco:core Predicate


# not
    function iodeco:core/api/validate/predicate/common/base/not

# 以降の条件を反転して検証する
    execute if data storage iodeco:core {Not:true} run function iodeco:core/api/validate/predicate/types/float/_
