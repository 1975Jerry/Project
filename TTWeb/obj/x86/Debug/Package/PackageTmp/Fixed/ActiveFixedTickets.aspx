<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiveFixedTickets.aspx.cs" Inherits="TTWeb.ActiveFixedTickets" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript"></script>

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
        </style>
</head>
<body style="font-size: 8pt">
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
                        <td width="100%" valign="middle" align="left">Active Fixed Tickets
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

	 if(e.item.name == &quot;AddTicket&quot;) 
	{          
		ASPxGridViewActiveFixedTickets.AddNewRow();
	}
}
                                    " />
                                <Items>
                                    <dx:MenuItem Name="AddTicket" Text="Add Ticket">
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
    ClientInstanceName="ASPxGridViewActiveFixedTickets" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="ID" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewActiveFixedTickets" 
    EnableViewState="False" 
        Theme="Metropolis" style="font-size: 8pt" 
        OnRowInserting="ASPxGridViewActiveFixedTickets_RowInserting" 
        OnRowDeleting="ASPxGridViewActiveFixedTickets_RowDeleting" 
        OnRowUpdating="ASPxGridViewActiveFixedTickets_RowUpdating" 
        OnLoad="ASPxGridViewActiveFixedTickets_Load" 
        OnCellEditorInitialize="ASPxGridViewActiveFixedTickets_CellEditorInitialize" 
        OnHtmlRowPrepared="ASPxGridViewActiveFixedTickets_HtmlRowPrepared">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}"></ClientSideEvents>
<Columns>
    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Name="CommandButtons" ShowEditButton="True" ShowDeleteButton="True"/>
<dx:GridViewDataTextColumn FieldName="TICKET_ID" ShowInCustomizationForm="True" 
        Name="TICKET_ID" Caption="Ticket Id" VisibleIndex="2" Width="100px">
    <PropertiesTextEdit>
        <ReadOnlyStyle BackColor="#F2F2F2">
        </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
</dx:GridViewDataTextColumn>




<dx:GridViewDataTextColumn FieldName="ID" 
        ShowInCustomizationForm="True" Name="ID" 
        Caption="ID" VisibleIndex="1" Visible="False">
</dx:GridViewDataTextColumn>


        <dx:GridViewDataTextColumn Caption="Customer Name" FieldName="NAME" 
        Name="NAME" ShowInCustomizationForm="True" 
        VisibleIndex="5" Width="140px">
            <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataTextColumn>
    

    <dx:GridViewDataDateColumn Caption="Issue date" FieldName="ISSUE_DATE" 
        Name="ISSUE_DATE" ShowInCustomizationForm="True" VisibleIndex="3" Width="100px">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy HH:mm" EditFormat="Custom" 
            EditFormatString="dd/MM/yy HH:mm">
            <TimeSectionProperties Visible="True">
                <TimeEditProperties DisplayFormatString="HH:mm" EditFormatString="HH:mm">
                </TimeEditProperties>
            </TimeSectionProperties>
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>
    <dx:GridViewDataComboBoxColumn Caption="Area" FieldName="AREA" 
        Name="AREA" ShowInCustomizationForm="True" VisibleIndex="8" Width="100px">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
               


    <dx:GridViewDataComboBoxColumn Caption="Issue" FieldName="ISSUE" 
        Name="ISSUE" ShowInCustomizationForm="True" VisibleIndex="9" Width="120px">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
               


    <dx:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" 
        Name="Tooltip" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
    </dx:GridViewDataTextColumn>

    

<dx:GridViewDataTextColumn FieldName="ADDRESS" ShowInCustomizationForm="True" 
        Name="ADDRESS" Caption="Address" VisibleIndex="7" Width="140px">
    </dx:GridViewDataTextColumn>
    

    <dx:GridViewDataComboBoxColumn Caption="SLA" FieldName="SLA" 
        Name="SLA" ShowInCustomizationForm="True" VisibleIndex="4" Width="60px">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
    

    <dx:GridViewDataTextColumn Caption="Comments" FieldName="COMMENTS" 
        Name="COMMENTS" ShowInCustomizationForm="True" VisibleIndex="10">
        <PropertiesTextEdit MaxLength="800">
        </PropertiesTextEdit>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
        <EditCellStyle>
            <BorderLeft BorderStyle="None" />
            <BorderRight BorderStyle="None" />
        </EditCellStyle>
        <FilterCellStyle>
            <BorderLeft BorderStyle="None" />
            <BorderRight BorderStyle="None" />
        </FilterCellStyle>
        <HeaderStyle>
        <Border BorderStyle="None" />
        </HeaderStyle>
        <CellStyle HorizontalAlign="Left">
            <BorderLeft BorderStyle="None" />
            <BorderRight BorderStyle="None" />
        </CellStyle>
    </dx:GridViewDataTextColumn>
               


    <dx1:GridViewDataTextColumn Caption="Phone" FieldName="PHONE" Name="PHONE" ShowInCustomizationForm="True" VisibleIndex="6" Width="90px">
    </dx1:GridViewDataTextColumn>
               


