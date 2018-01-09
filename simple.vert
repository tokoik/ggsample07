#version 150 core

// 光源
const vec4 pl     = vec4(3.0, 4.0, 5.0, 1.0);       // 位置
const vec4 lamb   = vec4(0.2, 0.2, 0.2, 1.0);       // 環境光成分の強度
const vec4 ldiff  = vec4(1.0, 1.0, 1.0, 0.0);       // 拡散反射成分の強度
const vec4 lspec  = vec4(1.0, 1.0, 1.0, 0.0);       // 鏡面反射成分の強度

// 材質
const vec4 kamb   = vec4(0.6, 0.6, 0.6, 1.0);       // 環境光の反射係数
const vec4 kdiff  = vec4(0.6, 0.6, 0.6, 1.0);       // 拡散反射係数
const vec4 kspec  = vec4(0.4, 0.4, 0.4, 1.0);       // 鏡面反射係数
const float kshi  = 40.0;                           // 輝き係数

// 頂点属性
in vec4 pv;                                         // ローカル座標系の頂点位置
in vec4 nv;                                         // 頂点の法線ベクトル

// 変換行列
uniform mat4 mw;                                    // 視点座標系への変換行列
uniform mat4 mc;                                    // クリッピング座標系への変換行列
uniform mat4 mg;                                    // 法線ベクトルの変換行列

// ラスタライザに送る頂点属性
out vec4 dc;                                        // 頂点色の拡散反射光成分＋環境光成分
out vec4 sc;                                        // 頂点色の鏡面反射光成分

void main(void)
{
  vec4 p = mw * pv;                                 // 視点座標系の頂点の位置
  vec3 v = -normalize(p.xyz / p.w);                 // 視線ベクトル
  vec3 l = normalize((pl * p.w - p * pl.w).xyz);    // 光線ベクトル
  vec3 n = normalize((mg * nv).xyz);                // 法線ベクトル
  vec3 h = normalize(l + v);                        // 中間ベクトル

  vec4 iamb = kamb * lamb;
  vec4 idiff = max(dot(n, l), 0.0) * kdiff * ldiff;
  vec4 ispec = pow(max(dot(n, h), 0.0), kshi) * kspec * lspec;

  dc = iamb + idiff;
  sc = ispec;

  gl_Position = mc * pv;
}
