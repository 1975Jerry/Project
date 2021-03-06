<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoutingPath.aspx.cs" Inherits="TTWeb.RoutingPath" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>







<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
                
.dxeTextBoxSys,
.dxeButtonEditSys 
{
    width: 170px;
}

.dxeEditAreaSys 
{
    height: 14px;
    line-height: 14px;
    border: 0px!important;
	padding: 0px 1px 0px 0px; /* B146658 */
    background-position: 0 0; /* iOS Safari */
}
.dxeTextBoxSys, 
.dxeMemoSys 
{
    border-collapse:separate!important;
            font-size: 8pt;
            color: #666666;
        }

        .imagePreviewCell
        {
            text-align: left;
        }
        .dxeBase
{
	font: 12px Tahoma;
}
        </style>
</head>
<body>
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" 
            ClientIDMode="AutoID" CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" 
            CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" 
            SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" 
            EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px" 
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
                        <td width="100%" valign="middle" align="left">Routing Path Configuration
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
                                <ClientSideEvents ItemClick="function(s, e) {
	gridviewRoutingPath.AddNewRow()

		
}" />
                                <Items>
                                    <dx:MenuItem Name="NewRoutingPath" Text="New Routing Path">
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
                <dx:ASPxGridView ID="ASPxGridViewRoutingPath" runat="server" 
                    AutoGenerateColumns="False" ClientIDMode="AutoID" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" KeyFieldName="Hidden_id" Width="100%" 
                    EnableViewState="true" 
                    OnCellEditorInitialize="ASPxGridViewRoutingPath_CellEditorInitialize" 
                    OnRowDeleting="ASPxGridViewRoutingPath_RowDeleting" 
                    OnRowInserting="ASPxGridViewRoutingPath_RowInserting" 
                    OnRowUpdating="ASPxGridViewRoutingPath_RowUpdating" 
                    ClientInstanceName="gridviewRoutingPath" 
                    OnCustomJSProperties="ASPxGridViewRoutingPath_CustomJSProperties" 
                    style="text-align: center" PreviewFieldName="Condition" Theme="Metropolis">


                    <Styles>
                        <Header SortingImageSpacing="10px" ImageSpacing="10px" BackColor="#0066CC" 
                            ForeColor="White"></Header>

                        <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                        <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX"></BackgroundImage>
                        </FocusedRow>

                        <CommandColumnItem>
                            <Paddings PaddingLeft="3px"/>
                        </CommandColumnItem>
                    </Styles>

                    <ClientSideEvents CallbackError="function(s, e) {
	if (s.Editing)
	{
		buttonCancel.SetEnabled(true);
		buttonSave.SetEnabled(true);
		buttonUpdate.SetEnabled(false);
		buttonNew.SetEnabled(false);
        buttonDelete.SetEnabled(false);
        s.Editing = false;
	}
}" Init="function(s, e) {
	window.pagegrid = s;
}" />


                    <Columns>

                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="80px" ButtonType="Image" ShowEditButton="True" ShowDeleteButton="True" ShowClearFilterButton="True"/>

                        <dx:GridViewDataComboBoxColumn Caption="From Team / Role" FieldName="From_Team" 
                            Name="From_Team" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%" >
                            <PropertiesComboBox ValueType="System.Int32" Spacing="0">
                                <ClientSideEvents Validation="function(s, e) {
        
    }" />
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="To Team / Role" FieldName="To_Team" 
                            Name="To_Team" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%">
                            <PropertiesComboBox ValueType="System.Int32" Spacing="0">
                                <ClientSideEvents Validation="function(s, e) {
                                
	    
}" />
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
                        </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn Caption="Condition (*)" ShowInCustomizationForm="True" 
                                VisibleIndex="3" FieldName="Condition" Name="Condition">
                                <Settings AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn Caption="Verify Completion" 
                            FieldName="Verify_Completion_Team" Name="Verify_Completion_Team" 
                            ShowInCustomizationForm="True" VisibleIndex="4" Width="12%">
                            <PropertiesCheckEdit>
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesCheckEdit>
                        </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Process" FieldName="Process" 
                                Name="Process" ShowInCustomizationForm="True" VisibleIndex="9" 
                                Width="100px">
                                <PropertiesComboBox ClientInstanceName="checkComboBox" 
                                    EnableClientSideAPI="True" Spacing="0">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesComboBox>
                                <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
                            </dx:GridViewDataComboBoxColumn>

                            <dx:GridViewDataCheckColumn Caption="Cancel Right" FieldName="Cancel_team" 
                                Name="Cancel_team" ShowInCustomizationForm="True" VisibleIndex="6" 
                                Width="10%">
                            </dx:GridViewDataCheckColumn>

                            <dx:GridViewDataCheckColumn Caption="Valid?" FieldName="Valid_flg" 
                                Name="Valid_flg" ShowInCustomizationForm="True" VisibleIndex="7" Width="8%">
                            </dx:GridViewDataCheckColumn>

                        <dx:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" 
                            Name="Hidden_id" ShowInCustomizationForm="True" Visible="False" 
                            VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Hidden_from_team_id" 
                            FieldName="Hidden_from_team_id" Name="Hidden_from_team_id" 
                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Hidden_to_team_id" 
                            FieldName="Hidden_to_team_id" Name="Hidden_to_team_id" 
                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn Caption="Approve Only" FieldName="Approve_only" 
                                Name="Approve_only" ShowInCustomizationForm="True" VisibleIndex="5" 
                                Width="10%">
                            </dx:GridViewDataCheckColumn>
                    </Columns>
                    <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" 
                        AllowFocusedRow="True" />
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
                    <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterRowMenu="True" 
                        ShowGroupedColumns="True" ShowFilterBar="Visible" />
                    <SettingsCookies Enabled="True" Version="8" />
                    <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                        CssPostfix="PlasticBlue">
                        <Header ImageSpacing="10px" SortingImageSpacing="10px">
                        </Header>
                        <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                        <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                        </FocusedRow>

