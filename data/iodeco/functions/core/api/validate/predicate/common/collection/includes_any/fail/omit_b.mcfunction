#> iodeco:core/api/validate/predicate/common/collection/includes_any/fail/omit_b
# @within function iodeco:core/api/validate/predicate/common/collection/includes_any/fail/_

#>
# @private
    #declare score_holder $Length

# エラーメッセージを設定する
    data modify storage iodeco:util in.Detail.arrayBInfo set value '{"color":"red", "translate":", ... %1$s more", "with":[{"storage":"iodeco:", "nbt":"error.detail.arrayBLength"}]}'

# 要素の表示を省略する
    execute store result score $Length IODecorator if data storage iodeco: in.value[]
    execute store result storage iodeco:util in.Detail.arrayBLength int 1.0 run scoreboard players remove $Length IODecorator 1

# リセット
    scoreboard players reset $Length
