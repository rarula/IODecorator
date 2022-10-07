#> iodeco:core/api/uninstall/_
# @within function iodeco:api/uninstall

# スコアボードを削除
    scoreboard objectives remove IODecorator

# ストレージを削除
    data remove storage iodeco: Version
    data remove storage iodeco: in
    data remove storage iodeco: out

# ストレージを削除 (util/nbt)
    data remove storage iodeco:util/nbt Ids
    data remove storage iodeco:util/nbt NumericCollectionIds
    data remove storage iodeco:util/nbt NumericArrayChecker
    data remove storage iodeco:util/nbt ValueOrEmptyCollectionIds
