#> iodeco:core/api/validate/predicate/types/boolean/check_type
# @within function iodeco:core/api/validate/predicate/_

# 検証前にフラグを立てておく
    data modify storage iodeco: out.boolean.success set value true


# 実際の型と期待されている型の一致を検証する
    data modify storage iodeco:temp Type set value "boolean"
    function iodeco:core/api/validate/predicate/common/check_type

# 型が一致しない -> TypeMismatchError を発生させる
## エラーを発生させる
    execute if data storage iodeco:temp {Matched:false} run data modify storage iodeco:temp ExpectedType set value '"boolean"'
    execute if data storage iodeco:temp {Matched:false} run function iodeco:core/api/validate/predicate/common/fail_check_type

## 戻り値を設定する
    execute if data storage iodeco:temp {Matched:false} run data modify storage iodeco: out.boolean.success set value false
    execute if data storage iodeco:temp {Matched:false} run data modify storage iodeco: out.boolean.error set from storage iodeco:util out.Error
    execute if data storage iodeco:temp {Matched:false} run function iodeco:core/util/cleanup

# 型が一致する -> boolean以降の引数をコピーし、条件との合致を検証する
    execute if data storage iodeco:temp {Matched:true} run data modify storage iodeco:core Args set from storage iodeco:core Args.boolean
    execute if data storage iodeco:temp {Matched:true} run function iodeco:core/api/validate/predicate/types/boolean/_


# リセット
    data remove storage iodeco:temp Matched