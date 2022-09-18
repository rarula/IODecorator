#> iodeco:core/util/error/type_mismatch_error
#
# TypeMismatchError を発生させます
#
# @input
#   storage iodeco:util in
#       Name: string
#           引数の名前
#       ExpectedType: TextComponent
#           期待されていた型
#       ReceivedType: string
#           受け取った型
#       Detail?: compound
#           (任意) エラーメッセージに使用する変数のデータ
#
# @output
#   storage iodeco:util out
#       Error: Error
#           発生したエラー
#
# @within function iodeco:core/**

function iodeco:core/util/error/core/type_mismatch_error/_
