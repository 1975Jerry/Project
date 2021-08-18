<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SchTicketInfoControl.ascx.cs" Inherits="TTWeb.SchTicketInfoControl" %>
<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>















<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>


<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx2" %>

<style type="text/css">
        .style1
        {
            width: 100%;
        font-size: 8pt;
    }
        .style3
        {
            color: #666666;
            text-align: right;
            width: 120px;
        }
        .style5
        {
            text-align: right;
            color: #CC3300;
        }
        .style6
        {
            color: #CC3300;
            text-align: right;
            width: 120px;
        }
        .style7
        {
            text-align: right;
            color: #CC3300;
            font-style: italic;
        }
        .style8
        {
            color: #CC3300;
        }
        .style9
        {
            color: #CC3300;
            text-align: right;
            width: 120px;
            font-style: italic;
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
}

.dxeTextBoxSys, 
.dxeMemoSys 
{
    border-collapse:separate!important;
        color: #009933;
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
        .style10
        {
            font-size: 8pt;
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
        .style11
    {
        color: #339966;
        text-align: right;
        width: 120px;
    }
        </style>

    <body style="font-size: 8pt">

    <div>

        <dx:ASPxMenu ID="ASPxMenu1" runat="server" BackColor="White" 
            EnableTheming="True" HorizontalAlign="Right" ItemAutoWidth="False" 
            Theme="Metropolis" Width="100%">
            <Items>
                <dx:MenuItem Name="Export" 
                    NavigateUrl="~/System_Views/SchTicketInfo_Report.aspx" Target="_blank" 
                    Text="Export Ticket Info">
                    <Image Height="12px" Url="~/Images/export.png">
                    </Image>
                </dx:MenuItem>
            </Items>
        </dx:ASPxMenu>

        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" 
            Theme="PlasticBlue" Width="100%" EnableCallBacks="True" 
            EnableClientSideAPI="True">
            <TabPages>
                <dx:TabPage Name="TicketInfo" Text="Ticket Info">
                    <ContentCollection>
                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                            <table bgcolor="White" class="style1">
                                <tr>
                                    <td class="style3" width="120">
                                        <span class="style10"></span>
                                    </td>
                                    <td width="20%">
                                        <span class="style10"></span>
                                    </td>
                                    <td class="style3" width="120">
                                        &nbsp;</td>
                                    <td width="20%">
                                        &nbsp;</td>
                                    <td class="style3" width="120">
                                        &nbsp;</td>
                                    <td style="text-align: right" valign="bottom" width="20%">
                                        <i style="color: #CC3300; text-align: right">Ticket ID</i></td>
                                    <td width="50">
                                        &nbsp;</td>
                                    <td style="text-align: right" width="70">
                                        <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/Images/identity.png">
                                        </dx:ASPxImage>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3" width="120">
                                        SRI:</td>
                                    <td width="20%">
                                        <dx:ASPxTextBox ID="SRI" runat="server" Font-Bold="True" Font-Size="8pt" 
                                            ForeColor="#990000" style="font-weight: 700" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3" width="120">
                                        TT id:</td>
                                    <td width="20%">
                                        <dx:ASPxTextBox ID="TTId" runat="server" Font-Bold="True" Font-Size="8pt" 
                                            ForeColor="#336699" style="font-weight: 700" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3" width="120">
                                        Priority:</td>
                                    <td width="20%">
                                        <dx:ASPxTextBox ID="Priority" runat="server" Font-Bold="True" Font-Size="8pt" 
                                            ForeColor="#336699" style="font-weight: 700" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td width="50">
                                        &nbsp;</td>
                                    <td style="border-color: #CCCCCC; border-right-style: solid; border-right-width: 1px;" 
                                        width="70">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style3" 
                                        style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        Ticket type:</td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        <dx:ASPxTextBox ID="TicketType" runat="server" Font-Bold="True" Font-Size="8pt" 
                                            ForeColor="#336699" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3" 
                                        style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        Status:</td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        <dx:ASPxTextBox ID="Status" runat="server" Font-Bold="True" Font-Size="8pt" 
                                            ForeColor="#336699" style="font-weight: 700" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3" 
                                        style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        Current Owner:</td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        <dx:ASPxTextBox ID="CurrentOwner" runat="server" Font-Bold="True" 
                                            Font-Size="8pt" ForeColor="#336699" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        &nbsp;</td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-right-style: solid; border-right-width: 1px; padding-bottom: 5px;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        &nbsp;</td>
                                    <td class="style7" valign="bottom">
                                        <i>Duration</i></td>
                                    <td class="style9" valign="bottom">
                                        &nbsp;</td>
                                    <td class="style5" valign="bottom">
                                        <i>Site</i></td>
                                    <td class="style9" valign="bottom">
                                        &nbsp;</td>
                                    <td style="text-align: right" valign="bottom">
                                        <span class="style8"><i style="text-align: right">Issue</i></span></td>
                                    <td class="dxtcRightAlignCell_SoftOrange" valign="bottom">
                                        &nbsp;</td>
                                    <td style="text-align: right">
                                        <dx:ASPxImage ID="ASPxImage5" runat="server" ImageUrl="~/Images/Issue.png">
                                        </dx:ASPxImage>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFF4F2" class="style3" width="120">
                                        Inc start on:</td>
                                    <td bgcolor="#FFF4F2" width="20%">
                                        <dx:ASPxDateEdit ID="IncStartOn" runat="server" BackColor="#FFF4F2" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm" EnableTheming="True" Font-Size="8pt" 
                                            Theme="DevEx" Width="100%" ReadOnly="True">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td bgcolor="#FFFFF4" class="style3" width="120">
                                        Node type:</td>
                                    <td bgcolor="#FFFFF4" width="20%">
                                        <dx:ASPxTextBox ID="NodeType" runat="server" BackColor="#FFFFF4" 
                                            Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td bgcolor="#FFFFF4" class="style3" width="120">
                                        Short description:</td>
                                    <td bgcolor="#FFFFF4" colspan="2" width="20%">
                                        <dx:ASPxTextBox ID="ShortDescription" runat="server" BackColor="#FFFFF4" 
                                            Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td bgcolor="#FFFFF4" 
                                        style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC;" 
                                        width="70">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFF4F2" class="style3">
                                        Inc end on:</td>
                                    <td bgcolor="#FFF4F2">
                                        <dx:ASPxDateEdit ID="IncEndOn" runat="server" BackColor="#FFF4F2" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm" EnableTheming="True" Font-Size="8pt" 
                                            Theme="DevEx" Width="100%" ReadOnly="True">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td bgcolor="#FFFFF4" class="style3">
                                        Location:</td>
                                    <td bgcolor="#FFFFF4">
                                        <dx:ASPxTextBox ID="Location" runat="server" BackColor="#FFFFF4" 
                                            Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td bgcolor="#FFFFF4" class="style3">
                                        Alarm severity:</td>
                                    <td bgcolor="#FFFFF4" colspan="2">
                                        <dx:ASPxTextBox ID="AlarmSeverity" runat="server" BackColor="#FFFFF4" 
                                            Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td bgcolor="#FFFFF4" 
                                        style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFF4F2" class="style3">
                                        TT creation on:</td>
                                    <td bgcolor="#FFF4F2">
                                        <dx:ASPxDateEdit ID="TTCreationOn" runat="server" BackColor="#FFF4F2" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm" EnableTheming="True" Font-Size="8pt" 
                                            Theme="DevEx" Width="100%" ReadOnly="True">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style3">
                                        Master node:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="MasterNode" runat="server" Font-Size="8pt" Width="100%" 
                                            ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3">
                                        Cause 1:</td>
                                    <td colspan="2">
                                        <dx:ASPxTextBox ID="Cause1" runat="server" Font-Size="8pt" Width="100%" 
                                            ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFF4F2" class="style3">
                                        Send to vendor on:</td>
                                    <td bgcolor="#FFF4F2">
                                        <dx:ASPxDateEdit ID="SendToVendorOn" runat="server" BackColor="#FFF4F2" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm" EnableTheming="True" Font-Size="8pt" 
                                            Theme="DevEx" Width="100%" Font-Bold="True" ReadOnly="True">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style3">
                                        Affected nodes:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="AffectedNodes" runat="server" Font-Size="8pt" Width="100%" 
                                            ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3">
                                        Cause 2:</td>
                                    <td colspan="2">
                                        <dx:ASPxTextBox ID="Cause2" runat="server" Font-Size="8pt" Width="100%" 
                                            ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFF4F2" class="style3">
                                        Response on:</td>
                                    <td bgcolor="#FFF4F2">
                                         <dx:ASPxDateEdit ID="ResponseOn" runat="server" BackColor="#FFF4F2" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm" EnableTheming="True" Font-Size="8pt" 
                                            Theme="DevEx" Width="100%" ReadOnly="True">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style3">
                                        BSC:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="Bsc" runat="server" Font-Size="8pt" Width="100%" 
                                            ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3">
                                        Spare parts No:</td>
                                    <td colspan="2">
                                        <dx:ASPxTextBox ID="SparePartsNo" runat="server" Font-Size="8pt" Width="100%" 
                                            ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFF4F2" class="style3">
                                        Resolution on:</td>
                                    <td bgcolor="#FFF4F2">
                                        <dx:ASPxDateEdit ID="ResolutionOn" runat="server" BackColor="#FFF4F2" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm" EnableTheming="True" Font-Size="8pt" 
                                            Theme="DevEx" Width="100%" ReadOnly="True">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style3">
                                        Geogr. location:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="GeogrLocation" runat="server" Font-Size="8pt" Width="100%" 
                                            ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3">
                                        Issuer:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="Issuer" runat="server" Font-Size="8pt" Width="100%" 
                                            ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style3" 
                                        style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        &nbsp;</td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px;">
                                        &nbsp;</td>
                                    <td class="style3" 
                                        style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        &nbsp;</td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px;">
                                        &nbsp;</td>
                                    <td class="style3" 
                                        style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        Assign to:</td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px;">
                                        <dx:ASPxTextBox ID="AssignTo" runat="server" Font-Size="8pt" Width="100%" 
                                            ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px;">
                                        &nbsp;</td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-right-style: solid; border-right-width: 1px;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style3" width="120">
                                        &nbsp;</td>
                                    <td class="style7" valign="bottom">
                                        <i>Freezed?</i></td>
                                    <td class="style6" valign="bottom" width="120">
                                        &nbsp;</td>
                                    <td class="style5" valign="bottom">
                                        <em>Cancelled?</em></td>
                                    <td class="style6" valign="bottom" width="120">
                                        &nbsp;</td>
                                    <td class="style5" valign="bottom">
                                        <em>Rejected?</em></td>
                                    <td width="50">
                                        &nbsp;</td>
                                    <td style="text-align: right" width="70">
                                        <dx:ASPxImage ID="ASPxImage6" runat="server" ImageUrl="~/Images/process.png" 
                                            style="text-align: right">
                                        </dx:ASPxImage>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F8F8F8" class="style3" width="120">
                                        Freeze flag:</td>
                                    <td bgcolor="#F8F8F8">
                                        <dx:ASPxTextBox ID="FreezeFlag" runat="server" BackColor="WhiteSmoke" 
                                            Font-Bold="True" Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td bgcolor="#F8F8F8" class="style3" width="120">
                                        <span class="style3">Cancellation flag:</span></td>
                                    <td bgcolor="#F8F8F8">
                                        <dx:ASPxTextBox ID="CancellationFlag" runat="server" BackColor="WhiteSmoke" 
                                            Font-Bold="True" Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td bgcolor="#F8F8F8" class="style3" width="120">
                                        Kintec rej. status flag:</td>
                                    <td bgcolor="#F8F8F8">
                                        <dx:ASPxTextBox ID="KintecRejStatusFlag" runat="server" BackColor="WhiteSmoke" 
                                            Font-Bold="True" Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td bgcolor="#F8F8F8" width="50">
                                        &nbsp;</td>
                                    <td bgcolor="#F8F8F8" 
                                        style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F8F8F8" class="style3">
                                        Response freeze:</td>
                                    <td bgcolor="#F8F8F8">
                                        <dx:ASPxTextBox ID="ResponseFreeze" runat="server" BackColor="WhiteSmoke" 
                                            Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td bgcolor="#F8F8F8" class="style3">
                                        <span class="style3">Cancellation on:</span></td>
                                    <td bgcolor="#F8F8F8">
                                        <dx:ASPxDateEdit ID="CancelationOn" runat="server" BackColor="WhiteSmoke" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm" EnableTheming="True" Font-Size="8pt" 
                                            Theme="DevEx" Width="100%" ReadOnly="True">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td bgcolor="#F8F8F8" class="style3">
                                        Last Kintec rej. flag:</td>
                                    <td bgcolor="#F8F8F8">
                                        <dx:ASPxTextBox ID="LastKintecRejFlag" runat="server" BackColor="WhiteSmoke" 
                                            Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td bgcolor="#F8F8F8">
                                        &nbsp;</td>
                                    <td bgcolor="#F8F8F8" 
                                        style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC">
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F8F8F8" class="style3">
                                        Resp. freeze reas.:</td>
                                    <td bgcolor="#F8F8F8">
                                        <dx:ASPxTextBox ID="ResponseFreezeReas" runat="server" BackColor="WhiteSmoke" 
                                            Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3">
                                        <span class="style3"></span>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td bgcolor="#F8F8F8" class="style3">
                                        Last VF rej. flag:</td>
                                    <td bgcolor="#F8F8F8">
                                        <dx:ASPxTextBox ID="LastVFRejFlag" runat="server" BackColor="WhiteSmoke" 
                                            Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td bgcolor="#F8F8F8">
                                        &nbsp;</td>
                                    <td bgcolor="#F8F8F8" 
                                        style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F8F8F8" class="style3">
                                        Restore freeze:</td>
                                    <td bgcolor="#F8F8F8">
                                        <dx:ASPxTextBox ID="RestoreFreeze" runat="server" BackColor="WhiteSmoke" 
                                            Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style3">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F8F8F8" class="style3" 
                                        style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        Rest. freeze reas.:</td>
                                    <td bgcolor="#F8F8F8" 
                                        style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px;">
                                        <dx:ASPxTextBox ID="RestoreFreezeReas" runat="server" BackColor="WhiteSmoke" 
                                            Font-Size="8pt" Width="100%" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style3" 
                                        style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        &nbsp;</td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px;">
                                        &nbsp;</td>
                                    <td class="style11" 
                                        
                                        style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        Last uploaded on</td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                        <dx:ASPxTextBox ID="LastUploadedOn" runat="server" Font-Size="8pt" 
                                            ForeColor="#339966" Width="100%" ReadOnly="True">
                                            <Border BorderWidth="0px" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px;">
                                        &nbsp;</td>
                                    <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-right-style: solid; border-right-width: 1px;">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="LocationHistory" Text="Location History">
                    <ContentCollection>
                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                            <dx:ASPxGridView ID="ASPxGridViewLocation" runat="server" 
                                AutoGenerateColumns="False" EnableTheming="True" style="font-size: 8pt" 
                                Theme="Office2003Blue" Width="100%" 
                                OnHtmlDataCellPrepared="ASPxGridViewLocation_HtmlDataCellPrepared" 
                                OnHtmlRowPrepared="ASPxGridViewLocation_HtmlRowPrepared">
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
            </div>



