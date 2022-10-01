#> iodeco:api/validate
#
# 引数が指定された条件に合致するかどうかを検証します
#
# @input
#   storage iodeco: in
#       name: string
#           対象の引数の名前
#       value: any
#           対象の引数
#       boolean: BooleanPredicate
#           (いずれか) boolean型として指定する条件
#       byte: BytePredicate
#           (いずれか) byte型として指定する条件
#       short: ShortPredicate
#           (いずれか) short型として指定する条件
#       int: IntPredicate
#           (いずれか) int型として指定する条件
#       long: LongPredicate
#           (いずれか) long型として指定する条件
#       float: FloatPredicate
#           (いずれか) float型として指定する条件
#       double: DoublePredicate
#           (いずれか) double型として指定する条件
#       byteArray: ByteArrayPredicate
#           (いずれか) byteArray型として指定する条件
#       string: StringPredicate
#           (いずれか) string型として指定する条件
#       list: ListPredicate
#           (いずれか) list型として指定する条件
#       compound: CompoundPredicate
#           (いずれか) compound型として指定する条件
#       intArray: IntArrayPredicate
#           (いずれか) intArray型として指定する条件
#       longArray: LongArrayPredicate
#           (いずれか) longArray型として指定する条件
#
# @output
#   storage iodeco: out
#       success: boolean
#           検証の成否 (条件に合致した場合は `true`、それ以外の場合は `false`)
#       boolean: BooleanResult
#           (いずれか) boolean型として検証した結果
#       byte: ByteResult
#           (いずれか) byte型として検証した結果
#       short: ShortResult
#           (いずれか) short型として検証した結果
#       int: IntResult
#           (いずれか) int型として検証した結果
#       long: LongResult
#           (いずれか) long型として検証した結果
#       float: FloatResult
#           (いずれか) float型として検証した結果
#       double: DoubleResult
#           (いずれか) double型として検証した結果
#       byteArray: ByteArrayResult
#           (いずれか) byteArray型として検証した結果
#       string: StringResult
#           (いずれか) string型として検証した結果
#       list: ListResult
#           (いずれか) list型として検証した結果
#       compound: CompoundResult
#           (いずれか) compound型として検証した結果
#       intArray: IntArrayResult
#           (いずれか) intArray型として検証した結果
#       longArray: LongArrayResult
#           (いずれか) longArray型として検証した結果
#
# @api

function iodeco:core/api/validate/_
