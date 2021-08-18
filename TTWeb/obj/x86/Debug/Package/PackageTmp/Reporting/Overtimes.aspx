<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Overtimes.aspx.cs" Inherits="TTWeb.Overtimes" uiCulture="en" Culture="en-US" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>







<%@ Register assembly="DevExpress.XtraReports.v15.1.Web, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

       

        .style1
        {
            text-align: center;
        }
        .style3
        {
            color: #000066;
        }

       

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
                        <td width="100%" valign="middle" align="left">Management Report Tickets Summary Report
                        </td>
                        
                    </tr>
                </table>
            </HeaderTemplate>
            <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">


    <table >
        <tr>
            <td>
                 &nbsp;</td>

            <td>
                &nbsp;</td>
            <td>
                 <dx:ReportToolbar ID="ReportToolbar1" runat="server" BackColor="#F9F9F9" 
                     ClientIDMode="AutoID" Font-Names="Tahoma" Font-Size="9pt" ItemSpacing="2px" 
                     ReportViewer="<%# ReportViewer1 %>" SeparatorHeight="100%" SeparatorWidth="1px" 
                     ShowDefaultButtons="False" Width="650px">
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
            </td>

        </tr>
        <tr>
            <td bgcolor="#F9F9F9" colspan="2" valign="top">
                <table class="dxflInternalEditorTable_SoftOrange">
                    <tr>
                        <td class="style3" colspan="2" style="padding-bottom: 10px">
                            Please select:</td>
                    </tr>
                    <tr>
                        <td class="style3" style="text-align: right; padding-bottom: 5px">
                            From:
                        </td>
                        <td style="padding-bottom: 5px">
                            <dx:ASPxDateEdit ID="FromDay" runat="server" DisplayFormatString="dd/MM/yyyy" 
                                EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableTheming="True" 
                                OnInit="FromDay_Init" Theme="SoftOrange" Width="100px" Font-Size="8pt">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" style="text-align: right; padding-bottom: 10px">
                            To:</td>
                        <td class="style3" style="text-align: right; padding-bottom: 10px">
                            <dx:ASPxDateEdit ID="ToDay" runat="server" DisplayFormatString="dd/MM/yyyy" 
                                EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableTheming="True" 
                                OnInit="ToDay_Init" Theme="SoftOrange" Width="100px" Font-Size="8pt">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" style="text-align: left; padding-bottom: 10px" colspan="2">
                            Users:</td>
                    </tr>
                    <tr>
                        <td class="style3" style="text-align: right; padding-bottom: 10px" colspan="2">
                            <dx:ASPxComboBox ID="ASPxComboBoxUsers" runat="server" Font-Size="8pt" 
                                OnInit="ASPxComboBoxUsers_Init" SelectedIndex="0" style="font-size: 8pt" 
                                Width="130px">
                                <Items>
                                    <dx:ListEditItem Selected="True" Text="All" Value="All" />
                                </Items>
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <dx:ASPxButton ID="Refresh" runat="server" AutoPostBack="False" 
                                ClientIDMode="AutoID" CssClass="style1" 
                                CssFilePath="~/App_Themes/Office2010Silver/{0}/styles.css" 
                                CssPostfix="Office2010Silver" OnClick="Refresh_Click" 
                                SpriteCssFilePath="~/App_Themes/Office2010Silver/{0}/sprite.css" Text="Refresh" 
                                UseSubmitBehavior="False" Width="100%">
                                <Border BorderColor="#F0653A" />
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>

            </td>
            <td bgcolor="White">
                <dx:ReportViewer ID="ReportViewer1" runat="server" ClientIDMode="AutoID" 
                    Theme="DevEx">
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
