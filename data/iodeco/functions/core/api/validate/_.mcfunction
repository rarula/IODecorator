#> iodeco:core/api/validate/_
#
# @input
#   storage iodeco: in
#       value: any
#       optional?: boolean
#       byte?: BytePredicate
#       short?: ShortPredicate
#
# @within function iodeco:api/validate

# 実際の型を取得する
    data modify storage iodeco:util in.NBT set from storage iodeco: in.value
    function iodeco:core/util/nbt/get_type
    data modify storage iodeco:core ReceivedType set from storage iodeco:util out.NBTType
    function iodeco:core/util/cleanup


# 検証前にフラグを立てておく
    data modify storage iodeco: out.success set value true


# 指定された条件が要素を含んだリストである -> それぞれ条件を解析する
    execute if data storage iodeco: in.any[0] run function iodeco:core/api/validate/any

# 指定された条件が要素を含んだリストでない -> 条件を解析する
    execute unless data storage iodeco: in.any[0] run data modify storage iodeco:core Input set from storage iodeco: in
    execute unless data storage iodeco: in.any[0] run function iodeco:core/api/validate/predicate/_


# リセット
    data remove storage iodeco:core ReceivedType
    data remove storage iodeco:core Input
    data remove storage iodeco: in
