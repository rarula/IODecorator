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
#       errorList: Error[]
#           発生したエラーのリスト
#
# @api

function iodeco:core/api/validate/_
