#> iodeco:core/api/validate/predicate/predicates/short/check_type
# @within function iodeco:core/api/validate/predicate/_

# 実際の型と期待されている型の一致を検証する
    data modify storage iodeco:temp Type set value "short"
    function iodeco:core/api/validate/predicate/common/check_type

# 型が一致しない -> TypeMismatchError を発生させる
    execute if data storage iodeco:temp {Matched:false} run data modify storage iodeco:temp ExpectedType set value "short"
    execute if data storage iodeco:temp {Matched:false} run function iodeco:core/api/validate/error/errors/type_mismatch

# 型が一致する -> short以降の引数をコピーし、条件との合致を検証する
    execute if data storage iodeco:temp {Matched:true} run data modify storage iodeco:core Args set from storage iodeco:core Args.byte
    execute if data storage iodeco:temp {Matched:true} run function iodeco:core/api/validate/predicate/predicates/short/_

# リセット
    data remove storage iodeco:temp Matched
