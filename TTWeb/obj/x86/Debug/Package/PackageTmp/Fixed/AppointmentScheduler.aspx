<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppointmentScheduler.aspx.cs" Inherits="TTWeb.AppointmentScheduler" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>




<%@ Register assembly="DevExpress.Web.ASPxScheduler.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraScheduler.v15.1.Core, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>




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
                        <td width="100%" valign="middle" align="left">Appointment Scheduler
                        </td>
                        <td align="right" valign="middle">
                            &nbsp;</td>
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

    <br />
    <dx1:ASPxSplitter ID="ASPxSplitter1" runat="server" Height="800px" ResizingMode="Live">
        <Panes>
            <dx1:SplitterPane Name="SchedulerPane">
                <ContentCollection>
                    <dx1:SplitterContentControl runat="server">
                        <table class="style1">
                            <tr>
                                <td width="140">
                                    <dx1:ASPxComboBox ID="ASPxComboBoxSLA" runat="server" Caption="SLA:" Font-Size="8pt" style="font-size: 8pt" Theme="Metropolis" Width="80px" OnInit="ASPxComboBoxSLA_Init">
                                    </dx1:ASPxComboBox>
                                </td>
                                <td width="180">
                                    <dx1:ASPxComboBox ID="ASPxComboBoxArea" runat="server" Caption="Area:" Font-Size="8pt" style="font-size: 8pt" Theme="Metropolis" Width="120px" OnInit="ASPxComboBoxArea_Init">
                                    </dx1:ASPxComboBox>
                                </td>
                                <td>
                                    <dx1:ASPxButton ID="ASPxButton1" runat="server" style="font-size: 8pt" Text="Search" Theme="Metropolis" Width="80px" AutoPostBack="False">
                                        <ClientSideEvents Click="function(s, e) {
	theschedule.Refresh(); 
}" />
                                    </dx1:ASPxButton>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <dxwschs:ASPxScheduler ID="TheScheduler" runat="server" ClientIDMode="AutoID" Start="2015-08-03" Theme="MetropolisBlue" ClientInstanceName="theschedule" GroupType="Resource" OnAppointmentChanging="TheScheduler_AppointmentChanging" OnAppointmentDeleting="TheScheduler_AppointmentDeleting" OnAppointmentInserting="TheScheduler_AppointmentInserting" OnAppointmentRowDeleted="TheScheduler_AppointmentRowDeleted" OnAppointmentRowDeleting="TheScheduler_AppointmentRowDeleting" OnAppointmentRowInserted="TheScheduler_AppointmentRowInserted" OnAppointmentRowInserting="TheScheduler_AppointmentRowInserting" OnAppointmentRowUpdated="TheScheduler_AppointmentRowUpdated" OnAppointmentRowUpdating="TheScheduler_AppointmentRowUpdating" OnQueryWorkTime="TheScheduler_QueryWorkTime" OnAppointmentsInserted="TheScheduler_AppointmentsInserted" OnHtmlTimeCellPrepared="TheScheduler_HtmlTimeCellPrepared">
                            <Views>
                                <DayView TimeScale="01:00:00" ShowWorkTimeOnly="True">
                                    <VisibleTime Start="09:00:00" />
                                    <TimeRulers>
                                        <cc1:TimeRuler />
                                    </TimeRulers>
                                </DayView>
                                <WorkWeekView Enabled="False">
                                    <VisibleTime Start="09:00:00" />
                                    <TimeRulers>
                                        <cc1:TimeRuler />
                                    </TimeRulers>
                                </WorkWeekView>
                                <WeekView Enabled="False">
                                </WeekView>
                                <MonthView Enabled="False">
                                </MonthView>
                                <TimelineView Enabled="False">
                                </TimelineView>
                                <FullWeekView Enabled="True" ShowWorkTimeOnly="True">
                                    <VisibleTime Start="09:00:00" />
                                    <TimeRulers>
                                        <cc1:TimeRuler />
                                    </TimeRulers>
                                </FullWeekView>
                            </Views>
                            <OptionsCustomization AllowAppointmentConflicts="Forbidden" AllowAppointmentCopy="None" AllowAppointmentDrag="None" AllowAppointmentDragBetweenResources="None" AllowAppointmentEdit="None" AllowAppointmentMultiSelect="False" AllowInplaceEditor="None" />
                            <OptionsBehavior RecurrentAppointmentDeleteAction="Cancel" RecurrentAppointmentEditAction="Cancel" ShowCurrentTime="Never" ShowTimeMarker="False" />
                        </dxwschs:ASPxScheduler>
                    </dx1:SplitterContentControl>
                </ContentCollection>
            </dx1:SplitterPane>
            <dx1:SplitterPane Name="TicketsPane" Size="300px">
                <ContentCollection>
                    <dx1:SplitterContentControl runat="server">
                        <dx1:ASPxGridView ID="ASPxGridViewTickets" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID" ClientInstanceName="ASPxGridViewTickets" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" EnableViewState="False" KeyFieldName="ID" OnHtmlRowPrepared="ASPxGridViewTickets_HtmlRowPrepared" style="font-size: 8pt" Theme="Metropolis" Width="100%">
                            <ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}" />
                            <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                            <Templates>
                                <DetailRow>
                                    <dx1:ASPxGridView ID="ASPxGridViewAppointments" runat="server" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="ID" Theme="Office2003Blue" Width="100%">
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
                            <SettingsPager AlwaysShowPager="True" PageSize="20" ShowDefaultImages="False">
                                <AllButton Text="All">
                                </AllButton>
                                <NextPageButton Text="Next &gt;">
                                </NextPageButton>
                                <PrevPageButton Text="&lt; Prev">
                                </PrevPageButton>
                                <Summary Text="{0} of {1}" />
                                <PageSizeItemSettings Visible="True" Caption="Page:">
                                </PageSizeItemSettings>
                            </SettingsPager>
                            <SettingsEditing Mode="Inline">
                            </SettingsEditing>
                            <Settings ShowFilterBar="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True" />
                            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                            <SettingsCookies Enabled="True" StoreColumnsVisiblePosition="False" Version="38" />
                            <SettingsCommandButton>
                                <UpdateButton>
                                    <Image Height="18px" ToolTip="Save" Url="~/Images/Save.png">
                                    </Image>
                                </UpdateButton>
                                <CancelButton>
                                    <Image Height="18px" ToolTip="Cancel" Url="~/Images/cancel.png">
                                    </Image>
                                </CancelButton>
                                <EditButton>
                                    <Image Height="10px" ToolTip="Edit" Url="~/Images/Edit.png">
                                    </Image>
                                </EditButton>
                                <DeleteButton>
                                    <Image Height="10px" ToolTip="Delete" Url="~/Images/delete.png">
                                    </Image>
                                </DeleteButton>
                            </SettingsCommandButton>
                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                            <StylesEditors>
                                <CalendarHeader Spacing="11px">
                                </CalendarHeader>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                            <StylesPager>
                                <Pager Font-Size="8pt">
                                </Pager>
                            </StylesPager>
                            <Columns>
                                <dx1:GridViewDataTextColumn Caption="Ticket Id" FieldName="TICKET_ID" Name="TICKET_ID" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                    <PropertiesTextEdit>
                                        <ReadOnlyStyle BackColor="#F2F2F2">
                                        </ReadOnlyStyle>
                                    </PropertiesTextEdit>
                                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                                </dx1:GridViewDataTextColumn>
                                <dx1:GridViewDataTextColumn Caption="ID" FieldName="ID" Name="ID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                </dx1:GridViewDataTextColumn>
                                <dx1:GridViewDataTextColumn Caption="Customer Name" FieldName="NAME" Name="NAME" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                                </dx1:GridViewDataTextColumn>
                                <dx1:GridViewDataComboBoxColumn Caption="Area" FieldName="AREA" Name="AREA" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7" Width="100px">
                                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                                </dx1:GridViewDataComboBoxColumn>
                                <dx1:GridViewDataComboBoxColumn Caption="Issue" FieldName="ISSUE" Name="ISSUE" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8" Width="120px">
                                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                                </dx1:GridViewDataComboBoxColumn>
                                <dx1:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" Name="Tooltip" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
                                </dx1:GridViewDataTextColumn>
                                <dx1:GridViewDataTextColumn Caption="Address" FieldName="ADDRESS" Name="ADDRESS" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6" Width="140px">
                                </dx1:GridViewDataTextColumn>
                                <dx1:GridViewDataComboBoxColumn Caption="SLA" FieldName="SLA" Name="SLA" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4" Width="60px">
                                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                                </dx1:GridViewDataComboBoxColumn>
                                <dx1:GridViewDataTextColumn Caption="Hidden_SLA_Hours" FieldName="Hidden_SLA_Hours" Name="Hidden_SLA_Hours" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                </dx1:GridViewDataTextColumn>
                            </Columns>
                            <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                                <Header BackColor="#0066CC" Font-Size="8pt" ForeColor="White" ImageSpacing="10px" SortingImageSpacing="10px" Wrap="True">
                                </Header>
                                <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                                    <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                                </FocusedRow>
                                <Cell Font-Size="8pt">
                                </Cell>
                                <CommandColumnItem>
                                    <Paddings PaddingLeft="3px" />
                                </CommandColumnItem>
                            </Styles>
                        </dx1:ASPxGridView>
                    </dx1:SplitterContentControl>
                </ContentCollection>
            </dx1:SplitterPane>
        </Panes>
    </dx1:ASPxSplitter>
    <br />
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
        <asp:ObjectDataSource ID="ObjectAppointmentsDataSource" runat="server" 
            DataObjectTypeName="MyAppointment" DeleteMethod="DeleteMethodHandler" 
            InsertMethod="InsertMethodHandler" 
            OnObjectCreated="ObjectAppointmentsDataSource_ObjectCreated" 
            SelectMethod="SelectMethodHandler" TypeName="MyAppointmentDataSource" 
            UpdateMethod="UpdateMethodHandler">

        </asp:ObjectDataSource>
    </form>
</body>
</html>
