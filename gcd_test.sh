ERROR_EXIT () {     # ERROR関数
    echo "$1" >&2   # エラーメッセージ(引数1)を標準エラー出⼒に表⽰
    rm -f /tmp/$$-* # 作ったファイルの削除
    exit 1          # エラー終了
}

# 正常系　引き数１＞引き数２で起動した時
./greatest_common_divisor.sh 528 248 > /tmp/$$-result
echo "528 と 248 の最大公約数は 8 です。" > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT "result err" # 失敗
rm -f /tmp/$$-*

# 正常系　引き数１＜引き数２で起動した時
./greatest_common_divisor.sh 248 528 > /tmp/$$-result
echo "248 と 528 の最大公約数は 8 です。" > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT "result err" # 失敗
rm -f /tmp/$$-*

# 正常系　引き数１＝引き数２で起動した時
./greatest_common_divisor.sh 248 248 > /tmp/$$-result
echo "248 と 248 の最大公約数は 248 です。" > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT "result err" # 失敗
rm -f /tmp/$$-*

# 正常系　引き数１をマイナスで起動した時
./greatest_common_divisor.sh -528 248 > /tmp/$$-result
echo "-528 と 248 の最大公約数は 8 です。" > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT "result err" # 失敗
rm -f /tmp/$$-*

# 正常系　引き数２をマイナスで起動した時
./greatest_common_divisor.sh 248 -528 > /tmp/$$-result
echo "248 と -528 の最大公約数は 8 です。" > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT "result err" # 失敗
rm -f /tmp/$$-*

# 正常系　引き数１と引き数２をマイナスで起動した時
./greatest_common_divisor.sh 248 -528 > /tmp/$$-result
echo "248 と -528 の最大公約数は 8 です。" > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT "result err" # 失敗
rm -f /tmp/$$-*

# 異常系　引き数１を０で起動した時
./greatest_common_divisor.sh 0 248 > /tmp/$$-result
echo "入力エラー！ 引数が自然数ではありません。" > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT "result err" # 失敗
rm -f /tmp/$$-*

# 異常系　引き数２を０で起動した時
./greatest_common_divisor.sh 248 0 > /tmp/$$-result
echo "入力エラー！ 引数が自然数ではありません。" > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT "result err" # 失敗
rm -f /tmp/$$-*

# 異常系　引き数を一つだけで起動した時
./greatest_common_divisor.sh 248 > /tmp/$$-result
echo "入力エラー！ 引き数がないか、数字以外の文字が入力されました。" > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT "result err" # 失敗
rm -f /tmp/$$-*

# 異常系　引き数を無しで起動した時
./greatest_common_divisor.sh 248 > /tmp/$$-result
echo "入力エラー！ 引き数がないか、数字以外の文字が入力されました。" > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT "result err" # 失敗
rm -f /tmp/$$-*
