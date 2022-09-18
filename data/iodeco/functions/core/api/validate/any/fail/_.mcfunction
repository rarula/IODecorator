#> iodeco:core/api/validate/any/fail/_
# @within function iodeco:core/api/validate/any/_

data modify storage iodeco:temp ExpectedType set value '[{"storage":"iodeco:core", "nbt":"Error.detail.1[]", "separator":{"text":" | "}}]'
data modify storage iodeco:temp Detail.1 set from storage iodeco: in.any
function iodeco:core/api/validate/error/errors/type_mismatch
