<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddedWindTickets.aspx.cs" Inherits="TTWeb.AddedWindTickets" %>

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
        .style15
        {
            color: #990000;
        }
        .style11
        {
            text-align: right;
            color: #666666;
        }
        .style12
        {
            text-align: right;
            color: #666666;
            }
        .style16
        {
            color: #336699;
        }
        </style>
</head>
<body style="font-size: 8pt">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <script language="javascript" type="text/javascript">
    function OnGetSelectedFieldValues(selectedValues) {
        for (var i = 0; i < 36; i++) {
            var editor = ASPxGridViewAddedWindTickets.GetEditor(i + 1);
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
            GroupBoxCaptionOffsetY="-19px" HeaderText="Active WindTickets" 
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
                        <td width="100%" valign="middle" align="left">Added Wind Tickets
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
        CallbackSRI.PerformCallback(ASPxGridViewAddedWindTickets.GetRowKey(ASPxGridViewAddedWindTickets.GetFocusedRowIndex()));
    }

	 if(e.item.name == &quot;AddWindTicket&quot;) 
	{          
		ASPxGridViewAddedWindTickets.AddNewRow();
	}
}
                                    " />
                                <Items>
                                    <dx:MenuItem Name="AddWindTicket" Text="Add Ticket">
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
    ClientInstanceName="ASPxGridViewAddedWindTickets" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="ID" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewAddedWindTickets" 
    EnableViewState="False" 
        Theme="Metropolis" style="font-size: 8pt" 
        OnHtmlRowPrepared="ASPxGridViewAddedWindTickets_HtmlRowPrepared" 
        OnRowInserting="ASPxGridViewAddedWindTickets_RowInserting" 
        OnRowDeleting="ASPxGridViewAddedWindTickets_RowDeleting" 
        OnRowUpdating="ASPxGridViewAddedWindTickets_RowUpdating" 
        OnLoad="ASPxGridViewAddedWindTickets_Load" 
        
        OnHtmlDataCellPrepared="ASPxGridViewAddedWindTickets_HtmlDataCellPrepared" 
        OnHtmlRowCreated="ASPxGridViewAddedWindTickets_HtmlRowCreated">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}"></ClientSideEvents>
<Columns>
    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Name="CommandButtons" Caption=" " ShowEditButton="True" ShowDeleteButton="True"/>
<dx:GridViewDataTextColumn FieldName="SRI" 
        ShowInCustomizationForm="True" Name="SRI" 
        Caption="SRI" VisibleIndex="5" Width="150px">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm">
    <ReadOnlyStyle BackColor="#ECE9D8">
    </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
    <dx:GridViewDataCheckColumn Caption="To be Scheduled" FieldName="ToBeScheduled" 
        Name="ToBeScheduled" ShowInCustomizationForm="True" VisibleIndex="1" 
        Width="70px" Visible="False">
    </dx:GridViewDataCheckColumn>
<dx:GridViewDataTextColumn FieldName="TT_Id" ShowInCustomizationForm="True" 
        Name="TT_Id" Caption="Ticket ID" VisibleIndex="4" 
        Width="140px">
    <PropertiesTextEdit>
        <ReadOnlyStyle BackColor="#ECE9D8">
        </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>


        <dx:GridViewDataComboBoxColumn Caption="Status" FieldName="Status" Name="Status" 
        ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
<PropertiesComboBox>

    <Items>
        <dx:ListEditItem Text="Active" Value="Active" />
        <dx:ListEditItem Text="Active /S" Value="Active /S" />
        <dx:ListEditItem Text="Active /C" Value="Active /C" />
        <dx:ListEditItem Text="Completed" Value="Completed" />
    </Items>

