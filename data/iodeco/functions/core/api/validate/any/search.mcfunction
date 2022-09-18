#> iodeco:core/api/validate/any/search
# @within function
#   iodeco:core/api/validate/any/_
#   iodeco:core/api/validate/any/search

# 配列末尾の要素を比較する
    data modify storage iodeco:temp Value set from storage iodeco:temp Array[-1]
    execute store success storage iodeco:temp Result byte 1.0 run data modify storage iodeco:temp Value set from storage iodeco:core ReceivedType

# 値が不一致 -> 配列末尾の要素を削除する
    execute if data storage iodeco:temp {Result:true} run data remove storage iodeco:temp Array[-1]

# 値が一致するか、全てを探索し終えるまで再帰
    execute if data storage iodeco:temp {Result:true} if data storage iodeco:temp Array[-1] run function iodeco:core/api/validate/any/search
