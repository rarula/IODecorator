#> iodeco:core/api/validate/predicate/types/boolean/true/_
# @within function iodeco:core/api/validate/predicate/types/boolean/_

# 検証前にフラグを立てておく
    data modify storage iodeco:core ValidationResult.true.success set value true


# 検証する
    execute store success storage iodeco:temp Success byte 1.0 if data storage iodeco: in{value:true}

# 実際に条件が反転する -> 検証の成否を反転する
    execute if data storage iodeco:core {Inverted:true} store success storage iodeco:temp Success byte 1.0 if data storage iodeco:temp {Success:false}


# 検証に失敗 -> ArgumentError を発生させる
    execute if data storage iodeco:temp {Success:false} run function iodeco:core/api/validate/predicate/types/boolean/true/fail/_


# リセット
    data remove storage iodeco:temp Success
    data remove storage iodeco:core Args.true
