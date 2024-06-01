#!/bin/bash

# 引数が数字かを判定する関数
argument_check() {
    expr "$1" + 1 >&/dev/null
    if [ $? -eq 2 ]; then
        echo '入力エラー数字以外の文字が入力されました'
        exit 1
    fi
}

# これよりメイン処理

#引き数チェック
argument_check $1
argument_check $2

# 大きい方を変数a、小さい方を変数bにする
a=$1
b=$2
if [ $1 -lt $2 ]; then
    a=$2
    b=$1
fi

# 最大公約数を計算（ユークリッドの互除法）
while ((c=$a%$b)); do
    if [ $c -eq 0 ]; then
        break
    fi
    a=$b
    b=$c
done

# 結果を表示
echo $1 "と" $2 "の最大公約数は" $b "です。"

