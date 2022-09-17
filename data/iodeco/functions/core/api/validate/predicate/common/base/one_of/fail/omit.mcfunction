#> iodeco:core/api/validate/predicate/common/base/one_of/fail/omit
# @within function iodeco:core/api/validate/predicate/common/base/one_of/fail/_

#>
# @private
    #declare score_holder $Length


# エラーメッセージを設定する
    data modify storage iodeco:temp Detail.4 set value '[{"translate":", ... %1$s more", "with":[{"storage":"iodeco:core", "nbt":"Error.detail.4-1"}]}]'


## 1
# 要素の表示を省略する
    execute store result score $Length IODecorator if data storage iodeco:core Args.oneOf[]
    execute store result storage iodeco:temp Detail.4-1 int 1.0 run scoreboard players remove $Length IODecorator 1

# リセット
    scoreboard players reset $Length
