#> iodeco:core/api/validate/predicate/common/base/one_of/fail/_
# @within function iodeco:core/api/validate/predicate/common/base/one_of/_

data modify storage iodeco:util in.Name set from storage iodeco: in.name

# エラーメッセージを設定する
    data modify storage iodeco:util in.Message set value '[{"text":"", "color":"red"}, {"translate":"Expected \'%1$s\' %2$s be one of \'[%3$s%4$s]\', but got \'%5$s\'.", "with":[{"storage":"iodeco:core", "nbt":"Error.nbtName"}, {"storage":"iodeco:core", "nbt":"Error.detail.2"}, {"storage":"iodeco:core", "nbt":"Error.detail.3"}, {"storage":"iodeco:core", "nbt":"Error.detail.4", "interpret":true}, {"storage":"iodeco:core", "nbt":"Error.detail.5"}]}]'


## 2
# 条件の反転状況に応じてメッセージの内容も反転する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:util in.Detail.2 set value "to"
    execute if data storage iodeco:core {Inverted:true} run data modify storage iodeco:util in.Detail.2 set value "not"

## 3
# 配列の先頭要素を表示する
    data modify storage iodeco:util in.Detail.3 set from storage iodeco:core Args.oneOf[0]

## 4
# 配列の長さが2以上 -> 要素の表示を省略する
    execute if data storage iodeco:core Args.oneOf[1] run function iodeco:core/api/validate/predicate/common/base/one_of/fail/omit

## 5
# 実際に受け取った値を表示する
    data modify storage iodeco:util in.Detail.5 set from storage iodeco: in.value


# エラーを発生させる
    function iodeco:core/api/validate/error/argument_error


# 戻り値を設定する
    data modify storage iodeco:core BasePredicate.oneOf.success set value false
    data modify storage iodeco:core BasePredicate.oneOf.error set from storage iodeco:util out.Error


# リセット
    function iodeco:core/util/cleanup
