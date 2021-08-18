<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitsPerMonth.aspx.cs" Inherits="TTWeb.VisitsPerMonth" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>










<%@ Register src="SchEditControl.ascx" tagname="SchEditControl" tagprefix="uc1" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">


<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0"></script>
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
        .style1
        {
            height: 22px;
        }
        .style3
        {
            width: 25%;
            height: 22px;
        }
    </style>
    </head>


   <script type="text/javascript" src="http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0"></script>

    <script charset="UTF-8" type="text/javascript">
        

        function onLoadSystems() {
            ActiveVisitsGrid.PerformCallback(period.GetText() + ';' + phase.GetText());
        }

    </script>

<body>
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="All Active Visits" 
            SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" 
            Width="100%" EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px" 
            Theme="Metropolis">
            <ContentPaddings PaddingBottom="10px" PaddingTop="10px" PaddingLeft="9px" 
                PaddingRight="11px" />

<ContentPaddings PaddingBottom="10px" PaddingLeft="9px" PaddingTop="10px" 
                PaddingRight="11px"></ContentPaddings>

            <HeaderStyle Font-Size="Small">
            <Paddings PaddingBottom="6px" PaddingLeft="9px" 
                PaddingRight="11px" PaddingTop="3px" />
<Paddings PaddingBottom="6px" PaddingLeft="9px" PaddingTop="3px" PaddingRight="11px"></Paddings>
            </HeaderStyle>
                       <HeaderTemplate>
                <table style="width: 100%">
                    <tr>
                        <td width="100%" valign="middle" align="left" class="style1">Visits' Reports per Month

                        </td>
                           <td valign="middle" align="right" class="style3" 
                            >
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
                        <td align="right" class="style3" valign="middle" width="80">
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

<table class="style1" style="padding-bottom: 8px" width="100%">
            <tr>
                <td class="style4" 
                    style="border-left: 1px solid #808080; border-bottom: 1px solid #808080; background-color: #FBFBFB; text-align: right; border-right-color: #808080; border-right-width: 1px; border-top-color: #808080; border-top-width: 1px; padding-right: 2px;" 
                    width="80">
                    <span class="style5">Month</span>:</td>
                <td style="background-color: #FBFBFB;" width="140">
                    <dx:ASPxComboBox ID="ASPxComboBoxPeriod" runat="server" 
                        ClientInstanceName="period" EnableIncrementalFiltering="True" 
                        EnableTheming="True" Font-Size="8pt" IncrementalFilteringDelay="300" 
                        IncrementalFilteringMode="StartsWith" OnLoad="ASPxComboBoxPeriod_Load" 
                        Theme="Aqua" Width="120px">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	ActiveVisitsGrid.PerformCallback(period.GetText()+';'+phase.GetText());
}" Init="function(s, e) {
	ActiveVisitsGrid.PerformCallback(period.GetText()+';'+phase.GetText());
}" />
                    </dx:ASPxComboBox>
                </td>
                <td class="style4" 
                    style="border-left: 1px solid #808080; border-bottom: 1px solid #808080; background-color: #FBFBFB; text-align: right; border-right-color: #808080; border-right-width: 1px; border-top-color: #808080; border-top-width: 1px; padding-right: 2px;" 
                    width="80">
                    <span class="style5">Visit status</span>:</td>
                <td style="background-color: #FBFBFB;" width="140">
                    <dx:ASPxComboBox ID="ASPxComboBoxPhase" runat="server" 
                        ClientInstanceName="phase" EnableIncrementalFiltering="True" 
                        EnableTheming="True" Font-Size="8pt" IncrementalFilteringDelay="300" 
                        IncrementalFilteringMode="StartsWith" 
                        SelectedIndex="0" Theme="Aqua" Width="120px">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	ActiveVisitsGrid.PerformCallback(period.GetText()+';'+phase.GetText());
}" />
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Yes" Value="Yes" />
                            <dx:ListEditItem Text="No" Value="No" />
                            <dx:ListEditItem Text="Pending" Value="Pending" />
                            <dx:ListEditItem Text="All" Value="All" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td style="background-color: #FBFBFB;">
                    &nbsp;</td>
            </tr>
        </table>

    <dx:ASPxGridView ID="ASPxGridViewAllVisits" runat="server" 
        AutoGenerateColumns="False" ClientIDMode="AutoID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        OnHtmlDataCellPrepared="ASPxGridViewAllVisits_HtmlDataCellPrepared" 
        Width="100%" KeyFieldName="Hidden_id" ClientInstanceName="ActiveVisitsGrid" 
        Theme="Metropolis" 
        OnHtmlRowPrepared="ASPxGridViewAllVisits_HtmlRowPrepared" 
        style="font-size: 8pt" 
        OnCustomCallback="ASPxGridViewAllVisits_CustomCallback">
        <ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}" />
