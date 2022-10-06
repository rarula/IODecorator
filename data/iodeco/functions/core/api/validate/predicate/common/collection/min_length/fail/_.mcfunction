#> iodeco:core/api/validate/predicate/common/collection/min_length/fail/_
# @within function iodeco:core/api/validate/predicate/common/collection/min_length/_

# エラーメッセージを設定する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"Expected \'%1$s\' to have a minimum length of \'%2$s\', but got \'%3$s\'.", "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}, {"storage":"iodeco:", "nbt":"error.detail.length"}, {"storage":"iodeco:", "nbt":"error.detail.value"}]}'
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"Expected \'%1$s\' to have a maximum length of \'%2$s\', but got \'%3$s\'.", "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}, {"storage":"iodeco:", "nbt":"error.detail.length"}, {"storage":"iodeco:", "nbt":"error.detail.value"}]}'

# エラーを発生させる
    data modify storage iodeco:util in.Name set from storage iodeco: in.name
    execute store result storage iodeco:util in.Detail.length int 1.0 run scoreboard players get $Length IODecorator
    execute store result storage iodeco:util in.Detail.value int 1.0 run scoreboard players get $Value IODecorator
    function iodeco:core/api/validate/error/argument_error


# 戻り値を設定する
    data modify storage iodeco:core ValidationResult.minLength.success set value false
    data modify storage iodeco:core ValidationResult.minLength.error set from storage iodeco:util out.Error

# リセット
    function iodeco:core/util/cleanup
