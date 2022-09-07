#> iodeco:core/api/validate/predicate/_
# @within function
#   iodeco:core/api/validate/_
#   iodeco:core/api/validate/any

# 引数が省略できるかどうかフラグを立てる
    execute store success storage iodeco:core Optional byte 1.0 if data storage iodeco:core Input.optional

# 引数が省略できない -> 引数をコピーする
    execute if data storage iodeco:core {Optional:false} run data modify storage iodeco:core Args set from storage iodeco:core Input

# 引数が省略できる -> optional以降の引数をコピーする
    execute if data storage iodeco:core {Optional:true} run data modify storage iodeco:core Args set from storage iodeco:core Input.optional


# 条件との合致を検証する
    data modify storage iodeco:core Inverted set value false
    data modify storage iodeco:core Checked set value false
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.byte run function iodeco:core/api/validate/predicate/predicates/byte/check_type
    execute if data storage iodeco:core {Checked:false} if data storage iodeco:core Args.short run function iodeco:core/api/validate/predicate/predicates/short/check_type


# リセット
    data remove storage iodeco:core Optional
    data remove storage iodeco:core Args
    data remove storage iodeco:core Inverted
    data remove storage iodeco:core Checked
    data remove storage iodeco:core Not
