<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiveCombinedMap.aspx.cs" Inherits="TTWeb.System_Views.ActiveCombinedMap" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>








<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0"></script>

    <script charset="UTF-8" type="text/javascript">
        var systemsmap = null;
        var thearray = null;

        function onLoadSystems() {
            if (window.onresize == null) {
                window.onresize = windowresized;
            }
            InitMap();
        }

        function windowresized() {
            var myWidth = document.documentElement.clientWidth - 220;
            var myHeight = document.documentElement.clientHeight - 20;
            var container = document.getElementById('systemmapdiv');
            container.style.width = myWidth + 'px';
            container.style.height = myHeight + 'px';
        }

        function AddInfoBox(pin, labelsystem, hastt) {

            var label = "<font size='2pt'>" + labelsystem + "</font>";
            //var label = "<strong>System </strong>" + labelsystem + "</strong><hr/>";
            pin.setInfoBox(new InfoBox(label));
        }

        function InitMap() {
            var myWidth = document.documentElement.clientWidth - 220;
            var myHeight = document.documentElement.clientHeight - 20;
            var container = document.getElementById('systemmapdiv');
            container.style.width = myWidth + 'px';
            container.style.height = myHeight + 'px';

            var container = document.getElementById('systemmapdiv');
            systemsmap = new Microsoft.Maps.Map(container, { credentials: 'An9eDuIsRVmZAKSD_iLrr4RMqqbK30ssMOwnBG_SEGBEp5MVLySR_diMHPsvAJ-h', center: new Microsoft.Maps.Location(38.333, 24.020202), mapTypeId: Microsoft.Maps.MapTypeId.road, zoom: 7 });

            var currentTime = new Date()
            var year = currentTime.getFullYear()
//            var quarter = Math.floor((today.getMonth() + 3) / 3);

            coordinatesCallback.PerformCallback('Yes;All;All;Last week;All;Yes;All;Last week;All;No;All;' + year.toString() + ';No;All;All');
        }

        /***************************************************************/
        /* Add support for pop-up info boxes.
        /***************************************************************/

        // InfoBox class
        function InfoBox(html) {
            this.div;  // Container div element
            this.html = html; // HTML to display inside the infobox 
        }

        // Add the infobox div to the page
        InfoBox.prototype.show = function (e) {
            if (this.div == undefined) {
                // Create the container div.
                this.div = document.createElement("div");
                this.div.className = "infobox";
                this.div.innerHTML = this.html;
                var mapDiv = document.getElementById('systemmapdiv');
                mapDiv.appendChild(this.div);
            }

            // Calculate the pixel position of the pushpin relative to the map control
            var pinLocation = systemsmap.tryLocationToPixel(e.target.getLocation(), Microsoft.Maps.PixelReference.control);

            // Display the infobox at the correct pixel coordinates
            this.div.style.left = pinLocation.x + "px";
            this.div.style.top = pinLocation.y + "px";
            this.div.style.visibility = "visible";
        };

        // Hide the infobox
        InfoBox.prototype.hide = function (e) {
            if (this.div != undefined)
                this.div.style.visibility = "hidden";
        };

        // Extend the Pushpin class to add an InfoBox object
        Microsoft.Maps.Pushpin.prototype.setInfoBox = function (infoBox) {
            if (typeof this.infoBox != undefined && this.infoBox != undefined && this.infoBox != null) {
                this.removeInfoBox();
            }
            // Assign the infobox to this pushpin
            this.infoBox = infoBox;

            // Add handlers for mouse events
            this.mouseoverHandler = Microsoft.Maps.Events.addHandler(this, 'mouseover', function (e) { infoBox.show(e); }
   );
            this.mouseoutHander = Microsoft.Maps.Events.addHandler(this, 'mouseout', function (e) { infoBox.hide(e); }
   );
        }

    </script>
    <style type="text/css">
      /* Define a style used for infoboxes */
      .infobox 
      {
       position: absolute;
       /*border: solid 2px black;*/
       background-color: White;
       z-index: 1000;
       padding: 2px;
       /*width: 180px;*/
      }
        .style1
        {
            width: 100%;
        }
        .style5
        {
            color: #336699;
            font-family: Tahoma;
            font-size: 8pt;
        }
        .style7
        {
            font-size: 8pt;
            text-align: right;
            color: #336699;
            font-family: Tahoma;
        }
        .style8
        {
            color: #FF9900;
            font-size: small;
        }
     </style>
