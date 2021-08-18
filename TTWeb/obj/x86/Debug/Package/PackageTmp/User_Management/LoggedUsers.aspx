﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoggedUsers.aspx.cs" Inherits="TTWeb.LoggedUsers" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                        <td width="50%" valign="middle" align="left">Logged Users
                        </td>
                        <td width="50%" valign="middle" align="right">
                            <dx:ASPxHyperLink ID="ASPxHyperLinkRefreshButton" runat="server" Text="Refresh" 
                                   ClientIDMode="AutoID" Cursor="pointer">
                                   <ClientSideEvents Click="function(s, e) {
	window.pagegrid.Refresh();
}" />
                               </dx:ASPxHyperLink>
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <dx:ASPxGridView ID="ASPxGridViewLoggedUsers" runat="server" 
        ClientIDMode="AutoID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" Width="100%" AutoGenerateColumns="False" 
        KeyFieldName="SessionId" Theme="Metropolis">
        <ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}" />
        <Columns>
            <dx:GridViewDataTimeEditColumn Caption="Login Time" FieldName="LoginTime" 
                Name="LoginTime" ShowInCustomizationForm="True" VisibleIndex="0" 
                Width="20%">
                <PropertiesTimeEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                </PropertiesTimeEdit>
            </dx:GridViewDataTimeEditColumn>
            <dx:GridViewDataTextColumn Caption="User Name" FieldName="UserName" 
                Name="UserName" ShowInCustomizationForm="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Session Id" FieldName="SessionId" 
                Name="SessionId" ShowInCustomizationForm="True" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle ForeColor="#999999">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Ip Address" FieldName="IpAddress" 
                Name="IpAddress" ShowInCustomizationForm="True" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle ForeColor="#999999">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Browser" FieldName="Browser" 
                ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior ColumnResizeMode="NextColumn" AllowFocusedRow="True" />
        <SettingsPager ShowDefaultImages="False" PageSize="20" AlwaysShowPager="True">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;">
            </NextPageButton>
            <PrevPageButton Text="&lt; Prev">
            </PrevPageButton>
            <PageSizeItemSettings Visible="True">
            </PageSizeItemSettings>
        </SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFilterRowMenu="True" 
            ShowFilterBar="Visible" />
        <SettingsCookies Enabled="True" />

        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue">
            <Header ImageSpacing="10px" SortingImageSpacing="10px" BackColor="#0066CC" 
                ForeColor="White">
            </Header>
            <Row BackColor="#FCFCFC">
            </Row>
            <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
            <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
            </FocusedRow>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    </form>
</body>
</html>
