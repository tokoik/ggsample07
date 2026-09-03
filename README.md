# ggsample07 - GLSL シェーダサンプル

## 1. 概要

本プログラムは、GLSL を用いてカスタムシェーダを構築し、ポリゴンメッシュに対してライティングおよび陰影付けを行うサンプルプログラムです。

- 移行元ブログ記事:
  - [シェーダの作成 - 床井研究室](https://tokoik.github.io/blog/2005/10/19/)

## 2. 対応環境

- **Windows**: Visual Studio 2019 / 2022 / 2026 (CMake 経由で GLFW を自動構成)
- **macOS**: Xcode (GLFW を自動ダウンロード、OpenGL Framework を使用)
- **Ubuntu Linux**: GCC / Make (システム標準の libglfw3-dev, libgl1-mesa-dev を使用)

## 3. ビルド手順

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

## 4. 起動方法

ビルド完了後、生成された実行ファイルを実行します。

- **Windows**: `build/Release/ggsample07.exe`
- **macOS**: `build/Release/ggsample07.app`
- **Linux**: `build/ggsample07`

## 5. 操作方法

- **マウスドラッグ**: シーンの視点回転（トラックボール）
- **[q] / [Q] / [ESC]**: プログラムの終了

## 6. プログラムの解説

独自のシェーダ管理クラス `Shader` を用いてバーテックスシェーダ `ggsample07.vert` およびフラグメントシェーダ `ggsample07.frag` をコンパイル・リンクし、ユニフォーム変数を通じて光源パラメータや材質属性をシェーダに渡してレンダリングしています。
