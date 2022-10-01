#> iodeco:core/api/validate/predicate/_
# @within function iodeco:core/api/validate/_

# 引数の型を取得する
    data modify storage iodeco:util in.NBT set from storage iodeco: in.value
    function iodeco:core/util/nbt/get_type
    data modify storage iodeco:core ReceivedType set from storage iodeco:util out.NBTType
    function iodeco:core/util/cleanup


# 条件との合致を検証する
    data modify storage iodeco:core Inverted set value false
    data modify storage iodeco:core Checked set value false
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.byte run function iodeco:core/api/validate/predicate/types/byte/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.short run function iodeco:core/api/validate/predicate/types/short/check_type


# リセット
    data remove storage iodeco:core ReceivedType
    data remove storage iodeco:core Inverted
    data remove storage iodeco:core Checked
    data remove storage iodeco:core Not
