# ggsample07 - GLSL シェーダサンプル

## 1. 概要

本プログラムは、GLSL を用いてカスタムシェーダを構築し、ポリゴンメッシュに対してライティングおよび陰影付けを行うサンプルプログラムです。

- 移行元ブログ記事:
  - [シェーダの作成 - 床井研究室](https://tokoik.github.io/blog/2005/10/19/)

## 2. 宿題の内容

[ggnote07.pdf](https://tokoik.github.io/gg/ggnote07.pdf) の宿題ひな型プログラムです。
`ggsample07.frag` の陰影付けモデルを、Phong モデルから毛髪や繊維などの異方性反射面を表現する Kajiya-Kay モデルに変更し、接線ベクトル $\mathbf{t}$ に沿った陰影付けを行ってください。

## 3. 対応環境

- **Windows**: Visual Studio 2019 / 2022 / 2026 (CMake 経由で GLFW を自動構成)
- **macOS**: Xcode (GLFW を自動ダウンロード、OpenGL Framework を使用)
- **Ubuntu Linux**: GCC / Make (システム標準の libglfw3-dev, libgl1-mesa-dev を使用)

## 4. ビルド手順

### Windows (Visual Studio)

```pwsh
cmake -B build -S .
cmake --build build --config Release
```

### macOS (Xcode)

```bash
cmake -B build -G Xcode
cmake --build build --config Release
```

### Ubuntu Linux (Makefile)

```bash
sudo apt-get update
sudo apt-get install -y libglfw3-dev libgl1-mesa-dev
cmake -B build -S .
cmake --build build
```

## 5. 起動方法

ビルド完了後、生成された実行ファイルを実行します。

- **Windows**: `build/Release/ggsample07.exe`
- **macOS**: `build/Release/ggsample07.app`
- **Linux**: `build/ggsample07`

## 6. 操作方法

- **マウスドラッグ**: シーンの視点回転（トラックボール）
- **[q] / [Q] / [ESC]**: プログラムの終了

## 7. プログラムの解説

独自のシェーダ管理クラス `Shader` を用いてバーテックスシェーダ `ggsample07.vert` およびフラグメントシェーダ `ggsample07.frag` をコンパイル・リンクし、ユニフォーム変数を通じて光源パラメータや材質属性をシェーダに渡してレンダリングしています。
