#> iodeco:core/util/nbt/core/get_id/init
# @within function iodeco:core/load_once

# endタグ以外の全てのタグのid
    data modify storage iodeco:util/nbt Ids.byte set value 1b
    data modify storage iodeco:util/nbt Ids.short set value 2b
    data modify storage iodeco:util/nbt Ids.int set value 3b
    data modify storage iodeco:util/nbt Ids.long set value 4b
    data modify storage iodeco:util/nbt Ids.float set value 5b
    data modify storage iodeco:util/nbt Ids.double set value 6b
    data modify storage iodeco:util/nbt Ids.byte_array set value 7b
    data modify storage iodeco:util/nbt Ids.string set value 8b
    data modify storage iodeco:util/nbt Ids.list set value 9b
    data modify storage iodeco:util/nbt Ids.compound set value 10b
    data modify storage iodeco:util/nbt Ids.int_array set value 11b
    data modify storage iodeco:util/nbt Ids.long_array set value 12b

# numeric collectionがnumeric listかどうかを判定する用のlist
    data modify storage iodeco:util/nbt NumericCollectionIds set value [[], [], [], [], [], []]
    execute store result storage iodeco:util/nbt NumericCollectionIds[0][] byte 1.0 run data get storage iodeco:util/nbt Ids.byte_array
    execute store result storage iodeco:util/nbt NumericCollectionIds[1][] short 1.0 run data get storage iodeco:util/nbt Ids.list
    execute store result storage iodeco:util/nbt NumericCollectionIds[2][] float 1.0 run data get storage iodeco:util/nbt Ids.list
    execute store result storage iodeco:util/nbt NumericCollectionIds[3][] double 1.0 run data get storage iodeco:util/nbt Ids.list
    execute store result storage iodeco:util/nbt NumericCollectionIds[4][] int 1.0 run data get storage iodeco:util/nbt Ids.int_array
    execute store result storage iodeco:util/nbt NumericCollectionIds[5][] long 1.0 run data get storage iodeco:util/nbt Ids.long_array

# numeric arrayかnumeric listかどうかを判定する用のshort
    data modify storage iodeco:util/nbt NumericArrayChecker set value 0s

# valueかcollectionのidのリスト
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds set value [[], [], [], [], [], [], [], [], [], [], []]
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds[0] append value 1b
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds[1] append value 2s
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds[2] append value 3
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds[3] append value 4L
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds[4] append value 5.0f
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds[5] append value 6.0d
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds[6] append value [B; 0b, 0b, 0b, 0b, 0b, 0b, 0b]
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds[7] append value "        "
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds[8] append value [0b, 0b, 0b, 0b, 0b, 0b, 0b, 0b, 0b]
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds[9] append value [I; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    data modify storage iodeco:util/nbt ValueOrEmptyCollectionIds[10] append value [L; 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L]
