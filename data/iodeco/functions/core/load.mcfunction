#> iodeco:core/load
#
# load時に実行される
#
# @within tag/function minecraft:load

# バージョンの初回ロード時実行
    execute unless data storage iodeco: {Version:"1.0.0"} run function iodeco:core/load_once
