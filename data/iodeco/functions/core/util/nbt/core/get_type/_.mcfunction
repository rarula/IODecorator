#> iodeco:core/util/nbt/core/get_type/_
#
# @input
#   storage iodeco:util in
#       NBT: any
#
# @output
#   storage iodeco:util out
#       NBTName: string
#
# @within function iodeco:core/util/nbt/get_type

# NBTのidを取得する
    function iodeco:core/util/nbt/get_id

# idを文字列に変換する
    execute if data storage iodeco:util out{Id:1b } run data modify storage iodeco:util out.NBTType set value "byte"
    execute if data storage iodeco:util out{Id:2b } run data modify storage iodeco:util out.NBTType set value "short"
    execute if data storage iodeco:util out{Id:3b } run data modify storage iodeco:util out.NBTType set value "int"
    execute if data storage iodeco:util out{Id:4b } run data modify storage iodeco:util out.NBTType set value "long"
    execute if data storage iodeco:util out{Id:5b } run data modify storage iodeco:util out.NBTType set value "float"
    execute if data storage iodeco:util out{Id:6b } run data modify storage iodeco:util out.NBTType set value "double"
    execute if data storage iodeco:util out{Id:7b } run data modify storage iodeco:util out.NBTType set value "byte_array"
    execute if data storage iodeco:util out{Id:8b } run data modify storage iodeco:util out.NBTType set value "string"
    execute if data storage iodeco:util out{Id:9b } run data modify storage iodeco:util out.NBTType set value "list"
    execute if data storage iodeco:util out{Id:10b} run data modify storage iodeco:util out.NBTType set value "compound"
    execute if data storage iodeco:util out{Id:11b} run data modify storage iodeco:util out.NBTType set value "int_array"
    execute if data storage iodeco:util out{Id:12b} run data modify storage iodeco:util out.NBTType set value "long_array"

# リセット
    data remove storage iodeco:util in
