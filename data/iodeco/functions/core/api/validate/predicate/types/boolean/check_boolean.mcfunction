#> iodeco:core/api/validate/predicate/types/boolean/check_boolean
# @within function iodeco:core/api/validate/predicate/types/boolean/check_type

#>
# @private
    #declare score_holder $IsBoolean


# boolean型として扱えるか検証する
    execute store result score $IsBoolean IODecorator run data get storage iodeco: in.value
    execute store success storage iodeco:temp IsBoolean byte 1.0 if score $IsBoolean IODecorator matches 0..1

# 型が一致しない -> TypeMismatchError を発生させる
## エラーを発生させる
    execute if data storage iodeco:temp {IsBoolean:false} run data modify storage iodeco:temp ExpectedType set value '"boolean"'
    execute if data storage iodeco:temp {IsBoolean:false} run function iodeco:core/api/validate/predicate/common/fail_check_type

## 戻り値を設定する
    execute if data storage iodeco:temp {IsBoolean:false} run data modify storage iodeco: out.boolean.success set value false
    execute if data storage iodeco:temp {IsBoolean:false} run data modify storage iodeco: out.boolean.error set from storage iodeco:util out.Error
    execute if data storage iodeco:temp {IsBoolean:false} run function iodeco:core/util/cleanup

# 型が一致する -> boolean以降の引数をコピーし、条件との合致を検証する
    execute if data storage iodeco:temp {IsBoolean:true} run data modify storage iodeco:core Args set from storage iodeco:core Args.boolean
    execute if data storage iodeco:temp {IsBoolean:true} run function iodeco:core/api/validate/predicate/types/boolean/_


# リセット
    scoreboard players reset $IsBoolean IODecorator
    data remove storage iodeco:temp IsBoolean
