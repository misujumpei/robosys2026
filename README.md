# robosys2026

![test](https://github.com/misujumpei/robosys2026/actions/workflows/test.yml/badge.svg)

コマンドライン引数、または標準入力から角度（度数法）を受け取り、三角関数（sin, cos, tan）の計算結果を出力するコマンドです。

## インストール方法
リポジトリをクローンし、ディレクトリに移動します。
```bash
git clone https://github.com/misujumpei/robosys2026.git
cd robosys2026
```

以下のコマンドを入力し実行権限を付与してください。
```bash
chmod +x trig
```


## 使い方
書式
```bash
./trig [関数名] [角度]
```
またはパイプを使った標準入力:
```bash
echo [角度] | ./trig [関数名]
```

* 関数名: sin, cos, tan のいずれか
* 角度: 度数法（degree）の数値（整数または小数）

## 実行例
 ### 基本的な実行
```bash
$ ./trig sin 90
1.0
```

### パイプ（標準入力）を使った連続処理
`seq` コマンドなどと組み合わせて、複数の角度の計算を一括で処理できます。
```bash
$ seq 0 30 90 | ./trig sin
0.0
0.5
0.8660254038
1.0
```

### エラー時の動作
 ```bash
$./trig sin abc$ echo $?
1
 ```

## テスト環境
  * Ubuntu 24.04 LTS 
  * Ubuntu 22.04 LTS 

```bash
 $ ./test.bash
```


必要なソフトウェア
Ubuntu 24.04 LTS

Python 3.7 〜 3.12

## ライセンス
 * このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．

 * © 2026 misujumpei

 * このパッケージのディレクトリ構成やテスト方法は、千葉工業大学 ロボットシステム学（2025）の講義資料を参考にしています。

  * [千葉工業大学 ロボットシステム学（2025）の講義資料](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)

