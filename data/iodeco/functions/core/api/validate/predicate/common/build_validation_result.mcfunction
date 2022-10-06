#> iodeco:core/api/validate/predicate/common/build_validation_result
#
# ValidationResult を組み立てる
#
# @input
#   storage iodeco:core
#       ValidationResult: compound
#           検証の結果
#
# @output
#   storage iodeco:core
#       Predicate: compound
#           検証の結果
#
# @within function iodeco:core/api/validate/predicate/*/*/_

# 戻り値を設定する
    execute if data storage iodeco:core {Inverted:false} run data modify storage iodeco:core Predicate set from storage iodeco:core ValidationResult
    execute if data storage iodeco:core {Inverted:true } run data modify storage iodeco:core Predicate.not set from storage iodeco:core ValidationResult

# リセット
    data remove storage iodeco:core ValidationResult
