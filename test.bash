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

# すべてのテストを通過したらOK
[ "$res" = 0 ] && echo "OK"
exit $res
