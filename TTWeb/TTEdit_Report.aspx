<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TTEdit_Report.aspx.cs" Inherits="TTWeb.TTEdit_Report" uiCulture="en" Culture="en-US" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>







<%@ Register assembly="DevExpress.XtraReports.v15.1.Web, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
        }
        .style2
        {}
        </style>
</head>
<body>
    <form id="formR" runat="server">
    <div>
    
        <dx:ASPxRoundPanel ID="ASPxRoundPanelR" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" 
            CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="Edit TT Report" 
            SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" 
            Width="100%" EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px">
            <ContentPaddings PaddingBottom="10px" PaddingLeft="9px" PaddingRight="11px" 
                PaddingTop="10px" />
            <HeaderStyle>
            <Paddings PaddingBottom="6px" PaddingLeft="9px" PaddingRight="11px" 
                PaddingTop="3px" />
            </HeaderStyle>
            <HeaderTemplate>
                <table style="width: 100%">
                    <tr>
                        <td width="100%" valign="middle" align="left">TT Report
                        </td>
                        
                    </tr>
                </table>
            </HeaderTemplate>
            <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <table class="style1">
        <tr>
            <td>
                <dx:ReportToolbar ID="TTEdit_ReportToolbar" runat="server" 
                    ClientIDMode="AutoID" ReportViewer="<%# TTEdit_ReportViewer %>" 
                    ShowDefaultButtons="False" Width="100%" BackColor="#F9F9F9" 
                    Font-Names="Tahoma" Font-Size="9pt" ItemSpacing="2px" SeparatorHeight="100%" 
                    SeparatorWidth="1px">
                    <Images SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                    </Images>
                    <Items>
                        <dx:ReportToolbarButton ItemKind="Search" />
                        <dx:ReportToolbarSeparator />
                        <dx:ReportToolbarButton ItemKind="PrintReport" />
                        <dx:ReportToolbarButton ItemKind="PrintPage" />
                        <dx:ReportToolbarSeparator />
                        <dx:ReportToolbarButton Enabled="False" ItemKind="FirstPage" />
                        <dx:ReportToolbarButton Enabled="False" ItemKind="PreviousPage" />
                        <dx:ReportToolbarLabel ItemKind="PageLabel" />
                        <dx:ReportToolbarComboBox ItemKind="PageNumber" Width="65px">
                        </dx:ReportToolbarComboBox>
                        <dx:ReportToolbarLabel ItemKind="OfLabel" />
                        <dx:ReportToolbarTextBox IsReadOnly="True" ItemKind="PageCount" Width="65px" />
                        <dx:ReportToolbarButton ItemKind="NextPage" />
                        <dx:ReportToolbarButton ItemKind="LastPage" />
                        <dx:ReportToolbarSeparator />
                        <dx:ReportToolbarButton ItemKind="SaveToDisk" />
                        <dx:ReportToolbarButton ItemKind="SaveToWindow" />
                        <dx:ReportToolbarComboBox ItemKind="SaveFormat" Width="70px">
                            <Elements>
                                <dx:ListElement Value="pdf" />
                                <dx:ListElement Value="xls" />
                                <dx:ListElement Value="xlsx" />
                                <dx:ListElement Value="rtf" />
                                <dx:ListElement Value="mht" />
                                <dx:ListElement Value="html" />
                                <dx:ListElement Value="txt" />
                                <dx:ListElement Value="csv" />
                                <dx:ListElement Value="png" />
                            </Elements>
                        </dx:ReportToolbarComboBox>
                    </Items>
                    <Styles CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" 
                        CssPostfix="SoftOrange">
                        <LabelStyle ForeColor="Black">
                        <Margins MarginLeft="3px" MarginRight="3px" />
                        </LabelStyle>
                        <ComboBoxStyle>
                            <Margins MarginLeft="3px" MarginRight="3px" />
                        </ComboBoxStyle>
                        <TextBoxStyle>
                        <Margins MarginLeft="2px" MarginRight="2px" />
                        </TextBoxStyle>
                        <ButtonStyle HorizontalAlign="Center" VerticalAlign="Middle">
                        </ButtonStyle>
                    </Styles>
                </dx:ReportToolbar>
                <dx:ReportViewer ID="TTEdit_ReportViewer" runat="server" ClientIDMode="AutoID" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    LoadingPanelText="" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                    <LoadingPanelImage Url="~/App_Themes/SoftOrange/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <LoadingPanelStyle ForeColor="#303030">
                    </LoadingPanelStyle>
                </dx:ReportViewer>
            </td>
        </tr>
        </table>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <div>
    
    </div>
    </form>
</body>
</html>
