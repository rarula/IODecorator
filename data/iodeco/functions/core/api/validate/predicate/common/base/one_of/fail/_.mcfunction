#> iodeco:core/api/validate/predicate/common/base/one_of/fail/_
# @within function iodeco:core/api/validate/predicate/common/base/one_of/_

# エラーメッセージを設定する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"Expected \'%1$s\' to be one of \'[%2$s%3$s]\', but got \'%4$s\'.",  "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}, {"storage":"iodeco:", "nbt":"error.detail.head"}, {"storage":"iodeco:", "nbt":"error.detail.arrayInfo", "interpret":true}, {"storage":"iodeco:", "nbt":"error.detail.value"}]}'
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"Expected \'%1$s\' not be one of \'[%2$s%3$s]\', but got \'%4$s\'.", "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}, {"storage":"iodeco:", "nbt":"error.detail.head"}, {"storage":"iodeco:", "nbt":"error.detail.arrayInfo", "interpret":true}, {"storage":"iodeco:", "nbt":"error.detail.value"}]}'

# 配列の長さが2以上 -> 要素の表示を省略する
    execute if data storage iodeco:core Args.oneOf[1] run function iodeco:core/api/validate/predicate/common/base/one_of/fail/omit

# エラーを発生させる
    data modify storage iodeco:util in.Name set from storage iodeco: in.name
    data modify storage iodeco:util in.Detail.head set from storage iodeco:core Args.oneOf[0]
    data modify storage iodeco:util in.Detail.value set from storage iodeco: in.value
    function iodeco:core/api/validate/error/argument_error


# 戻り値を設定する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:core Predicate.oneOf.success set value false
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:core Predicate.oneOf.error set from storage iodeco:util out.Error
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:core Predicate.not.oneOf.success set value false
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:core Predicate.not.oneOf.error set from storage iodeco:util out.Error

# リセット
    function iodeco:core/util/cleanup