</head>
<body  onload="onLoadSystems()">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <form id="form1" runat="server">

        <table class="style1" style="padding-bottom: 8px">
            <tr>
                <td 
                    style="padding-bottom: 8px;">
                    <span class="style8">VF & Wind Combined Map (TTs & PMs)</span></td>
            </tr>
            </table>

        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" 
            ShowCollapseBackwardButton="True" Theme="Aqua">
            <Panes>
                <dx:SplitterPane AutoHeight="True" Name="Missing" Size="250px">
                    <ContentCollection>
<dx:SplitterContentControl runat="server" SupportsDisabledAttribute="True">
    <dx:ASPxGridView ID="ASPxGridViewMissing" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="missing" EnableTheming="True" 
        KeyFieldName="Location;Tooltip" 
        OnCustomCallback="ASPxGridViewMissing_CustomCallback" 
        OnHtmlRowPrepared="ASPxGridViewMissing_HtmlRowPrepared" style="font-size: 8pt" 
        Theme="Metropolis" Width="100%">
        <Columns>
            <dx:GridViewDataTextColumn Caption="Combined not displayed on map" 
                FieldName="Location" Name="Location" ShowInCustomizationForm="True" 
                VisibleIndex="0" Width="250px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tooltip" ShowInCustomizationForm="True" 
                Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsPager AlwaysShowPager="True" PageSize="35" ShowNumericButtons="False">
            <Summary Text="{0} of {1} ({2} items)" />
        </SettingsPager>
        <Settings ShowColumnHeaders="False" ShowFilterBar="Auto" ShowFilterRow="True" 
            ShowFilterRowMenu="True" ShowTitlePanel="True" />
        <SettingsText Title="Tickets not displayed on map:" />
        <Styles>
            <Header BackColor="#0066CC" Font-Size="8pt" ForeColor="White">
            </Header>
            <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                <BackgroundImage ImageUrl="~/Images/GridRowBack.png" />
            </FocusedRow>
            <Cell Font-Size="8pt">
            </Cell>
            <PagerTopPanel Font-Size="8pt">
            </PagerTopPanel>
            <PagerBottomPanel Font-Size="8pt">
            </PagerBottomPanel>
            <TitlePanel Font-Size="9pt" ForeColor="#336699" HorizontalAlign="Left">
                <Border BorderStyle="None" />
            </TitlePanel>
        </Styles>
    </dx:ASPxGridView>
                        </dx:SplitterContentControl>
</ContentCollection>
                </dx:SplitterPane>
                <dx:SplitterPane AutoHeight="True" Name="Map">
                    <ContentCollection>
<dx:SplitterContentControl runat="server" SupportsDisabledAttribute="True">
    <table class="dxflInternalEditorTable_Aqua">
        <tr>
            <td>
                <div id="systemmapdiv" style="position:relative; top: 0px; left: -1px;">

    </div>
    </td>
        </tr>
    </table>
                        </dx:SplitterContentControl>
