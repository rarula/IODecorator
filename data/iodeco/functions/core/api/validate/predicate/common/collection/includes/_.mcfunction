#> iodeco:core/api/validate/predicate/common/collection/includes/_
# @within function iodeco:core/api/validate/predicate/common/collection/_

# 検証前にフラグを立てておく
    data modify storage iodeco:core ValidationResult.includes.success set value true


# 検証する
    data modify storage iodeco:temp SearchElements set from storage iodeco:core Args.includes
    function iodeco:core/api/validate/predicate/common/collection/includes/search/1
    execute store success storage iodeco:temp Success byte 1.0 unless data storage iodeco:temp SearchElements[0]

# 実際に条件が反転する -> 検証の成否を反転する
    execute if data storage iodeco:core {Inverted:true} store success storage iodeco:temp Success byte 1.0 if data storage iodeco:temp {Success:false}


# 検証に失敗 -> ArgumentError を発生させる
    execute if data storage iodeco:temp {Success:false} run function iodeco:core/api/validate/predicate/common/collection/includes/fail/_


# リセット
    data remove storage iodeco:temp InputElements
    data remove storage iodeco:temp InputElement
    data remove storage iodeco:temp SearchElements
    data remove storage iodeco:temp SearchElement
    data remove storage iodeco:temp Result
    data remove storage iodeco:temp Success
    data remove storage iodeco:core Args.includes
