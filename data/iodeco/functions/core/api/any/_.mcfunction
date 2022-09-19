#> iodeco:core/api/any/_
#
# @input
#   storage iodeco: in
#       name: string
#       value: any
#       types: NBTType[]
#
# @output
#   storage iodeco: out
#       success: boolean
#       error: Error
#       type: NBTType
#
# @within function iodeco:api/any

# 引数の型を取得する
    data modify storage iodeco:util in.NBT set from storage iodeco: in.value
    function iodeco:core/util/nbt/get_type
    data modify storage iodeco:core ReceivedType set from storage iodeco:util out.NBTType
    function iodeco:core/util/cleanup


# いずれかの型に一致するかどうか探索する
    data modify storage iodeco:temp Types set from storage iodeco: in.types
    function iodeco:core/api/any/search

# 戻り値を設定する
    data modify storage iodeco: out.type set from storage iodeco:core ReceivedType
    execute store success storage iodeco: out.success byte 1.0 if data storage iodeco:temp Types[0]

# 検証に失敗 -> TypeMismatchError を発生させる
    execute if data storage iodeco: out{success:false} run function iodeco:core/api/any/fail


# リセット
    data remove storage iodeco:core ReceivedType
    data remove storage iodeco:temp Types
    data remove storage iodeco:temp Value
    data remove storage iodeco:temp Result
    data remove storage iodeco: in
