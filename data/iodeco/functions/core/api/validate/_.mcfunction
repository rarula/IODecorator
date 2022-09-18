#> iodeco:core/api/validate/_
#
# @input
#   storage iodeco: in
#       name: string
#       value: any
#       any: NBTType[]
#
# @output
#   storage iodeco: out
#       success: boolean
#       errorList: Error[]
#       type: NBTType
#
#
# @input
#   storage iodeco: in
#       name: string
#       value: any
#       boolean: BooleanPredicate
#       byte: BytePredicate
#       short: ShortPredicate
#       int: IntPredicate
#       long: LongPredicate
#       float: FloatPredicate
#       double: DoublePredicate
#       byteArray: ByteArrayPredicate
#       string: StringPredicate
#       list: ListPredicate
#       compound: CompoundPredicate
#       intArray: IntArrayPredicate
#       longArray: LongArrayPredicate
#
# @output
#   storage iodeco: out
#       success: boolean
#       errorList: Error[]
#
# @within function iodeco:api/validate

# 実際の型を取得する
    data modify storage iodeco:util in.NBT set from storage iodeco: in.value
    function iodeco:core/util/nbt/get_type
    data modify storage iodeco:core ReceivedType set from storage iodeco:util out.NBTType
    function iodeco:core/util/cleanup


# 検証前にフラグを立てておく
    data modify storage iodeco: out.success set value true


# any -> いずれかの型と一致するか検証する
    execute if data storage iodeco: in.any[] run function iodeco:core/api/validate/any/_

# predicate -> 条件を解析する
    execute unless data storage iodeco: in.any[] run data modify storage iodeco:core Input set from storage iodeco: in
    execute unless data storage iodeco: in.any[] run function iodeco:core/api/validate/predicate/_


# リセット
    data remove storage iodeco:core ReceivedType
    data remove storage iodeco:core Input
    data remove storage iodeco: in
