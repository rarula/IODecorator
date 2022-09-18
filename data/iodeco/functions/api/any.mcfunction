#> iodeco:api/any
#
# 引数が指定された型のいずれかに一致するかどうかを検証します
#
# @input
#   storage iodeco: in
#       name: string
#           対象の引数の名前
#       value: any
#           対象の引数
#       types: NBTType[]
#           期待される型のリスト
#
# @output
#   storage iodeco: out
#       success: boolean
#           検証の成否 (いずれかに一致した場合は `true`、それ以外の場合は `false`)
#       error: Error
#           発生したエラー
#       type: NBTType
#           対象の引数の型を表す文字列
#
# @api

function iodeco:core/api/any/_