<ClientSideEvents DetailRowExpanding="function(s, e) {
	
}" Init="function(s, e) {
	window.pagegrid = s;
}"></ClientSideEvents>
        <Columns>
            <dx:GridViewDataTextColumn Caption="ID" FieldName="ID" Name="ID" 
                ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                <Settings AutoFilterCondition="Contains" />
<Settings AutoFilterCondition="Contains"></Settings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Team" FieldName="TT_User" Name="TT_User" 
                ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                <Settings AutoFilterCondition="Contains" />
<Settings AutoFilterCondition="Contains"></Settings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Visit?" FieldName="Visit" Name="Visit" 
                ShowInCustomizationForm="True" VisibleIndex="6" Width="60px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Solved?" FieldName="Solved" Name="Solved" 
                ShowInCustomizationForm="True" VisibleIndex="7" Width="70px">
                <Settings AutoFilterCondition="Contains" />
<Settings AutoFilterCondition="Contains"></Settings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Int. Type" FieldName="Intervention_Type" 
                Name="Intervention_Type" ShowInCustomizationForm="True" VisibleIndex="8" 
                Width="150px">
                <Settings AutoFilterCondition="Contains" />
<Settings AutoFilterCondition="Contains"></Settings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Description" FieldName="SITE_COMMENTS" 
                Name="SITE_COMMENTS" ShowInCustomizationForm="True" VisibleIndex="9">
                <Settings AutoFilterCondition="Contains" />
<Settings AutoFilterCondition="Contains"></Settings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="On Date" FieldName="On_Date" Name="On_Date" 
                ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Site" FieldName="Location" Name="Location" 
                ShowInCustomizationForm="True" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
<Settings AutoFilterCondition="Contains"></Settings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption=" " FieldName="Status" Name="StatusIcon" 
                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" 
                FixedStyle="Left" ToolTip="Status" Width="30px">
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
                    ShowInFilterControl="False" />

<Settings AllowAutoFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="False"></Settings>

                <HeaderStyle>
                <Border BorderStyle="None" />
<Border BorderStyle="None"></Border>
                </HeaderStyle>
                <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False">
                    <BorderRight BorderStyle="None" />
<BorderRight BorderStyle="None"></BorderRight>
                </CellStyle>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="SRI" FieldName="SRI" Name="SRI" 
                ShowInCustomizationForm="True" VisibleIndex="4" Width="150px">
                <Settings AutoFilterCondition="Contains" />
<Settings AutoFilterCondition="Contains"></Settings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" 
                Name="Tooltip" ShowInCustomizationForm="True" Visible="False" 
                VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" 
                Name="Hidden_id" ShowInCustomizationForm="True" Visible="False" 
                VisibleIndex="14">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior ColumnResizeMode="NextColumn" AllowFocusedRow="True" />

<SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn"></SettingsBehavior>

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
        <SettingsCookies Enabled="True" Version="6" />
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />

<Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True" ShowGroupPanel="True" ShowFilterBar="Visible"></Settings>

<SettingsCookies Version="4" Enabled="True"></SettingsCookies>

<SettingsDetail AllowOnlyOneMasterRowExpanded="True"></SettingsDetail>


        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue">
            <Header ImageSpacing="10px" SortingImageSpacing="10px" BackColor="#0066CC" 
                ForeColor="White">
            </Header>
            <Row BackColor="#FCFCFC">
            </Row>
            <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
<BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX"></BackgroundImage>
            </FocusedRow>
            <DetailButton>
                <Paddings PaddingRight="3px" />
<Paddings PaddingRight="3px"></Paddings>
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
        GridViewID="ASPxGridViewAllVisits" Landscape="True" MaxColumnWidth="200" 
        PaperKind="A4">
        <Styles>
            <Header Font-Size="8pt">
            </Header>
            <Default Font-Size="8pt">
            </Default>
            <Cell Font-Size="8pt">
            </Cell>
        </Styles>
        <PageHeader Right="[Page # of Pages #]" Left="Active Schedules">
        </PageHeader>
        <PageFooter Right="[Date Printed] [Time Printed]" 
            Left="TBSP Task Management System" VerticalAlignment="Far">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
