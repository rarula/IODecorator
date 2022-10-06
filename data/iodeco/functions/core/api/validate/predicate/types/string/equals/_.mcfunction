#> iodeco:core/api/validate/predicate/types/string/equals/_
# @within function iodeco:core/api/validate/predicate/types/string/_

# 検証前にフラグを立てておく
    data modify storage iodeco:core ValidationResult.equals.success set value true


# 検証する
    data modify storage iodeco:temp Value set from storage iodeco:core Args.equals
    execute store success storage iodeco:temp Success byte 1.0 run data modify storage iodeco:temp Value set from storage iodeco: in.value
    execute store success storage iodeco:temp Success byte 1.0 if data storage iodeco:temp {Success:false}

# 実際に条件が反転する -> 検証の成否を反転する
    execute if data storage iodeco:core {Inverted:true} store success storage iodeco:temp Success byte 1.0 if data storage iodeco:temp {Success:false}


# 検証に失敗 -> ArgumentError を発生させる
    execute if data storage iodeco:temp {Success:false} run function iodeco:core/api/validate/predicate/types/string/equals/fail/_


# リセット
    data remove storage iodeco:temp Value
    data remove storage iodeco:temp Success
    data remove storage iodeco:core Args.equals
