<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nodes.aspx.cs" Inherits="TTWeb.Nodes" %>

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
        .style2
        {
            background-color: #FFFFEC;
        }
        .style3
        {
            text-align: right;
            background-color: #FFFFEC;
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
                        <td width="100%" valign="middle" align="left">VF Nodes
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

	 if(e.item.name == &quot;AddNode&quot;) 
	{          
		ASPxGridViewNodes.AddNewRow();
	}
}
                                    " />
                                <Items>
                                    <dx:MenuItem Name="AddNode" Text="Add Node">
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
    ClientInstanceName="ASPxGridViewNodes" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="ID" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewNodes" 
    EnableViewState="False" 
        Theme="Metropolis" style="font-size: 8pt" 
        OnRowInserting="ASPxGridViewNodes_RowInserting" 
        OnRowDeleting="ASPxGridViewNodes_RowDeleting" 
        OnRowUpdating="ASPxGridViewNodes_RowUpdating" 
        OnLoad="ASPxGridViewNodes_Load" 
        OnStartRowEditing="ASPxGridViewNodes_StartRowEditing" 
        OnHtmlEditFormCreated="ASPxGridViewNodes_HtmlEditFormCreated">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}"></ClientSideEvents>
<Columns>
    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Name="CommandButtons" ShowEditButton="True" ShowDeleteButton="True"/>
<dx:GridViewDataTextColumn FieldName="TYPE" ShowInCustomizationForm="True" 
        Name="TYPE" Caption="Type" VisibleIndex="3">
<PropertiesTextEdit>
<ReadOnlyStyle BackColor="#ECE9D8"></ReadOnlyStyle>
</PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="SITE" ShowInCustomizationForm="True" 
        Name="SITE" Caption="Site" VisibleIndex="2">
<PropertiesTextEdit>

<ValidationSettings>
<RequiredField IsRequired="True"></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="REGION" ShowInCustomizationForm="True" 
        Name="REGION" Caption="Region" VisibleIndex="4">
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>




    <dx:GridViewDataTextColumn Caption="Prefecture" FieldName="NOMOS" Name="NOMOS" 
        ShowInCustomizationForm="True" ToolTip="Response_Freeze" VisibleIndex="5">
        <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>




<dx:GridViewDataTextColumn FieldName="ID" 
        ShowInCustomizationForm="True" Name="ID" 
        Caption="ID" VisibleIndex="1" Visible="False">
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="CABINS_2G" ShowInCustomizationForm="True" 
        Name="CABINS_2G" Caption="Cabins 2G" VisibleIndex="6" Width="80px">
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="3G_ACTIVATED" ShowInCustomizationForm="True" 
        Name="3G_ACTIVATED" Caption="3G Activated" 
        VisibleIndex="7" Width="100px">
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>


        <dx:GridViewDataTextColumn Caption="NODE_ID" FieldName="NODE_ID" 
        Name="NODE_ID" ShowInCustomizationForm="True" 
        VisibleIndex="11" Visible="False">
    </dx:GridViewDataTextColumn>
    

    <dx:GridViewDataTextColumn Caption="STATUS" FieldName="STATUS" 
        Name="STATUS" ShowInCustomizationForm="True" VisibleIndex="12" 
        Visible="False">
    </dx:GridViewDataTextColumn>
               


