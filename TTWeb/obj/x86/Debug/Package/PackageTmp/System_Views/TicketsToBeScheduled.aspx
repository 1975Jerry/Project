<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketsToBeScheduled.aspx.cs" Inherits="TTWeb.TicketsToBeScheduled" %>

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
            font-size: 8pt;
            color: #993333;
        }
    </style>
    </head>

<body>
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="All Active ToBeScheduled" 
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
            </HeaderStyle>
                       <HeaderTemplate>
                <table style="width: 100%">
                    <tr>
                        <td width="100%" valign="middle" align="left">Tickets* marked to be Scheduled

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
    <dx:ASPxGridView ID="ASPxGridViewAllToBeScheduled" runat="server" 
        AutoGenerateColumns="False" ClientIDMode="AutoID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        Width="100%" KeyFieldName="TT_Id" ClientInstanceName="ActiveToBeScheduledGrid" 
        Theme="Metropolis" style="font-size: 8pt">
        <ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}" DetailRowExpanding="function(s, e) {
	
}" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="Ticket ID" FieldName="TT_Id" Name="TT_Id" 
                ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Location" FieldName="Location" Name="Location" 
                ShowInCustomizationForm="True" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Event" FieldName="Event" Name="Event" 
                ShowInCustomizationForm="True" VisibleIndex="9">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Priority" FieldName="Priority" 
                Name="Priority" ShowInCustomizationForm="True" VisibleIndex="10" 
                Width="100px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Source" 
                FieldName="Source" Name="Source" 
                ShowInCustomizationForm="True" VisibleIndex="12" Width="100px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="Scheduled Once?" FieldName="Scheduled" 
                Name="Scheduled" ShowInCustomizationForm="True" VisibleIndex="0" 
                Width="80px">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataDateColumn Caption="Ticket Date" FieldName="TDate" Name="TDate" 
                ShowInCustomizationForm="True" VisibleIndex="3" Width="130px">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Type" FieldName="Ticket_type" 
                Name="Ticket_type" ShowInCustomizationForm="True" VisibleIndex="8" 
                Width="100px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="SRI" FieldName="SRI" Name="SRI" 
                ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Region" FieldName="Region" Name="Region" 
                ShowInCustomizationForm="True" VisibleIndex="7" Width="90px">
                <Settings AutoFilterCondition="Contains" />
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
        <SettingsCookies Enabled="True" Version="4" />
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />

        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue">
            <Header ImageSpacing="10px" SortingImageSpacing="10px" BackColor="#0066CC" 
                ForeColor="White" Wrap="True">
            </Header>
            <Row BackColor="#FCFCFC">
            </Row>
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


                <br />
    <span class="style1">* with SRI number</span>


                </dx:PanelContent>    
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" 
        GridViewID="ASPxGridViewAllToBeScheduled" Landscape="True" MaxColumnWidth="200" 
        PaperKind="A4">
        <Styles>
            <Header Font-Size="8pt">
            </Header>
            <Default Font-Size="8pt">
            </Default>
            <Cell Font-Size="8pt">
            </Cell>
        </Styles>
        <PageHeader Right="[Page # of Pages #]" Left="Tickets to be Scheduled">
        </PageHeader>
        <PageFooter Right="[Date Printed] [Time Printed]" 
            Left="TBSP Task Management System" VerticalAlignment="Far">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
