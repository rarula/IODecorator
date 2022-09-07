#> iodeco:core/api/validate/predicate/common/base/one_of/_
#
# 対象の引数が配列に含まれるかどうかを検証する
#
# @within function iodeco:core/api/validate/predicate/common/base/_

# 値が含まれているか探索する
    data modify storage iodeco:temp Array set from storage iodeco:core Args.oneOf
    function iodeco:core/api/validate/predicate/common/base/one_of/search


# 検証に成功したかどうかフラグを立てる
    execute store success storage iodeco:temp Success byte 1.0 if data storage iodeco:temp Array[0]
    execute if data storage iodeco:core {Inverted:true} store success storage iodeco:temp Success byte 1.0 if data storage iodeco:temp {Success:false}

# 検証に失敗 -> ArgumentError を発生させる
    execute if data storage iodeco:temp {Success:false} run function iodeco:core/api/validate/predicate/common/base/one_of/fail/_


# リセット
    data remove storage iodeco:temp Array
    data remove storage iodeco:temp Success
    data remove storage iodeco:temp Value
    data remove storage iodeco:temp Result
    data remove storage iodeco:core Args.oneOf
