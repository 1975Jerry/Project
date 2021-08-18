<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vehicle.aspx.cs" Inherits="TTWeb.Vehicle" %>

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
    .dxgvControl_Office2003Blue,
.dxgvDisabled_Office2003Blue
{
	border: solid 1px #4f93e3;
	font: normal normal normal 8pt normal Segoe UI;
	background-color: White;
	color: Black;
	cursor: default;
}

.dxgvTable_Office2003Blue
{
	background-color: transparent;
	border:0;
	border-collapse: separate !important;
	overflow:hidden;
	font: 9pt Tahoma;
	color: Black;
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
            GroupBoxCaptionOffsetY="-19px" HeaderText="CI Groups" 
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
                        <td width="100%" valign="middle" align="left">Vehicles Configuration [> Teams]
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
                                Width="100%">
                                <ClientSideEvents ItemClick="function(s, e) 
{
ASPxGridViewVehicles.AddNewRow()
}" />
                                <Items>
                                    <dx:MenuItem Name="NewVehicle" Text="New Vehicle">
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


                <dx:ASPxGridView ID="ASPxGridViewVehicles" runat="server" 
                    AutoGenerateColumns="False" ClientIDMode="AutoID" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" KeyFieldName="Hidden_id" 
                    OnRowDeleting="ASPxGridViewVehicle_RowDeleting" 
                    OnRowInserting="ASPxGridViewVehicle_RowInserting" 
                    OnRowUpdating="ASPxGridViewVehicle_RowUpdating" Width="100%" 
                    EnableViewState="False" 
                    OnDetailRowExpandedChanged="ASPxGridViewVehicles_DetailRowExpandedChanged" 
                                                        ClientInstanceName="ASPxGridViewVehicles" EnableTheming="True" 
                                                        style="font-size: 8pt" Theme="Metropolis">
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
                    <ClientSideEvents  Init="function(s, e) {
	window.pagegrid = s;
}" />

                    <Columns>
                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="80px" ButtonType="Image" ShowEditButton="True" ShowDeleteButton="True" ShowClearFilterButton="True"/>
                        <dx:GridViewDataTextColumn Caption="Vehicle ID *" FieldName="Vehicle_ID" 
                            Name="Vehicle_ID" ShowInCustomizationForm="True" VisibleIndex="2">
                            <PropertiesTextEdit>
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Vehicle Number" FieldName="Vehicle_Number" 
                            Name="Vehicle_Number" ShowInCustomizationForm="True" VisibleIndex="1">
                            <PropertiesTextEdit MaxLength="50">
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" 
                            Name="Hidden_id" ShowInCustomizationForm="True" Visible="False" 
                            VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                     <%--   <dx:GridViewDataTextColumn Caption="Process" FieldName="Process" Name="Process" 
                            ShowInCustomizationForm="True" VisibleIndex="2" Width="35%">
                        </dx:GridViewDataTextColumn>--%>

                        
                         <dx:GridViewDataTextColumn Caption="Vehicle Type" FieldName="Vehicle_Type" 
                            Name="Vehicle_Type" ShowInCustomizationForm="True" VisibleIndex="2">
                             <PropertiesTextEdit ClientInstanceName="checkComboBox" MaxLength="50">
                                 <ValidationSettings>
                                     <RequiredField IsRequired="True" />
                                 </ValidationSettings>
                             </PropertiesTextEdit>
                             <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataCheckColumn Caption="4x4" FieldName="Vehicle_4x4" 
                            Name="Vehicle_4x4" ShowInCustomizationForm="True" VisibleIndex="3" Width="50px">
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataTextColumn Caption="Comments" FieldName="Vehicle_Comments" 
                            Name="Vehicle_Comments" ShowInCustomizationForm="True" VisibleIndex="6">
                            <PropertiesTextEdit MaxLength="500">
                            </PropertiesTextEdit>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataComboBoxColumn Caption="Fuel" FieldName="Fuel" Name="Fuel" 
                            ShowInCustomizationForm="True" VisibleIndex="4">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="Diesel" Value="Diesel" />
                                    <dx:ListEditItem Text="Gasoline" Value="Gasoline" />
                                </Items>
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataSpinEditColumn Caption="Lit per 100 km" 
                            FieldName="Lit_per_100_km" Name="Lit_per_100_km" ShowInCustomizationForm="True" 
                            VisibleIndex="5">
                            <PropertiesSpinEdit DisplayFormatString="g" MaxValue="50">
                            </PropertiesSpinEdit>
                            <CellStyle HorizontalAlign="Left">
                            </CellStyle>
                        </dx:GridViewDataSpinEditColumn>

                    </Columns>
                    <SettingsBehavior ColumnResizeMode="NextColumn" 
                        ConfirmDelete="True" AllowFocusedRow="True" />
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
                    <SettingsEditing Mode="Inline" />
                    <Settings ShowGroupPanel="True" ShowFilterRowMenu="True" 
                        ShowGroupedColumns="True" ShowFilterBar="Visible" 
                        ShowHeaderFilterButton="True" ShowFilterRow="True" />
                    <SettingsCookies Enabled="True" Version="6" />
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
                        <ButtonEdit Wrap="True">
                        </ButtonEdit>
                        <CalendarHeader Spacing="11px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <Templates>
                        <DetailRow>
                            

                             <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenu2" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%">
                                <ClientSideEvents ItemClick="function(s, e) 
{
ASPxGridViewVehicleTeam.AddNewRow()
}" />
                                <Items>
                                    <dx:MenuItem Name="AddTeam" Text="New Vehicle to Team Association">
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

                            <dx:ASPxGridView ID="ASPxGridViewVehicleTeam" runat="server" 
                                AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                EnableTheming="True" KeyFieldName="Hidden_team_id" 
                                onbeforeperformdataselect="ASPxGridViewVehicleTeam_BeforePerformDataSelect" 
                                OnCellEditorInitialize="ASPxGridViewVehicleTeam_CellEditorInitialize" 
                                OnRowDeleting="ASPxGridViewVehicleTeam_RowDeleting" 
                                OnRowInserting="ASPxGridViewVehicleTeam_RowInserting" 
                                Theme="Office2003Blue" Width="100%" 
                                 ClientInstanceName="ASPxGridViewVehicleTeam" Font-Size="8pt">
                                <ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}" />
                                <Columns>
                                    <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="70px" ShowDeleteButton="True" ShowClearFilterButton="True"/>
                                    <dx:GridViewDataTextColumn Caption="Updated on" FieldName="Update_date" Name="Update_date" 
                                        ReadOnly="True" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatInEditMode="True" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm">
                                            <ReadOnlyStyle BackColor="WhiteSmoke" ForeColor="#999999">
                                            </ReadOnlyStyle>
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="#999999">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataCheckColumn Caption="Valid Team" FieldName="Valid_Team" 
                                        Name="Valid_Team" ReadOnly="True" VisibleIndex="2" Width="100px">
                                        <PropertiesCheckEdit>
                                            <ReadOnlyStyle BackColor="WhiteSmoke" ForeColor="Gray">
                                            </ReadOnlyStyle>
                                        </PropertiesCheckEdit>
                                    </dx:GridViewDataCheckColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="Assigned to Team" 
                                        FieldName="Team" Name="Team" VisibleIndex="1" Width="40%">
                                        <PropertiesComboBox Spacing="0">
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn Caption="Hidden_ID" FieldName="Hidden_team_id" 
                                        Name="Hidden_team_id" Visible="False" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" 
                                    ConfirmDelete="True" />
                                <SettingsPager AlwaysShowPager="True" PageSize="20" ShowDefaultImages="False">
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
                                <Settings ShowFilterRowMenu="True" />
                                <SettingsCookies Enabled="True" Version="3" />
                                <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                                
                                <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                                    CssPostfix="PlasticBlue">
                                    <Header ImageSpacing="10px" SortingImageSpacing="10px">
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
                                <SettingsCommandButton>
                                    <EditButton Text="Edit CI Group">
                                        <Image Height="10px" ToolTip="Edit Group" Url="~/Images/Edit.png">
                                        </Image>
                                    </EditButton>
                                    <NewButton Text="New CI Group">
                                        <Image Height="10px" ToolTip="New Group" Url="~/Images/Add.png">
                                        </Image>
                                    </NewButton>
                                    <DeleteButton Text="Delete Team Association">
                                        <Image Height="10px" ToolTip="Delete Group" Url="~/Images/Delete.png">
                                        </Image>
                                    </DeleteButton>
                                    <CancelButton Text="Cancel">
                                        <Image Height="18px" ToolTip="Cancel" Url="~/Images/Cancel.png">
                                        </Image>
                                    </CancelButton>
                                    <UpdateButton Text="Update Team Association">
                                        <Image Height="18px" ToolTip="Save Group" Url="~/Images/Save.png">
                                        </Image>
                                    </UpdateButton>
                                    <ClearFilterButton Text="Clear Filter">
                                        <Image Height="20px" Url="~/Images/ClearFilter.png">
                                        </Image>
                                    </ClearFilterButton>
                                </SettingsCommandButton>
                            </dx:ASPxGridView>
                        </DetailRow>
                    </Templates>
                    <SettingsCommandButton>
                        <EditButton Text="Edit CI Group">
                            <Image Height="10px" Url="~/Images/Edit.png" ToolTip="Edit Group">
                            </Image>
                        </EditButton>
                        <NewButton Text="New CI Group">
                            <Image Height="10px" Url="~/Images/Add.png" ToolTip="New Group">
                            </Image>
                        </NewButton>
                        <DeleteButton Text="Delete CI Group">
                            <Image Height="10px" Url="~/Images/Delete.png" ToolTip="Delete Group">
                            </Image>
                        </DeleteButton>
                        <CancelButton Text="Cancel">
                            <Image Height="18px" Url="~/Images/Cancel.png" ToolTip="Cancel">
                            </Image>
                        </CancelButton>
                        <UpdateButton Text="Update CI Group">
                            <Image Height="18px" Url="~/Images/Save.png" ToolTip="Save Group">
                            </Image>
                        </UpdateButton>
                        <ClearFilterButton Text="Clear Filter">
                            <Image Height="18px" Url="~/Images/ClearFilter.png">
                            </Image>
                        </ClearFilterButton>
                    </SettingsCommandButton>
                </dx:ASPxGridView>
                                                    <br />
                                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="8pt" 
                                                        ForeColor="#CC3300" 
                                                        Text="* ID that matches fleet management system's vehicle id" Width="100%">
                                                    </dx:ASPxLabel>
                                                    <br />
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