<CommandColumnItem>
<Paddings PaddingLeft="3px"></Paddings>
</CommandColumnItem>
                    </Styles>

                    <StylesEditors>
                        <CalendarHeader Spacing="11px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <Templates>
                        <PreviewRow>
                            Test
                        </PreviewRow>
                    </Templates>
                    <SettingsCommandButton>
                        <EditButton Text="Edit Routing">
                            <Image Height="10px" Url="~/Images/Edit.png" ToolTip="Edit Group">
                            </Image>
                        </EditButton>
                        <NewButton Text="New Routing">
                            <Image Height="10px" Url="~/Images/Add.png" ToolTip="New Group">
                            </Image>
                        </NewButton>
                        <DeleteButton Text="Delete Routing">
                            <Image Height="10px" Url="~/Images/Delete.png" ToolTip="Delete Group">
                            </Image>
                        </DeleteButton>
                        <CancelButton Text="Cancel">
                            <Image Height="18px" Url="~/Images/Cancel.png" ToolTip="Cancel">
                            </Image>
                        </CancelButton>
                        <UpdateButton Text="Update">
                            <Image Height="18px" Url="~/Images/Save.png" ToolTip="Save Group">
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
        <tr>
            <td width="100%">
                <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="75px" Text="(*) Valid conditions contains field @Status, @Priority and operators =, !=, &lt;, &gt;, AND, OR, (), like ' ', not like ' ' (where special character * represents any string of zero or more characters). Constants must be enclosed in single quotes (' '). 

For example: @Priority = 'Low' and (@Status like '*Off')

&gt; @Status values: Initiating, Active, Sign Off
&gt; @Priority will be evaluated for each Ticket 
&gt; Not specified condition evaluates to true " 
                    Width="100%" ForeColor="#666666">
                </dx:ASPxMemo>
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
