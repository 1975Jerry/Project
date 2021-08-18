<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignOffSchedules.aspx.cs" Inherits="TTWeb.SignOffSchedules" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>










<%@ Register src="SchEditControl.ascx" tagname="SchEditControl" tagprefix="uc1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">


<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 1pt;
        }
        .style3
        {
            width: 100%;
        }
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
    </style>
    </head>

<body>
    <form id="form1" runat="server">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="All Sign Off SCHs" 
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
                        <td width="100%" valign="middle" align="left">Sign Off Schedules
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
    <dx:ASPxGridView ID="ASPxGridViewAllSCHs" runat="server" 
        AutoGenerateColumns="False" ClientIDMode="AutoID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        OnHtmlDataCellPrepared="ASPxGridViewAllSCHs_HtmlDataCellPrepared" 
        Width="100%" KeyFieldName="Hidden_id" 
        OnDetailRowExpandedChanged="ASPxGridViewAllSCHs_DetailRowExpandedChanged" ClientInstanceName="SignOffSCHsGrid" 
        OnCustomJSProperties="ASPxGridViewAllSCHs_CustomJSProperties" 
        Theme="Metropolis">
        <ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}" DetailRowExpanding="function(s, e) {
	
}" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="ID" FieldName="ID" Name="ID" 
                ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="For_team" ShowInCustomizationForm="True" 
                Name="For_team" Caption="For Team" VisibleIndex="4" Width="20%">
    <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Current Owner" FieldName="Team" Name="Team" 
                ShowInCustomizationForm="True" VisibleIndex="3" Width="15%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Status" FieldName="Status" Name="Status" 
                ShowInCustomizationForm="True" VisibleIndex="8" Width="70px" 
                Visible="False">
                <Settings ShowFilterRowMenu="True" ShowInFilterControl="True" 
                    AllowAutoFilter="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Schedule date" FieldName="Schedule_date" 
                Name="Schedule_date" ShowInCustomizationForm="True" VisibleIndex="5" 
                Width="120px">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Process" FieldName="Process" Name="Process" 
                ShowInCustomizationForm="True" VisibleIndex="9" Width="70px" 
                Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Sites" FieldName="Location" 
                Name="Location" ShowInCustomizationForm="True" VisibleIndex="6" 
                Width="20%" Visible="False">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataComboBoxColumn Caption=" " FieldName="HAS_ATTACHMENT" Name="HAS_ATTACHMENT" 
                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" 
                FixedStyle="Left" ToolTip="Status" Width="22px">
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
                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" 
                FixedStyle="Left" ToolTip="Status" Width="22px">
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
                ShowInCustomizationForm="True" VisibleIndex="7">
                <PropertiesTextEdit EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" 
                Name="Tooltip" ShowInCustomizationForm="True" Visible="False" 
                VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" 
                Name="Hidden_id" ShowInCustomizationForm="True" Visible="False" 
                VisibleIndex="10">
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
        <SettingsCookies Enabled="True" Version="22" />
        <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />

        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue">
            <Header ImageSpacing="10px" SortingImageSpacing="10px" BackColor="#0066CC" 
                ForeColor="White">
            </Header>
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
        <Templates>
            <DetailRow>
                <uc1:SchEditControl ID="SchEditControl1" runat="server" />
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>


                </dx:PanelContent>    
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" 
        GridViewID="ASPxGridViewAllSCHs" Landscape="True" MaxColumnWidth="500" 
        PaperKind="A4">
        <Styles>
            <Header Font-Size="8pt">
            </Header>
            <Default Font-Size="8pt">
            </Default>
            <Cell Font-Size="8pt">
            </Cell>
        </Styles>
        <PageHeader Right="[Page # of Pages #]" Left="Sign Off Schedules">
        </PageHeader>
        <PageFooter Right="[Date Printed] [Time Printed]" 
            Left="TBSP Task Management System" VerticalAlignment="Far">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
