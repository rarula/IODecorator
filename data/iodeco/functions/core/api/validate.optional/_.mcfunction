#> iodeco:core/api/validate.optional/_
#
# @input
#   storage iodeco: in
#       name: string
#       value?: any
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
#       boolean: BooleanResult
#       byte: ByteResult
#       short: ShortResult
#       int: IntResult
#       long: LongResult
#       float: FloatResult
#       double: DoubleResult
#       byteArray: ByteArrayResult
#       string: StringResult
#       list: ListResult
#       compound: CompoundResult
#       intArray: IntArrayResult
#       longArray: LongArrayResult
#
# @within function iodeco:api/validate.optional

# 検証前にフラグを立てておく
    data modify storage iodeco: out.success set value true


# 対象のNBTが設定されている -> 条件を解析する
    execute if data storage iodeco: in.value run data modify storage iodeco:core Args set from storage iodeco: in
    execute if data storage iodeco: in.value run function iodeco:core/api/validate/predicate/_


# リセット
    data remove storage iodeco:core Args
    data remove storage iodeco: in
