﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="TTWeb.User_Management.Users" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>










<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style23
        {
            color: #999999;
            text-align: left;
            font-size: 9pt;
        }
        .style24
        {
            text-align: right;
            color: #666666;
        }
        .style22
        {
            color: #993300;
        }
        .style25
        {
            text-align: right;
            color: #993300;
            font-size: 7pt;
        }
        .style27
        {
            color: #999999;
            text-align: right;
            font-size: 8pt;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" 
        ClientIDMode="AutoID" CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" 
        CssPostfix="Office2010Blue" 
        GroupBoxCaptionOffsetY="-19px" 
        SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" 
        HeaderText="Users" EnableDefaultAppearance="False" 
            GroupBoxCaptionOffsetX="6px" Cursor="default" Theme="Metropolis">
        <ContentPaddings PaddingBottom="10px" PaddingLeft="9px" PaddingRight="11px" 
                PaddingTop="10px" />
            <HeaderStyle Font-Size="Small">
            <Paddings PaddingBottom="6px" PaddingLeft="9px" PaddingRight="11px" 
                PaddingTop="3px" />
            </HeaderStyle>
            <HeaderTemplate>
                <table style="width: 100%">
                    <tr>
                        <td width="100%" valign="middle" align="left">Users Management [> Teams] [> Roles]
                        </td>
                        
                    </tr>
                </table>
            </HeaderTemplate>
        <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <table class="style1">
        <tr>
            <td>
                <div>
                    
                    <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px;" 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenu1" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%" OnLoad="ASPxMenu1_Load">
                                <ClientSideEvents ItemClick="function(s, e) {
	userlistgrid.AddNewRow()

		
}" />
                                <Items>
                                    <dx:MenuItem Name="NewUser" Text="New User">
                                        <Image AlternateText="New" Height="10px" Url="~/Images/Add.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
                                <ItemStyle>
                                <Paddings PaddingRight="0px" />
                                </ItemStyle>
                                <BorderRight BorderWidth="0px" />
                            </dx:ASPxMenu>
                        </td>
                        <td style="border-left-width: 0px; padding-left: 0px; margin-left: 0px;">
                            <dx:ASPxMenu ID="ASPxMenu2" runat="server" EnableTheming="True" 
                                ItemAutoWidth="False" RightToLeft="False" Theme="Metropolis" Width="100%">
                                <ClientSideEvents ItemClick="function(s, e) {
	window.pagegrid.Refresh();
}" />
                                <Items>
                                    <dx:MenuItem Name="Refresh" Text="Refresh">
                                        <Image Height="10px" Url="~/Images/Refresh.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
                                <ItemStyle HorizontalAlign="Right">
                                <Paddings PaddingLeft="0px" />
                                </ItemStyle>
                                <BorderLeft BorderWidth="0px" />
                            </dx:ASPxMenu>
                        </td>
                    </tr>
                </table>


                    <dx:ASPxGridView ID="ASPxGridViewUserList" runat="server" AutoGenerateColumns="False"
                        ClientIDMode="AutoID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
                        CssPostfix="PlasticBlue" KeyFieldName="Hidden_user_id" Width="100%"
                        OnInitNewRow="ASPxGridViewUserList_InitNewRow" ClientInstanceName="userlistgrid"
                        OnRowDeleting="ASPxGridViewUserList_RowDeleting" 
                        OnCustomJSProperties="ASPxGridViewUserList_CustomJSProperties" 
                        OnRowInserting="ASPxGridViewUserList_RowInserting" 
                        EnableViewState="False" 
                        OnDetailRowExpandedChanged="ASPxGridViewUserList_DetailRowExpandedChanged" 
                        OnRowUpdating="ASPxGridViewUserList_RowUpdating" 
                        OnHtmlEditFormCreated="ASPxGridViewUserList_HtmlEditFormCreated" 
                        OnStartRowEditing="ASPxGridViewUserList_StartRowEditing" 
                        Theme="Metropolis" >
                        <SettingsEditing Mode="EditFormAndDisplayRow" EditFormColumnCount="2"></SettingsEditing>
                        <SettingsDetail ShowDetailRow="True"></SettingsDetail>
                        <ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}" />
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="50px" ButtonType="Image" Name="EditButtons" ShowEditButton="True" ShowDeleteButton="True" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn Caption="User Name" FieldName="User_name" Name="User_name"
                                ShowInCustomizationForm="True" VisibleIndex="1" Width="35%">
                                <Settings AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="Created on" FieldName="Created_on" 
                                Name="Created_on" ShowInCustomizationForm="True" VisibleIndex="5">
                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                </PropertiesDateEdit>
                                <CellStyle ForeColor="#999999">
                                </CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="Roles" FieldName="Roles" Name="Roles" 
                                ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                <Settings AllowSort="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Teams" FieldName="Teams" Name="Teams" 
                                ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                <Settings AllowSort="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn Caption="Valid User" FieldName="Valid_user" 
                                Name="Valid_user" ShowInCustomizationForm="True" VisibleIndex="4" 
                                Width="70px">
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataTextColumn Caption="Hidden_user_id" FieldName="Hidden_user_id" 
                                Name="Hidden_user_id" ShowInCustomizationForm="True"
                                VisibleIndex="7" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="Last login" FieldName="Last_login" 
                                Name="Last_login" ReadOnly="True" ShowInCustomizationForm="True" 
                                UnboundType="DateTime" VisibleIndex="6">
                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                </PropertiesDateEdit>
                                <CellStyle ForeColor="#999999">
                                </CellStyle>
                            </dx:GridViewDataDateColumn>
                        </Columns>
                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" 
                            AllowFocusedRow="True" />
                        <SettingsPager PageSize="20" ShowDefaultImages="False">
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
                        <SettingsCookies Enabled="True" StoreColumnsWidth="False" Version="16" 
                            StoreColumnsVisiblePosition="False" />
                        <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />

                        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                            CssPostfix="PlasticBlue">
                            <Header ImageSpacing="10px" SortingImageSpacing="10px" BackColor="#0066CC" 
                                ForeColor="White">
                            </Header>
                            <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                            <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                            </FocusedRow>
                            <CommandColumnItem>
                                <Paddings PaddingLeft="3px" />
                            </CommandColumnItem>
                        </Styles>
                        <StylesEditors>
                            <CalendarHeader Spacing="11px">
                            </CalendarHeader>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <Templates>
                            <DetailRow>
                                <div>
                                    <dx:ASPxPageControl ID="ASPxPageControlUsers" runat="server" ActiveTabIndex="0" 
                                        ClientIDMode="AutoID" CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                        CssPostfix="Office2003Blue" Width="100%" 
                                        EnableCallBacks="True" Theme="PlasticBlue">
                                        <TabPages>
                                            <dx:TabPage Text="Details">
                                                <ContentCollection>
                                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                        <table class="style1" 
                                                            style="border-top-width: 1px; border-right-width: 2px; border-top-style: solid; border-right-style: solid; border-color: #000080">
                                                            <tr>
                                                                <td width="100px" class="style24">
                                                                    &nbsp;User Name:</td>
                                                                <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 10px; padding-top: 10px;">
                                                                    <dx:ASPxTextBox ID="ASPxTextBoxUserName" runat="server" MaxLength="60" 
                                                                        Text='<%# Bind("User_name") %>' Width="200px" style="font-weight: 700" 
                                                                        ReadOnly="True">
                                                                        <ValidationSettings>
                                                                            <RequiredField IsRequired="True" />
                                                                            <RequiredField IsRequired="True" />
                                                                        </ValidationSettings>
                                                                        <Border BorderColor="#3399FF" />
                                                                        <Border BorderColor="#3399FF" />
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                                <td colspan="2" rowspan="3" style="text-align: center">
                                                                    <dx:ASPxImage ID="ASPxImageUser" runat="server" ImageUrl="~/Images/Users.png" 
                                                                        IsPng="True">
                                                                    </dx:ASPxImage>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style24" style="padding-bottom: 5px">
                                                                    &nbsp;Login Name:</td>
                                                                <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                                    <dx:ASPxTextBox ID="ASPxTextBoxLoginName" runat="server" MaxLength="10" 
                                                                        Text='<%# Bind("Login") %>' Width="150px" ReadOnly="True">
                                                                        <ValidationSettings>
                                                                            <RequiredField IsRequired="True" />
                                                                            <RequiredField IsRequired="True" />
                                                                        </ValidationSettings>
                                                                        <Border BorderColor="#3399FF" />
                                                                        <Border BorderColor="#3399FF" />
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style24" style="padding-bottom: 5px">
                                                                    &nbsp;Password:</td>
                                                                <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                                    <dx:ASPxTextBox ID="ASPxTextBoxPassword" runat="server" MaxLength="10" 
                                                                        Text='<%# Bind("Password") %>' Width="150px" ReadOnly="True">
                                                                        <ValidationSettings>
                                                                            <RequiredField IsRequired="True" />
                                                                            <RequiredField IsRequired="True" />
                                                                        </ValidationSettings>
                                                                        <Border BorderColor="#3399FF" />
                                                                        <Border BorderColor="#3399FF" />
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style24" style="padding-bottom: 5px">
                                                                    &nbsp;Phone:</td>
                                                                <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                                    <dx:ASPxTextBox ID="ASPxTextBoxPhone" runat="server" MaxLength="50" 
                                                                        Text='<%# Bind("Phone") %>' Width="170px" ReadOnly="True">
                                                                        <ValidationSettings>
                                                                            <RequiredField IsRequired="True" />
                                                                            <RequiredField IsRequired="True" />
                                                                        </ValidationSettings>
                                                                        <Border BorderColor="#3399FF" />
                                                                        <Border BorderColor="#3399FF" />
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                                <td class="style23" width="100px">
                                                                    &nbsp;</td>
                                                                <td width="200px">
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style24" style="padding-bottom: 5px">
                                                                    &nbsp;Mobile:</td>
                                                                <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                                    <dx:ASPxTextBox ID="ASPxTextBoxMobile" runat="server" MaxLength="50" 
                                                                        Text='<%# Bind("Mobile") %>' Width="170px" ReadOnly="True">
                                                                        <ValidationSettings>
                                                                            <RequiredField IsRequired="True" />
                                                                            <RequiredField IsRequired="True" />
                                                                        </ValidationSettings>
                                                                        <Border BorderColor="#3399FF" />
                                                                        <Border BorderColor="#3399FF" />
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                                <td class="style27" 
                                                                    style="border-right-style: solid; border-right-width: 1px; border-right-color: #C0C0C0">
                                                                    Created by:</td>
                                                                <td style="font-size: 8pt">
                                                                    <dx:ASPxTextBox ID="ASPxTextBoxCreatedBy0" runat="server" CssClass="style26" 
                                                                        Font-Size="8pt" ForeColor="#999999" Text='<%# Bind("Created_by") %>' 
                                                                        Width="220px" ReadOnly="True">
                                                                        <Border BorderWidth="0px" />
                                                                        <Border BorderWidth="0px" />
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style24" style="padding-bottom: 5px">
                                                                    &nbsp;Email:</td>
                                                                <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                                    <dx:ASPxTextBox ID="ASPxTextBoxEmail" runat="server" MaxLength="100" 
                                                                        Text='<%# Bind("Email") %>' Width="250px" ReadOnly="True">
                                                                        <ValidationSettings>
                                                                            <RequiredField IsRequired="True" />
                                                                            <RequiredField IsRequired="True" />
                                                                        </ValidationSettings>
                                                                        <Border BorderColor="#3399FF" />
                                                                        <Border BorderColor="#3399FF" />
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                                <td class="style27" 
                                                                    style="border-right-style: solid; border-right-width: 1px; border-right-color: #C0C0C0">
                                                                    Updated by:</td>
                                                                <td style="font-size: 8pt">
                                                                    <dx:ASPxTextBox ID="ASPxTextBoxUpdatedBy" runat="server" 
                                                                        Text='<%# Bind("Updated_by") %>' Width="220px" CssClass="style26" 
                                                                        Font-Size="8pt" ForeColor="#999999" ReadOnly="True">
                                                                        <Border BorderWidth="0px" />
                                                                        <Border BorderWidth="0px" />
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style24">
                                                                    &nbsp;Valid User:</td>
                                                                <td>
                                                                    <dx:ASPxCheckBox ID="ASPxCheckBox4" runat="server" CheckState="Unchecked" 
                                                                        Value='<%# Bind("Valid_user") %>' ReadOnly="True">
                                                                        <ValidationSettings>
                                                                            <RequiredField IsRequired="True" />
                                                                            <RequiredField IsRequired="True" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxCheckBox>
                                                                </td>
                                                                <td class="style27" 
                                                                    style="border-right-style: solid; border-right-width: 1px; border-right-color: #C0C0C0">
                                                                    Last login:</td>
                                                                <td style="font-size: 8pt">
                                                                    <dx:ASPxTextBox ID="ASPxTextBoxLastLogin" runat="server" 
                                                                        Text='<%# Bind("Last_login") %>' Width="170px" CssClass="style26" 
                                                                        Font-Size="8pt" ForeColor="#999999" ReadOnly="True">
                                                                        <MaskSettings Mask="dd/MM/yyyy HH:mm" />
                                                                        <Border BorderWidth="0px" />
                                                                        <MaskSettings Mask="dd/MM/yyyy HH:mm" />
                                                                        <Border BorderWidth="0px" />
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style25" colspan="4">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                            <dx:TabPage Text="Teams">
                                                <ContentCollection>
                                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxGridView ID="ASPxGridViewTeams" runat="server" ClientIDMode="AutoID" 
                                                            CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                            CssPostfix="Office2003Blue" Width="100%" AutoGenerateColumns="False" 
                                                            OnBeforePerformDataSelect="ASPxGridViewTeams_BeforePerformDataSelect" 
                                                            KeyFieldName="Hidden_team_id">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Team" FieldName="Team" Name="Team" 
                                                                    ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn Caption="Updated on" FieldName="Updated_on" 
                                                                    Name="Updated_on" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                    VisibleIndex="2">
                                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                                                    </PropertiesDateEdit>
                                                                    <CellStyle ForeColor="#999999">
                                                                    </CellStyle>
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataCheckColumn Caption="Valid Team" FieldName="Valid_team" 
                                                                    Name="Valid_team" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                    VisibleIndex="3" Width="15%">
                                                                </dx:GridViewDataCheckColumn>
                                                                <dx:GridViewDataCheckColumn Caption="Read only" FieldName="Read_only" 
                                                                    Name="Read_only" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                    VisibleIndex="1" Width="15%">
                                                                </dx:GridViewDataCheckColumn>
                                                                <dx:GridViewDataTextColumn Caption="Hidden user id" FieldName="Hidden_user_id" 
                                                                    Name="Hidden_user_id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" 
                                                                    VisibleIndex="5">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Hidden team id" FieldName="Hidden_team_id" 
                                                                    Name="Hidden_team_id" ShowInCustomizationForm="True" 
                                                                    Visible="False" VisibleIndex="4">
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsBehavior ColumnResizeMode="NextColumn" AllowFocusedRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />

                                                            <Styles CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                                CssPostfix="Office2003Blue">
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                                                                                                                                                    
                                                        <FocusedRow BackColor="#FCF9DF" ForeColor="Black" VerticalAlign="Top">
                                                            <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                                                            <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                                                        </FocusedRow>
                                            
                                                            </Styles>
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                        </dx:ASPxGridView>
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                            <dx:TabPage Text="Roles">
                                                <ContentCollection>
                                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxGridView ID="ASPxGridCiewRoles" runat="server" ClientIDMode="AutoID" 
                                                            CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                            CssPostfix="Office2003Blue" Width="100%" AutoGenerateColumns="False" 
                                                            OnBeforePerformDataSelect="ASPxGridCiewRoles_BeforePerformDataSelect" 
                                                            KeyFieldName="Hidden_role_id">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Role" FieldName="Role" Name="Role" 
                                                                    ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn Caption="Updated on" FieldName="Updated_on" 
                                                                    Name="Updated_on" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                    VisibleIndex="2">
                                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                                                    </PropertiesDateEdit>
                                                                    <CellStyle ForeColor="#999999">
                                                                    </CellStyle>
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataCheckColumn Caption="Valid Role" FieldName="Valid_role" 
                                                                    Name="Valid_role" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                    VisibleIndex="3" Width="10%">
                                                                </dx:GridViewDataCheckColumn>
                                                                <dx:GridViewDataTextColumn Caption="Hidden user id" FieldName="Hidden_user_id" 
                                                                    Name="Hidden_user_id" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                    Visible="False" VisibleIndex="4">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Hidden role id" FieldName="Hidden_role_id" 
                                                                    Name="Hidden_role_id" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                    Visible="False" VisibleIndex="4">
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsBehavior ColumnResizeMode="NextColumn" AllowFocusedRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />

                                                            <Styles CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                                CssPostfix="Office2003Blue">
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>

                                                        <FocusedRow BackColor="#FCF9DF" ForeColor="Black" VerticalAlign="Top">
                                                            <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                                                            <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                                                        </FocusedRow>

                                                            </Styles>
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                        </dx:ASPxGridView>
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                        </TabPages>
                                        <LoadingPanelImage Url="~/App_Themes/Office2003Blue/Web/Loading.gif">
                                        </LoadingPanelImage>
                                        <LoadingPanelStyle ImageSpacing="6px">
                                        </LoadingPanelStyle>
                                        <ContentStyle>
                                            <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                                            <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                                        </ContentStyle>
                                    </dx:ASPxPageControl>
                                </div>
                            </DetailRow>
                            <EditForm>
                                <dx:ASPxPageControl ID="ASPxPageControlUsers" runat="server" ActiveTabIndex="0" 
                                    ClientIDMode="AutoID" CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                    CssPostfix="Office2003Blue" EnableCallBacks="True" Theme="PlasticBlue" 
                                    Width="100%">
                                    <TabPages>
                                        <dx:TabPage Text="Details">
                                            <ContentCollection>
                                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                    <table class="style1" 
                                                        style="border-top-width: 1px; border-right-width: 2px; border-top-style: solid; border-right-style: solid; border-color: #000080">
                                                        <tr>
                                                            <td class="style24" width="100px">
                                                                <span class="style22">*</span> User Name:</td>
                                                            <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 10px; padding-top: 10px;">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxUserName" runat="server" MaxLength="60" 
                                                                    style="font-weight: 700" Text='<%# Bind("User_name") %>' Width="200px">
                                                                    
                                                                    <ValidationSettings>
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <Border BorderColor="#3399FF" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td colspan="2" rowspan="3" style="text-align: center">
                                                                <dx:ASPxImage ID="ASPxImageUser" runat="server" ImageUrl="~/Images/Users.png" 
                                                                    IsPng="True">
                                                                </dx:ASPxImage>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style24" style="padding-bottom: 5px">
                                                                <span class="style22">* **</span> Login Name:</td>
                                                            <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxLoginName" runat="server" MaxLength="10" 
                                                                    Text='<%# Bind("Login") %>' Width="150px">
                                                                    <ValidationSettings>
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <Border BorderColor="#3399FF" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style24" style="padding-bottom: 5px">
                                                                <span class="style22">* **</span> Password:</td>
                                                            <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxPassword" runat="server" MaxLength="10" 
                                                                    Text='<%# Bind("Password") %>' Width="150px">
                                                                    <ValidationSettings>
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <Border BorderColor="#3399FF" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style24" style="padding-bottom: 5px">
                                                                <span class="style22">*</span> Phone:</td>
                                                            <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxPhone" runat="server" MaxLength="50" 
                                                                    Text='<%# Bind("Phone") %>' Width="170px">
                                                                    <ValidationSettings>
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <Border BorderColor="#3399FF" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td class="style23" width="100px">
                                                                &nbsp;</td>
                                                            <td width="200px">
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style24" style="padding-bottom: 5px">
                                                                <span class="style22">*</span> Mobile:</td>
                                                            <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxMobile" runat="server" MaxLength="50" 
                                                                    Text='<%# Bind("Mobile") %>' Width="170px">
                                                                    <ValidationSettings>
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <Border BorderColor="#3399FF" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td class="style27" 
                                                                style="border-right-style: solid; border-right-width: 1px; border-right-color: #C0C0C0">
                                                                Created by:</td>
                                                            <td style="font-size: 8pt">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxCreatedBy0" runat="server" CssClass="style26" 
                                                                    Font-Size="8pt" ForeColor="#999999" ReadOnly="True" 
                                                                    Text='<%# Bind("Created_by") %>' Width="220px">
                                                                    <Border BorderWidth="0px" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style24" style="padding-bottom: 5px">
                                                                <span class="style22">*</span> Email:</td>
                                                            <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxEmail" runat="server" MaxLength="100" 
                                                                    Text='<%# Bind("Email") %>' Width="250px">
                                                                    <ValidationSettings>
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <Border BorderColor="#3399FF" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td class="style27" 
                                                                style="border-right-style: solid; border-right-width: 1px; border-right-color: #C0C0C0">
                                                                Updated by:</td>
                                                            <td style="font-size: 8pt">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxUpdatedBy" runat="server" CssClass="style26" 
                                                                    Font-Size="8pt" ForeColor="#999999" ReadOnly="True" 
                                                                    Text='<%# Bind("Updated_by") %>' Width="220px">
                                                                    <Border BorderWidth="0px" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style24">
                                                                &nbsp;Valid User:</td>
                                                            <td>
                                                                <dx:ASPxCheckBox ID="ASPxCheckBoxValidUser" runat="server" 
                                                                    CheckState="Unchecked" Value='<%# Bind("Valid_user") %>'>
                                                                    <ValidationSettings>
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxCheckBox>
                                                            </td>
                                                            <td class="style27" 
                                                                style="border-right-style: solid; border-right-width: 1px; border-right-color: #C0C0C0">
                                                                Last login:</td>
                                                            <td style="font-size: 8pt">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxLastLogin" runat="server" CssClass="style26" 
                                                                    Font-Size="8pt" ForeColor="#999999" ReadOnly="True" 
                                                                    Text='<%# Bind("Last_login") %>' Width="170px">
                                                                    <MaskSettings Mask="dd/MM/yyyy HH:mm" />
                                                                    <Border BorderWidth="0px" />
                                                                    <MaskSettings Mask="dd/MM/yyyy HH:mm" />
                                                                    <Border BorderWidth="0px" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style25" colspan="4" style="padding-top: 15px; padding-right: 10px;">
                                                                * mandatory, ** please do not use the special characters *, %, _, =, -</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style28" colspan="4">
                                                                <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" runat="server" 
                                                                    ColumnID="" ReplacementType="EditFormUpdateButton" />
                                                                <dx:ASPxGridViewTemplateReplacement ID="CancelButton" runat="server" 
                                                                    ColumnID="" ReplacementType="EditFormCancelButton" />
                                                                <dx:ASPxTextBox ID="ASPxTextBoxHiddenUserID" runat="server" MaxLength="60" 
                                                                    style="font-weight: 700" Text='<%# Bind("Hidden_user_id") %>' Visible="False" 
                                                                    Width="100px">
                                                                    <ValidationSettings>
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <Border BorderColor="#3399FF" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                        <dx:TabPage Text="Teams">
                                            <ContentCollection>
                                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

 <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenu2" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%" OnInit="ASPxMenu2_Init">
                                <ClientSideEvents ItemClick="function(s, e) {
	ASPxGridViewTeams.AddNewRow()

		
}" />
                                <Items>
                                    <dx:MenuItem Name="AddTeam" Text="Add to Team">
                                        <Image AlternateText="New" Height="10px" Url="~/Images/Add.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
                                <ItemStyle>
                                <Paddings PaddingRight="0px" />
                                </ItemStyle>
                            </dx:ASPxMenu>
                        </td>

                    </tr>
                </table>

                                                    <dx:ASPxGridView ID="ASPxGridViewTeams" runat="server" 
                                                        AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                                        CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003Blue" KeyFieldName="Hidden_team_id" 
                                                        OnBeforePerformDataSelect="ASPxGridViewTeams_BeforePerformDataSelect" 
                                                        Width="100%" 
                                                        OnCellEditorInitialize="ASPxGridViewTeams_CellEditorInitialize" 
                                                        OnRowDeleting="ASPxGridViewTeams_RowDeleting" 
                                                        OnRowInserting="ASPxGridViewTeams_RowInserting" 
                                                        OnRowUpdating="ASPxGridViewTeams_RowUpdating" 
                                                        ClientInstanceName="ASPxGridViewTeams">
                                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" 
                                                            ConfirmDelete="True" />
                                                        <Columns>
                                                            <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" Name="EditButtons" ShowEditButton="True" ShowDeleteButton="True"/>
                                                            <dx:GridViewDataComboBoxColumn Caption="Team" FieldName="Team" Name="Team" 
                                                                ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <PropertiesComboBox IncrementalFilteringDelay="300" 
                                                                    IncrementalFilteringMode="Contains">
                                                                    <ValidationSettings>
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesComboBox>
                                                            </dx:GridViewDataComboBoxColumn>
                                                            <dx:GridViewDataDateColumn Caption="Updated on" FieldName="Updated_on" 
                                                                Name="Updated_on" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                VisibleIndex="3">
                                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                                                </PropertiesDateEdit>
                                                                <CellStyle ForeColor="#999999">
                                                                </CellStyle>
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataCheckColumn Caption="Valid Team" FieldName="Valid_team" 
                                                                Name="Valid_team" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                VisibleIndex="4" Width="15%">
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewDataCheckColumn Caption="Read only" FieldName="Read_only" 
                                                                Name="Read_only" ShowInCustomizationForm="True" 
                                                                VisibleIndex="2" Width="15%">
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewDataTextColumn Caption="Hidden user id" FieldName="Hidden_user_id" Name="Hidden_user_id" 
                                                                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" 
                                                                Visible="False">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Hidden team id" FieldName="Hidden_team_id" 
                                                                Name="Hidden_team_id" ShowInCustomizationForm="True" Visible="False" 
                                                                VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                                                        <SettingsEditing Mode="Inline" />

                                                        <Styles CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                            CssPostfix="Office2003Blue">
                                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                            </Header>
                                                            <LoadingPanel ImageSpacing="10px">
                                                            </LoadingPanel>
                                                            <FocusedRow BackColor="#FCF9DF" ForeColor="Black" VerticalAlign="Top">
                                                                <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                                                                <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                                                            </FocusedRow>
                                                        </Styles>
                                                        <StylesEditors>
                                                            <ProgressBar Height="25px">
                                                            </ProgressBar>
                                                        </StylesEditors>
                                                        <SettingsCommandButton>
                                                            <EditButton Text="Edit">
                                                                <Image Height="10px" Url="~/Images/Edit.png">
                                                                </Image>
                                                            </EditButton>
                                                            <NewButton Text="Add Team">
                                                                <Image Height="10px" Url="~/Images/Add.png">
                                                                </Image>
                                                            </NewButton>
                                                            <DeleteButton Text="Delete">
                                                                <Image Height="10px" Url="~/Images/Delete.png">
                                                                </Image>
                                                            </DeleteButton>
                                                            <CancelButton Text="Cancel">
                                                                <Image Height="18px" Url="~/Images/Cancel.png">
                                                                </Image>
                                                            </CancelButton>
                                                            <UpdateButton Text="Save">
                                                                <Image Height="18px" Url="~/Images/Save.png">
                                                                </Image>
                                                            </UpdateButton>
                                                        </SettingsCommandButton>
                                                    </dx:ASPxGridView>
                                                    
                                                    <dx:ASPxImage ID="ASPxImage2" runat="server" 
                                                        ImageUrl="~/Images/Return.png" IsPng="True" ToolTip="Return" Width="25px">
                                                        <ClientSideEvents Click="function(s, e) {
	userlistgrid.CancelEdit();
}" />
                                                    </dx:ASPxImage>
                                                    <br />
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                        <dx:TabPage Text="Roles">
                                            <ContentCollection>
                                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                    
                                                     <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenu3" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%" OnInit="ASPxMenu3_Init" >
                                <ClientSideEvents ItemClick="function(s, e) {
	ASPxGridViewRoles.AddNewRow()}" />
                                <Items>
                                    <dx:MenuItem Name="AddRole" Text="Assign Role">
                                        <Image AlternateText="New" Height="10px" Url="~/Images/Add.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
                                <ItemStyle>
                                <Paddings PaddingRight="0px" />
                                </ItemStyle>
                            </dx:ASPxMenu>
                        </td>

                    </tr>
                </table>


                                                    <dx:ASPxGridView ID="ASPxGridCiewRoles" runat="server" 
                                                        AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                                        CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003Blue" KeyFieldName="Hidden_role_id" 
                                                        OnBeforePerformDataSelect="ASPxGridCiewRoles_BeforePerformDataSelect" 
                                                        Width="100%" 
                                                        OnCellEditorInitialize="ASPxGridCiewRoles_CellEditorInitialize" 
                                                        OnRowDeleting="ASPxGridCiewRoles_RowDeleting" 
                                                        OnRowInserting="ASPxGridCiewRoles_RowInserting" 
                                                         ClientInstanceName="ASPxGridViewRoles">
                                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" 
                                                            ConfirmDelete="True" />
                                                        <Columns>
                                                            <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" Name="EditButtons" ShowDeleteButton="True"/>
                                                            <dx:GridViewDataComboBoxColumn Caption="Role" FieldName="Role" Name="Role" 
                                                                ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <PropertiesComboBox IncrementalFilteringDelay="300" 
                                                                    IncrementalFilteringMode="Contains">
                                                                    <ValidationSettings>
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesComboBox>
                                                            </dx:GridViewDataComboBoxColumn>
                                                            <dx:GridViewDataDateColumn Caption="Updated on" FieldName="Updated_on" 
                                                                Name="Updated_on" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                VisibleIndex="3">
                                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                                                </PropertiesDateEdit>
                                                                <CellStyle ForeColor="#999999">
                                                                </CellStyle>
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataCheckColumn Caption="Valid Role" FieldName="Valid_role" 
                                                                Name="Valid_role" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                VisibleIndex="4" Width="10%">
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewDataTextColumn Caption="Hidden user id" FieldName="Hidden_user_id" Name="Hidden_user_id" 
                                                                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" 
                                                                Visible="False">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Hidden role id" FieldName="Hidden_role_id" 
                                                                Name="Hidden_role_id" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                Visible="False" VisibleIndex="5">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                                                        <SettingsEditing Mode="Inline" />

                                                        <Styles CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                            CssPostfix="Office2003Blue">
                                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                            </Header>
                                                            <LoadingPanel ImageSpacing="10px">
                                                            </LoadingPanel>
                                                            <FocusedRow BackColor="#FCF9DF" ForeColor="Black" VerticalAlign="Top">
                                                                <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                                                                <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                                                            </FocusedRow>
                                                        </Styles>
                                                        <StylesEditors>
                                                            <ProgressBar Height="25px">
                                                            </ProgressBar>
                                                        </StylesEditors>
                                                        <SettingsCommandButton>
                                                            <EditButton Text="Edit">
                                                                <Image Height="10px" Url="~/Images/Edit.png">
                                                                </Image>
                                                            </EditButton>
                                                            <NewButton Text="Add Role">
                                                                <Image Height="10px" Url="~/Images/Add.png">
                                                                </Image>
                                                            </NewButton>
                                                            <DeleteButton Text="Delete">
                                                                <Image Height="10px" Url="~/Images/Delete.png">
                                                                </Image>
                                                            </DeleteButton>
                                                            <CancelButton Text="Cancel">
                                                                <Image Height="18px" Url="~/Images/Cancel.png">
                                                                </Image>
                                                            </CancelButton>
                                                            <UpdateButton Text="Save">
                                                                <Image Height="18px" Url="~/Images/Save.png">
                                                                </Image>
                                                            </UpdateButton>
                                                        </SettingsCommandButton>
                                                    </dx:ASPxGridView>
                                                     <dx:ASPxImage ID="ASPxImage1" runat="server" 
                                                         ImageUrl="~/Images/Return.png" IsPng="True" ToolTip="Return" Width="25px">
                                                         <ClientSideEvents Click="function(s, e) {
	userlistgrid.CancelEdit();
}" />
                                                     </dx:ASPxImage>
                                                     <br />
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                    </TabPages>
                                    <LoadingPanelImage Url="~/App_Themes/Office2003Blue/Web/Loading.gif">
                                    </LoadingPanelImage>
                                    <LoadingPanelStyle ImageSpacing="6px">
                                    </LoadingPanelStyle>
                                    <ContentStyle>
                                        <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                                        <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                                    </ContentStyle>
                                </dx:ASPxPageControl>
                            </EditForm>
                        </Templates>
                        <SettingsCommandButton>
                            <EditButton Text="Edit User">
                                <Image Height="10px" Url="~/Images/Edit.png">
                                </Image>
                            </EditButton>
                            <NewButton Text="New User">
                                <Image Height="10px" Url="~/Images/Add.png">
                                </Image>
                            </NewButton>
                            <DeleteButton Text="Delete User">
                                <Image Height="10px" Url="~/Images/Delete.png">
                                </Image>
                            </DeleteButton>
                            <CancelButton Text="Cancel">
                                <Image Height="25px" Url="~/Images/CancelNew.png">
                                </Image>
                            </CancelButton>
                            <UpdateButton Text="Save">
                                <Image Height="25px" Url="~/Images/SaveNew.png">
                                </Image>
                            </UpdateButton>
                            <ClearFilterButton Text="Clear Filter">
                                <Image Height="20px" Url="~/Images/ClearFilter.png">
                                </Image>
                            </ClearFilterButton>
                        </SettingsCommandButton>
                    </dx:ASPxGridView>
                </div>
            </td>
        </tr>
    </table>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
 <script type="text/javascript">
     function OnUpdateClick(editor) {
         if (ASPxClientEdit.ValidateGroup("NewRow"))
             userlistgrid.UpdateEdit();
     }
</script>
    </form>
 </body>
</html>
