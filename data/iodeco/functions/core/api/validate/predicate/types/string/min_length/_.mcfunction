#> iodeco:core/api/validate/predicate/types/string/min_length/_
# @within function iodeco:core/api/validate/predicate/types/string/_

#>
# @within function iodeco:core/api/validate/predicate/types/string/min_length/**
    #declare score_holder $Value
    #declare score_holder $Length


# 検証前にフラグを立てておく
    data modify storage iodeco:core ValidationResult.minLength.success set value true


# 検証する
    execute store result score $Value IODecorator run data get storage iodeco: in.value
    execute store result score $Length IODecorator run data get storage iodeco:core Args.minLength
    execute store success storage iodeco:temp Success byte 1.0 if score $Value IODecorator >= $Length IODecorator

# 実際に条件が反転する -> 検証の成否を反転する
    execute if data storage iodeco:core {Inverted:true} store success storage iodeco:temp Success byte 1.0 if data storage iodeco:temp {Success:false}


# 検証に失敗 -> ArgumentError を発生させる
    execute if data storage iodeco:temp {Success:false} run function iodeco:core/api/validate/predicate/types/string/min_length/fail/_


# リセット
    scoreboard players reset $Value IODecorator
    scoreboard players reset $Length IODecorator
    data remove storage iodeco:temp Success
    data remove storage iodeco:core Args.minLength
