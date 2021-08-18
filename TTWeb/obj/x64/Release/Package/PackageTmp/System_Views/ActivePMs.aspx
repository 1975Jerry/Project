<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActivePMs.aspx.cs" Inherits="TTWeb.ActivePMs" %>

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
        .dxeTrackBar, 
.dxeIRadioButton, 
.dxeButtonEdit, 
.dxeTextBox, 
.dxeRadioButtonList, 
.dxeCheckBoxList, 
.dxeMemo, 
.dxeListBox, 
.dxeCalendar, 
.dxeColorTable
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxeTextBox,
.dxeButtonEdit,
.dxeIRadioButton,
.dxeRadioButtonList,
.dxeCheckBoxList
{
    cursor: default;
}

.dxeTextBox,
.dxeMemo
{
	background-color: white;
	border: 1px solid #9f9f9f;
}

.dxeTextBoxSys,
.dxeButtonEditSys 
{
    width: 170px;
}

.dxeTextBoxSys, 
.dxeMemoSys 
{
    border-collapse:separate!important;
}

.dxeTextBox .dxeEditArea
{
	background-color: white;
}

.dxeEditArea
{
	font: 12px Tahoma;
	border: 1px solid #A0A0A0;
}
.dxeEditAreaSys 
{
    height: 14px;
    line-height: 14px;
    border: 0px!important;
	padding: 0px 1px 0px 0px; /* B146658 */
    background-position: 0 0; /* iOS Safari */
}
        .dxtcRightAlignCell_SoftOrange 
{
	text-align: right;
}
        .style10
        {
            font-size: 8pt;
        }
        .dxpcControl_Aqua
{
	font: 12px Tahoma;
	cursor: default;
	color: #000000;
	background-color: #ECF4FE;
	border: 1px Solid #8BB6EF;
	width: 200px;
}

.dxpcHBCell_Aqua {
    padding: 1px 1px 1px 1px;
}
.dxpcCloseButton_Aqua,
.dxpcPinButton_Aqua,
.dxpcRefreshButton_Aqua,
.dxpcCollapseButton_Aqua,
.dxpcMaximizeButton_Aqua
{
	cursor: pointer;
	padding: 1px 1px 1px 1px;
}

.dxpcContent_Aqua
{
	color: #000000;
	background-color: #FFFFFF;
	line-height: 128%;
	white-space: normal;
	border-width: 0px;
	vertical-align: top;
}
.dxpcContentPaddings_Aqua 
{
	padding: 14px 20px 15px;
}
.dxflInternalEditorTable_Aqua {
    width: 100%;
}
        .style11
        {
            height: 26px;
        }
        .style12
        {
            width: 0%;
            height: 26px;
        }
        .style13
        {
            width: 25%;
            height: 26px;
        }
        </style>
</head>
<body style="font-size: 8pt">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <script language="javascript" type="text/javascript">
    function OnGetSelectedFieldValues(selectedValues) {
        for (var i = 0; i < 36; i++) {
            var editor = ASPxGridViewActivePMs.GetEditor(i + 1);
            if (editor != null) {
                if (selectedValues[0][i] == null) {
                    editor.SetText('');
                }
                else {
                    editor.SetText(selectedValues[0][i]);
                }
            }
        }
    }

    function OnGetRowValues(values) {
        popupsri1.Hide();
        popupsri2.Show();

		processedrows.SetText(values[0]);
		errorrows.SetText(values[1]);

}

