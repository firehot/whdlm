#pragma once

//////////////////////////////////////////////////////////////////////////////////

#ifndef VC_EXTRALEAN
#define VC_EXTRALEAN
#endif

#ifndef WINVER
#define WINVER 0x0501
#endif

#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0501
#endif

#ifndef _WIN32_WINDOWS
#define _WIN32_WINDOWS 0x0510
#endif

#ifndef _WIN32_IE
#define _WIN32_IE 0x0500
#endif

#define _ATL_ATTRIBUTES
#define _AFX_ALL_WARNINGS
#define _ATL_CSTRING_EXPLICIT_CONSTRUCTORS

//////////////////////////////////////////////////////////////////////////////////

//MFC ?ļ?
#include <AfxWin.h>
#include <AfxExt.h>
#include <AfxCmn.h>
#include <AfxDisp.h>

//?????ļ?
#include "Other\SkinSB.h"
#include "Other\Detours.h"

//ͼƬ?ؼ?
#import "ImageOle.dll" named_guids

//////////////////////////////////////////////////////////////////////////////////
//???Ӵ???

#pragma comment (lib,"Other/SkinSB.lib")
#pragma comment (lib,"Other/Detours.lib")

#ifndef _DEBUG
#ifndef _UNICODE
	#pragma comment (lib,"../../???ӿ?/Ansi/WHImage.lib")
	#pragma comment (lib,"../../???ӿ?/Ansi/ServiceCore.lib")
	#pragma comment (lib,"../../???ӿ?/Ansi/FGuilib.lib")
	#pragma comment (lib,"../../???ӿ?/Ansi/FGuimfcFactory.lib")
#else
	#pragma comment (lib,"../../???ӿ?/Unicode/WHImage.lib")
	#pragma comment (lib,"../../???ӿ?/Unicode/ServiceCore.lib")
	#pragma comment (lib,"../../???ӿ?/Unicode/FGuilib.lib")
	#pragma comment (lib,"../../???ӿ?/Unicode/FGuimfcFactory.lib")
#endif
#else
#ifndef _UNICODE
	#pragma comment (lib,"../../???ӿ?/Ansi/WHImageD.lib")
	#pragma comment (lib,"../../???ӿ?/Ansi/ServiceCoreD.lib")
	#pragma comment (lib,"../../???ӿ?/Ansi/FGuilibD.lib")
	#pragma comment (lib,"../../???ӿ?/Ansi/FGuimfcFactoryD.lib")
#else
	#pragma comment (lib,"../../???ӿ?/Unicode/WHImageD.lib")
	#pragma comment (lib,"../../???ӿ?/Unicode/ServiceCoreD.lib")
	#pragma comment (lib,"../../???ӿ?/Unicode/FGuilibD.lib")
	#pragma comment (lib,"../../???ӿ?/Unicode/FGuimfcFactoryD.lib")
#endif
#endif

//////////////////////////////////////////////////////////////////////////////////
