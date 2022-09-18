#> iodeco:core/api/any/search
# @within function
#   iodeco:core/api/any/_
#   iodeco:core/api/any/search

# 配列末尾の要素を比較する
    data modify storage iodeco:temp Value set from storage iodeco:temp Types[-1]
    execute store success storage iodeco:temp Result byte 1.0 run data modify storage iodeco:temp Value set from storage iodeco:core ReceivedType

# 型が不一致 -> 配列末尾の要素を削除する
    execute if data storage iodeco:temp {Result:true} run data remove storage iodeco:temp Types[-1]

# 型が一致するか、全てを探索し終えるまで再帰
    execute if data storage iodeco:temp {Result:true} if data storage iodeco:temp Types[0] run function iodeco:core/api/any/search
