#> iodeco:core/api/validate/predicate/types/string/empty/fail/_
# @within function iodeco:core/api/validate/predicate/types/string/empty/_

# エラーメッセージを設定する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"Expected \'%1$s\' to be empty, but got \'%2$s\'.",  "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}, {"storage":"iodeco:", "nbt":"error.detail.value"}]}'
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"Expected \'%1$s\' not be empty, but got \'%2$s\'.", "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}, {"storage":"iodeco:", "nbt":"error.detail.value"}]}'

# エラーを発生させる
    data modify storage iodeco:util in.Name set from storage iodeco: in.name
    data modify storage iodeco:util in.Detail.value set from storage iodeco: in.value
    function iodeco:core/api/validate/error/argument_error


# 戻り値を設定する
    data modify storage iodeco:core ValidationResult.empty.success set value false
    data modify storage iodeco:core ValidationResult.empty.error set from storage iodeco:util out.Error

# リセット
    function iodeco:core/util/cleanup
