#> iodeco:core/util/nbt/core/get_id/_
#
# @input
#   storage iodeco:util in
#       NBT: any
#
# @output
#   storage iodeco:util out
#       Id: byte
#
# @within function iodeco:core/util/nbt/get_id

# 対象のNBTが compound である
    execute if data storage iodeco:util in.NBT{} run data modify storage iodeco:util out.Id set from storage iodeco:util/nbt Ids.compound

# 対象のNBTが 空でないcollection ->
    execute if data storage iodeco:util in.NBT[0] run function iodeco:core/util/nbt/core/get_id/non_empty_collection

# 対象のNBTが value/空のcollection ->
    execute unless data storage iodeco:util out.Id run function iodeco:core/util/nbt/core/get_id/value_or_empty_collection

# リセット
    data remove storage iodeco:util in
