#> iodeco:core/api/validate/error/argument_error
#
# `iodeco:core/util/error/argument_error` のラッパー
#
# @input
#   storage iodeco:util in
#       Name: string
#           引数の名前
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

function iodeco:core/util/error/argument_error

# フラグを下ろす
    data modify storage iodeco: out.success set value false
