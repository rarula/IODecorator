#> iodeco:core/util/error/core/build
#
# エラーを組み立てる
#
# @input
#   storage iodeco:temp Error
#       name: ErrorType
#           エラーの名前
#       message: TextComponent
#           エラーメッセージ
#       nbtName: string
#           NBTの名前
#       detail?: compound
#           (任意) エラーメッセージに使用する変数のデータ
#
# @output
#   storage iodeco:util out
#       Error: Error
#
# @within function iodeco:core/util/error/core/*/_

# 戻り値を設定する
    data modify storage iodeco:util out.Error set from storage iodeco:temp Error

# リセット
    data remove storage iodeco:temp Error
