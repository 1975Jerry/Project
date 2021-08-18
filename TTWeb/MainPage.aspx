<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="TTWeb.MainPage" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


















<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title title="Main Page">
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <style type="text/css">
         html,body,form 
         {
             height: 100%;
             width: 100%;
             margin: 0px;
             padding: 0px;
             overflow: hidden;
         }
        .style3
        {
            width: 100%;
        }
        

       
     </style>
    <script type="text/javascript">
        window.onbeforeunload = function (e) {
            var cookies = document.cookie;
            var cookiearray = cookies.split(';');
            document.cookie = 'privateTT' + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';

            /*for (var i = 0; i < cookiearray.length; i++) {
                if (cookiearray[i].indexOf("privateTT") !== -1) {
                    var now = new Date();
                    now.setMonth(now.getMonth() - 1)
                    cookiearray[i] = "expires" + now.toUTCString() + ";";
                }
            }*/
        };


        function getClientHeight() 
        {
            var height = document.compatMode == 'CSS1Compat' && !window.opera ? document.documentElement.clientHeight : document.body.clientHeight;
        }

        function getClientWidth() 
        {
            var width = document.compatMode == 'CSS1Compat' && !window.opera ? document.documentElement.clientwidth : document.body.clientwidth;
        }

        function onLoad() 
        {
            window.onresize = alertSize
            alertSize();
            setInterval("callHome()", 60000);
        }

        function callHome()
        {
            keepalive.PerformCallback(MainMenu.cpUserName);
        }

        function alertSize() {
            var myWidth = 0, myHeight = 0;
            if (typeof (window.innerWidth) == 'number') {
                //Non-IE
                myWidth = window.innerWidth;
                myHeight = window.innerHeight;
            } else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
                //IE 6+ in 'standards compliant mode'
                myWidth = document.documentElement.clientWidth;
                myHeight = document.documentElement.clientHeight;
            } else if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
                //IE 4 compatible
                myWidth = document.body.clientWidth;
                myHeight = document.body.clientHeight;
            }
            //var element = document.getElementById('statusstrip');
            //element.height = '15px';
            element = document.getElementById('splitter');
            //if (myHeight > 16) 
            //{
                //element.height = myHeight - 16;
            //}
        }
    </script> 
</head>
<body onload="onLoad()" background="~\Images\back2.png" >
    <form id="form1" runat="server" style="background-image: ~/Images/back2.png">
            <dx:aspxsplitter ID="ASPxSplitter1" runat="server" 
                        ResizingMode="Live" ClientInstanceName="ASPxSplitter1" 
                        ClientIDMode="AutoID" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                        CssPostfix="Aqua" Width="100%" Height="100%" 
                        Orientation="Vertical" SeparatorVisible="False" PaneMinSize="" 
                        AllowResize="False" EnableTheming="True" Theme="Metropolis" 
                SeparatorSize="0px" ShowSeparatorImage="False" >
                
                    <panes>
                        <dx:SplitterPane  Name="MenuPane" AllowResize="False" AutoHeight="True" >
                            <Separators Visible="False"></Separators>
                            <Separator Visible="False"></Separator>
                            <PaneStyle BackgroundImage-ImageUrl="~/Images/back2.png">
                                <Paddings Padding="0px" />
                            <BackgroundImage ImageUrl="/~Images/back2.png"></BackgroundImage>
                                <Border BorderWidth="0px" />
                            </PaneStyle>
                            <ContentCollection>
                                <dx:SplitterContentControl ID="SplitterContentControl3" runat="server">
                        <table class="style3" cellpadding="0" cellspacing="0" 
                        
                                        style="border-style: solid solid none solid; border-width: 1px 1px 0px 1px; border-color: #CCCCCC;" 
                                        bgcolor="White">
                            <tr>
                                <td style="width: 100%; padding-top: 2px;" height="20">
                                <dx:ASPxImage ID="ASPxImage1" runat="server" 
                                        ImageUrl="~/Images/company_logo_small.jpg">
                                </dx:ASPxImage>
                                </td>
                                <td style="padding-top: 2px;">
                                    <dx:ASPxImage ID="ASPxImage4" runat="server" ImageUrl="~/Images/powered_by.jpg">
                                    </dx:ASPxImage>
                                </td>
                            </tr>
                        </table>
    
     <table class="style3" cellpadding="0" cellspacing="0" >
        <tr>
            <td style="width: 100%; padding-top: 4px;" >
                <dx:ASPxMenu ID="ASPxMainMenu" runat="server" ClientInstanceName="MainMenu" 
                    OnCustomJSProperties="ASPxMainMenu_CustomJSProperties" 
                    ItemAutoWidth="False" Theme="Metropolis" Width="100%" Height="20px" 
                    SeparatorWidth="0px" AllowSelectItem="True" ShowPopOutImages="True">
                    <RootItemSubMenuOffset X="10" FirstItemX="10" LastItemX="10" />
                    <BackgroundImage ImageUrl="~/Images/back2.png" />
                    <Border BorderWidth="0px" />
                </dx:ASPxMenu>
            </td>
        </tr>
    </table>
                         </dx:SplitterContentControl>
                            </ContentCollection>
                        </dx:SplitterPane>
                        <dx:SplitterPane Name="GridPane" ContentUrlIFrameName="GridPaneFrame" 
                            ScrollBars="Horizontal">
                             <Separators Visible="False"></Separators>
                             <Separator Visible="False"></Separator>
                             <PaneStyle>
                                 <Paddings Padding="0px" />
                                 <Border BorderWidth="0px" />
                             </PaneStyle>
                            <ContentCollection>
<dx:SplitterContentControl runat="server" SupportsDisabledAttribute="True">
</dx:SplitterContentControl>
</ContentCollection>
    </dx:SplitterPane>
        </panes>
<ClientSideEvents PaneResized="function(s, e) 
{
	
}"></ClientSideEvents>

                        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                            <HorizontalSeparator>
                            </HorizontalSeparator>
                            <Pane>
                                <BackgroundImage ImageUrl="~/Images/back2.png" />
                            </Pane>
                        </Styles>
                    <BackgroundImage ImageUrl="~/Images/back2.png" />
                    <Border BorderWidth="0px" />

        </dx:aspxsplitter>

            <dx:ASPxCallback ID="ASPxCallback1" runat="server" 
                ClientInstanceName="keepalive" oncallback="ASPxCallback1_Callback">
            </dx:ASPxCallback>
    </form>
</body>
</html>


