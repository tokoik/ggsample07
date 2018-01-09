#version 150 core

// ラスタライザから受け取る頂点属性の補間値
in vec4 dc;                                         // 頂点色の拡散反射光成分＋環境光成分
in vec4 sc;                                         // 頂点色の鏡面反射光成分

// フレームバッファに出力するデータ
out vec4 fc;                                        // フラグメントの色

void main(void)
{
  fc = dc + sc;
}
