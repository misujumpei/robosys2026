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


# Test 4: 角度ではなく文字を入力された場合に対するエラー処理
res=$(./trig sin abc)      # 角度に 'abc' を入れて実行
if [[ "$res" == *"エラー"* ]]; then
    echo "Test 4 (異常系): 正解 (Passed - エラーを検知)"
else
    echo "Test 4 (異常系): 不正解: エラーを出すべき場所で出ませんでした"
    exit 1
fi


# Test 5: 記号の入力に対するエラー処理
res=$(./trig sin "@#!?")      # 角度に記号を入れて実行
if [[ "$res" == *"エラー"* ]]; then
    echo "Test 5 (記号系): 正解 (Passed - 記号を検知)"
else
    echo "Test 5 (記号系): 不正解: 記号に対してエラーが出ていません"
    exit 1
fi


# Test 6: 未対応の関数名（例: log）を入れたとき
res=$(./trig log 90)      # sin/cos/tan 以外の文字を入れて実行
if [[ "$res" == *"未対応"* ]]; then
    echo "Test 6 (未対応関数): 正解 (Passed - メッセージを確認)"
else
    echo "Test 6 (未対応関数): 不正解: 未対応である旨を表示すべきです"
    exit 1
fi


# Test 7: 引数が3つ以上あるとき
res=$(./trig sin 90 dummy)
if [ "$res" = "1.0" ]; then
    echo "Test 7 (過剰引数): 正解 (Passed - 3つ目以降を無視して計算)"
else
    echo "Test 7 (過剰引数): 不正解: 余計な引数があっても計算すべきです"
    exit 1
fi


# Test 8: 引数が足りないとき（使いかたを表示するか）
res=$(./trig sin)      # 角度を入れずに実行してみる
if [[ "$res" == *"使い方"* ]]; then
    echo "Test 8 (引数不足): 正解 (Passed - 使い方を表示)"
else
    echo "Test 8 (引数不足): 不正解: 使い方を表示すべきです"
    exit 1
fi


echo "すべての基本テストが完了"