</script>

    <form id="form1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" 
            CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="Active PMs" 
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
                        <td width="100%" valign="middle" align="left" class="style11">Active VF PMs
                        </td>
                        <td align="right" valign="middle">
                            <dx:ASPxMenu ID="ASPxMenu3" runat="server" 
                                EnableTheming="True" HorizontalAlign="Right" ItemAutoWidth="False" 
                                onitemclick="ASPxMenu3_ItemClick" Theme="Metropolis">
                                <ClientSideEvents ItemClick="function(s, e) {
	 if(e.item.name == &quot;Refresh&quot;) 
	{
	window.pagegrid.Refresh();
    }
}" />
                                <Items>
                                    <dx:MenuItem Name="Export" Text="Export as...">
                                        <Items>
                                            <dx:MenuItem Name="pdf" Text="pdf">
                                            </dx:MenuItem>
                                            <dx:MenuItem Name="xls" Text="xls">
                                            </dx:MenuItem>
                                        </Items>
                                        <Image Height="12px" Url="~/Images/export_ticket.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
                                <RootItemSubMenuOffset FirstItemX="10" LastItemX="10" X="10" />
                                <BackgroundImage ImageUrl="~/Images/back2.png" />
                                <Border BorderStyle="None" />
                            </dx:ASPxMenu>
                        </td>
                        <td align="right" valign="middle" width="80">
                            <dx:ASPxMenu ID="ASPxMenu4" runat="server" EnableTheming="True" 
                                HorizontalAlign="Right" ItemAutoWidth="False" Theme="Metropolis" Width="80px">
                                <ClientSideEvents ItemClick="function(s, e) {
	 if(e.item.name == &quot;Refresh&quot;) 
	{
	window.pagegrid.Refresh();
    }
}" />
                                <Items>
                                    <dx:MenuItem Name="Refresh" Text="Refresh">
                                        <Image Height="12px" Url="~/Images/refresh.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
                                <RootItemSubMenuOffset FirstItemX="10" LastItemX="10" X="10" />
                                <BackgroundImage ImageUrl="~/Images/back2.png" />
                                <Border BorderStyle="None" />
                            </dx:ASPxMenu>
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
                        <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px; padding-left: 0px;" 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenuAttachment" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%" ClientInstanceName="menuAttachment" SeparatorWidth="0px" 
                                OnLoad="ASPxMenuAttachment_Load">
                                <ClientSideEvents ItemClick="function(s, e) {

	 if(e.item.name == &quot;CreateSRI&quot;) 
	{
        popupsri1.Show();
        CallbackSRI.PerformCallback(ASPxGridViewActivePMs.GetRowKey(ASPxGridViewActivePMs.GetFocusedRowIndex()));
    }

	 if(e.item.name == &quot;AddPM&quot;) 
	{          
		ASPxGridViewActivePMs.AddNewRow();
	}
}
                                    " />
                                <Items>
                                    <dx:MenuItem Name="CreateSRI" Text="Create SRI ">
                                        <Image AlternateText="New" Height="12px" Url="~/Images/star.png">
                                        </Image>
                                    </dx:MenuItem>
                                    <dx:MenuItem Name="AddPM" Text="Add PM Ticket">
                                        <Image Height="10px" Url="~/Images/add.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
                                <ItemStyle>
                                <Paddings PaddingRight="0px" />
                                </ItemStyle>
                                <BackgroundImage ImageUrl="~/Images/back2.png" />
                                <BorderRight BorderWidth="0px" />
                            </dx:ASPxMenu>
                        </td>
                    </tr>
                </table>

                </td>
        </tr>
    </table>
                <dx:ASPxGridView runat="server" 
    ClientInstanceName="ASPxGridViewActivePMs" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="PM_ID" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewActivePMs" 
    EnableViewState="False" 
        Theme="Metropolis" style="font-size: 8pt" 
        OnHtmlRowPrepared="ASPxGridViewActivePMs_HtmlRowPrepared" 
        OnRowInserting="ASPxGridViewActivePMs_RowInserting" 
        OnRowDeleting="ASPxGridViewActivePMs_RowDeleting" 
        OnRowUpdating="ASPxGridViewActivePMs_RowUpdating" 
        OnCellEditorInitialize="ASPxGridViewActivePMs_CellEditorInitialize" 
        OnLoad="ASPxGridViewActivePMs_Load">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}"></ClientSideEvents>
<Columns>
    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Name="CommandButtons" Caption=" " ShowEditButton="True" ShowDeleteButton="True"/>
<dx:GridViewDataTextColumn FieldName="SRI" 
        ShowInCustomizationForm="True" Name="SRI" 
        Caption="SRI" VisibleIndex="3" ReadOnly="True" Width="160px">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm">
    <ReadOnlyStyle BackColor="#ECE9D8">
    </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="PM_YEAR" ShowInCustomizationForm="True" 
        Name="PM_YEAR" Caption="Year" VisibleIndex="6" Width="80px">
    <PropertiesTextEdit MaxLength="4">
        <MaskSettings Mask="0000" />
        <ValidationSettings>
            <RequiredField IsRequired="True" />
        </ValidationSettings>
    </PropertiesTextEdit>
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataCheckColumn Caption="To be Scheduled" FieldName="ToBeScheduled" 
        Name="ToBeScheduled" ShowInCustomizationForm="True" VisibleIndex="1" 
        Width="70px">
    </dx:GridViewDataCheckColumn>
