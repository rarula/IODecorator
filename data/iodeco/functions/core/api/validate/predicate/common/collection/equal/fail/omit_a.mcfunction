#> iodeco:core/api/validate/predicate/common/collection/equal/fail/omit_a
# @within function iodeco:core/api/validate/predicate/common/collection/equal/fail/_

#>
# @private
    #declare score_holder $Length

# エラーメッセージを設定する
    data modify storage iodeco:util in.Detail.arrayAInfo set value '{"color":"red", "translate":", ... %1$s more", "with":[{"storage":"iodeco:", "nbt":"error.detail.arrayALength"}]}'

# 要素の表示を省略する
    execute store result score $Length IODecorator if data storage iodeco:core Args.equal[]
    execute store result storage iodeco:util in.Detail.arrayALength int 1.0 run scoreboard players remove $Length IODecorator 1

# リセット
    scoreboard players reset $Length
