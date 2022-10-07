#> iodeco:api/any
#
# NBTが指定された型のいずれかに一致するかどうかを検証します
#
# @input
#   storage iodeco: in
#       name: string
#           対象のNBTの名前
#       value: any
#           対象のNBT
#       types: ("byte" | "short" | "int" | "long" | "float" | "double" | "byte_array" | "string" | "list" | "compound" | "int_array" | "long_array")[]
#           期待される型のリスト
#
# @output
#   storage iodeco: out
#       success: boolean
#           検証の成否 (いずれかに一致した場合は `true`、それ以外の場合は `false`)
#       error: Error
#           発生したエラー
#       type: "byte" | "short" | "int" | "long" | "float" | "double" | "byte_array" | "string" | "list" | "compound" | "int_array" | "long_array"
#           対象のNBTの型を表す文字列
#
# @api

function iodeco:core/api/any/_