</Columns>

<SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                    AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" 
                    ConfirmDelete="True"></SettingsBehavior>

        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
        <Templates>
            <DetailRow>
                <dx1:ASPxGridView ID="ASPxGridViewAppointments" runat="server" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="ID" OnBeforePerformDataSelect="ASPxGridViewAppointments_BeforePerformDataSelect" Theme="Office2003Blue" Width="100%">
                    <SettingsCookies Enabled="True" Version="1" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <Columns>
                        <dx1:GridViewDataTextColumn Caption="ID" FieldName="ID" Name="ID" Visible="False" VisibleIndex="0">
                        </dx1:GridViewDataTextColumn>
                        <dx1:GridViewDataTextColumn Caption="ENGINEER_ID" FieldName="ENGINEER_ID" Name="ENGINEER_ID" Visible="False" VisibleIndex="1">
                        </dx1:GridViewDataTextColumn>
                        <dx1:GridViewDataDateColumn Caption="Appointment on" FieldName="APPOINTMENT_FROM" Name="APPOINTMENT_FROM" VisibleIndex="2" Width="120px">
                            <PropertiesDateEdit DisplayFormatInEditMode="True" DisplayFormatString="dd/MM/yy HH:mm" EditFormat="Custom" EditFormatString="dd/MM/yy HH:mm">
                            </PropertiesDateEdit>
                        </dx1:GridViewDataDateColumn>
                        <dx1:GridViewDataDateColumn Caption="APPOINTMENT_TO" FieldName="APPOINTMENT_TO" Name="APPOINTMENT_TO" Visible="False" VisibleIndex="3">
                            <PropertiesDateEdit DisplayFormatString="">
                            </PropertiesDateEdit>
                        </dx1:GridViewDataDateColumn>
                        <dx1:GridViewDataTextColumn Caption="Comments" FieldName="OPERATOR_COMMENTS" Name="OPERATOR_COMMENTS" VisibleIndex="4">
                        </dx1:GridViewDataTextColumn>
                        <dx1:GridViewDataTextColumn Caption="Status" FieldName="APPOINTMENT_STATUS" Name="APPOINTMENT_STATUS" VisibleIndex="5" Width="100px">
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                        </dx1:GridViewDataTextColumn>
                        <dx1:GridViewDataDateColumn Caption="Visit on" FieldName="VISIT_FROM" Name="VISIT_FROM" VisibleIndex="6" Width="120px">
                            <PropertiesDateEdit DisplayFormatInEditMode="True" DisplayFormatString="dd/MM/yy HH:mm" EditFormat="Custom" EditFormatString="dd/MM/yy HH:mm">
                            </PropertiesDateEdit>
                        </dx1:GridViewDataDateColumn>
                        <dx1:GridViewDataTextColumn Caption="Engineer comments" FieldName="ENGINEER_COMMENTS" Name="ENGINEER_COMMENTS" VisibleIndex="7">
                        </dx1:GridViewDataTextColumn>
                    </Columns>
                    <Styles>
                        <Header Font-Size="8pt">
                        </Header>
                        <Cell BackColor="#F9F9F9" Font-Size="8pt">
                        </Cell>
                    </Styles>
                </dx1:ASPxGridView>
            </DetailRow>
        </Templates>

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

<SettingsCookies Enabled="True" Version="38" StoreColumnsVisiblePosition="False"></SettingsCookies>


<Styles CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css">
<Header SortingImageSpacing="10px" ImageSpacing="10px" BackColor="#0066CC" 
        ForeColor="White" Wrap="True" Font-Size="8pt"></Header>

<FocusedRow BackColor="#FCF9DF" ForeColor="Black">
<BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX"></BackgroundImage>
</FocusedRow>

    <Cell Font-Size="8pt">
    </Cell>

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
        GridViewID="ASPxGridViewActiveFixedTickets" 
        MaxColumnWidth="500" PaperKind="A4">
        <Styles>
            <Default Font-Size="8pt">
            </Default>
        </Styles>
        <PageHeader Left="Active Fixed Tickets" Right="[Page # of Pages #]">
        </PageHeader>
        <PageFooter Left="TBSP Task Management System" 
            Right="[Date Printed] [Time Printed]">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
