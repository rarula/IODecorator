#> iodeco:core/api/validate/predicate/common/collection/equal/fail/_
# @within function iodeco:core/api/validate/predicate/common/collection/equal/_

# エラーメッセージを設定する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"Expected \'%1$s\' to be equal to \'[%2$s%3$s]\', but got \'[%4$s%5$s]\'.",  "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}, {"storage":"iodeco:", "nbt":"error.detail.headA", "underlined":true, "hoverEvent":{"action":"show_text", "contents":{"storage":"iodeco:", "nbt":"error.detail.arrayA"}}}, {"storage":"iodeco:", "nbt":"error.detail.arrayAInfo", "interpret":true, "underlined":true, "hoverEvent":{"action":"show_text", "contents":{"storage":"iodeco:", "nbt":"error.detail.arrayA"}}}, {"storage":"iodeco:", "nbt":"error.detail.headB", "underlined":true, "hoverEvent":{"action":"show_text", "contents":{"storage":"iodeco:", "nbt":"error.detail.arrayB"}}}, {"storage":"iodeco:", "nbt":"error.detail.arrayBInfo", "interpret":true, "underlined":true, "hoverEvent":{"action":"show_text", "contents":{"storage":"iodeco:", "nbt":"error.detail.arrayB"}}}]}'
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:util in.Message set value '{"color":"red", "translate":"Expected \'%1$s\' not be equal to \'[%2$s%3$s]\', but got \'[%4$s%5$s]\'.", "with":[{"storage":"iodeco:", "nbt":"error.nbtName"}, {"storage":"iodeco:", "nbt":"error.detail.headA", "underlined":true, "hoverEvent":{"action":"show_text", "contents":{"storage":"iodeco:", "nbt":"error.detail.arrayA"}}}, {"storage":"iodeco:", "nbt":"error.detail.arrayAInfo", "interpret":true, "underlined":true, "hoverEvent":{"action":"show_text", "contents":{"storage":"iodeco:", "nbt":"error.detail.arrayA"}}}, {"storage":"iodeco:", "nbt":"error.detail.headB", "underlined":true, "hoverEvent":{"action":"show_text", "contents":{"storage":"iodeco:", "nbt":"error.detail.arrayB"}}}, {"storage":"iodeco:", "nbt":"error.detail.arrayBInfo", "interpret":true, "underlined":true, "hoverEvent":{"action":"show_text", "contents":{"storage":"iodeco:", "nbt":"error.detail.arrayB"}}}]}'

# 配列の長さが2以上 -> 要素の表示を省略する
    execute if data storage iodeco:core Args.equal[1] run function iodeco:core/api/validate/predicate/common/collection/equal/fail/omit_a
    execute if data storage iodeco: in.value[1] run function iodeco:core/api/validate/predicate/common/collection/equal/fail/omit_b

# エラーを発生させる
    data modify storage iodeco:util in.Name set from storage iodeco: in.name
    data modify storage iodeco:util in.Detail.arrayA set from storage iodeco:core Args.equal
    data modify storage iodeco:util in.Detail.headA set from storage iodeco:core Args.equal[0]
    data modify storage iodeco:util in.Detail.arrayB set from storage iodeco: in.value
    data modify storage iodeco:util in.Detail.headB set from storage iodeco: in.value[0]
    function iodeco:core/api/validate/error/argument_error


# 戻り値を設定する
    data modify storage iodeco:core ValidationResult.equal.success set value false
    data modify storage iodeco:core ValidationResult.equal.error set from storage iodeco:util out.Error

# リセット
    function iodeco:core/util/cleanup
