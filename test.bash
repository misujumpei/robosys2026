#!/bin/bash
# SPDX-FileCopyrightText: 2026 misujumpei
# SPDX-License-Identifier: BSD-3-Clause

# Test 1: sin 90 のテスト
res=$(./trig sin 90)      # 実行して結果をresに入れる
if [ "$res" = "1.0" ]; then
    echo "Test 1 (sin 90): 正解 (Passed)"
else
    echo "Test 1 (sin 90): 不正解: $res"
    exit 1
fi

# Test 2: cos 60 のテスト
res=$(./trig cos 60)      # 実行して結果をresに入れる
# コンピュータの計算誤差を考慮して 0.5 が含まれているかチェック
if [[ "$res" == *"0.5"* ]]; then
    echo "Test 2 (cos 60): 正解 (Passed)"
else
    echo "Test 2 (cos 60): 不正解: $res"
    exit 1
fi

# Test 3: tan 45 のテスト
res=$(./trig tan 45)
# 1.0 ぴったりでなくても、0.999... や 1.000... を許容するために 0.99 や 1.0 が含まれているかチェック
if [[ "$res" == *"0.99"* ]] || [[ "$res" == *"1.0"* ]]; then
    echo "Test 3 (tan 45): 正解 (Passed)"
else
    echo "Test 3 (tan 45): 不正解: $res"
    exit 1
fi

echo "すべての基本テストが完了"
