#> iodeco:core/api/validate/predicate/common/numeric/equal/fail/_
# @within function iodeco:core/api/validate/predicate/common/numeric/equal/_

# エラーメッセージを設定する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"Expected \'%1$s\' to be equal to \'%2$s\', but got \'%3$s\'.",  "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}, {"storage":"iodeco:", "nbt":"error.detail.expected"}, {"storage":"iodeco:", "nbt":"error.detail.value"}]}'
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"Expected \'%1$s\' not be equal to \'%2$s\', but got \'%3$s\'.", "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}, {"storage":"iodeco:", "nbt":"error.detail.expected"}, {"storage":"iodeco:", "nbt":"error.detail.value"}]}'

# エラーを発生させる
    data modify storage iodeco:util in.Name set from storage iodeco: in.name
    data modify storage iodeco:util in.Detail.expected set from storage iodeco:core Args.equal
    data modify storage iodeco:util in.Detail.value set from storage iodeco: in.value
    function iodeco:core/api/validate/error/argument_error


# 戻り値を設定する
    data modify storage iodeco:core NumericPredicate.equal.success set value false
    data modify storage iodeco:core NumericPredicate.equal.error set from storage iodeco:util out.Error

# リセット
    function iodeco:core/util/cleanup
