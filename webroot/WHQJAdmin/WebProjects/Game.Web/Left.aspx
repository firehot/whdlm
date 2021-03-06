<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Left.aspx.cs" Inherits="Game.Web.Left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/layout.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="scripts/web-storage-cache.min.js"></script>
    <script type="text/javascript">
        var arrObj = {},wsCache;

        function InitMenu() {
            var selector = document.getElementsByTagName("td");
            for (var i = 0; i < selector.length; i++) {
                var td = selector[i];
                if (td.id.indexOf('M_') > -1) {
                    arrObj[td.id] = true;
                }
            }
            wsCache = new WebStorageCache();
            if (wsCache.isSupported()) {
                var menuCache = wsCache.get("menu_cache") || arrObj;
                Object.keys(menuCache).forEach(function (obj) {
                    if (!menuCache[obj]) {
                        ShowHide(document.getElementById(obj));
                    }
                });
            }
        }

        function ShowHide(obj) {
            var oStyle = obj.style;
            var imgId = obj.id.replace("M", "S");
            oStyle.display === "none" ? oStyle.display = "block" : oStyle.display = "none";
            oStyle.display === "none"
                ? document.getElementById(imgId).src = "/images/arrBig1.gif"
                : document.getElementById(imgId).src = "images/arrBig.gif";
            arrObj[obj.id] = oStyle.display !== "none";
            if (wsCache) {
                wsCache.set("menu_cache", arrObj);
            }
        }

        function GetUrl(obj, url) {
            //加入一个随机防止OPEN的缓存
            var vNum = Math.random();
            vNum = Math.round(vNum * 1000);
            if (url.valueOf("?") > 0) {
                url = url + "&" + vNum;
            } else {
                url = url + "?" + vNum;
            }
            window.open(url, "frm_main_content");
            var trList = document.getElementsByTagName("tr");
            for (var i = 0; i < trList.length; i++) {
                if (trList[i].className === "linkBg") {
                    trList[i].className = "s";
                }
            }
            obj.className = "linkBg";
        }
    </script>
</head>
<body style="background-image: url(/images/sideBg.gif); background-repeat: repeat-y;" onload="InitMenu();">
<asp:Repeater ID="LeftMenu" runat="server" OnItemDataBound="LeftMenu_ItemDataBound">
    <ItemTemplate>
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td class="hui f14 bold pd32 hand" height="30" onclick="ShowHide(M_<%# Eval("ModuleID") %>);">
                    <img src="/images/arrBig.gif" width="11" height="11" id="S_<%# Eval("ModuleID") %>" alt="<%# Eval("Title") %>"/> <%# Eval("Title") %>
                </td>
            </tr>
            <tr>
                <td id="M_<%# Eval("ModuleID") %>">
                    <table width="93%" border="0" align="right" cellpadding="0" cellspacing="0" class="hui">
                        <asp:Repeater ID="LeftMenu_Sub" runat="server">
                            <ItemTemplate>
                                <tr class="s" onclick="GetUrl(this, '<%# Eval("Link") %>')">
                                    <td width="313" height="25" align="right"></td>
                                    <td width="67" height="25">
                                        <img src="/images/arrSmall.gif" width="8" height="7" alt=""/>
                                    </td>
                                    <td width="725" height="25" align="left"><%# Eval("Title") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:Repeater>
</body>
</html>