#> iodeco:core/api/validate/predicate/common/collection/empty/_
# @within function iodeco:core/api/validate/predicate/common/collection/_

# 検証前にフラグを立てておく
    data modify storage iodeco:core ValidationResult.empty.success set value true


# 検証する
    execute store success storage iodeco:temp Success byte 1.0 unless data storage iodeco: in.value[0]

# 実際に条件が反転する -> 検証の成否を反転する
    execute if data storage iodeco:core {Inverted:true} store success storage iodeco:temp Success byte 1.0 if data storage iodeco:temp {Success:false}


# 検証に失敗 -> ArgumentError を発生させる
    execute if data storage iodeco:temp {Success:false} run function iodeco:core/api/validate/predicate/common/collection/empty/fail/_


# リセット
    data remove storage iodeco:temp Success
    data remove storage iodeco:core Args.empty
