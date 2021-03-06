#ifndef GUID_B216E494_71B4_435D_A22A_E71E5073790B
#define GUID_B216E494_71B4_435D_A22A_E71E5073790B

#pragma once

#include "D3DDevice.h"
#include "DexterD3DHead.h"
#include "D3DTexture.h"

////////////////////////////////////////////////////////////////////////////////// 

namespace_dex_begin

////////////////////////////////////////////////////////////////////////////////// 

// 纹理缓冲	
class DEXTER_D3D_CLASS CD3DTextureBuffer : public CD3DTexture
{

	// 图片信息
protected:
	CString							m_TextureBufferKey;					// 标识信息
	CD3DDevice *					m_pD3DDevice;						// 设备指针
	CSize							m_SizeBuffer;						// 缓冲大小

	// 指针信息
protected:
	IDirect3DTexture9 *				m_pTextureInfo;						// 纹理指针
	IDirect3DSurface9 *				m_pSurfaceInfo;						// 绘画缓冲

	// 静态变量
public:
	static CArray< CD3DTextureBuffer * >		m_ArrayTextureBuffe;		// 类指针

	// 函数定义
public:
	// 构造函数
	CD3DTextureBuffer();
	// 析构函数
	virtual ~CD3DTextureBuffer();

	// 获取图像
public:
	// 获取图像
	IDirect3DTexture9 * GetTexture();
	// 获取缓冲
	IDirect3DSurface9 * GetSurface();

	// 图片信息
public:
	// 加载判断
	bool IsNull();
	// 纹理宽度
	int GetWidth() { return m_TextureSize.cx; }
	// 纹理高度
	int GetHeight() { return m_TextureSize.cy; }

	// 控制函数
public:
	// 设置旋转
	void SetRotation( EnumTextureRotationDirection chDirection, float fRotationX, float fRotationY, float fAngle );
	// 设置旋转
	void SetRotation( EnumTextureRotationDirection chDirection, int nRotationX, int nRotationY, float fAngle );
	// 设置对称
	void SetSymmetry( bool bSymmetry );
	// 设置透明
	void SetTextureAlpha( byte cbAlpha );
	// 设置乘积
	void SetTextureColor( CD3DColor D3DColor );
	// 设置描边
	void SetTextureBorderColor( CD3DColor D3DColor );
	// 设置渐变
	void SetGradientColor( CD3DColor D3DColorTop, CD3DColor D3DColorBottom );
	// 设置上层
	void SetUpperTexture( CD3DTexture * pUpperTexture );
	// 设置特效
	void SetEffectType( EnumTextureEffectType nEffectType );

	// 纹理管理
public:
	// 销毁缓冲
	bool Destory();

	// 功能函数
public:
	// 创建缓冲
	bool CreateBuffer( CD3DDevice * pD3DDevice, int nWidth, int nHeight );
	// 保存图片
	bool SaveImage( const tchar * pszSaveFile );

	// 绘画函数
public:
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, int nXDest, int nYDest);
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, int nXDest, int nYDest, int nDestWidth, int nDestHeight, int nXSource, int nYSource);
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, int nXDest, int nYDest, int nDestWidth, int nDestHeight, int nXSource, int nYSource, int nSourceWidth, int nSourceHeight);

	// 透明绘画
public:
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, int nXDest, int nYDest, byte cbAlpha);
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, int nXDest, int nYDest, int nDestWidth, int nDestHeight, int nXSource, int nYSource, byte cbAlpha);
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, int nXDest, int nYDest, int nDestWidth, int nDestHeight, int nXSource, int nYSource, int nSourceWidth, int nSourceHeight, byte cbAlpha);

	// 乘积绘画
public:
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, int nXDest, int nYDest, CD3DColor D3DColor);
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, int nXDest, int nYDest, int nDestWidth, int nDestHeight, int nXSource, int nYSource, CD3DColor D3DColor);
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, int nXDest, int nYDest, int nDestWidth, int nDestHeight, int nXSource, int nYSource, int nSourceWidth, int nSourceHeight, CD3DColor D3DColor);

	// 变形绘画
public:
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, CPoint ptDest[4], CRect rcImage );
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, CPoint ptDest[4], CRect rcImage, byte cbAlpha);
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, CPoint ptDest[4], CRect rcImage, CD3DColor D3DColor);

	// 绘画公告板图片
public:
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, CD3DVector * pD3DVector, CD3DSize D3DSize );
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, CD3DVector * pD3DVector, CD3DSize D3DSize, byte cbAlpha );
	// 绘画图片
	bool DrawTexture( CD3DDevice * pD3DDevice, CD3DVector * pD3DVector, CD3DSize D3DSize, CD3DColor D3DColor );
	// 绘画图片
	bool DrawTexture( CD3DDevice * pD3DDevice, CD3DVector * pD3DVector, CD3DSize D3DSize, int nXSource, int nYSource, int nSourceWidth, int nSourceHeight, CD3DColor D3DColor );

	// 绘画空间图片
public:
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, CD3DMatrix * pD3DMatrix, CD3DSize D3DSize );
	// 绘画图片
	bool DrawTexture(CD3DDevice * pD3DDevice, CD3DMatrix * pD3DMatrix, CD3DSize D3DSize, byte cbAlpha );
	// 绘画图片
	bool DrawTexture( CD3DDevice * pD3DDevice, CD3DMatrix * pD3DMatrix, CD3DSize D3DSize, CD3DColor D3DColor );
	// 绘画图片
	bool DrawTexture( CD3DDevice * pD3DDevice, CD3DMatrix * pD3DMatrix, CD3DSize D3DSize, int nXSource, int nYSource, int nSourceWidth, int nSourceHeight, CD3DColor D3DColor );

	// 全局函数
public:
	// 丢失设备
	static void OnLostDevice();
	// 重置设备
	static void OnResetDevice();
};


////////////////////////////////////////////////////////////////////////////////// 

namespace_dex_end

////////////////////////////////////////////////////////////////////////////////// 

#endif