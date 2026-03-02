#!/bin/bash
# SPDX-FileCopyrightText: 2026 misujumpei
# SPDX-License-Identifier: BSD-3-Clause

# エラー発生時にその行番号を表示して終了
ng () {
    echo "NG at Line $1"
    res=1
}

res=0

### 正常系のテスト ###
# 引数テスト
out=$(./trig sin 90)
[ "$out" = "1.0" ] || ng $LINENO

out=$(./trig cos 60)
[ "$out" = "0.5" ] || ng $LINENO

out=$(./trig tan 45)
[ "$out" = "1.0" ] || ng $LINENO

# 標準入力テスト
out=$(echo 90 | ./trig sin)
[ "$out" = "1.0" ] || ng $LINENO

# 大量のデータを流す
out=$(seq 0 360 | ./trig sin | wc -l)
[ "$out" = "361" ] || ng $LINENO

# 小数の入力（cos 60.0 は 0.5 になるか）
out=$(./trig cos 60.0)
[ "$out" = "0.5" ] || ng $LINENO

# 非常に小さい値（sin 0.0000000001）
./trig sin 0.0000000001 > /dev/null
[ $? -eq 0 ] || ng $LINENO

### 異常系のテスト ###
# 文字を入力された場合
./trig sin abc > /dev/null 2>&1
[ $? -eq 1 ] || ng $LINENO

# 記号の入力
./trig sin "@#!?" > /dev/null 2>&1
[ $? -eq 1 ] || ng $LINENO

# 未対応の関数名
./trig log 90 > /dev/null 2>&1
[ $? -eq 1 ] || ng $LINENO

# 引数不足
./trig sin > /dev/null 2>&1
[ $? -eq 1 ] || ng $LINENO

# 文字が入った時、何も出力せずに終了ステータス1を返すか
out=$(echo "abc" | ./trig sin 2>&1)
status=$?  

[ "$out" = "" ] || ng $LINENO
[ $status -eq 1 ] || ng $LINENO  

# 複数引数のテスト
out=$(./trig sin 90 180)
[ "$out" = "1.0
0.0" ] || ng $LINENO

# すべてのテストを通過したらOK
[ "$res" = 0 ] && echo "OK"
exit $res
