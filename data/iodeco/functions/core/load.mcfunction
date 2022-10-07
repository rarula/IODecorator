#> iodeco:core/load
#
# load時に実行される
#
# @within tag/function minecraft:load

# 初回ロード時実行
    execute unless data storage iodeco: Version run function iodeco:core/load_once
