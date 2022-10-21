#> iodeco:core/api/validate/predicate/_
# @within function
#   iodeco:core/api/validate/_
#   iodeco:core/api/validate.optional/_

# 対象のNBTの型を取得する
    data modify storage iodeco:util in.NBT set from storage iodeco: in.value
    function iodeco:core/util/nbt/get_type
    data modify storage iodeco:core ReceivedType set from storage iodeco:util out.NBTType
    function iodeco:core/util/cleanup


# 条件との合致を検証する
    data modify storage iodeco:core Inverted set value false
    data modify storage iodeco:core Checked set value false
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.boolean run function iodeco:core/api/validate/predicate/types/boolean/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.byte run function iodeco:core/api/validate/predicate/types/byte/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.short run function iodeco:core/api/validate/predicate/types/short/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.int run function iodeco:core/api/validate/predicate/types/int/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.long run function iodeco:core/api/validate/predicate/types/long/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.float run function iodeco:core/api/validate/predicate/types/float/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.double run function iodeco:core/api/validate/predicate/types/double/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.byteArray run function iodeco:core/api/validate/predicate/types/byte_array/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.string run function iodeco:core/api/validate/predicate/types/string/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.list run function iodeco:core/api/validate/predicate/types/list/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.compound run function iodeco:core/api/validate/predicate/types/compound/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.intArray run function iodeco:core/api/validate/predicate/types/int_array/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.longArray run function iodeco:core/api/validate/predicate/types/long_array/check_type


# リセット
    data remove storage iodeco:core ReceivedType
    data remove storage iodeco:core Inverted
    data remove storage iodeco:core Checked
    data remove storage iodeco:core Not