</PropertiesComboBox>
            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataComboBoxColumn>



        <dx:GridViewDataComboBoxColumn FieldName="Priority" 
        Name="Priority" ShowInCustomizationForm="True" VisibleIndex="3" 
        Width="50px" Caption="Severity">
        <PropertiesComboBox ShowImageInEditBox="True">
            <Items>
                <dx:ListEditItem ImageUrl="~/Images/bullet_red.png" Text=" " Value="EMERGENCY" />
                <dx:ListEditItem ImageUrl="~/Images/bullet_red.png" Text=" " Value="Critical" />
                <dx:ListEditItem ImageUrl="~/Images/bullet_yellow.png" Text=" " Value="P1" />
                <dx:ListEditItem ImageUrl="~/Images/bullet_yellow.png" Text=" " Value="High" />
                <dx:ListEditItem ImageUrl="~/Images/bullet_blue.png" Text=" " Value="Medium" />
                <dx:ListEditItem ImageUrl="~/Images/bullet_green.png" Text=" " Value="P2" />
                <dx:ListEditItem ImageUrl="~/Images/bullet_green.png" Text=" " Value="Low" />
            </Items>
            <ReadOnlyStyle BackColor="#ECE9D8">
            </ReadOnlyStyle>
        </PropertiesComboBox>

                <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False">
                </CellStyle>
    </dx:GridViewDataComboBoxColumn>




    <dx:GridViewDataDateColumn Caption="Event time" FieldName="Event_time" 
        Name="Event_time" ShowInCustomizationForm="True" VisibleIndex="6" 
        Width="110px">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy HH:mm" EditFormat="Custom" 
            EditFormatString="dd/MM/yy HH:mm">
            <TimeSectionProperties Visible="True">
            </TimeSectionProperties>
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>

            


    <dx:GridViewDataComboBoxColumn Caption="BSC" FieldName="BSC" 
        Name="BSC" ShowInCustomizationForm="True" VisibleIndex="21" 
        Width="60px" Visible="False">
        <PropertiesComboBox DropDownStyle="DropDown" IncrementalFilteringDelay="300" 
            IncrementalFilteringMode="Contains">
        </PropertiesComboBox>
        <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataComboBoxColumn>

            


    <dx:GridViewDataComboBoxColumn Caption="Site" FieldName="Object" Name="Object" 
        ShowInCustomizationForm="True" VisibleIndex="7" Width="200px">
        <PropertiesComboBox DropDownStyle="DropDown" IncrementalFilteringDelay="500" 
            IncrementalFilteringMode="Contains">
        </PropertiesComboBox>
        <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataComboBoxColumn>

            


    <dx:GridViewDataComboBoxColumn Caption="Region" FieldName="Region" 
        Name="Region" ShowInCustomizationForm="True" VisibleIndex="9" Width="90px" 
        Visible="False">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>

            


    <dx:GridViewDataComboBoxColumn Caption="Problem" FieldName="Problem" 
        Name="Problem" ShowInCustomizationForm="True" VisibleIndex="10">
        <PropertiesComboBox DropDownStyle="DropDown" IncrementalFilteringDelay="500" 
            IncrementalFilteringMode="Contains">
            <ReadOnlyStyle BackColor="#ECE9D8">
            </ReadOnlyStyle>
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>

            


    <dx:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" Name="Tooltip" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="22">
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataTextColumn Caption="ID" FieldName="ID" Name="ID" 
        ShowInCustomizationForm="True" VisibleIndex="20" Visible="False">
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataTextColumn Caption="Zone" FieldName="Zone" Name="Zone" 
        ShowInCustomizationForm="True" VisibleIndex="8" Width="50px" 
        Visible="False">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Comments" FieldName="Comments" 
        Name="Comments" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="19">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataDateColumn Caption="TT_receive_time" 
        FieldName="TT_receive_time" Name="TT_receive_time" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
        <PropertiesDateEdit DisplayFormatString="">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>
    <dx:GridViewDataDateColumn Caption="Repair_time" FieldName="Repair_time" 
        Name="Repair_time" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="17">
        <PropertiesDateEdit DisplayFormatString="">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>

            


    <dx:GridViewDataDateColumn Caption="Submit_date" FieldName="Submit_date" 
        Name="Submit_date" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="11">
        <PropertiesDateEdit DisplayFormatString="">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>
    <dx:GridViewDataDateColumn Caption="Vendor_resolution_date" 
        FieldName="Vendor_resolution_date" Name="Vendor_resolution_date" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
        <PropertiesDateEdit DisplayFormatString="">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>
    <dx:GridViewDataDateColumn Caption="Actual_resolution_date" 
        FieldName="Actual_resolution_date" Name="Actual_resolution_date" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
        <PropertiesDateEdit DisplayFormatString="">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>

            


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

                    <Settings ShowFilterBar="Visible" ShowFilterRowMenu="True" 
                        ShowGroupPanel="True" 
                        ShowHeaderFilterButton="True" ShowFilterRow="True" />

