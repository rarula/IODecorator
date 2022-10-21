#> iodeco:core/util/error/argument_error
#
# ArgumentError を発生させます
#
# @input
#   storage iodeco:util in
#       Name: string
#           NBTの名前
#       Message: TextComponent
#           エラーメッセージ
#       Detail?: compound
#           (任意) エラーメッセージに使用する変数のデータ
#
# @output
#   storage iodeco:util out
#       Error: Error
#           発生したエラー
#
# @within function iodeco:core/**

function iodeco:core/util/error/core/argument_error/_
