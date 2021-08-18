<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagementTicketsReport.aspx.cs" Inherits="TTWeb.ManagementTicketsReport" %>

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
            font-size: 8pt;
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
        .style2
        {
            font-size: 8pt;
            color: #999999;
        }
        </style>
</head>
<body style="font-size: 8pt">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <script language="javascript" type="text/javascript">
    function OnGetSelectedFieldValues(selectedValues) {
        for (var i = 0; i < 36; i++) {
            var editor = ASPxGridViewManagementTicketsReport.GetEditor(i + 1);
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
            GroupBoxCaptionOffsetY="-19px" HeaderText="Active MoreTickets" 
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
                        <td width="100%" valign="middle" align="left">Daily Tickets Report Management
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
                        <td style="padding-right: 4px; border-right-width: 0px; margin-right: 0px; padding-left: 10px; width: 0%;" 
                            class="style2">
                            Date:</td>
                        <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px; padding-left: 0px; width: 0%;">
                            <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" 
                                ClientInstanceName="dateedit" DisplayFormatString="dd/MM/yyyy" 
                                EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableTheming="True" 
                                Font-Size="8pt" OnInit="ASPxDateEdit1_Init" Theme="Metropolis" 
                                Width="100px" Font-Bold="True">
                                <ClientSideEvents DateChanged="function(s, e) {


var dt = s.GetValue();

var dateobj = dt.getFullYear() + &quot;-&quot; + (dt.getMonth() + 1) + &quot;-&quot; + dt.getDate();

ASPxGridViewManagementTicketsReport.PerformCallback(dateobj+';'+'DC');

}" />
                            </dx:ASPxDateEdit>
                        </td>
                        <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px; padding-left: 0px; width: 0%;">
                            <dx:ASPxMenu ID="ASPxMenuAttachment" runat="server" 
                                ClientInstanceName="menuAttachment" ItemAutoWidth="False" 
                                OnLoad="ASPxMenuAttachment_Load" SeparatorWidth="0px" Theme="Metropolis" Width="220px">
                                <ClientSideEvents ItemClick="function(s, e) {

	 if(e.item.name == &quot;UploadTickets&quot;) 
	{
		var dt = dateedit.GetValue();
		if(!dt)
		{
			alert('Please select date first!');
		}
		else
		{	
		var dateobj = dt.getFullYear() + &quot;-&quot; + (dt.getMonth() + 1) + &quot;-&quot; + dt.getDate();
		ASPxGridViewManagementTicketsReport.PerformCallback(dateobj+';'+'UP');
		}
	}

	 if(e.item.name == &quot;AddTicket&quot;) 
	{          
        var cmbDate = dateedit.GetValue();
		if(!cmbDate)
		{
			alert('Please select date first!');
		}
		else
		{
			ASPxGridViewManagementTicketsReport.AddNewRow();
		}
	}
}
                                    

