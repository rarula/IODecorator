#> iodeco:core/api/validate/any
# @within function
#   iodeco:core/api/validate/_
#   iodeco:core/api/validate/any

# 配列末尾の条件をコピーし、取り除く
    data modify storage iodeco:core Input set from storage iodeco: in.any[-1]
    data remove storage iodeco: in.any[-1]

# 条件を解析する
    function iodeco:core/api/validate/predicate/_

# いずれかの条件に合致するか、全てを探索し終えるまで再帰
    execute if data storage iodeco: out{success:true} if data storage iodeco: in.any[-1] run function iodeco:core/api/validate/any
