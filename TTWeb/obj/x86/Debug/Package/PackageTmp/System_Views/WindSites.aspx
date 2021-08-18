<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WindSites.aspx.cs" Inherits="TTWeb.WindSites" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>










<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0"></script>

    <script charset="UTF-8" type="text/javascript">
        var systemsmap = null;
        
        function windowresized() {
            var myWidth = document.documentElement.clientWidth - 20;
            var myHeight = document.documentElement.clientHeight - 20;
            var container = document.getElementById('systemmapdivpopup');
            container.style.width = myWidth + 'px';
            container.style.height = myHeight + 'px';
        }

        function AddInfoBox(pin, labelsystem, hastt) {

            var label = "<font size='2pt'>" + labelsystem + "</font>";
            //var label = "<strong>System </strong>" + labelsystem + "</strong><hr/>";
            pin.setInfoBox(new InfoBox(label));
        }

        function InitMap() {
            //var myWidth = document.documentElement.clientWidth - 20;
            //var myHeight = document.documentElement.clientHeight - 20;
            //var container = document.getElementById('systemmapdiv');
            //container.style.width = myWidth + 'px';
            //container.style.height = myHeight + 'px';

            var container = document.getElementById('systemmapdivpopup');
            if (systemsmap == null) {
                systemsmap = new Microsoft.Maps.Map(container, { credentials: 'An9eDuIsRVmZAKSD_iLrr4RMqqbK30ssMOwnBG_SEGBEp5MVLySR_diMHPsvAJ-h', center: new Microsoft.Maps.Location(38.333, 24.020202), mapTypeId: Microsoft.Maps.MapTypeId.auto, zoom: 7 });
            }
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
                var mapDiv = document.getElementById('systemmapdivpopup');
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
                        <td width="100%" valign="middle" align="left">Wind Sites
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

	 if(e.item.name == &quot;AddWindSite&quot;) 
	{          
		ASPxGridViewWindSites.AddNewRow();
	}
}
                                    " />
                                <Items>
                                    <dx:MenuItem Name="AddWindSite" Text="Add Site">
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
    ClientInstanceName="ASPxGridViewWindSites" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="ID" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewWindSites" 
    EnableViewState="False" 
        Theme="Metropolis" style="font-size: 8pt" 
        OnRowInserting="ASPxGridViewWindSites_RowInserting" 
        OnRowDeleting="ASPxGridViewWindSites_RowDeleting" 
        OnRowUpdating="ASPxGridViewWindSites_RowUpdating" 
        OnLoad="ASPxGridViewWindSites_Load" 
        OnCellEditorInitialize="ASPxGridViewWindSites_CellEditorInitialize" 
        OnHtmlRowPrepared="ASPxGridViewWindSites_HtmlRowPrepared" 
        OnHtmlRowCreated="ASPxGridViewWindSites_HtmlRowCreated">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}"></ClientSideEvents>
<Columns>
    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Name="CommandButtons" ShowEditButton="True" ShowDeleteButton="True"/>
<dx:GridViewDataTextColumn FieldName="SiteNo" ShowInCustomizationForm="True" 
        Name="SiteNo" Caption="Site No" VisibleIndex="2" Width="60px">
    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
</dx:GridViewDataTextColumn>




<dx:GridViewDataTextColumn FieldName="ID" 
        ShowInCustomizationForm="True" Name="ID" 
        Caption="ID" VisibleIndex="1" Visible="False">
</dx:GridViewDataTextColumn>


        <dx:GridViewDataTextColumn Caption="Site Name" FieldName="SiteName" 
        Name="SiteName" ShowInCustomizationForm="True" 
        VisibleIndex="4" Width="200px">
            <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataTextColumn>
    

    <dx:GridViewDataComboBoxColumn Caption="Category" FieldName="RNCategory" 
        Name="RNCategory" ShowInCustomizationForm="True" VisibleIndex="5">
        <PropertiesComboBox DropDownStyle="DropDown">
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataDateColumn Caption="Activ. Date" FieldName="ActivationDate" 
        Name="ActivationDate" ShowInCustomizationForm="True" VisibleIndex="6">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" 
            EditFormatString="dd/MM/yyyy">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>
    <dx:GridViewDataDateColumn Caption="Deactiv. Date" FieldName="DeactivationDate" 
        Name="DeactivationDate" ShowInCustomizationForm="True" VisibleIndex="7">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" 
            EditFormatString="dd/MM/yyyy">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>
    <dx:GridViewDataComboBoxColumn Caption="Technology" FieldName="Technology" 
        Name="Technology" ShowInCustomizationForm="True" VisibleIndex="8">
        <PropertiesComboBox DropDownStyle="DropDown">
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
               