" />
                                <Items>
                                    <dx:MenuItem Name="UploadTickets" Text="Upload Tickets">
                                        <Image AlternateText="New" Height="12px" Url="~/Images/refresh.png">
                                        </Image>
                                        <ItemStyle Width="120px" />
                                    </dx:MenuItem>
                                    <dx:MenuItem Name="AddTicket" Text="Add a Ticket">
                                        <Image Height="10px" Url="~/Images/add.png">
                                        </Image>
                                        <ItemStyle Width="100px" />
                                    </dx:MenuItem>
                                </Items>
                                <ItemStyle>
                                <Paddings PaddingRight="0px" />
                                </ItemStyle>
                                <BackgroundImage ImageUrl="~/Images/back2.png" />
                                <BorderRight BorderWidth="0px" />
                            </dx:ASPxMenu>
                        </td>
                        <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px; padding-left: 2px; width: 0%; background-image: ~/Images/back2.png; background-repeat: repeat;">
                            &nbsp;</td>
                        <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px; padding-left: 5px; width: 100%; background-image: ~/Images/back2.png; background-repeat: repeat;" 
                            width="100%">
                            &nbsp;</td>
                    </tr>
                </table>

                </td>
        </tr>
    </table>
                <dx:ASPxGridView runat="server" 
    ClientInstanceName="ASPxGridViewManagementTicketsReport" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="SCH_ITEM_TICKET_ID" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewManagementTicketsReport" 
    EnableViewState="False" 
        Theme="Metropolis" style="font-size: 8pt" 
        OnHtmlRowPrepared="ASPxGridViewManagementTicketsReport_HtmlRowPrepared" 
        OnRowInserting="ASPxGridViewManagementTicketsReport_RowInserting" 
        OnRowDeleting="ASPxGridViewManagementTicketsReport_RowDeleting" 
        OnRowUpdating="ASPxGridViewManagementTicketsReport_RowUpdating" 
        OnLoad="ASPxGridViewManagementTicketsReport_Load" 
        
        
        
        OnCellEditorInitialize="ASPxGridViewManagementTicketsReport_CellEditorInitialize1" 
        OnCustomCallback="ASPxGridViewManagementTicketsReport_CustomCallback" 
        OnHtmlDataCellPrepared="ASPxGridViewManagementTicketsReport_HtmlDataCellPrepared">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}" RowDblClick="function(s, e) {

}"></ClientSideEvents>
<Columns>
    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Name="CommandButtons" Caption=" " FixedStyle="Left" ShowEditButton="True" ShowDeleteButton="True"/>
    <dx:GridViewDataComboBoxColumn Caption="For Team" FieldName="TEAM" 
        Name="TEAM" ShowInCustomizationForm="True" VisibleIndex="23" 
        Width="90px">
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataComboBoxColumn Caption="Source" FieldName="TICKET_SOURCE" 
        Name="TICKET_SOURCE" ShowInCustomizationForm="True" VisibleIndex="3" 
        Width="100px">
        <PropertiesComboBox DisplayFormatInEditMode="True" 
            DisplayFormatString="dd/MM/yy HH:mm" DropDownStyle="DropDown" 
            IncrementalFilteringDelay="300" IncrementalFilteringMode="Contains" 
            MaxLength="30">
            <ReadOnlyStyle BackColor="WhiteSmoke">
            </ReadOnlyStyle>
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataCheckColumn Caption="SCH_ITEM_TICKET_ID" FieldName="SCH_ITEM_TICKET_ID" 
        Name="SCH_ITEM_TICKET_ID" ShowInCustomizationForm="True" VisibleIndex="32" 
        Visible="False">
    </dx:GridViewDataCheckColumn>
    <dx:GridViewDataComboBoxColumn Caption="Site/Cell" FieldName="SITE_CELL" 
        Name="SITE_CELL" ShowInCustomizationForm="True" VisibleIndex="12" 
        Width="60px">
        <PropertiesComboBox DropDownStyle="DropDown" 
            IncrementalFilteringMode="Contains">
            <Items>
                <dx:ListEditItem Text="Site" Value="Site" />
                <dx:ListEditItem Text="Cell" Value="Cell" />
            </Items>
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataCheckColumn Caption="Access?" FieldName="ACCESS" Name="ACCESS" 
        ShowInCustomizationForm="True" VisibleIndex="14" Width="60px">
        <PropertiesCheckEdit DisplayTextChecked="Yes" DisplayTextUnchecked=" ">
        </PropertiesCheckEdit>
    </dx:GridViewDataCheckColumn>
    <dx:GridViewDataCheckColumn Caption="Leased Lines?" FieldName="LEASED_LINES" 
        Name="LEASED_LINES" ShowInCustomizationForm="True" VisibleIndex="13" 
        Width="60px">
        <PropertiesCheckEdit DisplayTextChecked="Yes" DisplayTextUnchecked=" ">
        </PropertiesCheckEdit>
    </dx:GridViewDataCheckColumn>
    <dx:GridViewDataCheckColumn Caption="Spares?" FieldName="SPARES" Name="SPARES" 
        ShowInCustomizationForm="True" VisibleIndex="15" Width="60px">
        <PropertiesCheckEdit DisplayTextChecked="Yes" DisplayTextUnchecked=" ">
        </PropertiesCheckEdit>
    </dx:GridViewDataCheckColumn>
    <dx:GridViewDataTextColumn Caption="Schedule date" FieldName="SCHEDULE_DATE" Name="SCHEDULE_DATE" 
        ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" 
        Visible="False">
        <PropertiesTextEdit>
            <ReadOnlyStyle BackColor="#F4F4F4">
            </ReadOnlyStyle>
        </PropertiesTextEdit>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="ID" ShowInCustomizationForm="True" 
        Name="ID" Caption="Task Id" 
        VisibleIndex="22" Width="60px">
    <PropertiesTextEdit MaxLength="30">
        <ReadOnlyStyle BackColor="#F4F4F4">
        </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataTextColumn>

