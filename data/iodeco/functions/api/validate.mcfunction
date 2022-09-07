#> iodeco:api/validate
#
# 引数が指定された条件に合致するかを検証します
#
# @input
#   storage iodeco: in
#       name: string
#           対象の引数の名前
#       value: any
#           対象の引数
#       optional?: boolean
#           (任意) 引数が省略できるかどうか
#       any?: AnyPredicate[]
#           (任意) 指定する条件のリスト
#               リストに含まれる条件のどれか一つでも合致すれば合格とする
#
# `storage iodeco: in.any` を指定しない場合、以下の内から1つの条件を指定してください
#
# @input
#   storage iodeco: in
#       boolean: BooleanPredicate
#           boolean型として指定する条件
#       byte: BytePredicate
#           byte型として指定する条件
#       short: ShortPredicate
#           short型として指定する条件
#       int: IntPredicate
#           int型として指定する条件
#       long: LongPredicate
#           long型として指定する条件
#       float: FloatPredicate
#           float型として指定する条件
#       double: DoublePredicate
#           double型として指定する条件
#       byteArray: ByteArrayPredicate
#           byteArray型として指定する条件
#       string: StringPredicate
#           string型として指定する条件
#       list: ListPredicate
#           list型として指定する条件
#       compound: CompoundPredicate
#           compound型として指定する条件
#       intArray: IntArrayPredicate
#           intArray型として指定する条件
#       longArray: LongArrayPredicate
#           longArray型として指定する条件
#
# @output
#   storage iodeco: out
#       success: boolean
#           検証の成否 (検証が成功した場合は `true`、それ以外の場合は `false`)
#       errorList: Error[]
#           発生したエラーのリスト
#
# @api

function iodeco:core/api/validate/_
