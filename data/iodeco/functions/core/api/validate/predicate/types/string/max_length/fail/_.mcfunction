#> iodeco:core/api/validate/predicate/types/string/max_length/fail/_
# @within function iodeco:core/api/validate/predicate/types/string/max_length/_

# エラーメッセージを設定する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"Expected \'%1$s\' to have a maximum length of \'%2$s\', but got \'%3$s\'.", "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}, {"storage":"iodeco:", "nbt":"error.detail.length"}, {"storage":"iodeco:", "nbt":"error.detail.value"}]}'
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"Expected \'%1$s\' to have a minimum length of \'%2$s\', but got \'%3$s\'.", "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}, {"storage":"iodeco:", "nbt":"error.detail.length"}, {"storage":"iodeco:", "nbt":"error.detail.value"}]}'

# 配列の長さを設定する
    execute if data storage iodeco:core {Inverted:false} store result storage iodeco:util in.Detail.length int 1.0 run scoreboard players get $Length IODecorator
    execute if data storage iodeco:core {Inverted:true } store result storage iodeco:util in.Detail.length int 1.0 run scoreboard players add $Length IODecorator 1

# エラーを発生させる
    data modify storage iodeco:util in.Name set from storage iodeco: in.name
    data modify storage iodeco:util in.Detail.value set from storage iodeco: in.value
    function iodeco:core/api/validate/error/argument_error


# 戻り値を設定する
    data modify storage iodeco:core ValidationResult.maxLength.success set value false
    data modify storage iodeco:core ValidationResult.maxLength.error set from storage iodeco:util out.Error

# リセット
    function iodeco:core/util/cleanup
