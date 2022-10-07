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
#       error: Error
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
# @within function iodeco:api/validate

# 対象のNBTが省略できるかどうかフラグを立てる
    execute store success storage iodeco:core Optional byte 1.0 if data storage iodeco: in.optional

# 検証前にフラグを立てておく
    data modify storage iodeco: out.success set value true


# 対象のNBTが設定されていない -> 対象のNBTが省略できない -> ArgumentError を発生させる
    execute unless data storage iodeco: in.value if data storage iodeco:core {Optional:false} run function iodeco:core/api/validate/fail

# 対象のNBTが設定されている -> 条件を解析する
    execute if data storage iodeco: in.value if data storage iodeco:core {Optional:false} run data modify storage iodeco:core Args set from storage iodeco: in
    execute if data storage iodeco: in.value if data storage iodeco:core {Optional:true } run data modify storage iodeco:core Args set from storage iodeco: in.optional
    execute if data storage iodeco: in.value run function iodeco:core/api/validate/predicate/_


# リセット
    data remove storage iodeco:core Optional
    data remove storage iodeco:core Args
    data remove storage iodeco: in
