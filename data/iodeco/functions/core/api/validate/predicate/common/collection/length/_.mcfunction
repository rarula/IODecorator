#> iodeco:core/api/validate/predicate/common/collection/length/_
# @within function iodeco:core/api/validate/predicate/common/collection/_

#>
# @within function iodeco:core/api/validate/predicate/common/collection/length/**
    #declare score_holder $Value
    #declare score_holder $Length


# 検証前にフラグを立てておく
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:core Predicate.length.success set value true
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:core Predicate.not.length.success set value true


# 対象の引数(配列)の長さと指定された値が一致するか検証する
    execute store result score $Value IODecorator run data get storage iodeco: in.value[]
    execute store result score $Length IODecorator if data storage iodeco:core Args.length

# 検証に失敗 -> ArgumentError を発生させる
    execute unless score $Value IODecorator = $Length IODecorator run function iodeco:core/api/validate/predicate/common/collection/length/fail/_


# リセット
    scoreboard players reset $Value IODecorator
    scoreboard players reset $Length IODecorator
    data remove storage iodeco:core Args.length
