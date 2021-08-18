﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StandByList.aspx.cs" Inherits="TTWeb.StandByList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>





<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
        CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" CssPostfix="Office2010Blue" 
        GroupBoxCaptionOffsetY="-19px" 
        SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" 
        Width="100%" ClientInstanceName="ASPxRoundPanel" HeaderText="Stand by list" 
        EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px">
        
        <ContentPaddings PaddingBottom="10px" PaddingLeft="9px" PaddingRight="11px" 
            PaddingTop="10px" />
        <HeaderStyle>
        <Paddings PaddingBottom="6px" PaddingLeft="9px" PaddingRight="11px" 
            PaddingTop="3px" />
        </HeaderStyle>
        <HeaderTemplate>
                <table style="width: 100%">
                    <tr>
                        <td width="50%" valign="middle" align="left">Stand by list
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
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True" >
            <div id="RoundPanelDiv" style="height: 100%">
                <table class="style1">
                    <tr>
                        <td colspan="2">
                            <dx:ASPxGridView ID="ASPxGridViewStandByList" runat="server" 
                                ClientIDMode="AutoID" ClientInstanceName="ASPxGridViewStandByList" 
                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                                CssPostfix="PlasticBlue" Width="100%" AutoGenerateColumns="False" 
                                KeyFieldName="Team" 
                                
                                EnableViewState="False">
                                <ClientSideEvents EndCallback="function(s, e) {
                                                            }" Init="function(s, e) {
	window.pagegrid = s;
}"/>
                                <Columns>
                                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="0px" ShowCancelButton="True" ShowUpdateButton="True" ShowClearFilterButton="True"/>
                                    <dx:GridViewDataTextColumn Caption="Team" FieldName="Team" Name="Team" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="User Name" FieldName="User_name" 
                                        Name="User_name" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Phone" FieldName="Phone" 
                                        Name="Phone" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Mobile" FieldName="Mobile" 
                                        Name="Mobile" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Email" FieldName="Email" Name="Email" 
                                        ShowInCustomizationForm="True" VisibleIndex="5">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Updated on" FieldName="Updated_on" Name="Updated_on" 
                                        ShowInCustomizationForm="True" VisibleIndex="6">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="#999999">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataCheckColumn Caption="Valid User" FieldName="Valid_user" 
                                        Name="Valid_user" ShowInCustomizationForm="True" VisibleIndex="8" 
                                        Width="10%" Visible="False">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataCheckColumn>
                                </Columns>
                                <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" 
                                    AllowFocusedRow="True" />
                                <SettingsPager PageSize="20" ShowDefaultImages="False" AlwaysShowPager="True">
                                    <AllButton Text="All">
                                    </AllButton>
                                    <NextPageButton Text="Next &gt;">
                                    </NextPageButton>
                                    <PrevPageButton Text="&lt; Prev">
                                    </PrevPageButton>
                                    <PageSizeItemSettings Visible="True">
                                    </PageSizeItemSettings>
                                </SettingsPager>
                                <SettingsEditing Mode="EditForm" />
                                <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterRowMenu="True" 
                                    ShowFilterBar="Visible" />
                                <SettingsCookies Enabled="True" Version="1" />

                                <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                                    CssPostfix="PlasticBlue">
                                    <Header ImageSpacing="10px" SortingImageSpacing="10px">
                                    </Header>
                                    <FocusedGroupRow Font-Bold="True">
                                    </FocusedGroupRow>
                                    <Row BackColor="#FCFCFC">
                                    </Row>
                                    <FocusedRow BackColor="#FCF9DF" ForeColor="Black"                                
                                        Font-Bold="False">
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
                        </td>
                    </tr>

                </table>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
   </form>
</body>
</html>
