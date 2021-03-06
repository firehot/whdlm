//分享樱花草、的酷,群:16886186，联系QQ:412069412
#include "Stdafx.h"
#include "AfxDllx.h"
#include "WHSocketHead.h"

//////////////////////////////////////////////////////////////////////////////////

//静态变量
static AFX_EXTENSION_MODULE WHSocketDLL={NULL,NULL};

//////////////////////////////////////////////////////////////////////////////////

//DLL 主函数
extern "C" INT APIENTRY DllMain(HINSTANCE hInstance, DWORD dwReason, LPVOID lpReserved)
{
	UNREFERENCED_PARAMETER(lpReserved);

	if (dwReason==DLL_PROCESS_ATTACH)
	{
		if (!AfxInitExtensionModule(WHSocketDLL, hInstance)) return 0;
		new CDynLinkLibrary(WHSocketDLL);

		//配置网络
		WSADATA WSAData;
		if(WSAStartup(MAKEWORD(2,2),&WSAData)!=0) return 0;
	}
	else if (dwReason==DLL_PROCESS_DETACH)
	{
		AfxTermExtensionModule(WHSocketDLL);

		//清理网络
		WSACleanup();
	}

	return 1;
}

//////////////////////////////////////////////////////////////////////////////////