#!/usr/bin/python3
# SPDX-FileCopyrightText: 2026 misujumpei
# SPDX-License-Identifier: BSD-3-Clause

# Test 1: 正解が出るか確認 (sin 90 = 1.0)

res=$(./trig sin 90) 	 # 実行して、結果をresに入れる


if [ "$res" = "1.0" ]; then 	 # 「もしresの中身が 1.0 だったら」という条件分岐
    
    echo" 正解 "	         #正解であれば表示
else
    				 
    echo "不正解: $res"　　　　　#不正解なことと、何を間違えたか表示
    exit 1
fi
