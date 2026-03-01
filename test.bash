#!/bin/bash
# SPDX-FileCopyrightText: 2026 misujumpei
# SPDX-License-Identifier: BSD-3-Clause

# Test 1: sin 90 のテスト
res=$(./trig sin 90)
status=$?
if [ $status -eq 0 ] && [ "$res" = "1.0" ]; then
    echo "Test 1: OK"
else
    echo "Test 1: NG"
    exit 1
fi


# Test 2: cos 60 のテスト
res=$(./trig cos 60)
status=$?
if [ $status -eq 0 ] && [[ "$res" == *"0.5"* ]]; then
    echo "Test 2: OK"
else
    echo "Test 2: NG"
    exit 1
fi


# Test 3: tan 45 のテスト
res=$(./trig tan 45)      
status=$?
if [ $status -eq 0 ] && { [[ "$res" == *"0.99"* ]] || [[ "$res" == *"1.0"* ]]; }; then
    echo "Test 3: OK"
else
    echo "Test 3: NG"
    exit 1
fi


# Test 4: 角度ではなく文字を入力された場合

./trig sin abc > /dev/null 2>&1
status=$?
if [ $status -ne 0 ]; then
    echo "Test 4: OK"
else
    echo "Test 4: NG"
    exit 1
fi


# Test 5: 記号の入力
./trig sin "@#!?" > /dev/null 2>&1
status=$?
if [ $status -ne 0 ]; then
    echo "Test 5: OK"
else
    echo "Test 5: NG"
    exit 1
fi


# Test 6: 未対応の関数名（例: log）
./trig log 90 > /dev/null 2>&1
status=$?
if [ $status -ne 0 ]; then
    echo "Test 6: OK"
else
    echo "Test 6: NG"
    exit 1
fi


# Test 7: 引数が3つ以上あるとき
res=$(./trig sin 90 dummy)
status=$?
if [ $status -eq 0 ] && [ "$res" = "1.0" ]; then
    echo "Test 7: OK"
else
    echo "Test 7: NG"
    exit 1
fi


# Test 8: 引数が足りないとき
./trig sin > /dev/null 2>&1
status=$?
if [ $status -ne 0 ]; then
    echo "Test 8: OK"
else
    echo "Test 8: NG"
    exit 1
fi

echo "All tests passed."
exit 0

