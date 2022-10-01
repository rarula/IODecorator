#> iodeco:core/api/any/fail
# @within function iodeco:core/api/any/_

# エラーを発生させる
    data modify storage iodeco:util in.Name set from storage iodeco: in.name
    data modify storage iodeco:util in.ReceivedType set from storage iodeco:core ReceivedType
    data modify storage iodeco:util in.ExpectedType set value '{"storage":"iodeco:core", "nbt":"Error.detail.types[]", "separator":{"text":" | "}}'
    data modify storage iodeco:util in.Detail.types set from storage iodeco: in.types
    function iodeco:core/util/error/type_mismatch_error

# 戻り値を設定する
    data modify storage iodeco: out.error set from storage iodeco:util out.Error

# リセット
    function iodeco:core/util/cleanup
