#> iodeco:core/util/nbt/get_id
#
# 指定されたNBTのidを取得します
# 参考: https://gist.github.com/intsuc/a798ed9c10b495d2beaf60db327fb4dd
#
# NBTのid
#   1b: byte
#   2b: short
#   3b: int
#   4b: long
#   5b: float
#   6b: double
#   7b: byte_array
#   8b: string
#   9b: list
#   10b: compound
#   11b: int_array
#   12b: long_array
#
# @input
#   storage iodeco:util in
#       NBT: any
#           対象のNBT
#
# @output
#   storage iodeco:util out
#       Id: byte
#           対象のNBTのid
#
# @within function iodeco:core/**

function iodeco:core/util/nbt/core/get_id/_
