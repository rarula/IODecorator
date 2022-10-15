# IODecorator
関数引数を検証するためのデータパック

## 対応バージョン
- 1.19

## ダウンロード
[Releases](https://github.com/rarula/IODecorator/releases) を参照してください

## 使い方
```mcfunction
#> example:util

data modify storage iodeco: in.name set value "input"
data modify storage iodeco: in.value set from storage _ input
data modify storage iodeco: in.string.minLength set value 5
function iodeco:api/validate

data modify storage iodeco: in.errorList append from storage iodeco: out.string.error
data modify storage iodeco: in.errorList append from storage iodeco: out.string.minLength.error
function iodeco:api/throw

# ...
```
```mcfunction
data modify storage _ input set value 3
function example:util
# -> TypeMismatchError: Expected type of 'input' is 'string', but received type is 'int'.

data modify storage _ input set value "abc"
function example:util
# -> ArgumentError: Expected 'input' to have a minimum length of '5', but got 'abc'.

data modify storage _ input set value "abcde"
function example:util
# -> OK
```

## API

### iodeco:api/any
NBTが指定された型のいずれかに一致するかどうかを検証します

#### 引数
| ストレージ | 型 | 説明 |
| :- | :- | :- |
| iodeco: in.name | string | 対象のNBTの名前 |
| iodeco: in.value | any | 対象のNBT |
| iodeco: in.types | Type[] | 期待される型のリスト |

#### 戻り値
| ストレージ | 型 | 説明 |
| :- | :- | :- |
| iodeco: out.success | boolean | 検証の成否 (いずれかに一致した場合は `true`、それ以外の場合は `false`) |
| iodeco: out.error | Error | 発生したエラー |
| iodeco: out.type | Type | 対象のNBTの型を表す文字列 |

### iodeco:api/validate
NBTが指定された条件に合致するかどうかを検証します

#### 引数
| ストレージ | 型 | 説明 |
| :- | :- | :- |
| iodeco: in.name | string | 対象のNBTの名前 |
| iodeco: in.value | any | 対象のNBT |
| iodeco: in.{type} | Predicate | 指定する条件 |

#### 戻り値
| ストレージ | 型 | 説明 |
| :- | :- | :- |
| iodeco: out.success | boolean | 検証の成否 (条件に合致した場合は `true`、それ以外の場合は `false`) |
| iodeco: out.error | Error | 発生したエラー |
| iodeco: out.{type} | Result | 検証した結果 |

### iodeco:api/throw
指定されたエラーを全て出力します

#### 引数
| ストレージ | 型 | 説明 |
| :- | :- | :- |
| iodeco: in.errorList | Error[] | 出力するエラーのリスト |

### iodeco:api/uninstall
追加・変更されたスコアボードやストレージを全て削除し、導入前の状態に戻します

## その他
以下のリポジトリや記事を参考にさせていただきました
- [ow](https://github.com/sindresorhus/ow)
- [定数時間でNBTのidを取得する方法とその解説](https://gist.github.com/intsuc/a798ed9c10b495d2beaf60db327fb4dd)

## 連絡
<https://twitter.com/rarula_>

## ライセンス
[CC0-1.0](LICENSE)
