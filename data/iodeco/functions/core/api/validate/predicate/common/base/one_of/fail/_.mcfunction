#> iodeco:core/api/validate/predicate/common/base/one_of/fail/_
# @within function iodeco:core/api/validate/predicate/common/base/one_of/_

#>
# @private
    #declare score_holder $Length

# エラーメッセージを設定する
    data modify storage iodeco:temp Message set value '[{"text":"", "color":"red"}, {"translate":"Expected \'%1$s\' %2$s be one of \'[%3$s%4$s]\', but got \'%5$s\'.", "with":[{"storage":"iodeco:core", "nbt":"Error.nbtName"}, {"storage":"iodeco:core", "nbt":"Error.detail.word"}, {"storage":"iodeco:core", "nbt":"Error.detail.listValue"}, {"storage":"iodeco:core", "nbt":"Error.detail.list", "interpret":true}, {"storage":"iodeco:core", "nbt":"Error.detail.inputValue"}]}]'

# エラーメッセージを構成する
    data modify storage iodeco:temp Detail.listValue set from storage iodeco:core Args.oneOf[0]
    data modify storage iodeco:temp Detail.inputValue set from storage iodeco: in.value

# 条件の反転状況に応じてメッセージの内容も反転する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:temp Detail.word set value "to"
    execute if data storage iodeco:core {Inverted:true} run data modify storage iodeco:temp Detail.word set value "not"

# 配列の長さが2以上であれば省略する
    execute if data storage iodeco:core Args.oneOf[1] run data modify storage iodeco:temp Detail.list set value '[{"translate":", ... %1$s more", "with":[{"storage":"iodeco:core", "nbt":"Error.detail.listLength"}]}]'
    execute if data storage iodeco:core Args.oneOf[1] store result score $Length IODecorator if data storage iodeco:core Args.oneOf[]
    execute if data storage iodeco:core Args.oneOf[1] store result storage iodeco:temp Detail.listLength int 1.0 run scoreboard players remove $Length IODecorator 1

# リセット
    scoreboard players reset $Length


# エラーを発生させる
    function iodeco:core/api/validate/error/errors/argument
