#> iodeco:core/util/nbt/core/get_id/non_empty_collection
# @within function iodeco:core/util/nbt/core/get_id/_

# 対象のNBTが 空でないnumeric_collection かどうかを判定する (倍率指定による数値タグかどうかの判定)
    execute store success storage iodeco:temp IsNumericCollection byte 1.0 run data get storage iodeco:util in.NBT[0] 1.0

# 対象のNBTが 空でないnumeric_collection ->
    execute if data storage iodeco:temp {IsNumericCollection:true} run function iodeco:core/util/nbt/core/get_id/numeric_collection

# 対象のNBTが 空でないlist である
    execute if data storage iodeco:temp {IsNumericCollection:false} run data modify storage iodeco:util out.Id set from storage iodeco:util/nbt Ids.list

# リセット
    data remove storage iodeco:temp IsNumericCollection