<dx:GridViewDataTextColumn FieldName="SITE" ShowInCustomizationForm="True" 
        Name="SITE" Width="220px" Caption="Site" VisibleIndex="4">

<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>
</dx:GridViewDataTextColumn>
    <dx:GridViewDataComboBoxColumn Caption="Engineer 2" FieldName="ENGINEER2" 
        Name="ENGINEER2" ShowInCustomizationForm="True" VisibleIndex="25">
        <PropertiesComboBox MaxLength="100" IncrementalFilteringMode="Contains">
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataTextColumn Caption="Ticket Id" FieldName="TT_ID" 
        FixedStyle="Left" Name="TT_ID" ShowInCustomizationForm="True" 
        VisibleIndex="2" Width="100px">
        <PropertiesTextEdit MaxLength="500">
        </PropertiesTextEdit>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
        <FilterCellStyle>
            <BorderRight BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="2px" />
        </FilterCellStyle>
        <CellStyle>
            <BorderRight BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="2px" />
        </CellStyle>
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataComboBoxColumn Caption="Engineer" FieldName="ENGINEER" 
        Name="ENGINEER" ShowInCustomizationForm="True" VisibleIndex="24">
        <PropertiesComboBox DisplayFormatInEditMode="True" 
            DisplayFormatString="dd/MM/yyyy HH:mm" IncrementalFilteringMode="Contains">
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>

    <dx:GridViewDataComboBoxColumn FieldName="PRIORITY" 
        Name="PRIORITY" ShowInCustomizationForm="True" VisibleIndex="5" 
        Caption="Priority" Width="80px">

        <PropertiesComboBox DropDownStyle="DropDown" 
            IncrementalFilteringMode="Contains">
        </PropertiesComboBox>

    </dx:GridViewDataComboBoxColumn>


        <dx:GridViewDataComboBoxColumn Caption="Status" FieldName="STATUS" Name="STATUS" 
        ShowInCustomizationForm="True" VisibleIndex="6" Width="80px">
            <PropertiesComboBox DropDownStyle="DropDown" 
                IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataComboBoxColumn>




    <dx:GridViewDataComboBoxColumn Caption="Ticket Type" FieldName="TICKET_TYPE" 
        Name="TICKET_TYPE" ShowInCustomizationForm="True" VisibleIndex="7" 
        Width="80px">
        <PropertiesComboBox DropDownStyle="DropDown" 
            IncrementalFilteringMode="Contains">
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>

            


    <dx:GridViewDataComboBoxColumn Caption="Geogr. Location" FieldName="GEOGRAPHICAL_LOCATION" 
        Name="GEOGRAPHICAL_LOCATION" ShowInCustomizationForm="True" VisibleIndex="8" 
        Width="90px">
        <PropertiesComboBox IncrementalFilteringDelay="300" 
            IncrementalFilteringMode="Contains" DropDownStyle="DropDown">
        </PropertiesComboBox>
        <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>




    <dx:GridViewDataComboBoxColumn Caption="Visit?" FieldName="VISIT" Name="VISIT" 
        ShowInCustomizationForm="True" VisibleIndex="9" Width="70px">
        <PropertiesComboBox IncrementalFilteringMode="Contains">
            <Items>
                <dx:ListEditItem Text="Yes" Value="Yes" />
                <dx:ListEditItem Text="No" Value="No" />
                <dx:ListEditItem Text="Pending" Value="Pending" />
            </Items>
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>




    <dx:GridViewDataTextColumn Caption="Site Comments" FieldName="SITE_COMMENTS" 
        Name="SITE_COMMENTS" ShowInCustomizationForm="True" 
        VisibleIndex="19" Width="300px">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataTextColumn Caption="Event" FieldName="EVENT" Name="EVENT" 
        ShowInCustomizationForm="True" VisibleIndex="17" Width="220px">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataComboBoxColumn Caption="Solved?" FieldName="SOLVED" 
        Name="SOLVED" ShowInCustomizationForm="True" VisibleIndex="10" 
        Width="60px">
        <PropertiesComboBox IncrementalFilteringMode="Contains">
            <Items>
                <dx:ListEditItem Text="Yes" Value="Yes" />
                <dx:ListEditItem Text="No" Value="No" />
                <dx:ListEditItem Text="Partially" Value="Partially" />
            </Items>
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataComboBoxColumn Caption="Engineer 3" FieldName="ENGINEER3" 
        Name="ENGINEER3" ShowInCustomizationForm="True" VisibleIndex="26">
        <PropertiesComboBox IncrementalFilteringMode="Contains">
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataComboBoxColumn Caption="Engineer 4" FieldName="ENGINEER4" 
        Name="ENGINEER4" ShowInCustomizationForm="True" VisibleIndex="27">
        <PropertiesComboBox IncrementalFilteringMode="Contains">
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataTextColumn Caption="Task Comments" 
        FieldName="ENGINEER_COMMENTS" Name="ENGINEER_COMMENTS" 
        ShowInCustomizationForm="True" VisibleIndex="29" Visible="False">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Tooltip" 
        ShowInCustomizationForm="True" Name="Tooltip" 
        Caption="Tooltip" VisibleIndex="28" Visible="False">
