#> iodeco:core/api/validate/predicate/common/collection/includes/search/2
# @within function
#   iodeco:core/api/validate/predicate/common/collection/includes/search/1
#   iodeco:core/api/validate/predicate/common/collection/includes/search/2

# 配列末尾に含まれる値が一致するかチェック
    data modify storage iodeco:temp InputElement set from storage iodeco:temp InputElements[-1]
    execute store success storage iodeco:temp Result byte 1.0 run data modify storage iodeco:temp InputElement set from storage iodeco:temp SearchElement

# 値が不一致 -> 配列末尾の要素を削除する
    execute if data storage iodeco:temp {Result:true} run data remove storage iodeco:temp InputElements[-1]

# 値が一致するか、全てを探索し終えるまで再帰
    execute if data storage iodeco:temp {Result:true} if data storage iodeco:temp InputElements[0] run function iodeco:core/api/validate/predicate/common/collection/includes/search/2
