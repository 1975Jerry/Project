<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="TTWeb.Roles" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>









<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
<script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" 
            CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="Roles" 
            SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" 
            Width="100%" EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px" 
            Theme="Metropolis">
            <ContentPaddings PaddingBottom="10px" PaddingLeft="9px" PaddingRight="11px" 
                PaddingTop="10px" />
            <HeaderStyle Font-Size="Small">
            <Paddings PaddingBottom="6px" PaddingLeft="9px" PaddingRight="11px" 
                PaddingTop="3px" />
            </HeaderStyle>
            <HeaderTemplate>
                <table style="width: 100%">
                    <tr>
                        <td width="100%" valign="middle" align="left">Roles Management [> Role Members]
                        </td>
                       
                    </tr>
                </table>
            </HeaderTemplate>
            <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <table class="style1">
        <tr>
            <td>

<table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px;" 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenu1" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%" OnLoad="ASPxMenu1_Load">
                                <ClientSideEvents ItemClick="function(s, e) {
	gridViewRoles.AddNewRow()

		
}" />
                                <Items>
                                    <dx:MenuItem Name="NewRole" Text="New Role">
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

                <dx:ASPxGridView ID="ASPxGridViewRoles" runat="server" 
                    AutoGenerateColumns="False" ClientIDMode="AutoID" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" KeyFieldName="Hidden_role_id" 
                    OnInitNewRow="ASPxGridViewRoles_InitNewRow" 
                    OnRowInserting="ASPxGridViewRoles_RowInserting" 
                    OnRowUpdating="ASPxGridViewRoles_RowUpdating" Width="100%" 
                    OnCellEditorInitialize="ASPxGridViewRoles_CellEditorInitialize" ClientInstanceName="gridViewRoles" 
                    OnRowDeleting="ASPxGridViewRoles_RowDeleting" Theme="Metropolis" >
                    <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                        CssPostfix="PlasticBlue">
                        <Header ImageSpacing="10px" SortingImageSpacing="10px" BackColor="#0066CC" 
                            ForeColor="White">
                        </Header>
                        <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                        <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                        </FocusedRow>

<CommandColumnItem>
<Paddings PaddingLeft="3px"></Paddings>
</CommandColumnItem>
                    </Styles>
                    <ClientSideEvents CallbackError="function(s, e) {
	                if (s.Editing)
                    {
                        buttonNew.SetEnabled(false);
                        buttonEdit.SetEnabled(false);
                        buttonDelete.SetEnabled(false); 
                        buttonSave.SetEnabled(true);
                        buttonCancel.SetEnabled(true);
                    }
}" Init="function(s, e) {
	window.pagegrid = s;
}"/>

                    <Columns>

                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ButtonType="Image" Name="EditButtons" ShowEditButton="True" ShowDeleteButton="True" ShowClearFilterButton="True"/>

                        <dx:GridViewDataTextColumn Caption="Role" FieldName="Role" Name="Role" 
                            ShowInCustomizationForm="True" VisibleIndex="1">
                            <PropertiesTextEdit>
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Team Role" FieldName="Team_role" 
                                Name="Team_role" ShowInCustomizationForm="True" VisibleIndex="2">
                                <PropertiesComboBox Spacing="0" TextField="Team_Role" 
                                    ValueField="Hidden_role_id">
                                </PropertiesComboBox>
                                <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
                            </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataCheckColumn Caption="Valid Role" FieldName="Valid_role" 
                            Name="Valid_role" ShowInCustomizationForm="True" VisibleIndex="3" 
                            Width="70px">
                        </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataTextColumn Caption="CI Grps" FieldName="System_Groups" 
                                Name="System_Groups" ReadOnly="True" ShowInCustomizationForm="True" 
                                VisibleIndex="5" Width="70px" Visible="False">
                                <PropertiesTextEdit>
                                    <ReadOnlyStyle BackColor="#EBEBEB" ForeColor="#999999">
                                    </ReadOnlyStyle>
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Created on" FieldName="Created_on" 
                            Name="Created_on" ReadOnly="True" ShowInCustomizationForm="True" 
                            VisibleIndex="6">
                            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" Spacing="0">
                                <DropDownButton Enabled="False" Visible="False">
                                </DropDownButton>
                                <ReadOnlyStyle BackColor="#EBEBEB" ForeColor="#999999">
                                </ReadOnlyStyle>
                            </PropertiesDateEdit>
                            <CellStyle ForeColor="#999999">
                            </CellStyle>
                        </dx:GridViewDataDateColumn>
