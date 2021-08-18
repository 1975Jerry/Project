<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NWHConfig.aspx.cs" Inherits="TTWeb.NWHConfig" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            text-align: right;
            color: #800000;
        }
        .style2
        {
            color: #800000;
            text-align: right;
            font-size: 8pt;
        }
        .style3
        {
            font-size: 8pt;
            color: #993333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" 
            SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" 
            Width="100%" EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px" 
            HeaderText="Logged Users" Theme="Metropolis">
            <ContentPaddings PaddingBottom="10px" PaddingLeft="9px" PaddingRight="11px" 
                PaddingTop="10px" />
            <HeaderStyle Font-Size="Small">
            <Paddings PaddingBottom="6px" PaddingLeft="9px" PaddingRight="11px" 
                PaddingTop="3px" />
            </HeaderStyle>
            <HeaderTemplate>
                <table style="width: 100%">
                    <tr>
                        <td width="50%" valign="middle" align="left">Non-Working Hours Configuration
                        </td>
                        <td width="50%" valign="middle" align="right">
                            
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <table class="dxflInternalEditorTable_Metropolis">
                    <tr>
                        <td class="style1" width="150">
                            &nbsp;</td>
                        <td style="text-align: right">
                            <dx:ASPxImage ID="ASPxImage1" runat="server" Height="32px" 
                                ImageUrl="~/Images/Clock.png">
                            </dx:ASPxImage>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" valign="middle">
                            * Start Time (HH:mm):</td>

                        <td valign="middle">
                            <dx:ASPxTextBox ID="ASPxTextBoxFrom" runat="server" Font-Size="8pt" 
                                MaxLength="5" Theme="Aqua" Width="120px">
                                <MaskSettings Mask="HH:mm" />
                            </dx:ASPxTextBox>
                            </td>

                    </tr>

                    <tr>
                        <td class="style2" valign="middle">
                            * End Time (HH:mm):</td>

                    <td valign="middle">
                        <dx:ASPxTextBox ID="ASPxTextBoxTo" runat="server" Font-Size="8pt" MaxLength="5" 
                            Theme="Aqua" Width="120px">
                            <MaskSettings Mask="HH:mm" />
                        </dx:ASPxTextBox>
                    </td>
                    </tr>
                    <tr>
                        <td class="style2" style="padding-top: 20px">
                            &nbsp;</td>
                        <td style="padding-top: 20px">
                            <dx:ASPxButton ID="ASPxButton1" runat="server" Font-Size="8pt" Text="Save" 
                                Theme="Metropolis" Width="120px" OnClick="ASPxButton1_Click">
                            </dx:ASPxButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="padding-top: 20px">
                            &nbsp;</td>
                        <td class="style3" style="padding-top: 20px">
                            * 24h clock format</td>
                    </tr>
                </table>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    </form>
</body>
</html>