</dx:GridViewDataTextColumn>
    <dx:GridViewDataCheckColumn Caption="TA?" FieldName="TA" Name="TA" 
        ShowInCustomizationForm="True" VisibleIndex="11" Width="60px">
        <PropertiesCheckEdit DisplayTextChecked="Yes" DisplayTextGrayed=" ?" 
            DisplayTextUnchecked=" " DisplayTextUndefined=" ?">
        </PropertiesCheckEdit>
    </dx:GridViewDataCheckColumn>

            


    <dx:GridViewDataTextColumn Caption="Updated" ShowInCustomizationForm="True" 
        Visible="False" VisibleIndex="30">
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataComboBoxColumn Caption="Subcontractor" FieldName="SUBCO" 
        Name="SUBCO" ShowInCustomizationForm="True" VisibleIndex="20" Width="120px">
        <PropertiesComboBox DropDownStyle="DropDown" 
            IncrementalFilteringMode="Contains">
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>

            


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

                    <SettingsEditing Mode="Inline" />

                    <Settings ShowFilterBar="Visible" ShowFilterRowMenu="True" 
                        ShowGroupPanel="True" 
                        ShowHeaderFilterButton="True" ShowFilterRow="True" 
                        HorizontalScrollBarMode="Visible" />

<SettingsCookies Enabled="True" Version="22" StoreColumnsVisiblePosition="False"></SettingsCookies>


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
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" 
        GridViewID="ASPxGridViewManagementTicketsReport" Landscape="True" PaperKind="A4">
        <Styles>
            <Default Font-Size="8pt">
            </Default>
        </Styles>
    </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
