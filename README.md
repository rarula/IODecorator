# IODecorator
関数引数を検証するためのデータパック

## 対応バージョン
- 1.19

## ダウンロード
[Releases](https://github.com/rarula/IODecorator/releases) を参照してください

## 使い方
```mcfunction
#> example:util

data modify storage iodeco: in.value set from storage _ input

data modify storage iodeco: in.name set value "input"
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

### [any](https://github.com/rarula/IODecorator/wiki/any)
NBTが指定された型のいずれかに一致するかどうかを検証します

### [validate](https://github.com/rarula/IODecorator/wiki/validate)
NBTが指定された条件に合致するかどうかを検証します

### [validate.optional](https://github.com/rarula/IODecorator/wiki/validate-optional)
NBTが指定された条件に合致するかどうかを検証します

### [throw](https://github.com/rarula/IODecorator/wiki/throw)
指定されたエラーを全て出力します

### [uninstall](https://github.com/rarula/IODecorator/wiki/uninstall)
追加・変更されたスコアボードやストレージを全て削除し、導入前の状態に戻します

## その他
以下のリポジトリや記事を参考にさせていただきました
- [ow](https://github.com/sindresorhus/ow)
- [定数時間でNBTのidを取得する方法とその解説](https://gist.github.com/intsuc/a798ed9c10b495d2beaf60db327fb4dd)

## 連絡
<https://twitter.com/rarula_>

## ライセンス
[CC0-1.0](LICENSE)
