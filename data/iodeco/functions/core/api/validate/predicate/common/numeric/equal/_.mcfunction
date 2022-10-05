#> iodeco:core/api/validate/predicate/common/numeric/equal/_
# @within function iodeco:core/api/validate/predicate/common/numeric/_

# 検証前にフラグを立てておく
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:core Predicate.equal.success set value true
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:core Predicate.not.equal.success set value true


# 対象の引数と値が一致するか検証し、結果を反転する
    data modify storage iodeco:temp Value set from storage iodeco:core Args.equal
    execute store success storage iodeco:temp Success byte 1.0 run data modify storage iodeco:temp Value set from storage iodeco: in.value
    execute store success storage iodeco:temp Success byte 1.0 if data storage iodeco:temp {Success:false}

# 検証に成功したかどうかフラグを立てる
    execute if data storage iodeco:core {Inverted:true} store success storage iodeco:temp Success byte 1.0 if data storage iodeco:temp {Success:false}

# 検証に失敗 -> ArgumentError を発生させる
    execute if data storage iodeco:temp {Success:false} run function iodeco:core/api/validate/predicate/common/numeric/equal/fail/_


# リセット
    data remove storage iodeco:temp Value
    data remove storage iodeco:temp Success
    data remove storage iodeco:core Args.equal
