#> iodeco:core/util/nbt/core/get_id/numeric_collection
# @within function iodeco:core/util/nbt/core/get_id/non_empty_collection

# 対象のNBTが short/float/doubleのlist かどうかを判定する
# (要素の型が一致する NumericCollectionIds の要素のみサイズが2になるので、[-2]でアクセスできる)
    data modify storage iodeco:util/nbt NumericCollectionIds[] append from storage iodeco:util in.NBT[0]
    execute store result storage iodeco:temp NumericCollectionId byte 1.0 run data get storage iodeco:util/nbt NumericCollectionIds[][-2]
    data remove storage iodeco:util/nbt NumericCollectionIds[][1]

# 対象のNBTが short/float/doubleのlist である
# (short/float/double のarrayが存在しないため、listであると分かる)
    execute if data storage iodeco:temp {NumericCollectionId:9b} run data modify storage iodeco:util out.Id set from storage iodeco:util/nbt Ids.list

# 対象のNBTが byte/int/longのcollection ->
    execute unless data storage iodeco:temp {NumericCollectionId:9b} run function iodeco:core/util/nbt/core/get_id/numeric_array_check

# リセット
    data remove storage iodeco:temp NumericCollectionId
