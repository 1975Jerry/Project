<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordExpiration.aspx.cs" Inherits="TTWeb.PasswordExpiration" %>
<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .automargin 
        {
            position: fixed; 
            left: 35%; 
            top: 30%; 
            width: 35%
        } 

        .style2
        {}

        .style3
        {
            width: 100%;
        }

        .style4
        {
            color: #003399;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server" target="_parent">
    <div class ="automargin">
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" align="center" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
            CssPostfix="Aqua" HeaderText="TBSP Task Management System" 
            Width="70%" 
            GroupBoxCaptionOffsetY="-28px" 
            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Font-Size="Small" 
            CssClass="style2" Theme="Metropolis">
            <ContentPaddings Padding="14px" />
            <HeaderStyle Font-Size="Medium">
            </HeaderStyle>
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                    <table align="center" width="250">
                        <tr>
                            <td align="center" height="50px" 
                                style="font-size: small; width: 200px; text-align: left;" width="100" 
                                class="style4" colspan="2">
                                Your password has been expired. Please change it:</td>
                        </tr>
                        <tr>
                            <td align="center" height="50px" style="font-size: small" width="100">
                                Old Password</td>
                            <td width="100">
                                <dx:ASPxTextBox ID="PasswordOld" runat="server" ClientIDMode="AutoID" 
                                    CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css" CssPostfix="BlackGlass" 
                                    Font-Size="Small" Height="26px" Password="True" 
                                    SpriteCssFilePath="~/App_Themes/BlackGlass/{0}/sprite.css" Width="150px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text">
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" height="50px" style="font-size: small" width="100">
                                New Password</td>
                            <td width="100">
                                <dx:ASPxTextBox ID="PasswordNew" runat="server" ClientIDMode="AutoID" 
                                    CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css" CssPostfix="BlackGlass" 
                                    Font-Size="Small" Height="26px" Password="True" 
                                    SpriteCssFilePath="~/App_Themes/BlackGlass/{0}/sprite.css" Width="150px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text">
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" height="50px" style="font-size: small" width="100">
                                Confirm New Password</td>
                            <td width="100">
                                <dx:ASPxTextBox ID="PasswordNewConfirm" runat="server" ClientIDMode="AutoID" 
                                    CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css" CssPostfix="BlackGlass" 
                                    Font-Size="Small" Height="26px" Password="True" 
                                    SpriteCssFilePath="~/App_Themes/BlackGlass/{0}/sprite.css" Width="150px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text">
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <dx:ASPxLabel ID="ASPxlabelErrorText" runat="server" ClientIDMode="AutoID" 
                                    CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css" CssPostfix="BlackGlass" 
                                    Width="100%" Font-Size="Small" ForeColor="Red" >
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                
                                <dx:ASPxButton ID="ASPxButtonLogIn" runat="server" ClientIDMode="AutoID" 
                                    CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" CssPostfix="Office2010Blue" 
                                    Font-Bold="False" Height="30px" OnClick="ASPxButtonLogIn_Click" 
                                    SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" Text="Change Password" 
                                    Width="100%" Theme="Metropolis">
                                    <Border BorderColor="#00CC99" BorderWidth="1px" />
                                </dx:ASPxButton>
                                
                            </td>
                        </tr>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <table class="style3">
        <tr>
            <td>
                <dx:ASPxImage ID="ASPxImage1" runat="server" 
                    ImageUrl="~/Images/company_logo_medium.jpg">
                </dx:ASPxImage>
            </td>
            <td style="text-align: right">
                <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/Images/powered_by.jpg">
                </dx:ASPxImage>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