<dx:GridViewDataTextColumn FieldName="Rsite" ShowInCustomizationForm="True" 
        Name="Rsite" Caption="Rsite" VisibleIndex="3" Width="60px">
    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataComboBoxColumn Caption="Transmission" FieldName="TransmRespons" 
        Name="TransmRespons" ShowInCustomizationForm="True" VisibleIndex="9">
        <PropertiesComboBox DropDownStyle="DropDown">
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataComboBoxColumn Caption="Zone" FieldName="GeographicalZone" 
        Name="GeographicalZone" ShowInCustomizationForm="True" VisibleIndex="10">
        <PropertiesComboBox DropDownStyle="DropDown">
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>
    

    <dx:GridViewDataTextColumn Caption="Latitude" FieldName="LATITUDE" 
        Name="LATITUDE" ShowInCustomizationForm="True" VisibleIndex="11">
        <PropertiesTextEdit MaxLength="6">
        </PropertiesTextEdit>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
        <EditCellStyle>
            <BorderRight BorderStyle="None" />
        </EditCellStyle>
        <FilterCellStyle>
            <BorderRight BorderStyle="None" />
        </FilterCellStyle>
        <HeaderStyle>
        <Border BorderStyle="None" />
        </HeaderStyle>
        <CellStyle HorizontalAlign="Left">
            <BorderRight BorderStyle="None" />
        </CellStyle>
    </dx:GridViewDataTextColumn>
               


    <dx:GridViewDataTextColumn Caption="Longitude" FieldName="LONGITUDE" 
        Name="LONGITUDE" ShowInCustomizationForm="True" VisibleIndex="12">
        <PropertiesTextEdit MaxLength="6">
        </PropertiesTextEdit>
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

    
    <dx:GridViewDataHyperLinkColumn Caption=" " ReadOnly="True" 
        ShowInCustomizationForm="True" UnboundExpression="Show Map" 
        UnboundType="String" VisibleIndex="13" Width="30px">
        <PropertiesHyperLinkEdit EnableClientSideAPI="True" NullDisplayText="Show Map" Target="_self" Text="Show Map">
        </PropertiesHyperLinkEdit>
        <EditCellStyle>
            <BorderLeft BorderStyle="None" />
        </EditCellStyle>
        <FilterCellStyle>
            <BorderLeft BorderStyle="None" />
        </FilterCellStyle>
        <DataItemTemplate>
            <dx:ASPxImage ID="mapbutton" runat="server" ImageUrl="~/images/map.png" 
                ToolTip="Show map" Width="18px">
                <ClientSideEvents Click="function(s, e) {
	                            if (typeof(s.cp_Coordinates) != 'undefined')
                            {
	                            window.Coordinates = s.cp_Coordinates;
                                mappopup.Show();
                            }
}" />
            </dx:ASPxImage>
        </DataItemTemplate>
        <Settings AllowAutoFilter="False" AllowGroup="False" 
            ShowFilterRowMenu="False" AllowHeaderFilter="False" />
        <EditFormSettings Visible="False" />
        <CellStyle>
            <BorderLeft BorderStyle="None" />
        </CellStyle>
    </dx:GridViewDataHyperLinkColumn>

    

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

<SettingsEditing Mode="Inline"></SettingsEditing>

                    <Settings ShowFilterBar="Visible" ShowFilterRowMenu="True" 
                        ShowGroupPanel="True" 
                        ShowHeaderFilterButton="True" ShowFilterRow="True" />

<SettingsCookies Enabled="True" Version="37" StoreColumnsVisiblePosition="False"></SettingsCookies>


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
        GridViewID="ASPxGridViewWindSites" 
        MaxColumnWidth="500" PaperKind="A4">
        <Styles>
            <Default Font-Size="8pt">
            </Default>
        </Styles>
        <PageHeader Left="Wind Sites" Right="[Page # of Pages #]">
        </PageHeader>
        <PageFooter Left="TBSP Task Management System" 
            Right="[Date Printed] [Time Printed]">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True" 
        AllowResize="false" ClientInstanceName="mappopup" EnableClientSideAPI="True" 
        FooterText="" HeaderText="Map" Height="300px" PopupAnimationType="Fade" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        ShowFooter="true" Width="300px">
        <ContentStyle Paddings-Padding="0">
<Paddings Padding="0px"></Paddings>
        </ContentStyle>
        <ClientSideEvents Shown="function(s, e) {
        InitMap();
        systemsmap.entities.clear();
        var coordstring = window.Coordinates;
        if (typeof(coordstring) != 'undefined')
        {
            var coords = coordstring.split(&quot;;&quot;);            
            var latitude = coords[0];
            var longitude = coords[1];
            var pin = new  Microsoft.Maps.Pushpin( new Microsoft.Maps.Location(latitude, longitude));
            AddInfoBox(pin, coords[2], coords[3]);
            systemsmap.entities.push(pin);
            systemsmap.setView({center:new Microsoft.Maps.Location(latitude, longitude)});
        }

}" />
        <ContentCollection>
            <dx:PopupControlContentControl>
                <div ID="systemmapdivpopup" 
                    style="position:relative; width:800px; height:580px;">
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    </form>
</body>
</html>
