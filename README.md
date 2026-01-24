# robosys2026
ロボットシステム学授業用課題1。やり直しました


![test](https://github.com/misujumpei/robosys2026/actions/workflows/test.yml/badge.svg)

コマンドライン引数で「関数名（sin/cos/tan）」と「角度（度数法）」を受け取り、三角関数の計算結果を出力するコマンドです。
誤った入力（数値以外や引数不足など）に対しては、適切なエラーメッセージを表示します。

## インストール方法
以下のコマンドを入力してください。

```bash
$git clone [https://github.com/misujumpei/robosys2026.git$](https://github.com/misujumpei/robosys2026.git$) cd robosys2026
```

以下のコマンドを入力し実行権限を付与してください。
```bash
$ chmod +x trig
```

実行例
基本的な使い方
"./trig","sin""cos""tan""

```
$ ./trig sin 90
1.0
```

エラーハンドリング
```bash
$ ./trig sin abc
エラー: 角度には数値を入力してください
```

## テスト環境
本リポジトリには、堅牢性を確認するための自動テストスクリプト `test.bash` が含まれています。
正常系（sin/cos/tan）だけでなく、異常系（文字入力、引数不足、引数過多など）を含む計8項目のテストを自動で行います。

```bash
$ ./test.bash
```


必要なソフトウェア
Ubuntu 24.04 LTS

Python 3.7 〜 3.12

ライセンス
このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．

© 2026 Jumpei Misu

謝辞
このパッケージのディレクトリ構成やテスト方法は、千葉工業大学 ロボットシステム学（2025）の講義資料を参考にしています。

* [千葉工業大学 ロボットシステム学（2025）の講義資料](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)

