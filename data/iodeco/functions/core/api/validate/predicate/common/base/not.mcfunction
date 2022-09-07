#> iodeco:core/api/validate/predicate/common/base/not
#
# @input
#   storage iodeco:core Args
#       not?: NBTCompound
#
# @within function iodeco:core/api/validate/predicate/predicates/*/_

# 条件が反転するかどうかフラグを立てる
    execute store success storage iodeco:core Not byte 1.0 if data storage iodeco:core Args.not

# 条件が反転する -> not以降の引数をコピーし、実際に条件が反転されるかどうかフラグを立てる
    execute if data storage iodeco:core {Not:true} run data modify storage iodeco:core Args set from storage iodeco:core Args.not
    execute if data storage iodeco:core {Not:true} store success storage iodeco:core Inverted byte 1.0 if data storage iodeco:core {Inverted:false}
