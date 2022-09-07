#> iodeco:core/api/validate/error/common/base
#
# Error を発生させる
#
# @input
#   storage iodeco:temp Error
#       name: ErrorType
#           エラーの名前
#       message: TextComponent
#           エラーメッセージ
#       detail?: any
#           (任意) 各エラーが持つ固有データ
#
# @within function iodeco:core/api/validate/error/errors/*

# エラーを組み立てる
    data modify storage iodeco:temp Error.nbtName set from storage iodeco: in.name
    data modify storage iodeco: out.errorList append from storage iodeco:temp Error

# フラグを下ろす
    data modify storage iodeco: out.success set value false

# リセット
    data remove storage iodeco:temp Error