</ContentCollection>
                </dx:SplitterPane>
                <dx:SplitterPane Name="Param" Size="170px" ShowCollapseBackwardButton="False" 
                    ShowCollapseForwardButton="True">
                    <ContentCollection>
                        <dx:SplitterContentControl runat="server" SupportsDisabledAttribute="True">
                            <table class="dxeLyGroup_Metropolis" style="background-color: #FBFBFB;">
                                <tr>
                                    <td class="style7" width="70">
                                        &nbsp;</td>
                                    <td class="style5">
                                        <strong style="color: #CC3300">VF TTs</strong></td>
                                </tr>
                                <tr>
                                    <td class="style7" width="70">
                                        Show:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="VFTT" runat="server" ClientInstanceName="VFTT" 
                                            EnableTheming="True" Font-Size="8pt" SelectedIndex="0" style="font-size: 8pt" 
                                            Theme="Aqua" Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Yes" Value="Yes" />
                                                <dx:ListEditItem Text="No" Value="No" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7" width="70">
                                        Frozen:
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="VFreezed" runat="server" ClientInstanceName="VFreezed" 
                                            EnableTheming="True" Font-Size="8pt" SelectedIndex="2" style="font-size: 8pt" 
                                            Theme="Aqua" Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Text="Yes" Value="Yes" />
                                                <dx:ListEditItem Text="No" Value="No" />
                                                <dx:ListEditItem Text="All" Value="All" Selected="True" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Priority:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="VPriority" runat="server" ClientInstanceName="VPriority" 
                                            EnableTheming="True" Font-Size="8pt" SelectedIndex="3" Theme="Aqua" 
                                            Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
		coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Text="High" Value="High" />
                                                <dx:ListEditItem Text="Medium" Value="Medium" />
                                                <dx:ListEditItem Text="Low" Value="Low" />
                                                <dx:ListEditItem Text="All" Value="All" Selected="True" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <span class="style5">Period:</span></td>
                                    <td>
                                        <dx:ASPxComboBox ID="VPeriod" runat="server" ClientInstanceName="VPeriod" 
                                            EnableTheming="True" Font-Size="8pt" SelectedIndex="1" Theme="Aqua" 
                                            Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Text="All" Value="All" />
                                                <dx:ListEditItem Text="Last week" Value="Last week" Selected="True" />
                                                <dx:ListEditItem Text="Last 72 h" Value="Last 72 h" />
                                                <dx:ListEditItem Text="Last 24 h" Value="Last 24 h" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Processed:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="VProcessed" runat="server" ClientInstanceName="VProcessed" 
                                            EnableTheming="True" Font-Size="8pt" SelectedIndex="0" Theme="Aqua" 
                                            Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="All" Value="All" />
                                                <dx:ListEditItem Text="Yes" Value="Yes" />
                                                <dx:ListEditItem Text="No" Value="No" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td>
                                        <strong style="font-family: Tahoma; font-size: 8pt; color: #336699">Wind TTs</strong></td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Show:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="WTT" runat="server" ClientInstanceName="WTT" 
                                            EnableTheming="True" Font-Size="8pt" SelectedIndex="0" style="font-size: 8pt" 
                                            Theme="Aqua" Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Yes" Value="Yes" />
                                                <dx:ListEditItem Text="No" Value="No" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Priority:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="WPriority" runat="server" ClientInstanceName="WPriority" 
                                            EnableTheming="True" Font-Size="8pt" SelectedIndex="7" Theme="Aqua" 
                                            Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Text="Critical" Value="Critical" />
                                                <dx:ListEditItem Text="High" Value="High" />
                                                <dx:ListEditItem Text="Medium" Value="Medium" />
                                                <dx:ListEditItem Text="Low" Value="Low" />
                                                <dx:ListEditItem Text="EMERGENCY" Value="EMERGENCY" />
                                                <dx:ListEditItem Text="P1" Value="P1" />
                                                <dx:ListEditItem Text="P2" Value="P2" />
                                                <dx:ListEditItem Selected="True" Text="All" Value="All" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <span class="style5">Period</span>:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="WPeriod" runat="server" ClientInstanceName="WPeriod" 
                                            EnableTheming="True" Font-Size="8pt" SelectedIndex="1" Theme="Aqua" 
                                            Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Text="All" Value="All" />
                                                <dx:ListEditItem Text="Last week" Value="Last week" Selected="True" />
                                                <dx:ListEditItem Text="Last 72 h" Value="Last 72 h" />
                                                <dx:ListEditItem Text="Last 24 h" Value="Last 24 h" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <span class="style5">Processed</span>:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="WProcessed" runat="server" ClientInstanceName="WProcessed" 
                                            EnableTheming="True" Font-Size="8pt" SelectedIndex="0" style="font-size: 8pt" 
                                            Theme="Aqua" Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="All" Value="All" />
                                                <dx:ListEditItem Text="Yes" Value="Yes" />
                                                <dx:ListEditItem Text="No" Value="No" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td class="style5">
                                        <strong style="color: #CC3300">VF PMs</strong></td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Show:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="VFPM" runat="server" ClientInstanceName="VFPM" 
                                            EnableTheming="True" Font-Size="8pt" SelectedIndex="0" style="font-size: 8pt" 
                                            Theme="Aqua" Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Text="No" Value="No" Selected="True" />
                                                <dx:ListEditItem Text="Yes" Value="Yes" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Priority:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="VPPriority" runat="server" ClientInstanceName="VPPriority" 
                                            EnableTheming="True" Font-Size="8pt" OnLoad="ASPxComboBoxPriority_Load" 
                                            SelectedIndex="0" Theme="Aqua" Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="All" Value="All" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <span class="style5">Year</span>:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="VPPeriod" runat="server" ClientInstanceName="VPPeriod" 
                                            EnableTheming="True" Font-Size="8pt" OnLoad="ASPxComboBoxPeriod_Load" 
                                            Theme="Aqua" Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td class="style5">
                                        <strong>Wind PMs</strong></td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Show:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="WPM" runat="server" ClientInstanceName="WPM" 
                                            EnableTheming="True" Font-Size="8pt" SelectedIndex="0" style="font-size: 8pt" 
                                            Theme="Aqua" Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Text="No" Value="No" Selected="True" />
                                                <dx:ListEditItem Text="Yes" Value="Yes" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Type:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="WPPriority" runat="server" ClientInstanceName="WPPriority" 
                                            EnableTheming="True" Font-Size="8pt" OnLoad="WPPriority_Load" 
                                            SelectedIndex="0" Theme="Aqua" Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="All" Value="All" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <span class="style5">Year</span>:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="WPPeriod" runat="server" ClientInstanceName="WPPeriod" 
                                            EnableTheming="True" Font-Size="8pt" OnLoad="WPPeriod_Load" 
                                            SelectedIndex="0" Theme="Aqua" Width="100px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	coordinatesCallback.PerformCallback(VFTT.GetText()+';'+VFreezed.GetText()+';'+VPriority.GetText()+';'+VPeriod.GetText()+';'+VProcessed.GetText()+';'+WTT.GetText()+';'+WPriority.GetText()+';'+WPeriod.GetText()+';'+WProcessed.GetText()+';'+VFPM.GetText()+';'+VPPriority.GetText()+';'+VPPeriod.GetText()+';'+WPM.GetText()+';'+WPPriority.GetText()+';'+WPPeriod.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="All" Value="All" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
            </Panes>
            <Styles>
                <Pane>
                    <Paddings Padding="0px" />
                </Pane>
            </Styles>
        </dx:ASPxSplitter>

        <br />


    <dx:ASPxCallback ID="coordinatesCallback" runat="server" 
        ClientInstanceName="coordinatesCallback" 
        oncallback="ASPxCallback1_Callback" ClientIDMode="AutoID">
        <clientsideevents callbackcomplete="function(s, e) {
	    
}" EndCallback="function(s, e) {
	missing.PerformCallback();
}" />
    <ClientSideEvents callbackcomplete="function(s, e) {
    thearray = e.result.split('/');
    systemsmap.entities.clear();
    for (var i = 0; i &lt; thearray.length; i++)
    { 
    var innerarray = thearray[i].split(';');
    var latitude = innerarray[0];
    var longitude = innerarray[1];
　
    var customicon = 'bullet-red-icon.png'; 
    if (innerarray[2].indexOf('Wind ') &gt; -1)
    {
    customicon = 'bullet-blue-icon.png';
    }
　
    var pin= new Microsoft.Maps.Pushpin( new Microsoft.Maps.Location(latitude, longitude), {icon: customicon, width:32, height:32, anchor: new Microsoft.Maps.Point(16, 16)});
    AddInfoBox(pin, innerarray[2], innerarray[4]);
    systemsmap.entities.push(pin);
    } 
     
}"></ClientSideEvents>
    </dx:ASPxCallback>
    </form>
</body>
</html>
