#> iodeco:core/load_once
#
# バージョンの初回ロード時に実行される
#
# @within function iodeco:core/load

# バージョン設定
    data modify storage iodeco: Version set value "1.0.0"


# スコアボード設定
    scoreboard objectives add IODecorator dummy


# utilの初期化
    function iodeco:core/util/nbt/core/get_id/init