<dx:GridViewDataTextColumn FieldName="Members" ReadOnly="True" ShowInCustomizationForm="True" 
                                Name="Members" Caption="Members" VisibleIndex="4" Width="70px">
    <PropertiesTextEdit>
        <ReadOnlyStyle BackColor="#EBEBEB" ForeColor="#999999">
        </ReadOnlyStyle>
    </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Hidden Role Id" FieldName="Hidden_role_id" 
                                Name="Hidden_role_id" ReadOnly="True" ShowInCustomizationForm="True" 
                                Visible="False" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Hidden Team Id" FieldName="Hidden_team_id" 
                            Name="Hidden_team_id" ReadOnly="True" ShowInCustomizationForm="True" 
                            Visible="False" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior ColumnResizeMode="NextColumn" AllowFocusedRow="True" 
                        AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" 
                        ConfirmDelete="True" />
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
                    <SettingsEditing Mode="Inline" />
                    <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterRowMenu="True" 
                        ShowGroupedColumns="True" ShowFilterBar="Visible" />
                    <SettingsCookies Enabled="True" StoreColumnsVisiblePosition="False" 
                        Version="11" />
                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />

                   <Styles>
                        <Header SortingImageSpacing="10px" ImageSpacing="10px"></Header>

                        <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                        <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX"></BackgroundImage>
                        </FocusedRow>

                        <CommandColumnItem>
                            <Paddings PaddingLeft="3px"/>
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

                        <table class="style1">
                        <tr>
                        <td>
                        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" 
                        ClientIDMode="AutoID" CssFilePath="~/App_Themes/Glass/{0}/styles.css" 
                        CssPostfix="Glass" TabSpacing="0px" Width="100%" Theme="PlasticBlue">
                        <TabPages>
                           <dx:TabPage Name="Members" Text="Members">
                           <ContentCollection>
                           <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

 <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenu1" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%">
                                <ClientSideEvents ItemClick="function(s, e) {
	ASPxGridViewRoleUsers.AddNewRow()

		
}" />
                                <Items>
                                    <dx:MenuItem Name="AddUser" Text="Add User">
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

                            <dx:ASPxGridView ID="ASPxGridViewRoleUsers" runat="server" 
                                AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                CssFilePath="~/App_Themes/Office2003Silver/{0}/styles.css" 
                                CssPostfix="Office2003Silver" KeyFieldName="Hidden_user_id" 
                                onbeforeperformdataselect="ASPxGridViewRoleUsers_BeforePerformDataSelect" 
                                OnRowDeleting="ASPxGridViewRoleUsers_RowDeleting" Width="100%" 
                                   EnableTheming="True" Theme="Office2003Blue" 
                                   OnCellEditorInitialize="ASPxGridViewRoleUsers_CellEditorInitialize" 
                                   OnRowInserting="ASPxGridViewRoleUsers_RowInserting" 
                                   ClientInstanceName="ASPxGridViewRoleUsers">
                                <Columns>
                                    <dx:GridViewCommandColumn VisibleIndex="0" Width="50px" ButtonType="Image" Name="EditButtons" ShowDeleteButton="True"/>
                                    <dx:GridViewDataComboBoxColumn Caption="User Name" FieldName="User_name" 
                                        Name="User_name" ShowInCustomizationForm="True" VisibleIndex="1" Width="50%">
                                        <PropertiesComboBox IncrementalFilteringDelay="300" 
                                            IncrementalFilteringMode="Contains">
                                            <ReadOnlyStyle BackColor="#EBEBEB">
                                            </ReadOnlyStyle>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTimeEditColumn Caption="Updated On" FieldName="Updated_on" 
                                        Name="Updated_on" ReadOnly="True" VisibleIndex="3">
                                        <PropertiesTimeEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                            <ReadOnlyStyle BackColor="#EBEBEB">
                                            </ReadOnlyStyle>
                                        </PropertiesTimeEdit>
                                        <CellStyle ForeColor="#999999">
                                        </CellStyle>
                                    </dx:GridViewDataTimeEditColumn>
                                    <dx:GridViewDataCheckColumn Caption="Valid User" FieldName="Valid_user" 
                                        Name="Valid_user" VisibleIndex="4" ReadOnly="True">
                                        <EditCellStyle ForeColor="#999999">
                                        </EditCellStyle>
                                    </dx:GridViewDataCheckColumn>
                                    <dx:GridViewDataTextColumn Caption="Hidden_user_id" FieldName="Hidden_user_id" 
                                        Name="Hidden_user_id" Visible="False" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Hidden_role_id" FieldName="Hidden_role_id" 
                                        Name="Hidden_role_id" Visible="False" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" 
                                    ConfirmDelete="True" />
                                <SettingsPager PageSize="20" AlwaysShowPager="True">
                                 </SettingsPager>
                                <SettingsEditing Mode="Inline" />
                                <SettingsDetail IsDetailGrid="True" />

                                <Styles CssFilePath="~/App_Themes/Office2003Silver/{0}/styles.css" 
                                    CssPostfix="Office2003Silver">
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                    </Header>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                </Styles>
                                <StylesEditors>
                                    <ProgressBar Height="25px">
                                    </ProgressBar>
                                </StylesEditors>
                                <SettingsCommandButton>
                                    <EditButton Text="Add / Remove Member">
                                        <Image Height="10px" Url="~/Images/Edit.png">
                                        </Image>
                                    </EditButton>
                                    <NewButton Text="Add Users">
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

                            </dx:ContentControl>
                            </ContentCollection>
                            </dx:TabPage>

                                                                            <dx:TabPage Name="ReplacementMembers" Text="Replacement Members">
                                                                                <ContentCollection>
                                                                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                                                        <dx:ASPxMenu ID="ASPxMenu4" runat="server" ItemAutoWidth="False" 
                                                                                            OnLoad="ASPxMenu4_Load" Theme="Metropolis" Width="100%">
                                                                                            <ClientSideEvents ItemClick="function(s, e) {
	ASPxGridViewRoleReplacementUsers.AddNewRow()

		
}" />
                                                                                            <Items>
                                                                                                <dx:MenuItem Name="AddReplacementUser" Text="Add Replacement">
                                                                                                    <Image AlternateText="New" Height="10px" Url="~/Images/Add.png">
                                                                                                    </Image>
                                                                                                </dx:MenuItem>
                                                                                            </Items>
                                                                                            <ItemStyle>
                                                                                            <Paddings PaddingRight="0px" />
                                                                                            </ItemStyle>
                                                                                        </dx:ASPxMenu>
                                                                                        <dx:ASPxGridView ID="ASPxGridViewRoleReplacementUsers" runat="server" 
                                                                                            AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                                                                            ClientInstanceName="ASPxGridViewRoleReplacementUsers" 
                                                                                            CssFilePath="~/App_Themes/Office2003Silver/{0}/styles.css" 
                                                                                            CssPostfix="Office2003Silver" EnableTheming="True" KeyFieldName="Hidden_id" 
                                                                                            OnBeforePerformDataSelect="ASPxGridViewRoleReplacementUsers_BeforePerformDataSelect" 
                                                                                            OnCellEditorInitialize="ASPxGridViewRoleReplacementUsers_CellEditorInitialize" 
                                                                                            OnRowDeleting="ASPxGridViewRoleReplacementUsers_RowDeleting" 
                                                                                            OnRowInserting="ASPxGridViewRoleReplacementUsers_RowInserting" 
                                                                                            Theme="Office2003Blue" Width="100%" 
                                                                                            OnCommandButtonInitialize="ASPxGridViewRoleReplacementUsers_CommandButtonInitialize">
                                                                                            <Columns>
                                                                                                <dx:GridViewCommandColumn ButtonType="Image" Name="EditButtons" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px" ShowDeleteButton="True"/>
                                                                                                <dx:GridViewDataComboBoxColumn Caption="User Name" FieldName="User_name" 
                                                                                                    Name="User_name" ShowInCustomizationForm="True" VisibleIndex="1" Width="30%">
                                                                                                    <PropertiesComboBox IncrementalFilteringDelay="300" 
                                                                                                        IncrementalFilteringMode="Contains">
                                                                                                        <ReadOnlyStyle BackColor="#EBEBEB">
                                                                                                        </ReadOnlyStyle>
                                                                                                        <ValidationSettings>
                                                                                                            <RequiredField IsRequired="True" />
                                                                                                        </ValidationSettings>
                                                                                                    </PropertiesComboBox>
                                                                                                </dx:GridViewDataComboBoxColumn>
                                                                                                <dx:GridViewDataDateColumn Caption="From Date" FieldName="FROM_DATE" 
                                                                                                    Name="FROM_DATE" ShowInCustomizationForm="True" VisibleIndex="2" Width="200px">
                                                                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" 
                                                                                                        EditFormat="DateTime" EditFormatString="dd/MM/yyyy HH:mm">
                                                                                                        <ValidationSettings>
                                                                                                            <RequiredField IsRequired="True" />
                                                                                                        </ValidationSettings>
                                                                                                    </PropertiesDateEdit>
                                                                                                </dx:GridViewDataDateColumn>
                                                                                                <dx:GridViewDataDateColumn Caption="To Date" FieldName="TO_DATE" Name="TO_DATE" 
                                                                                                    ShowInCustomizationForm="True" VisibleIndex="3" Width="200px">
                                                                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" 
                                                                                                        EditFormat="DateTime" EditFormatString="dd/MM/yyyy HH:mm">
                                                                                                        <ValidationSettings>
                                                                                                            <RequiredField IsRequired="True" />
                                                                                                        </ValidationSettings>
                                                                                                    </PropertiesDateEdit>
                                                                                                </dx:GridViewDataDateColumn>
                                                                                                <dx:GridViewDataTimeEditColumn Caption="Updated On" FieldName="Updated_on" 
                                                                                                    Name="Updated_on" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                                                    VisibleIndex="4">
                                                                                                    <PropertiesTimeEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                                                                                        <ReadOnlyStyle BackColor="#EBEBEB">
                                                                                                        </ReadOnlyStyle>
                                                                                                    </PropertiesTimeEdit>
                                                                                                    <CellStyle ForeColor="#999999">
                                                                                                    </CellStyle>
                                                                                                </dx:GridViewDataTimeEditColumn>
                                                                                                <dx:GridViewDataCheckColumn Caption="Valid User" FieldName="Valid_user" 
                                                                                                    Name="Valid_user" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                                                    Visible="False" VisibleIndex="6">
                                                                                                    <EditCellStyle ForeColor="#999999">
                                                                                                    </EditCellStyle>
                                                                                                </dx:GridViewDataCheckColumn>
                                                                                                <dx:GridViewDataTextColumn Caption="Hidden_user_id" FieldName="Hidden_user_id" 
                                                                                                    Name="Hidden_user_id" ShowInCustomizationForm="True" Visible="False" 
                                                                                                    VisibleIndex="6">
                                                                                                </dx:GridViewDataTextColumn>
                                                                                                <dx:GridViewDataTextColumn Caption="Hidden_role_id" FieldName="Hidden_role_id" 
                                                                                                    Name="Hidden_role_id" ShowInCustomizationForm="True" Visible="False" 
                                                                                                    VisibleIndex="6">
                                                                                                </dx:GridViewDataTextColumn>
                                                                                                <dx:GridViewDataTextColumn Caption="Processed" FieldName="PROCESSED" 
                                                                                                    Name="PROCESSED" ShowInCustomizationForm="True" Visible="False" 
                                                                                                    VisibleIndex="7">
                                                                                                </dx:GridViewDataTextColumn>
                                                                                                <dx:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" 
                                                                                                    Name="Hidden_id" ShowInCustomizationForm="True" Visible="False" 
                                                                                                    VisibleIndex="5">
                                                                                                </dx:GridViewDataTextColumn>
                                                                                            </Columns>
                                                                                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" 
                                                                                                ConfirmDelete="True" />
                                                                                            <SettingsPager AlwaysShowPager="True" PageSize="20">
                                                                                            </SettingsPager>
                                                                                            <SettingsEditing Mode="Inline" />
                                                                                            <Styles CssFilePath="~/App_Themes/Office2003Silver/{0}/styles.css" 
                                                                                                CssPostfix="Office2003Silver">
                                                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                                                </Header>
                                                                                                <LoadingPanel ImageSpacing="10px">
                                                                                                </LoadingPanel>
                                                                                            </Styles>
                                                                                            <StylesEditors>
                                                                                                <ProgressBar Height="25px">
                                                                                                </ProgressBar>
                                                                                            </StylesEditors>
                                                                                            <SettingsCommandButton>
                                                                                                <EditButton Text="Add / Remove Member">
                                                                                                    <Image Height="10px" Url="~/Images/Edit.png">
                                                                                                    </Image>
                                                                                                </EditButton>
                                                                                                <NewButton Text="Add Users">
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
                                                                                    </dx:ContentControl>
                                                                                </ContentCollection>
                            </dx:TabPage>

                                                                            <dx:TabPage Name="System Groups" Text="Configuration Item Groups" 
                                ClientVisible="False">
                                                    <ContentCollection>
                                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                            
             <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenu3" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%" OnLoad="ASPxMenu3_Load">
                                <ClientSideEvents ItemClick="function(s, e) {ASPxGridViewSystemDetails.AddNewRow()
		
}" />
                                <Items>
                                    <dx:MenuItem Name="AddGroup" Text="Add Group">
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

                                                            <dx:ASPxGridView ID="ASPxGridViewSystemDetails" runat="server" 
                                                                AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                                                CssFilePath="~/App_Themes/Office2003Silver/{0}/styles.css" 
                                                                CssPostfix="Office2003Silver" 
                                                                OnBeforePerformDataSelect="ASPxGridViewSystemDetails_BeforePerformDataSelect" 
                                                                Width="100%" KeyFieldName="System_Group" EnableTheming="True" 
                                                                Theme="Office2003Blue" 
                                                                OnCellEditorInitialize="ASPxGridViewSystemDetails_CellEditorInitialize" 
                                                                OnLoad="ASPxGridViewSystemDetails_Load" 
                                                                OnRowDeleting="ASPxGridViewSystemDetails_RowDeleting" 
                                                                OnRowInserting="ASPxGridViewSystemDetails_RowInserting" 
                                                                ClientInstanceName="ASPxGridViewSystemDetails">
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="50px" ButtonType="Image" Name="EditButtons" ShowDeleteButton="True"/>
                                                                    <dx:GridViewDataComboBoxColumn Caption="Configuration Item Group" FieldName="System_Group" 
                                                                        Name="System_Group" ShowInCustomizationForm="True" VisibleIndex="1" 
                                                                        Width="50%">
                                                                        <PropertiesComboBox>
                                                                            <ReadOnlyStyle BackColor="#EBEBEB">
                                                                            </ReadOnlyStyle>
                                                                            <ValidationSettings>
                                                                                <RequiredField IsRequired="True" />
                                                                            </ValidationSettings>
                                                                        </PropertiesComboBox>
                                                                    </dx:GridViewDataComboBoxColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Updated On" FieldName="Added_on" 
                                                                        Name="Added_on" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="3" ReadOnly="True">
                                                                        <PropertiesTextEdit>
                                                                            <ReadOnlyStyle BackColor="#EBEBEB">
                                                                            </ReadOnlyStyle>
                                                                        </PropertiesTextEdit>
                                                                        <CellStyle ForeColor="#999999">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Hidden_team_id" FieldName="Hidden_team_id" 
                                                                        Name="Hidden_team_id" ShowInCustomizationForm="True" Visible="False" 
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" 
                                                                    EnableRowHotTrack="True" />
                                                                <SettingsPager PageSize="20" AlwaysShowPager="True">
                                                                </SettingsPager>
                                                                <SettingsEditing Mode="Inline" />
                                                                <SettingsDetail IsDetailGrid="True" />

                                                                <Styles CssFilePath="~/App_Themes/Office2003Silver/{0}/styles.css" 
                                                                    CssPostfix="Office2003Silver">
                                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                    </Header>
                                                                    <LoadingPanel ImageSpacing="10px">
                                                                    </LoadingPanel>
                                                                </Styles>
                                                                <StylesEditors>
                                                                    <ProgressBar Height="25px">
                                                                    </ProgressBar>
                                                                </StylesEditors>
                                                                <SettingsCommandButton>
                                                                    <EditButton Text="Add / Remove System Group">
                                                                        <Image Height="10px" Url="~/Images/Edit.png">
                                                                        </Image>
                                                                    </EditButton>
                                                                    <NewButton Text="Add System Group">
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
                                                            <p style="padding-top: 5px;">* System Groups that the specific Role monitors. Needed 
                                                                only for Roles initiating a new Routing Path</p>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>
                                            </TabPages>
                                            <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
                                            </LoadingPanelImage>
                                            <Paddings PaddingLeft="0px" />
                                            <ContentStyle>
                                                <Border BorderColor="#4986A2" />
                                            </ContentStyle>
                                        </dx:ASPxPageControl>
                                    </td>
                                </tr>
                            </table>


                        </DetailRow>
                    </Templates>
                    <SettingsCommandButton>
                        <EditButton Text="Edit Role">
                            <Image Height="10px" Url="~/Images/Edit.png" ToolTip="Edit Role">
                            </Image>
                        </EditButton>
                        <NewButton Text="New Role">
                            <Image Height="10px" Url="~/Images/Add.png" ToolTip="New Role">
                            </Image>
                        </NewButton>
                        <DeleteButton Text="Delete Role">
                            <Image Height="10px" Url="~/Images/Delete.png" ToolTip="Delete Role">
                            </Image>
                        </DeleteButton>
                        <CancelButton Text="Cancel">
                            <Image Height="18px" Url="~/Images/Cancel.png" ToolTip="Cancel">
                            </Image>
                        </CancelButton>
                        <UpdateButton Text="Update">
                            <Image Height="18px" Url="~/Images/Save.png" ToolTip="Save Role">
                            </Image>
                        </UpdateButton>
                        <ClearFilterButton Text="Clear Filter">
                            <Image Height="20px" Url="~/Images/ClearFilter.png">
                            </Image>
                        </ClearFilterButton>
                    </SettingsCommandButton>
                </dx:ASPxGridView>
            </td>
        </tr>
        </table>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    </form>
</body>
</html>