<dx:GridViewDataTextColumn FieldName="LL_LINK" ShowInCustomizationForm="True" 
        Name="LL_LINK" Caption="LL_LINK" VisibleIndex="13" Visible="False">
    </dx:GridViewDataTextColumn>
    


    <dx:GridViewDataTextColumn Caption="RADIO_TYPE" FieldName="RADIO_TYPE" 
        Name="RADIO_TYPE" ShowInCustomizationForm="True" VisibleIndex="14" 
        Visible="False">
    </dx:GridViewDataTextColumn>
               


    <dx:GridViewDataTextColumn Caption="COLOCATION_HOST" 
        FieldName="COLOCATION_HOST" Name="COLOCATION_HOST" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
    </dx:GridViewDataTextColumn>
               


    <dx:GridViewDataTextColumn Caption="POWER" FieldName="POWER" Name="POWER" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="AIR_CONDITIONING_UNITS" 
        FieldName="AIR_CONDITIONING_UNITS" Name="AIR_CONDITIONING_UNITS" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="17">
        <PropertiesTextEdit DisplayFormatString="g">
        </PropertiesTextEdit>
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="LC_LINKS" FieldName="LC_LINKS" 
        Name="LC_LINKS" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="18">
        <PropertiesTextEdit DisplayFormatString="g">
        </PropertiesTextEdit>
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="HC_LINKS" FieldName="HC_LINKS" 
        Name="HC_LINKS" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="19">
        <PropertiesTextEdit DisplayFormatString="g">
        </PropertiesTextEdit>
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="HC_MULTI_PLEXERS" 
        FieldName="HC_MULTI_PLEXERS" Name="HC_MULTI_PLEXERS" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="20">
        <PropertiesTextEdit DisplayFormatString="g">
        </PropertiesTextEdit>
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="CRITICAL_RADIO" FieldName="CRITICAL_RADIO" 
        Name="CRITICAL_RADIO" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="21">
        <PropertiesTextEdit DisplayFormatString="g">
        </PropertiesTextEdit>
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="CRITICAL_TMN" FieldName="CRITICAL_TMN" 
        Name="CRITICAL_TMN" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="22">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="ISLAND" FieldName="ISLAND" Name="ISLAND" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="23">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Updated_on" FieldName="Updated_on" 
        Name="Updated_on" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="24">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Updated_by" FieldName="Updated_by" 
        Name="Updated_by" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="25">
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataTextColumn Caption="LATITUDE" FieldName="LATITUDE" 
        Name="LATITUDE" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="10">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="LONGITUDE" FieldName="LONGITUDE" 
        Name="LONGITUDE" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="9">
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataCheckColumn Caption="Coord/s" FieldName="Coord" Name="Coord" 
        ShowInCustomizationForm="True" VisibleIndex="8" Width="70px">
    </dx:GridViewDataCheckColumn>

            


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

<SettingsEditing Mode="EditForm"></SettingsEditing>

                    <Settings ShowFilterBar="Visible" ShowFilterRowMenu="True" 
                        ShowGroupPanel="True" 
                        ShowHeaderFilterButton="True" ShowFilterRow="True" />

