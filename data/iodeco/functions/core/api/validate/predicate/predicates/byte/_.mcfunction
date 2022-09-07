#> iodeco:core/api/validate/predicate/predicates/byte/_
# @within function
#   iodeco:core/api/validate/predicate/predicates/byte/check_type
#   iodeco:core/api/validate/predicate/predicates/byte/_

# BasePredicate
    function iodeco:core/api/validate/predicate/common/base/_

# not (BasePredicate)
    function iodeco:core/api/validate/predicate/common/base/not

# 以降の条件を反転して検証する
    execute if data storage iodeco:core {Not:true} run function iodeco:core/api/validate/predicate/predicates/byte/_
