#> iodeco:core/api/validate/any/_
#
# @input
#   storage iodeco: in
#       name: string
#       value: any
#       any: NBTType[]
#
# @output
#   storage iodeco: out
#       success: boolean
#       errorList: Error[]
#       type: NBTType
#
# @within function iodeco:core/api/validate/_

# 値が含まれているか探索する
    data modify storage iodeco:temp Array set from storage iodeco: in.any
    function iodeco:core/api/validate/any/search


# 検証に成功したかどうかフラグを立てる
    execute store success storage iodeco: out.success byte 1.0 if data storage iodeco:temp Array[0]

# 検証に失敗 -> TypeMismatchError を発生させる
    execute if data storage iodeco: out{success:false} run function iodeco:core/api/validate/any/fail/_


# 実際に受け取った型を出力する
    data modify storage iodeco: out.type set from storage iodeco:core ReceivedType


# リセット
    data remove storage iodeco:temp Array
    data remove storage iodeco:temp Value
    data remove storage iodeco:temp Result
