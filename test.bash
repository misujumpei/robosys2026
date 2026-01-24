#!/bin/bash
# SPDX-FileCopyrightText: 2026 misujumpei
# SPDX-License-Identifier: BSD-3-Clause

# Test 1: 正解が出るか確認 (sin 90 = 1.0)
res=$(./trig sin 90)

if [ "$res" = "1.0" ]; then
    echo "正解"
else
    echo "不正解: $res"
    exit 1
fi