<SettingsCookies Enabled="True" Version="14" StoreColumnsVisiblePosition="False"></SettingsCookies>

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
                    <Templates>
                        <EditForm>
                            <table cellpadding="0" cellspacing="0" class="dxflInternalEditorTable" 
                                width="100%">
                                <tr>
                                    <td style="border-top: 2px solid #000066; text-align: right; padding-top: 8px; padding-bottom: 8px; border-top-style: solid; border-bottom-style: none; border-width: 2px 2px 1px 2px; border-color: #000066 #000066 #808080 #000066; padding-right: 2px;" 
                                        width="120">
                                        <span class="style15">* </span>ID:</td>
                                    <td style="border-top-style: solid; border-width: 2px 1px 1px 2px; border-color: #000066 #808080 #808080 #000066; padding-top: 8px; padding-bottom: 8px; border-right-style: none; border-bottom-style: none;">
                                        <dx:ASPxTextBox ID="ASPxTextBoxID" runat="server" BackColor="#F9FCFF" 
                                            EnableTheming="True" Font-Bold="True" Font-Size="8pt" 
                                            Text='<%# Bind("TT_Id") %>' Theme="Aqua" Width="200px">
                                            <ReadOnlyStyle BackColor="#F4F4F4">
                                            </ReadOnlyStyle>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="border-top: 2px solid #000066; padding-right: 2px; padding-top: 8px; padding-bottom: 8px; background-color: #EAF4FF; text-align: right; border-left-color: #000066; border-left-width: 2px; border-right-color: #000066; border-right-width: 2px; border-bottom-color: #000066; border-bottom-width: 2px;" 
                                        width="300">
                                        &nbsp;</td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066; background-color: #EAF4FF;">
                                        <dx:ASPxCheckBox ID="ASPxCheckBoxToBeScheduled" runat="server" 
                                            CheckState="Unchecked" ClientVisible="False" Font-Bold="True" Font-Size="8pt" 
                                            style="font-size: 8pt" Theme="Metropolis" Value='<%# Bind("ToBeScheduled") %>'>
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066; padding-top: 8px; padding-bottom: 8px; background-color: #EAF4FF;" 
                                        width="80">
                                        &nbsp;</td>
                                    <td style="padding: 4px; border-right-style: solid; border-width: 2px 1px 1px 1px; border-color: #000066; border-top-style: solid; text-align: right; background-color: #EAF4FF;" 
                                        width="30%">
                                        <dx:ASPxImage ID="ASPxImage1" runat="server" Height="22px" 
                                            ImageUrl="~/Images/Edit.png">
                                        </dx:ASPxImage>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-bottom: 8px; background-color: #EAF4FF; padding-top: 3px;" 
                                        valign="middle">
                                        <span class="style15">* </span>Severity:</td>
                                    <td style="background-color: #EAF4FF; padding-right: 2px; padding-bottom: 8px; padding-left: 2px; padding-top: 3px;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxPriority" runat="server" BackColor="#F9FCFF" 
                                            ClientInstanceName="projectcombo" EnableTheming="True" Font-Bold="True" 
                                            Font-Size="8pt" ForeColor="#003399" Text='<%# Bind("Priority") %>' Theme="Aqua" 
                                            Width="200px">
                                            <Items>
                                                <dx:ListEditItem Text="Critical" Value="Critical" />
                                                <dx:ListEditItem Text="High" Value="High" />
                                                <dx:ListEditItem Text="Medium" Value="Medium" />
                                                <dx:ListEditItem Text="Low" Value="Low" />
                                                <dx:ListEditItem Text="EMERGENCY" Value="EMERGENCY" />
                                                <dx:ListEditItem Text="P1" Value="P1" />
                                                <dx:ListEditItem Text="P2" Value="P2" />
                                            </Items>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style11" 
                                        style="padding-right: 2px; background-color: #EAF4FF; padding-bottom: 8px; padding-top: 3px;" 
                                        valign="middle">
                                        <span class="style15">* </span>Status:</td>
                                    <td style="background-color: #EAF4FF; padding-bottom: 8px; padding-top: 3px;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxStatus" runat="server" BackColor="#F9FCFF" 
                                            EnableTheming="True" Font-Bold="True" Font-Size="8pt" 
                                            Text='<%# Bind("Status") %>' Theme="Aqua" Width="200px">
                                            <Items>
                                                <dx:ListEditItem Text="Active" Value="Active" />
                                                <dx:ListEditItem Text="Active /S" Value="Active /S" />
                                                <dx:ListEditItem Text="Completed" Value="Completed" />
                                            </Items>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style11" 
                                        style="border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #EAF4FF; border-bottom-style: none; padding-bottom: 8px; border-top-style: none; border-left-style: none; padding-top: 3px;" 
                                        valign="middle">
                                        SRI:</td>
                                    <td style="border-style: none solid none none; border-width: 1px; border-color: #808080 #000066 #808080 #000080; background-color: #EAF4FF; padding-bottom: 8px; padding-top: 3px;">
                                        <dx:ASPxTextBox ID="ASPxTextBoxSRI" runat="server" BackColor="#F9FCFF" 
                                            EnableTheming="True" Font-Size="8pt" Text='<%# Bind("SRI") %>' Theme="Aqua" 
                                            Width="200px" ForeColor="Black">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-top: 5px; padding-bottom: 4px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        <span class="style15">*</span> Site:</td>
                                    <td style="padding: 5px 2px 4px 2px; background-color: #FFFFE6;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxSite" runat="server" BackColor="#FFFFE6" 
                                            ClientInstanceName="combosite" Font-Bold="False" Font-Size="8pt" 
                                            IncrementalFilteringDelay="500" IncrementalFilteringMode="Contains" 
                                            Theme="Aqua" Value='<%# Bind("Object") %>' 
                                            Width="200px">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style11" 
                                        style="padding-right: 2px; background-color: #FFFBFF; padding-bottom: 4px; padding-top: 3px;" 
                                        valign="middle">
                                        <span class="style15">* </span>Problem:</td>
                                    <td colspan="3" 
                                        
                                        style="border-width: 1px; border-color: #000066; background-color: #FFFBFF; padding-bottom: 4px; border-right-style: solid; padding-top: 3px;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxProblem" runat="server" BackColor="#FFFBFF" 
                                            ClientInstanceName="combodescription" DropDownStyle="DropDown" 
                                            EnableTheming="True" Font-Bold="False" Font-Size="8pt" MaxLength="100" 
                                            Text='<%# Bind("Problem") %>' 
                                            Theme="Aqua" Width="95%">
                                            <ItemStyle VerticalAlign="Top" />
                                            <ListBoxStyle VerticalAlign="Top" Wrap="True">
                                            </ListBoxStyle>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 5px; padding-bottom: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        &nbsp;BSC:</td>
                                    <td class="style13" 
                                        style="padding: 5px 2px 2px 2px; background-color: #FFFFE6;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxBSC" runat="server" BackColor="#FFFFE6" 
                                            EnableTheming="True" Font-Size="8pt" Text='<%# Bind("BSC") %>' Theme="Aqua" 
                                            Width="200px" DropDownStyle="DropDown" IncrementalFilteringDelay="300" 
                                            IncrementalFilteringMode="Contains">
                                            <Items>
                                                <dx:ListEditItem Text="Mainland" Value="Mainland" />
                                                <dx:ListEditItem Text="Island" Value="Island" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style12" 
                                        style="padding-right: 2px; background-color: #FFFBFF; padding-top: 5px; padding-bottom: 2px;" 
                                        valign="middle">
                                        <span class="style15">* </span>Event time:</td>
                                    <td style="background-color: #FFFBFF; padding-top: 5px; padding-bottom: 2px;">
                                        <dx:ASPxDateEdit ID="ASPxDateEditEventTime" runat="server" BackColor="#FFFBFF" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" Font-Size="8pt" Theme="Aqua" 
                                            Value='<%# Bind("Event_time") %>' Width="200px" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF; padding-top: 5px;" 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td class="style13" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td class="style13" style="padding: 2px; background-color: #FFFFE6;">
                                        &nbsp;</td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        Submit time:</td>
                                    <td class="style13" style="background-color: #FFFBFF; padding-top: 5px;">
                                        <dx:ASPxDateEdit ID="ASPxDateEditSubmit_date" runat="server" 
                                            BackColor="#FFFBFF" DisplayFormatString="dd/MM/yyyy HH:mm" 
                                            EditFormat="DateTime" EditFormatString="dd/MM/yyyy HH:mm" Font-Size="8pt" 
                                            Theme="Aqua" Value='<%# Bind("Submit_date") %>' Width="200px">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td class="style13" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td class="style13" style="padding: 2px; background-color: #FFFFE6;">
                                        &nbsp;</td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        Vendor resolution:</td>
                                    <td class="style13" style="background-color: #FFFBFF; padding-top: 5px;">
                                        <dx:ASPxDateEdit ID="ASPxDateEditVendor_resolution_date" runat="server" 
                                            BackColor="#FFFBFF" DisplayFormatString="dd/MM/yyyy HH:mm" 
                                            EditFormat="DateTime" EditFormatString="dd/MM/yyyy HH:mm" Font-Size="8pt" 
                                            Theme="Aqua" Value='<%# Bind("Vendor_resolution_date") %>' Width="200px">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td class="style13" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td class="style13" style="padding: 2px; background-color: #FFFFE6;">
                                        &nbsp;</td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        Actual resolution:</td>
                                    <td class="style13" style="background-color: #FFFBFF; padding-top: 5px;">
                                        <dx:ASPxDateEdit ID="ASPxDateEditActual_resolution_date" runat="server" 
                                            BackColor="#FFFBFF" DisplayFormatString="dd/MM/yyyy HH:mm" 
                                            EditFormat="DateTime" EditFormatString="dd/MM/yyyy HH:mm" Font-Size="8pt" 
                                            Theme="Aqua" Value='<%# Bind("Actual_resolution_date") %>' Width="200px">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td class="style13" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="5" style="padding-right: 2px; text-align: left;">
                                        <dx:ASPxGridViewTemplateReplacement ID="TempRep" runat="server" 
                                            ReplacementType="EditFormUpdateButton" />
                                        <dx:ASPxGridViewTemplateReplacement ID="TempRep2" runat="server" 
                                            ReplacementType="EditFormCancelButton" />
                                    </td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066" 
                                        valign="top">
                                        <span class="style15">* </span><span class="style16">mandatory<br /> </span>
                                        <span style="font-family: 'Segoe UI'; font-size: 11.111111640930176px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">
                                        <span class="style15">**</span></span><span class="style16"><span 
                                            style="color: rgb(255, 153, 51); font-family: 'Segoe UI'; font-size: 11.111111640930176px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">
                                        </span>
                                        <span style="font-family: 'Segoe UI'; font-size: 11.111111640930176px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">
                                        Attention: when Uploading tickets, the specific ticket will be automatically 
                                        updated based on the TT Id value.</span></span></td>
                                </tr>
                            </table>
                        </EditForm>
                    </Templates>
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
                            <Image Height="24px" ToolTip="Cancel" Url="~/Images/cancel.png">
                            </Image>
                        </CancelButton>
                        <UpdateButton>
                            <Image Height="24px" ToolTip="Save" Url="~/Images/Save.png">
                            </Image>
                        </UpdateButton>
                    </SettingsCommandButton>
</dx:ASPxGridView>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" 
        GridViewID="ASPxGridViewAddedWindTickets" Landscape="True" 
        MaxColumnWidth="500" PaperKind="A4">
        <Styles>
            <Default Font-Size="8pt">
            </Default>
        </Styles>
        <PageHeader Left="Added Wind Tickets" Right="[Page # of Pages #]">
        </PageHeader>
        <PageFooter Left="TBSP Task Management System" 
            Right="[Date Printed] [Time Printed]">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