<SettingsCookies Enabled="True" Version="31" StoreColumnsVisiblePosition="False"></SettingsCookies>

                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />


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
                    <Templates>
                        <EditForm>
                            <table class="dxflInternalEditorTable_Aqua">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td colspan="2">
                                        &nbsp;</td>
                                    <td style="text-align: right">
                                        <dx:ASPxImage ID="ASPxImage1" runat="server" Height="22px" 
                                            ImageUrl="~/Images/edit.png">
                                        </dx:ASPxImage>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        Site:</td>
                                    <td class="style2">
                                        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" BackColor="#FFFFEC" 
                                            Font-Size="8pt" Text='<%# Bind("SITE") %>' Width="200px" Theme="Aqua">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3">
                                        Prefecture:</td>
                                    <td class="style2">
                                        <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" BackColor="#FFFFEC" 
                                            Font-Size="8pt" Text='<%# Bind("NOMOS") %>' Width="200px" Theme="Aqua">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3" colspan="2">
                                        Type:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" BackColor="#FFFFEC" 
                                            Font-Size="8pt" Text='<%# Bind("TYPE") %>' Width="200px" Theme="Aqua">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        Cabins_2G:</td>
                                    <td class="style2">
                                        <dx:ASPxTextBox ID="ASPxTextBox4" runat="server" BackColor="#FFFFEC" 
                                            Font-Size="8pt" Text='<%# Bind("CABINS_2G") %>' Width="200px" Theme="Aqua">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3">
                                        3G_Activated:</td>
                                    <td class="style2">
                                        <dx:ASPxTextBox ID="ASPxTextBox5" runat="server" BackColor="#FFFFEC" 
                                            Font-Size="8pt" Text='<%# Bind("3G_ACTIVATED") %>' Width="200px" 
                                            Theme="Aqua">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="dxtcRightAlignCell_SoftOrange" colspan="2">
                                        Node_ID:</td>
                                    <td>
                                        <dx:ASPxSpinEdit ID="ASPxSpinEdit6" runat="server" Font-Size="8pt" 
                                            Height="21px" Number="0" NumberType="Integer" Theme="Aqua" 
                                            Value='<%# Bind("NODE_ID") %>' Width="200px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dxtcRightAlignCell_SoftOrange">
                                        Status:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="ASPxTextBox7" runat="server" Font-Size="8pt" 
                                            Text='<%# Bind("STATUS") %>' Width="200px" Theme="Aqua">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="dxtcRightAlignCell_SoftOrange">
                                        LL_Link:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="ASPxTextBox8" runat="server" Font-Size="8pt" 
                                            Text='<%# Bind("LL_LINK") %>' Width="200px" Theme="Aqua">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="dxtcRightAlignCell_SoftOrange" colspan="2">
                                        Radio_type:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="ASPxTextBox9" runat="server" Font-Size="8pt" 
                                            Text='<%# Bind("RADIO_TYPE") %>' Width="200px" Theme="Aqua">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dxtcRightAlignCell_SoftOrange">
                                        Collocation_host:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="ASPxTextBox10" runat="server" Font-Size="8pt" 
                                            Text='<%# Bind("COLOCATION_HOST") %>' Width="200px" Theme="Aqua">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="dxtcRightAlignCell_SoftOrange">
                                        Power:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="ASPxTextBox11" runat="server" Font-Size="8pt" 
                                            Text='<%# Bind("POWER") %>' Width="200px" Theme="Aqua">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="dxtcRightAlignCell_SoftOrange" colspan="2">
                                        Air_Conditioning_units:</td>
                                    <td>
                                        <dx:ASPxSpinEdit ID="ASPxSpinEdit1" runat="server" Font-Size="8pt" 
                                            Height="21px" Number="0" NumberType="Integer" Theme="Aqua" 
                                            Value='<%# Bind("AIR_CONDITIONING_UNITS") %>' Width="200px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dxtcRightAlignCell_SoftOrange">
                                        LC_Links:</td>
                                    <td>
                                        <dx:ASPxSpinEdit ID="ASPxSpinEdit2" runat="server" Font-Size="8pt" 
                                            Height="21px" Number="0" NumberType="Integer" Theme="Aqua" 
                                            Value='<%# Bind("LC_LINKS") %>' Width="200px" />
                                    </td>
                                    <td class="dxtcRightAlignCell_SoftOrange">
                                        HC_Links:</td>
                                    <td>
                                        <dx:ASPxSpinEdit ID="ASPxSpinEdit3" runat="server" Font-Size="8pt" 
                                            Height="21px" Number="0" NumberType="Integer" Theme="Aqua" 
                                            Value='<%# Bind("HC_LINKS") %>' Width="200px" />
                                    </td>
                                    <td class="dxtcRightAlignCell_SoftOrange" colspan="2">
                                        HC_Multi_Plexers:</td>
                                    <td>
                                        <dx:ASPxSpinEdit ID="ASPxSpinEdit4" runat="server" Font-Size="8pt" 
                                            Height="21px" Number="0" NumberType="Integer" Theme="Aqua" 
                                            Value='<%# Bind("HC_MULTI_PLEXERS") %>' Width="200px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dxtcRightAlignCell_SoftOrange">
                                        Critical_Radio:</td>
                                    <td>
                                        <dx:ASPxSpinEdit ID="ASPxSpinEdit5" runat="server" Font-Size="8pt" 
                                            Height="21px" Number="0" Theme="Aqua" Value='<%# Bind("CRITICAL_RADIO") %>' 
                                            Width="200px" />
                                    </td>
                                    <td class="dxtcRightAlignCell_SoftOrange">
                                        Critical_TMN:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="ASPxTextBox12" runat="server" Font-Size="8pt" 
                                            Text='<%# Bind("CRITICAL_TMN") %>' Width="200px" Theme="Aqua">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="dxtcRightAlignCell_SoftOrange" colspan="2">
                                        Area:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="ASPxTextBox13" runat="server" Font-Size="8pt" 
                                            Text='<%# Bind("ISLAND") %>' Width="200px" Theme="Aqua">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dxtcRightAlignCell_SoftOrange" bgcolor="AliceBlue">
                                        Latitude:</td>
                                    <td bgcolor="AliceBlue">
                                        <dx:ASPxTextBox ID="ASPxTextBox14" runat="server" BackColor="AliceBlue" 
                                            Font-Size="8pt" Text='<%# Bind("LATITUDE") %>' Theme="Aqua" Width="200px">
                                            <MaskSettings Mask="&lt;0..99&gt;\°&lt;0..99&gt;\'&lt;0..99&gt;\,&lt;0..99&gt;\&quot;" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="dxtcRightAlignCell_SoftOrange" bgcolor="AliceBlue">
                                        Longitude:</td>
                                    <td bgcolor="AliceBlue">
                                        <dx:ASPxTextBox ID="ASPxTextBox15" runat="server" BackColor="AliceBlue" 
                                            Font-Size="8pt" Text='<%# Bind("LONGITUDE") %>' Theme="Aqua" Width="200px">
                                            <MaskSettings Mask="&lt;0..99&gt;\°&lt;0..99&gt;\'&lt;0..99&gt;\,&lt;0..99&gt;\&quot;" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left">
                                        <dx:ASPxButton ID="ASPxButtonShowMap" runat="server" AutoPostBack="False" 
                                            Height="20px" HorizontalAlign="Left" 
                                            OnCustomJSProperties="ASPxButtonShowMap_CustomJSProperties" Theme="Metropolis" 
                                            ToolTip="Show Map" Width="30px">
                                            <ClientSideEvents Click="function(s, e) {
                                                                window.Coordinates = s.cpCoordinates;
                                                                mappopup.Show();
}" />
                                            <Image Height="22px" Url="~/Images/map.png">
                                            </Image>
                                            <Border BorderStyle="None" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="text-align: right">
                                        Region:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="ASPxComboBoxRegion" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" Theme="Aqua" Value='<%# Bind("REGION") %>' Width="200px">
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dxtcRightAlignCell_SoftOrange">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="dxtcRightAlignCell_SoftOrange">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="dxtcRightAlignCell_SoftOrange" colspan="2">
                                        &nbsp;</td>
                                    <td style="padding-top: 6px">
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="8pt" 
                                            ForeColor="#CC3300" style="font-style: italic" Text='<%# Bind("Updated_on") %>'>
                                        </dx:ASPxLabel>
                                        &nbsp;<dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="8pt" 
                                            ForeColor="#CC3300" Text='<%# Bind("Updated_by") %>' 
                                            style="font-style: italic">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
                            <dx:ASPxGridViewTemplateReplacement ID="Update" runat="server" 
                                ReplacementType="EditFormUpdateButton" />
                            <dx:ASPxGridViewTemplateReplacement ID="Cancel" runat="server" 
                                ReplacementType="EditFormCancelButton" />
                        </EditForm>
                        <DetailRow>
                            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" 
                                EnableTheming="True" Theme="PlasticBlue" Width="100%">
                                <TabPages>
                                    <dx:TabPage Text="Node">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                <table class="dxflInternalEditorTable_Aqua">
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td colspan="2">
                                                            &nbsp;</td>
                                                        <td style="text-align: right">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style3">
                                                            Site:</td>
                                                        <td class="style2">
                                                            <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" BackColor="#FFFFEC" 
                                                                Font-Size="8pt" ReadOnly="True" Text='<%# Eval("SITE") %>' Width="200px" 
                                                                Theme="Aqua">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3">
                                                            Prefecture:</td>
                                                        <td class="style2">
                                                            <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" BackColor="#FFFFEC" 
                                                                Font-Size="8pt" ReadOnly="True" Text='<%# Eval("NOMOS") %>' Width="200px" 
                                                                Theme="Aqua">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3" colspan="2">
                                                            Type:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" BackColor="#FFFFEC" 
                                                                Font-Size="8pt" ReadOnly="True" Text='<%# Eval("TYPE") %>' Width="200px" 
                                                                Theme="Aqua">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style3">
                                                            Cabins_2G:</td>
                                                        <td class="style2">
                                                            <dx:ASPxTextBox ID="ASPxTextBox4" runat="server" BackColor="#FFFFEC" 
                                                                Font-Size="8pt" ReadOnly="True" Text='<%# Eval("CABINS_2G") %>' 
                                                                Width="200px" Theme="Aqua">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3">
                                                            3G_Activated:</td>
                                                        <td class="style2">
                                                            <dx:ASPxTextBox ID="ASPxTextBox5" runat="server" BackColor="#FFFFEC" 
                                                                Font-Size="8pt" ReadOnly="True" Text='<%# Eval("3G_ACTIVATED") %>' 
                                                                Width="200px" Theme="Aqua">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="dxtcRightAlignCell_SoftOrange" colspan="2">
                                                            Node_ID:</td>
                                                        <td>
                                                            <dx:ASPxSpinEdit ID="ASPxSpinEdit6" runat="server" Font-Size="8pt" 
                                                                Height="21px" Number="0" ReadOnly="True" Theme="Aqua" 
                                                                Value='<%# Eval("NODE_ID") %>' Width="200px">
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="dxtcRightAlignCell_SoftOrange">
                                                            Status:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="ASPxTextBox7" runat="server" Font-Size="8pt" 
                                                                ReadOnly="True" Text='<%# Eval("STATUS") %>' Width="200px" Theme="Aqua">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="dxtcRightAlignCell_SoftOrange">
                                                            LL_Link:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="ASPxTextBox8" runat="server" Font-Size="8pt" 
                                                                ReadOnly="True" Text='<%# Eval("LL_LINK") %>' Width="200px" Theme="Aqua">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="dxtcRightAlignCell_SoftOrange" colspan="2">
                                                            Radio_type:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="ASPxTextBox9" runat="server" Font-Size="8pt" 
                                                                ReadOnly="True" Text='<%# Eval("RADIO_TYPE") %>' Width="200px" 
                                                                Theme="Aqua">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="dxtcRightAlignCell_SoftOrange">
                                                            Collocation_host:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="ASPxTextBox10" runat="server" Font-Size="8pt" 
                                                                ReadOnly="True" Text='<%# Eval("COLOCATION_HOST") %>' Width="200px" 
                                                                Theme="Aqua">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="dxtcRightAlignCell_SoftOrange">
                                                            Power:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="ASPxTextBox11" runat="server" Font-Size="8pt" 
                                                                ReadOnly="True" Text='<%# Eval("POWER") %>' Width="200px" Theme="Aqua">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="dxtcRightAlignCell_SoftOrange" colspan="2">
                                                            Air_Conditioning_units:</td>
                                                        <td>
                                                            <dx:ASPxSpinEdit ID="ASPxSpinEdit1" runat="server" Font-Size="8pt" 
                                                                Height="21px" Number="0" ReadOnly="True" Theme="Aqua" 
                                                                Value='<%# Eval("AIR_CONDITIONING_UNITS") %>' Width="200px">
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="dxtcRightAlignCell_SoftOrange">
                                                            LC_Links:</td>
                                                        <td>
                                                            <dx:ASPxSpinEdit ID="ASPxSpinEdit2" runat="server" Font-Size="8pt" 
                                                                Height="21px" Number="0" ReadOnly="True" Theme="Aqua" 
                                                                Value='<%# Eval("LC_LINKS") %>' Width="200px">
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                        <td class="dxtcRightAlignCell_SoftOrange">
                                                            HC_Links:</td>
                                                        <td>
                                                            <dx:ASPxSpinEdit ID="ASPxSpinEdit3" runat="server" Font-Size="8pt" 
                                                                Height="21px" Number="0" ReadOnly="True" Theme="Aqua" 
                                                                Value='<%# Eval("HC_LINKS") %>' Width="200px">
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                        <td class="dxtcRightAlignCell_SoftOrange" colspan="2">
                                                            HC_Multi_Plexers:</td>
                                                        <td>
                                                            <dx:ASPxSpinEdit ID="ASPxSpinEdit4" runat="server" Font-Size="8pt" 
                                                                Height="21px" Number="0" ReadOnly="True" Theme="Aqua" 
                                                                Value='<%# Eval("HC_MULTI_PLEXERS") %>' Width="200px">
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="dxtcRightAlignCell_SoftOrange">
                                                            Critical_Radio:</td>
                                                        <td>
                                                            <dx:ASPxSpinEdit ID="ASPxSpinEdit5" runat="server" Font-Size="8pt" 
                                                                Height="21px" Number="0" ReadOnly="True" Theme="Aqua" 
                                                                Value='<%# Eval("CRITICAL_RADIO") %>' Width="200px">
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                        <td class="dxtcRightAlignCell_SoftOrange">
                                                            Critical_TMN:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="ASPxTextBox12" runat="server" Font-Size="8pt" 
                                                                ReadOnly="True" Text='<%# Eval("CRITICAL_TMN") %>' Width="200px" 
                                                                Theme="Aqua">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="dxtcRightAlignCell_SoftOrange" colspan="2">
                                                            Area:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="ASPxTextBox13" runat="server" Font-Size="8pt" 
                                                                ReadOnly="True" Text='<%# Eval("ISLAND") %>' Width="200px" Theme="Aqua">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="dxtcRightAlignCell_SoftOrange" bgcolor="AliceBlue">
                                                            Latitude:</td>
                                                        <td bgcolor="AliceBlue">
                                                            <dx:ASPxTextBox ID="ASPxTextBox14" runat="server" BackColor="AliceBlue" 
                                                                Font-Size="8pt" ReadOnly="True" Text='<%# Eval("LATITUDE") %>' Theme="Aqua" 
                                                                Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="dxtcRightAlignCell_SoftOrange" bgcolor="AliceBlue">
                                                            Longitude:</td>
                                                        <td bgcolor="AliceBlue">
                                                            <dx:ASPxTextBox ID="ASPxTextBox15" runat="server" BackColor="AliceBlue" 
                                                                Font-Size="8pt" ReadOnly="True" Text='<%# Eval("LONGITUDE") %>' Theme="Aqua" 
                                                                Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="text-align: left">
                                                            <dx:ASPxButton ID="ASPxButtonShowMap" runat="server" AutoPostBack="False" 
                                                                Height="20px" HorizontalAlign="Left" 
                                                                OnCustomJSProperties="ASPxButtonShowMap_CustomJSProperties" Theme="Metropolis" 
                                                                Width="30px">
                                                                <ClientSideEvents Click="function(s, e) {
                                                                window.Coordinates = s.cpCoordinates;
                                                                mappopup.Show();
}" />
                                                                <Image Height="22px" Url="~/Images/map.png">
                                                                </Image>
                                                                <Border BorderStyle="None" />
                                                            </dx:ASPxButton>
                                                        </td>
                                                        <td style="text-align: right">
                                                            Region:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="ASPxTextBox16" runat="server" Font-Size="8pt" 
                                                                ReadOnly="True" Text='<%# Eval("REGION") %>' Theme="Aqua" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="dxtcRightAlignCell_SoftOrange">
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td class="dxtcRightAlignCell_SoftOrange">
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td class="dxtcRightAlignCell_SoftOrange" colspan="2">
                                                            &nbsp;</td>
                                                        <td style="padding-top: 6px">
                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="8pt" 
                                                                ForeColor="#CC3300" style="font-style: italic" Text='<%# Eval("Updated_on") %>'>
                                                            </dx:ASPxLabel>
                                                            &nbsp;<dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="8pt" 
                                                                ForeColor="#CC3300" Text='<%# Eval("Updated_by") %>' 
                                                                style="font-style: italic">
                                                            </dx:ASPxLabel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="Location History">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
 <dx:ASPxGridView ID="ASPxGridViewLocation" runat="server" 
                                AutoGenerateColumns="False" EnableTheming="True" style="font-size: 8pt" 
                                Theme="Office2003Blue" Width="100%" 
                                OnHtmlDataCellPrepared="ASPxGridViewLocation_HtmlDataCellPrepared" 
                                OnHtmlRowPrepared="ASPxGridViewLocation_HtmlRowPrepared" 
                                                    OnBeforePerformDataSelect="ASPxGridViewLocation_BeforePerformDataSelect">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Event Date" FieldName="Event_date" 
                                        Name="Event_date" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>


                                    <dx:GridViewDataComboBoxColumn Caption="Type" FieldName="Type" 
                                        Name="Type" ShowInCustomizationForm="True" VisibleIndex="2" 
                                        Width="50px">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem ImageUrl="~/Images/ticket.png" Text=" " Value="Ticket" />
                                                <dx:ListEditItem ImageUrl="~/Images/car.png" Text=" " Value="Visit" />
                                            </Items>
                                        </PropertiesComboBox>
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataComboBoxColumn>


                                    <dx:GridViewDataTextColumn Caption="Id" FieldName="ID" Name="ID" 
                                        ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Status" FieldName="Status" Name="Status" 
                                        ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataComboBoxColumn FieldName="Priority" 
                                        Name="Priority" ShowInCustomizationForm="True" VisibleIndex="0" 
                                        Width="30px">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem ImageUrl="~/Images/bullet_red.png" Text=" " Value="HIGH" />
                                                <dx:ListEditItem ImageUrl="~/Images/bullet_yellow.png" Text=" " Value="LOW" />
                                                <dx:ListEditItem ImageUrl="~/Images/bullet_blue.png" Text=" " 
                                                    Value="MEDIUM" />
                                            </Items>
                                        </PropertiesComboBox>
                                        <HeaderStyle>
                                        <Border BorderStyle="None" />
                                        </HeaderStyle>
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataComboBoxColumn>

                                    <dx:GridViewDataComboBoxColumn Caption="Freeze" FieldName="Freeze_Flag" 
                                        Name="Freeze_Flag" ShowInCustomizationForm="True" VisibleIndex="6" 
                                        ToolTip="Freeze_Flag" Width="50px">
                                        <PropertiesComboBox ShowImageInEditBox="True">
                                            <Items>
                                                <dx:ListEditItem ImageUrl="~/Images/Suspended.png" Text=" " Value="Yes" />
                                                <dx:ListEditItem Text=" " Value="No" />
                                            </Items>
                                            <ItemStyle Font-Size="0pt" HorizontalAlign="Center" />
                                            <Style HorizontalAlign="Center">
                                            </Style>
                                        </PropertiesComboBox>
                                        <Settings AllowAutoFilter="True" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataComboBoxColumn>

                                    <dx:GridViewDataTextColumn Caption="Visit" FieldName="Visit" Name="Visit" 
                                        ShowInCustomizationForm="True" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Solved" FieldName="Solved" Name="Solved" 
                                        ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Description" FieldName="Description" 
                                        Name="Description" ShowInCustomizationForm="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsCookies Enabled="True" Version="1" />
                                <Styles>
                                    <Row BackColor="WhiteSmoke">
                                    </Row>
                                </Styles>
                            </dx:ASPxGridView>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                </TabPages>
                            </dx:ASPxPageControl>
                        </DetailRow>
                    </Templates>
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
                            <Image Height="24px" ToolTip="Cancel" Url="~/Images/cancel.png">
                            </Image>
                        </CancelButton>
                        <UpdateButton>
                            <Image Height="24px" ToolTip="Save" Url="~/Images/Save.png">
                            </Image>
                        </UpdateButton>
                    </SettingsCommandButton>
</dx:ASPxGridView>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" 
        GridViewID="ASPxGridViewNodes" 
        MaxColumnWidth="500" PaperKind="A4">
        <Styles>
            <Default Font-Size="8pt">
            </Default>
        </Styles>
        <PageHeader Left="VF Nodes" Right="[Page # of Pages #]">
        </PageHeader>
        <PageFooter Left="TBSP Task Management System" 
            Right="[Date Printed] [Time Printed]">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" 
        ClientInstanceName="mappopup" HeaderText="Map" AllowDragging="True" 
        EnableClientSideAPI="True" Height="300px" 
        PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter"
        AllowResize="false" Width="300px" ShowFooter="true" FooterText="" 
        PopupAnimationType="Fade">
        <ContentStyle Paddings-Padding="0">
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
                <div id="systemmapdivpopup" style="position:relative; width:800px; height:580px;"></div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxCallback ID="ASPxCallbackMaps" runat="server" 
        ClientInstanceName="mapcallback">
    </dx:ASPxCallback>
    </form>
</body>
</html>
