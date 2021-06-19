#version 410 core

// 光源
const vec4 pl = vec4(0.0, 4.0, 7.0, 1.0);           // 位置

// 頂点属性
in vec4 pv;                                         // ローカル座標系の頂点位置
in vec4 nv;                                         // 頂点の法線ベクトル

// 変換行列
uniform mat4 mw;                                    // 視点座標系への変換行列
uniform mat4 mc;                                    // クリッピング座標系への変換行列
uniform mat4 mg;                                    // 法線ベクトルの変換行列

// ラスタライザに送る頂点属性
out vec3 n;                                         // 頂点の法線ベクトル
out vec3 l;                                         // 光線ベクトル
out vec3 v;                                         // 視線ベクトル

void main(void)
{
  vec4 p = mw * pv;                                 // 視点座標系の頂点の位置
  vec4 q = mw * pl;                                 // 視点座標系の光源の位置

  n = normalize((mg * nv).xyz);                     // 法線ベクトル
  l = normalize((q * p.w - p * q.w).xyz);           // 光線ベクトル
  v = normalize(p.xyz / p.w);                       // 視線ベクトル

  gl_Position = mc * pv;
}
