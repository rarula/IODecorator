#> iodeco:core/api/validate/predicate/types/byte/_
# @within function
#   iodeco:core/api/validate/predicate/types/byte/check_type
#   iodeco:core/api/validate/predicate/types/byte/_

# BasePredicate
    function iodeco:core/api/validate/predicate/common/base/_
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco: out.byte.oneOf set from storage iodeco:core BasePredicate.oneOf
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco: out.byte.not.oneOf set from storage iodeco:core BasePredicate.oneOf
    data remove storage iodeco:core BasePredicate

# not (BasePredicate)
    function iodeco:core/api/validate/predicate/common/base/not

# 以降の条件を反転して検証する
    execute if data storage iodeco:core {Not:true} run function iodeco:core/api/validate/predicate/types/byte/_
