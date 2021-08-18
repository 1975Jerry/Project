<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RouterSchedules.aspx.cs" Inherits="TTWeb.RouterSchedules" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>















<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">


<head runat="server">
    <title></title>
    <style type="text/css">
        .dxmMenu_Metropolis
{
	font: 12px Segoe UI;
	color: #333333;
	background-color: #f0f0f0;
	padding: 0;
}

.dxmMenuItemWithImage_Metropolis
{
	white-space: nowrap;
}
.dxmMenuItemWithImage_Metropolis
{
	padding: 3px 7px 4px;
}
.dxmMenuFullHeightSeparator_Metropolis
{
	width: 1px;
}

.dxmMenuFullHeightSeparator_Metropolis
{
	background-color: white;
	width: 1px;
	height: 100%!important;
}
.dxmMenuFullHeightSeparator_Metropolis
{
	display: none;
}

.dxmMenuFullHeightSeparator_Metropolis .dx 
{
	font-size: 0;
	line-height: 0;
	overflow: hidden;
	width: 1px;
	height: 1px;
}
        .style2
        {
            font-size: 8pt;
            text-align: right;
            color: #800000;
        }
    </style>
    </head>

<body>
    <form id="form1" runat="server">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="All Active SCHs" 
            SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" 
            Width="100%" EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px" 
            Theme="Metropolis">
            <ContentPaddings PaddingBottom="10px" PaddingTop="10px" PaddingLeft="9px" 
                PaddingRight="11px" />

            <HeaderStyle Font-Size="Small">
            <Paddings PaddingBottom="6px" PaddingLeft="9px" 
                PaddingRight="11px" PaddingTop="3px" />
            </HeaderStyle>
                       <HeaderTemplate>
                <table style="width: 100%">
                    <tr>
                        <td width="100%" valign="middle" align="left">Active Schedules Multi-Routing
                              <dx:ASPxLabel ID="ASPxLabelUserName" runat="server" ClientIDMode="AutoID" 
                                Text="ASPxLabel" Font-Size="Smaller" ForeColor="#CCCCCC">
                            </dx:ASPxLabel>
                        </td>
                           <td valign="middle" align="right">
                               <dx:ASPxMenu ID="ASPxMenu2" runat="server" 
                                   onitemclick="ASPxMenu2_ItemClick" Theme="Metropolis">
                                   <clientsideevents itemclick="function(s, e) {
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
                                           <image height="12px" url="~/Images/export_ticket.png">
                                           </image>
                                       </dx:MenuItem>
                                   </Items>
                                   <RootItemSubMenuOffset FirstItemX="10" LastItemX="10" X="10" />
                                   <BackgroundImage ImageUrl="~/Images/back2.png" />
                                   <border borderstyle="None" />
                               </dx:ASPxMenu>
                        </td>
                        <td align="right" valign="middle" width="80">
                            <dx:ASPxMenu ID="ASPxMenu3" runat="server" Theme="Metropolis" Width="80px">
                                <clientsideevents itemclick="function(s, e) {
	 if(e.item.name == &quot;Refresh&quot;) 
	{
	window.pagegrid.Refresh();
    }
}" />
                                <Items>
                                    <dx:MenuItem Name="Refresh" Text="Refresh">
                                        <image height="12px" url="~/Images/refresh.png">
                                        </image>
                                    </dx:MenuItem>
                                </Items>
                                <RootItemSubMenuOffset FirstItemX="10" LastItemX="10" X="10" />
                                <BackgroundImage ImageUrl="~/Images/back2.png" />
                                <border borderstyle="None" />
                            </dx:ASPxMenu>
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <table class="dxflInternalEditorTable">
        <tr style="padding-bottom: 5px">
            <td class="style2" width="60" style="padding-bottom: 5px">
                My Role:</td>
            <td width="180" style="padding-bottom: 5px">
                <dx:ASPxComboBox ID="ASPxComboBoxFrom" runat="server" Font-Size="8pt" 
                    Theme="Aqua" Width="150px" OnInit="ASPxComboBoxFrom_Init">
                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	comboto.PerformCallback(s.GetText());
}" />
                </dx:ASPxComboBox>
            </td>
            <td class="style2" width="60" style="padding-bottom: 5px">
                &gt; Route To:</td>
            <td width="180" style="padding-bottom: 5px">
                <dx:ASPxComboBox ID="ASPxComboBoxTo" runat="server" Font-Size="8pt" 
                    Theme="Aqua" Width="150px" ClientInstanceName="comboto" 
                    OnInit="ASPxComboBoxTo_Init" OnCallback="ASPxComboBoxTo_Callback" 
                    ViewStateMode="Enabled">
                    <ClientSideEvents EndCallback="function(s, e) {
	ActiveSCHsRouteGrid.Refresh();
}" />
                </dx:ASPxComboBox>
            </td>
            <td style="padding-bottom: 5px">
                <dx:ASPxButton ID="ASPxButton1" runat="server" Font-Size="8pt" Text="Route Selected" 
                    Theme="Metropolis" Width="120px" EnableClientSideAPI="True" 
                    AutoPostBack="false" ClientInstanceName="routebutton">
                    <ClientSideEvents Click="function(s, e) 
{
   var retVal = confirm('Are you sure you want to route the selected schedules to '+comboto.GetText());
   if( retVal == true ){
		s.SetEnabled(false);
		routeselectedcallback.PerformCallback(comboto.GetText());      
   }
}" />
                    <Image Height="10px" Url="~/Images/Release.gif">
                    </Image>
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <dx:ASPxGridView ID="ASPxGridViewRouteSCHs" runat="server" 
        AutoGenerateColumns="False" ClientIDMode="AutoID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        OnHtmlDataCellPrepared="ASPxGridViewAllSCHs_HtmlDataCellPrepared" 
        Width="100%" KeyFieldName="Hidden_id" 
        OnDetailRowExpandedChanged="ASPxGridViewAllSCHs_DetailRowExpandedChanged" ClientInstanceName="ActiveSCHsRouteGrid" 
        OnCustomJSProperties="ASPxGridViewAllSCHs_CustomJSProperties" 
        Theme="Metropolis"
        style="text-align: left" EnableViewState="False" ViewStateMode="Disabled">
        <ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}"  />
        <Columns>
            <dx:GridViewCommandColumn ShowInCustomizationForm="True" 
                ShowSelectCheckbox="True" VisibleIndex="0" Caption=" " Name="Selected" 
                Width="40px">
                <HeaderStyle>
                <Border BorderStyle="None" />
                </HeaderStyle>
                <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False">
                    <BorderRight BorderStyle="None" />
                </CellStyle>

                <HeaderTemplate>
                    <dx:ASPxCheckBox ID="SelectAllCheckBox" runat="server" ToolTip="Select/Unselect all rows on the page"
                        
                        ClientSideEvents-CheckedChanged="function(s, e) { ActiveSCHsGrid.SelectAllRowsOnPage(s.GetChecked()); }" 
                        Wrap="True" />
                </HeaderTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewCommandColumn>

            <dx:GridViewDataTextColumn Caption="ID" FieldName="ID" Name="ID" 
                ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="For_team" ShowInCustomizationForm="True" 
                Name="For_team" Caption="For Team" VisibleIndex="5" Width="20%">
    <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Current Owner" FieldName="Team" Name="Team" 
                ShowInCustomizationForm="True" VisibleIndex="4" Width="15%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Status" FieldName="Status" Name="Status" 
                ShowInCustomizationForm="True" VisibleIndex="9" Width="70px" 
                Visible="False">
                <Settings ShowFilterRowMenu="True" ShowInFilterControl="True" 
                    AllowAutoFilter="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Schedule date" FieldName="Schedule_date" 
                Name="Schedule_date" ShowInCustomizationForm="True" VisibleIndex="6" 
                Width="120px">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Process" FieldName="Process" Name="Process" 
                ShowInCustomizationForm="True" VisibleIndex="11" Width="70px" 
                Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Sites" FieldName="Location" 
                Name="Location" ShowInCustomizationForm="True" VisibleIndex="7" 
                Width="20%" Visible="False">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataComboBoxColumn Caption=" " FieldName="HAS_ATTACHMENT" Name="HAS_ATTACHMENT" 
                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" 
                FixedStyle="Left" Width="22px">
                <PropertiesComboBox ShowImageInEditBox="True" ValueField="HAS_ATTACHMENTS" 
                    ValueType="System.String">
                    <Items>
                        <dx:ListEditItem ImageUrl="~/Images/attach.png" Text=" " Value="1" />
                        <dx:ListEditItem ImageUrl="~/Images/comm.png" Text=" " Value="2" />
                        <dx:ListEditItem ImageUrl="~/Images/atcomm.png" Text=" " Value="3" />
                    </Items>
                    <ItemStyle Font-Size="0pt" Wrap="False" />
                </PropertiesComboBox>
                <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" 
                    ShowInFilterControl="False" AllowHeaderFilter="False" />
                    <FilterCellStyle>
                        <BorderLeft BorderStyle="None" />
                        <BorderRight BorderStyle="None" />
                </FilterCellStyle>
                    <HeaderStyle>
                <Border BorderStyle="None" />
                </HeaderStyle>
                <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False">
                    <BorderRight BorderStyle="None" />
                </CellStyle>
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn Caption=" " FieldName="Status" Name="StatusIcon" 
                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" 
                FixedStyle="Left" Width="22px">
                <PropertiesComboBox ShowImageInEditBox="True" ValueField="Status" 
                    ValueType="System.String">
                    <Items>
                        <dx:ListEditItem ImageUrl="~/Images/Active.png" Text=" " Value="Active" />
                        <dx:ListEditItem ImageUrl="~/Images/Suspended.png" Text=" " 
                            Value="Active /S" />
                        <dx:ListEditItem ImageUrl="~/Images/reject.png" Text=" " 
                            Value="Rejected" />
                        <dx:ListEditItem ImageUrl="~/Images/SignOff.png" Text=" " 
                            Value="Sign Off" />
                        <dx:ListEditItem ImageUrl="~/Images/Completed.png" Text=" " Value="Completed" />
                    </Items>
                    <ItemImage AlternateText="Status">
                    </ItemImage>
                    <ItemStyle Font-Size="0pt" Wrap="False" />
                </PropertiesComboBox>
                <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" 
                    ShowInFilterControl="False" AllowHeaderFilter="False" />
                <FilterCellStyle>
                    <BorderLeft BorderStyle="None" />
                    <BorderRight BorderStyle="None" />
                </FilterCellStyle>
                <HeaderStyle>
                <Border BorderStyle="None" />
                </HeaderStyle>
                <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False">
                    <BorderRight BorderStyle="None" />
                </CellStyle>
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataTextColumn Caption="Description" FieldName="Description" Name="Description" 
                ShowInCustomizationForm="True" VisibleIndex="8">
                <PropertiesTextEdit EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" 
                Name="Tooltip" ShowInCustomizationForm="True" Visible="False" 
                VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" 
                Name="Hidden_id" ShowInCustomizationForm="True" Visible="False" 
                VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Stamp" FieldName="Stamp" 
                ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior ColumnResizeMode="NextColumn" AllowFocusedRow="True" />

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
        <Settings ShowGroupPanel="True" 
            ShowFilterBar="Visible" ShowHeaderFilterButton="True" 
            ShowFilterRow="True" ShowFilterRowMenu="True" />
        <SettingsCookies Enabled="True" Version="26" />
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />

        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue">
            <Header ImageSpacing="10px" SortingImageSpacing="10px" BackColor="#0066CC" 
                ForeColor="White">
            </Header>
            <SelectedRow BackColor="#FCF9DF" ForeColor="Black">
                <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
            </SelectedRow>
            <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
            </FocusedRow>
            <DetailButton>
                <Paddings PaddingRight="3px" />
            </DetailButton>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>


                </dx:PanelContent>    
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" 
        GridViewID="ASPxGridViewRouteSCHs" Landscape="True" MaxColumnWidth="500" 
        PaperKind="A4">
        <Styles>
            <Header Font-Size="8pt">
            </Header>
            <Default Font-Size="8pt">
            </Default>
            <Cell Font-Size="8pt">
            </Cell>
        </Styles>
        <PageHeader Right="[Page # of Pages #]" Left="Schedules Multi-Routing">
        </PageHeader>
        <PageFooter Right="[Date Printed] [Time Printed]" 
            Left="TBSP Task Management System" VerticalAlignment="Far">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    <dx:ASPxCallback ID="ASPxCallbackRouteSelected" runat="server" 
        ClientInstanceName="routeselectedcallback" 
        oncallback="ASPxCallbackRouteSelected_Callback">
        <ClientSideEvents EndCallback="function(s, e) {
        routebutton.SetEnabled(true);
        ActiveSCHsRouteGrid.Refresh();
        selections = 0;
}" />
    </dx:ASPxCallback>
    </form>
</body>
</html>
