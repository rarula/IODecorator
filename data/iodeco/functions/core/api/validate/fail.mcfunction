#> iodeco:core/api/validate/fail
# @within function iodeco:core/api/validate/_

# エラーを発生させる
    data modify storage iodeco:util in.Name set from storage iodeco: in.name
    data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"An argument for \'%1$s\' was not specified.", "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}]}'
    function iodeco:core/api/validate/error/argument_error

# 戻り値を設定する
    data modify storage iodeco: out.error set from storage iodeco:util out.Error

# リセット
    function iodeco:core/util/cleanup
