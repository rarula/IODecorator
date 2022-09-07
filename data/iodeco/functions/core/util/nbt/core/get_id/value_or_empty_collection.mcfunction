#> iodeco:core/util/nbt/core/get_id/value_or_empty_collection
# @within function iodeco:core/util/nbt/core/get_id/_

# 対象のNBTのidを取得する
# (要素の型が一致する ValueOrEmptyCollectionIds の要素のみサイズが2になるので、[-2]でアクセスできる)
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds[] append from storage iodeco:util in.NBT
    execute store result storage iodeco:util out.Id byte 1.0 run data get storage iodeco:util/nbt ValueOrEmptyCollectionIds[][-2]
    data remove storage iodeco:util/nbt ValueOrEmptyCollectionIds[][1]
