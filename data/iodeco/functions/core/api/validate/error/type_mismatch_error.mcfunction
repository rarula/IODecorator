#> iodeco:core/api/validate/error/type_mismatch_error
#
# `iodeco:core/util/error/type_mismatch_error` のラッパー
#
# @input
#   storage iodeco:util in
#       Name: string
#           NBTの名前
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
# @within function iodeco:core/api/validate/**

function iodeco:core/util/error/type_mismatch_error

# フラグを下ろす
    data modify storage iodeco: out.success set value false
