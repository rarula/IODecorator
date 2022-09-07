#> iodeco:core/util/nbt/core/get_id/numeric_array_check
# @within function iodeco:core/util/nbt/core/get_id/numeric_collection

# 対象のNBTが numeric_array かどうかを判定する (暗黙の型変換による数値配列かどうかの判定)
    data modify storage iodeco:temp HeadNumeric set from storage iodeco:util in.NBT[0]
    execute store success storage iodeco:temp IsNumericArray byte 1.0 run data modify storage iodeco:util in.NBT[0] set from storage iodeco:util/nbt NumericArrayChecker
    data modify storage iodeco:util in.NBT[0] set from storage iodeco:temp HeadNumeric

# 対象のNBTが numeric_array である
    execute if data storage iodeco:temp {IsNumericArray:true} run data modify storage iodeco:util out.Id set from storage iodeco:temp NumericCollectionId

# 対象のNBTが numeric_list である
    execute if data storage iodeco:temp {IsNumericArray:false} run data modify storage iodeco:util out.Id set from storage iodeco:util/nbt Ids.list

# リセット
    data remove storage iodeco:temp HeadNumeric
    data remove storage iodeco:temp IsNumericArray