<dx:GridViewDataTextColumn FieldName="PM_ID" ShowInCustomizationForm="True" 
        Name="PM_ID" Caption="PM Id" 
        VisibleIndex="2" ReadOnly="True" Width="100px">
    <PropertiesTextEdit>
        <ReadOnlyStyle BackColor="#ECE9D8">
        </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataComboBoxColumn FieldName="PM_TYPE" 
        Name="PM_TYPE" ShowInCustomizationForm="True" VisibleIndex="7" 
        Caption="PM Type" Width="100px">
        <PropertiesComboBox>
            <Items>
                <dx:ListEditItem Text="Shelter" Value="Shelter" />
                <dx:ListEditItem Text="Antenna" Value="Antenna" />
                <dx:ListEditItem Text="Second Visit" Value="Second Visit" />
                <dx:ListEditItem Text="Gen" Value="Gen" />
            </Items>
            <ValidationSettings>
                <RequiredField IsRequired="True" />
            </ValidationSettings>
        </PropertiesComboBox>

    </dx:GridViewDataComboBoxColumn>


        <dx:GridViewDataComboBoxColumn Caption="Name" FieldName="NAME" Name="NAME" 
        ShowInCustomizationForm="True" VisibleIndex="4">
            <PropertiesComboBox IncrementalFilteringDelay="500" 
                IncrementalFilteringMode="Contains">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataComboBoxColumn>




    <dx:GridViewDataTextColumn Caption="Prefecture" FieldName="NOMOS" 
        Name="NOMOS" ShowInCustomizationForm="True" VisibleIndex="10" 
        ToolTip="Restore_Freeze" Visible="False">
    </dx:GridViewDataTextColumn>

            


<dx:GridViewDataTextColumn FieldName="Node_ID" ShowInCustomizationForm="True" 
        Name="Node_ID" Caption="Node Id" VisibleIndex="9" Width="80px">
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>




    <dx:GridViewDataDateColumn Caption="Completed on" FieldName="VISIT_DATE" 
        Name="VISIT_DATE" ShowInCustomizationForm="True" VisibleIndex="8" 
        Width="130px">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy HH:mm" MaxDate="2100-01-01" 
            MinDate="2008-01-01" DisplayFormatInEditMode="True" 
            EditFormatString="dd/MM/yy HH:mm">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>


        <dx:GridViewDataComboBoxColumn Caption="Site type" FieldName="CONTRACT_TYPE" 
        Name="CONTRACT_TYPE" ShowInCustomizationForm="True" VisibleIndex="11" 
        Visible="False">
        <PropertiesComboBox>
            <Items>
                <dx:ListEditItem Text="MACRO-MTX" Value="MACRO-MTX" />
                <dx:ListEditItem Text="MACRO INDOOR" Value="MACRO INDOOR" />
                <dx:ListEditItem Text="MACRO OUTDOOR" Value="MACRO OUTDOOR" />
                <dx:ListEditItem Text="MW REPEATER" Value="MW REPEATER" />
                <dx:ListEditItem Text="MW REPEATER-MTX" Value="MW REPEATER-MTX" />
            </Items>
            <ValidationSettings>
                <RequiredField IsRequired="True" />
            </ValidationSettings>
        </PropertiesComboBox>
    </dx:GridViewDataComboBoxColumn>




    <dx:GridViewDataComboBoxColumn Caption="Severity" FieldName="CRITICALITY" 
        Name="CRITICALITY" ShowInCustomizationForm="True" VisibleIndex="12" 
        Width="120px">
        <PropertiesComboBox DropDownStyle="DropDown">
        </PropertiesComboBox>
        <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataComboBoxColumn Caption="Region" FieldName="Region" 
        Name="Region" ShowInCustomizationForm="True" VisibleIndex="5" 
        Width="120px">
        <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataComboBoxColumn>

            


    <dx:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" 
        Name="Tooltip" ShowInCustomizationForm="True" VisibleIndex="14" 
        Visible="False">
    </dx:GridViewDataTextColumn>

            


    <dx1:GridViewDataTextColumn Caption="Source Id" FieldName="SOURCE_ID" Name="SOURCE_ID" ShowInCustomizationForm="True" VisibleIndex="13" Width="100px">
        <PropertiesTextEdit MaxLength="100">
        </PropertiesTextEdit>
        <Settings AutoFilterCondition="Contains" />
    </dx1:GridViewDataTextColumn>

            


</Columns>

<SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                    AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" 
                    ConfirmDelete="True"></SettingsBehavior>

<SettingsPager PageSize="20" AlwaysShowPager="True" ShowDefaultImages="False">
<AllButton Text="All"></AllButton>

<NextPageButton Text="Next &gt;"></NextPageButton>

<PrevPageButton Text="&lt; Prev"></PrevPageButton>

<PageSizeItemSettings Visible="True"></PageSizeItemSettings>
</SettingsPager>

<SettingsEditing Mode="Inline"></SettingsEditing>

                    <Settings ShowFilterBar="Visible" ShowFilterRowMenu="True" 
                        ShowGroupPanel="True" 
                        ShowHeaderFilterButton="True" ShowFilterRow="True" />

