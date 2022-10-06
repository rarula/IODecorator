#> iodeco:core/api/validate/predicate/common/collection/includes/search/1
# @within function
#   iodeco:core/api/validate/predicate/common/collection/includes/_
#   iodeco:core/api/validate/predicate/common/collection/includes/search/1

# 配列末尾に含まれる値が一致するかチェック
    data modify storage iodeco:temp SearchElement set from storage iodeco:temp SearchElements[-1]
    data modify storage iodeco:temp InputElements set from storage iodeco: in.value
    function iodeco:core/api/validate/predicate/common/collection/includes/search/2

# 値が一致 -> 配列末尾の要素を削除する
    execute if data storage iodeco:temp {Result:false} run data remove storage iodeco:temp SearchElements[-1]

# 値が一致しないか、全てを探索し終えるまで再帰
    execute if data storage iodeco:temp {Result:false} if data storage iodeco:temp SearchElements[0] run function iodeco:core/api/validate/predicate/common/collection/includes/search/1
