package org.cocos2dx.utils;

public class ConstDefine 
{
	/** Handler消息定义 **/
	//开始进行图片选择
	public static final int MSG_START_PICKIMG = 1;
	//图片选择处理结束
	public static final int MSG_CLIPIMG_END = 2;
	//图片选择结束
	public static final int MSG_PICKIMG_END = 3;
	//开始图片选择(不裁剪)
	public static final int MSG_START_PICKIMG_NOCLIP = 4;
	//第三方平台配置
	public static final int MSG_CONFIG_PARTY = 5;
	//分享配置
	public static final int MSG_SHARE_CONFIG = 6;	
	//第三方支付
	public static final int MSG_THIRD_PAY = 7;
	//第三方登陆
	public static final int MSG_THIRD_LOGIN = 8;
	//分享
	public static final int MSG_SOCIAL_SHARE = 9;
	//自定义分享
	public static final int MSG_SOCIAL_CUSCHARE = 10;
	//分享到指定平台
	public static final int MSG_SOCIAL_TARGETSHARE = 12;
	//竣付通获取支付列表
	public static final int MSG_JFT_PAYLIST = 13;
	//发起定位请求
	public static final int MSG_LOCATION_REQ = 14;
	// 发起通讯录请求
	public static final int MSG_CONTACT_REQ = 15;
	// 启动浏览器
	public static final int MSG_OPEN_BROWSER = 16;
	// 复制剪贴板
	public static final int MSG_COPY_CLIPBOARD = 17;
	// 删除授权
	public static final int MSG_DEL_AUTHOR = 18;
	// 获取复制内容
	public static final int MSG_GET_COPYDATA = 19;
	// toast消息
	public static final int MSG_NATIVE_TOAST = 20;
	// 拨号
	public static final int MSG_SYSTEM_CALL = 21;
	
	public static final int MSG_OPEN_BROWSER_POST = 25;
	
	public static final int MSG_RECOGNIZE_QRCODE =26 ;
	/** ActivityResult 定义**/
	//进入图库选择图片
	public static final int RES_PICKIMG_END = 1000;
	//图片裁剪
	public static final int RES_CLIPEIMG_END = 1001;
	//图片选择结束(不裁剪)
	public static final int RES_PICKIMG_END_NOCLIP = 1002;
	// 通讯录数据选择结束
	public static final int RES_PICKCONTACK_END = 1003;

	//网络类型
	public static final int NETWORKTYPE_NONE = 0;
	public static final int NETWORKTYPE_4G   = 1;
	public static final int NETWORKTYPE_WIFI = 2;
	public static final int NETWORKTYPE_2G   = 3;

	//信号强度
	public static final int MSG_WIFI_STATUS_STRONG = 22;
	public static final int MSG_WIFI_STATUS_SOSO = 23;
	public static final int MSG_WIFI_STATUS_WEAK = 24;
}
