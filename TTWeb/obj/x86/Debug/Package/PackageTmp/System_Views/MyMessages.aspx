<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyMessages.aspx.cs" Inherits="TTWeb.MyMessages" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0"></script>
</head>
<body>
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="My Messages (last 7 days)" 
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
                        <td width="50%" valign="middle" align="left">My Messages (last 7 days)
                        </td>
                        <td width="50%" valign="middle" align="right">
                            <dx:ASPxMenu ID="ASPxMenu1" runat="server" EnableTheming="True" 
                                HorizontalAlign="Right" ItemAutoWidth="False" Theme="Metropolis" Width="100%">
                                <ClientSideEvents ItemClick="function(s, e) {
	window.pagegrid.Refresh();
}" />
                                <clientsideevents itemclick="function(s, e) {
	window.pagegrid.Refresh();
}" />
                                <Items>
                                    <dx:MenuItem Name="Refresh" Text="Refresh">
                                        <Image Height="12px" Url="~/Images/refresh.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
                                <BackgroundImage ImageUrl="~/Images/back2.png" />
                                <backgroundimage imageurl="~/Images/back2.png" />
                                <border borderstyle="None"></border>
                            </dx:ASPxMenu>
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <dx:ASPxGridView ID="ASPxGridViewMyMessages" runat="server" 
        ClientIDMode="AutoID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" Width="100%" KeyFieldName="TT_ID" 
        AutoGenerateColumns="False" Font-Size="8pt" Theme="Metropolis">
        <ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}" />
        <Columns>
            <dx:GridViewDataDateColumn Caption="Send on" FieldName="Send_on" Name="Send_on" 
                ShowInCustomizationForm="True" VisibleIndex="0" Width="15%">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Send to" FieldName="Send_to" Name="Send_to" 
                ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="ID" FieldName="TT_ID" 
                Name="TT_ID" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Status" FieldName="Message_Status" Name="Message_Status" 
                ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle Font-Bold="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Message" FieldName="Message" 
                Name="Message" ShowInCustomizationForm="True" VisibleIndex="4">
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
        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFilterRowMenu="True" 
            ShowHeaderFilterButton="True" />
        <SettingsCookies Enabled="True" />
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue">
            <Header ImageSpacing="10px" SortingImageSpacing="10px" BackColor="#0066CC" 
                ForeColor="White">
            </Header>
            <Row BackColor="#FCFCFC">
            </Row>
            <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
            <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
            </FocusedRow>
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
    </form>
</body>
</html>
