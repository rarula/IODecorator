#> iodeco:core/api/validate/_
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

# 引数の型を取得する
    data modify storage iodeco:util in.NBT set from storage iodeco: in.value
    function iodeco:core/util/nbt/get_type
    data modify storage iodeco:core ReceivedType set from storage iodeco:util out.NBTType
    function iodeco:core/util/cleanup


# 条件を解析する
    data modify storage iodeco:core Input set from storage iodeco: in
    function iodeco:core/api/validate/predicate/_


# リセット
    data remove storage iodeco:core ReceivedType
    data remove storage iodeco:core Input
    data remove storage iodeco: in
