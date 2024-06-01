ERROR_EXIT () {     # ERROR関数
    echo "$1" >&2   # エラーメッセージ(引数1)を標準エラー出⼒に表⽰
    rm -f /tmp/$$-* # 作ったファイルの削除
    exit 1          # エラー終了
}

# ⓵正常系　引数を正常な値で起動したとき
./greatest_common_divisor.sh 528 248 > /tmp/$$-result
echo "528 と 248 の最大公約数は 8 です。" > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT "result err" # 失敗
rm -f /tmp/$$-*

# ⓶正常系　引数を正常な値で起動したとき　※引き数が⓵と逆にした時
./greatest_common_divisor.sh 248 528 > /tmp/$$-result
echo "248 と 528 の最大公約数は 8 です。" > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT "result err" # 失敗
rm -f /tmp/$$-*