<SettingsCookies Enabled="True" Version="31" StoreColumnsVisiblePosition="False"></SettingsCookies>

                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />


<Styles CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css">
<Header SortingImageSpacing="10px" ImageSpacing="10px" BackColor="#0066CC" 
        ForeColor="White" Wrap="True"></Header>

<FocusedRow BackColor="#FCF9DF" ForeColor="Black">
<BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX"></BackgroundImage>
</FocusedRow>

<CommandColumnItem>
<Paddings PaddingLeft="3px"></Paddings>
</CommandColumnItem>
</Styles>

<StylesEditors>
<CalendarHeader Spacing="11px"></CalendarHeader>

<ProgressBar Height="25px"></ProgressBar>
</StylesEditors>
<SettingsCommandButton>
    <EditButton>
        <Image Height="10px" ToolTip="Edit" Url="~/Images/Edit.png">
        </Image>
    </EditButton>
    <DeleteButton>
        <Image Height="10px" ToolTip="Delete" Url="~/Images/delete.png">
        </Image>
    </DeleteButton>
    <CancelButton>
        <Image Height="18px" ToolTip="Cancel" Url="~/Images/cancel.png">
        </Image>
    </CancelButton>
    <UpdateButton>
        <Image Height="18px" ToolTip="Save" Url="~/Images/Save.png">
        </Image>
    </UpdateButton>
</SettingsCommandButton>
</dx:ASPxGridView>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    <dx:ASPxCallback ID="ASPxCallbackSRI" runat="server" 
        oncallback="ASPxCallbackSRI_Callback" ClientInstanceName="CallbackSRI">
        <ClientSideEvents CallbackComplete="function(s, e) {

if (e.result.split(';')[2] == &quot;no&quot;)
{
	    popupsri1.Hide();
        popupsri2.Show();
		processedrows.SetText(e.result.split(';')[0]);
		errorrows.SetText(e.result.split(';')[1]);
        ASPxGridViewActivePMs.Refresh();
} 
else
{
		popupsri1.Hide();
}
	
}" />
    </dx:ASPxCallback>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" 
        GridViewID="ASPxGridViewActivePMs" Landscape="True" 
        MaxColumnWidth="500" PaperKind="A4">
        <Styles>
            <Default Font-Size="8pt">
            </Default>
        </Styles>
        <PageHeader Left="Active PMs" Right="[Page # of Pages #]">
        </PageHeader>
        <PageFooter Left="TBSP Task Management System" 
            Right="[Date Printed] [Time Printed]">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    <dx:ASPxPopupControl ID="ASPxPopupControlSRI1" runat="server" 
        ClientInstanceName="popupsri1" EnableCallbackAnimation="True" 
        EnableClientSideAPI="True" HeaderText="SRI generation process" Height="100px" 
        Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" 
        PopupVerticalAlign="WindowCenter" Theme="Aqua" 
        Width="300px" ShowCloseButton="False" CloseAction="CloseButton">
        <HeaderStyle Font-Size="Small" />
        <ContentCollection>
<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
    <table class="dxflInternalEditorTable_Aqua">
        <tr>
            <td width="40%" class="style10">
                Genarating SRI identification. Please wait...</td>
        </tr>
    </table>
            </dx:PopupControlContentControl>
</ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="ASPxPopupControlSRI2" runat="server" 
        ClientInstanceName="popupsri2" EnableCallbackAnimation="True" 
        EnableClientSideAPI="True" HeaderText="New SRI generated" Height="100px" 
        Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" 
        PopupVerticalAlign="WindowCenter" Theme="Aqua" 
        Width="300px" CloseAction="CloseButton">
        <HeaderStyle Font-Size="Small" />
        <ContentCollection>
<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
    <table class="dxflInternalEditorTable_Aqua">
        <tr>
            <td width="40%" style="width: 70%">
                <span class="style10">SRI id:<br />  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </span>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" ClientInstanceName="processedrows" 
                    CssClass="style10" Font-Bold="True" Font-Size="8pt" 
                    style="color: #CC0000; font-weight: 700;" Text="0">
                </dx:ASPxLabel>
                &nbsp;<br class="style10" /> <span class="style10">has been assigned for the PM
                </span>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" ClientInstanceName="errorrows" 
                    CssClass="style10" Font-Size="8pt" style="color: #000000; " Text="0">
                </dx:ASPxLabel>
                <span class="style10">. </span></td>
        </tr>
    </table>
            </dx:PopupControlContentControl>
</ContentCollection>
    </dx:ASPxPopupControl>
    </form>
</body>
</html>
