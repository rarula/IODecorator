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
```

## その他
以下のリポジトリや記事を参考にさせていただきました
- [ow](https://github.com/sindresorhus/ow)
- [定数時間でNBTのidを取得する方法とその解説](https://gist.github.com/intsuc/a798ed9c10b495d2beaf60db327fb4dd)

## 連絡
<https://twitter.com/rarula_>

## ライセンス
[CC0-1.0](LICENSE)
