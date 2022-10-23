#> iodeco:api/validate
#
# NBTが指定された条件に合致するかどうかを検証します
# 対象のNBTが設定されていない場合、検証は失敗します
#
# @input
#   storage iodeco: in
#       name: string
#           対象のNBTの名前
#       value: any
#           対象のNBT
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
#       error: Error
#           検証前に発生したエラー
#       {type}: Result
#           指定した{type}の検証結果
#       {type}.{validator}: Result
#           指定した{validator}の検証結果
#
# @api

function iodeco:core/api/validate/_
