<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddedVictusTickets.aspx.cs" Inherits="TTWeb.AddedVictusTickets" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>







<%@ Register src="SchTicketInfoControl.ascx" tagname="SchTicketInfoControl" tagprefix="uc1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        .style3
        {
            color: #666666;
            text-align: right;
            width: 120px;
        }
        .style10
        {
            font-size: 8pt;
        }
        .style7
        {
            text-align: right;
            color: #CC3300;
            font-style: italic;
        }
        .style9
        {
            color: #CC3300;
            text-align: right;
            width: 120px;
            font-style: italic;
        }
        .style5
        {
            text-align: right;
            color: #CC3300;
        }
        .style8
        {
            color: #CC3300;
        }
        .style11
    {
        color: #339966;
        text-align: right;
        width: 120px;
    }
        .style12
        {
            color: #FF9933;
            text-align: left;
        }
        .style14
        {
            background-color: #F5F5F5;
        }
        .style15
        {
            color: #666666;
            text-align: right;
            width: 120px;
            background-color: #F5F5F5;
        }
        .style16
        {
            color: #666666;
            text-align: right;
            width: 120px;
            background-color: #FFF4F2;
        }
        </style>
</head>
<body style="font-size: 8pt">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <script language="javascript" type="text/javascript">
    function OnGetSelectedFieldValues(selectedValues) {
        for (var i = 0; i < 36; i++) {
            var editor = ASPxGridViewAddedVictusTickets.GetEditor(i + 1);
            if (editor != null) {
                if (selectedValues[0][i] == null) {
                    editor.SetText('');
                }
                else {
                    editor.SetText(selectedValues[0][i]);
                }
            }
        }
    }

    function OnGetRowValues(values) {
        popupsri1.Hide();
        popupsri2.Show();

		processedrows.SetText(values[0]);
		errorrows.SetText(values[1]);

}

</script>

    <form id="form1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" 
            CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="Added VictusTickets" 
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
                        <td width="100%" valign="middle" align="left">Added Victus Trouble Tickets
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
                                Width="100%" ClientInstanceName="menuAttachment" SeparatorWidth="0px">
                                <ClientSideEvents ItemClick="function(s, e) {
	            ASPxGridViewAddedVictusTickets.AddNewRow()
    }
                                    " />
                                <Items>
                                    <dx:MenuItem Name="AddedTicket" Text="Add Ticket">
                                        <Image AlternateText="New" Height="12px" Url="~/Images/add.png">
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
    ClientInstanceName="ASPxGridViewAddedVictusTickets" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="TT_Id" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewAddedVictusTickets" 
    EnableViewState="False" 
        Theme="Metropolis" style="font-size: 8pt" 
        OnHtmlDataCellPrepared="ASPxGridViewAddedVictusTickets_HtmlDataCellPrepared" 
        OnRowInserting="ASPxGridViewAddedVictusTickets_RowInserting" 
        OnRowUpdating="ASPxGridViewAddedVictusTickets_RowUpdating" 
        OnRowDeleting="ASPxGridViewAddedVictusTickets_RowDeleting" 
        OnHtmlRowCreated="ASPxGridViewAddedVictusTickets_HtmlRowCreated">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}"></ClientSideEvents>
<Columns>
    <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ButtonType="Image" ShowEditButton="True" ShowDeleteButton="True"/>
<dx:GridViewDataTextColumn FieldName="SRI" 
        ShowInCustomizationForm="True" Name="SRI" 
        Caption="SRI" VisibleIndex="4">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm"></PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="TT_Id" ShowInCustomizationForm="True" 
        Name="TT_Id" Caption="TT Id" VisibleIndex="10">
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataDateColumn Caption="Send to Vendor on" 
        FieldName="Send_to_Vendor_Datetime" Name="Send_to_Vendor_Datetime" 
        ShowInCustomizationForm="True" VisibleIndex="2">
        <PropertiesDateEdit DisplayFormatString="">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>
<dx:GridViewDataTextColumn FieldName="Location" ShowInCustomizationForm="True" 
        Name="Location" Caption="Location" VisibleIndex="11">
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>


    <dx:GridViewDataComboBoxColumn FieldName="Priority" 
        Name="Priority" ShowInCustomizationForm="True" VisibleIndex="1" 
        Width="50px">
        <PropertiesComboBox>
            <Items>
                <dx:ListEditItem ImageUrl="~/Images/bullet_red.png" Text=" " Value="HIGH" />
                <dx:ListEditItem ImageUrl="~/Images/bullet_yellow.png" Text=" " Value="LOW" />
                <dx:ListEditItem ImageUrl="~/Images/bullet_blue.png" Text=" " 
                    Value="MEDIUM" />
            </Items>
        </PropertiesComboBox>

                <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False">
                </CellStyle>
    </dx:GridViewDataComboBoxColumn>


<dx:GridViewDataTextColumn FieldName="Status" ShowInCustomizationForm="True" 
        Name="Status" Caption="Status" VisibleIndex="15">
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>


     <dx:GridViewDataComboBoxColumn Caption="Kintec Reject." FieldName="Kintec_Rejection_Status_Flag" 
        Name="Kintec_Rejection_Status_Flag" ShowInCustomizationForm="True" VisibleIndex="5" 
        ToolTip="Kintec_Rejection_Status_Flag" Width="50px">
        <PropertiesComboBox ShowImageInEditBox="True">
            <Items>
                <dx:ListEditItem ImageUrl="~/Images/reject.png" Text=" " Value="True" />
                <dx:ListEditItem Text=" " Value="False" />
            </Items>
            <ItemStyle Font-Size="0pt" HorizontalAlign="Center" />
            <Style HorizontalAlign="Center">
            </Style>
        </PropertiesComboBox>
        <Settings AllowAutoFilter="True" />

                <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False">
                </CellStyle>
    </dx:GridViewDataComboBoxColumn>

            


    <dx:GridViewDataTextColumn Caption="Problem" FieldName="Short_Description" 
        Name="Short_Description" ShowInCustomizationForm="True" VisibleIndex="12">
        <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataTextColumn Caption="Owner" FieldName="Current_Owner" 
        Name="Current_Owner" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="23">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Type" FieldName="Ticket_Type" 
        Name="Ticket_Type" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="25">
    </dx:GridViewDataTextColumn>

         <dx:GridViewDataComboBoxColumn Caption="Cancel" FieldName="Cancellation_Flag" 
        Name="Cancellation_Flag" ShowInCustomizationForm="True" VisibleIndex="27" 
         Width="50px">
        <PropertiesComboBox ShowImageInEditBox="True">
            <Items>
                <dx:ListEditItem ImageUrl="~/Images/reject.png" Text=" " Value="True" />
                <dx:ListEditItem Text=" " Value="False" />
            </Items>
            <ItemStyle Font-Size="0pt" HorizontalAlign="Center" />
            <Style HorizontalAlign="Center">
            </Style>
        </PropertiesComboBox>
        <Settings AllowAutoFilter="True" />

                <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False">
                </CellStyle>
    </dx:GridViewDataComboBoxColumn>


    <dx:GridViewDataDateColumn Caption="Resolved on" 
        FieldName="Resolution_Datetime" Name="Resolution_Datetime" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="29">
        <PropertiesDateEdit DisplayFormatString="">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>
    <dx:GridViewDataDateColumn Caption="Response on" FieldName="Response_Datetime" 
        Name="Response_Datetime" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="31">
        <PropertiesDateEdit DisplayFormatString="">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>

    <dx:GridViewDataComboBoxColumn Caption="Frozen" FieldName="Freeze_Flag" 
        Name="Freeze_Flag" ShowInCustomizationForm="True" VisibleIndex="27" 
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

                    <Settings ShowFilterBar="Visible" ShowFilterRowMenu="True" 
                        ShowGroupPanel="True" 
                        ShowHeaderFilterButton="True" ShowFilterRow="True" />

<SettingsCookies Enabled="True" Version="23"></SettingsCookies>

                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />


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
                                    <td>
                                        &nbsp;</td>
                                    <td class="style3" width="120">
                                        &nbsp;</td>
                                    <td class="style8" style="text-align: right" valign="bottom" width="20%">
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" 
                                            style="font-size: 8pt; color: #333333" Text='<%# Bind("SRI") %>'>
                                        </dx:ASPxLabel>
                                        &nbsp;
                                        <dx:ASPxImage ID="ASPxImage1" runat="server" Height="22px" 
                                            ImageUrl="~/Images/edit.png">
                                        </dx:ASPxImage>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3" width="120">
                                        <span class="style12">* ** </span>TT id:</td>
                                    <td width="20%">
                                        <dx1:ASPxTextBox ID="TTId" runat="server" Font-Bold="False" Font-Size="8pt" 
                                            style="font-weight: 700" Text='<%# Bind("TT_Id") %>' Width="200px" 
                                            BackColor="#FFFFF4">
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx1:ASPxTextBox>
                                    </td>
                                    <td class="style3" width="120">
                                        <span class="style12">* </span>Priority:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="Priority" runat="server" EnableTheming="True" 
                                            Theme="DevEx" Value='<%# Bind("Priority") %>' Width="200px" 
                                            Font-Bold="False" Font-Size="8pt">
                                            <ClientSideEvents KeyDown="function(s, e) {
	if (e.htmlEvent.keyCode == 46)
    s.SetSelectedIndex(-1);
}" />
                                            <Items>
                                                <dx1:ListEditItem Text="CRITICAL" Value="CRITICAL" />
                                                <dx:ListEditItem Text="HIGH" Value="HIGH" />
                                                <dx:ListEditItem Text="MEDIUM 1" Value="MEDIUM 1" />
                                                <dx1:ListEditItem Text="MEDIUM 2" Value="MEDIUM 2" />
                                                <dx:ListEditItem Text="LOW" Value="LOW" />
                                            </Items>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style3" width="120">
                                        &nbsp;</td>
                                    <td width="20%">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <span class="style12">* </span>Ticket type:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="TicketType" runat="server" EnableTheming="True" 
                                            Theme="DevEx" Value='<%# Bind("Ticket_Type") %>' Width="200px" 
                                            Font-Bold="False" Font-Size="8pt">
                                            <ClientSideEvents KeyDown="function(s, e) {
	if (e.htmlEvent.keyCode == 46)
    s.SetSelectedIndex(-1);
}" />
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style3">
                                        <span class="style12">*&nbsp; </span>Location:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="Location" runat="server" BackColor="#FFFFF4" 
                                            EnableTheming="True" Font-Bold="False" Font-Size="8pt" Theme="DevEx" 
                                            Value='<%# Bind("Location") %>' Width="100%" 
                                            IncrementalFilteringDelay="500" IncrementalFilteringMode="Contains">
                                            <ClientSideEvents KeyDown="function(s, e) {
	if (e.htmlEvent.keyCode == 46)
    s.SetSelectedIndex(-1);
}" />
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <span class="style12">* </span>Status:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="Status" runat="server" EnableTheming="True" Theme="DevEx" 
                                            Value='<%# Bind("Status") %>' Width="200px" Font-Bold="False" 
                                            Font-Size="8pt">
                                            <ClientSideEvents KeyDown="function(s, e) {
	if (e.htmlEvent.keyCode == 46)
    s.SetSelectedIndex(-1);
}" />
                                            <Items>
                                                <dx:ListEditItem Text="APPR" Value="APPR" />
                                                <dx:ListEditItem Text="ASSIGNED" Value="ASSIGNED" />
                                                <dx:ListEditItem Text="CAN" Value="CAN" />
                                                <dx1:ListEditItem Text="CLOSE" Value="CLOSE" />
                                                <dx1:ListEditItem Text="COMP" Value="COMP" />
                                                <dx1:ListEditItem Text="FAIL" Value="FAIL" />
                                                <dx1:ListEditItem Text="INPRG" Value="INPRG" />
                                                <dx1:ListEditItem Text="SUSPEND" Value="SUSPEND" />
                                                <dx1:ListEditItem Text="WAPPR" Value="WAPPR" />
                                                <dx1:ListEditItem Text="WSUSPEND" Value="WSUSPEND" />
                                                <dx1:ListEditItem Text="PENDING ACCESS" Value="PENDING ACCESS" />
                                                <dx1:ListEditItem Text="PENDING SPARES" Value="PENDING SPARES" />
                                                <dx1:ListEditItem Text="PENDING OTHER" Value="PENDING OTHER" />
                                            </Items>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style3">
                                        <span class="style12">* </span>Short description:</td>
                                    <td>
                                        <dx1:ASPxTextBox ID="ShortDescription" runat="server" 
                                            Font-Size="8pt" Text='<%# Bind("Short_Description") %>' Width="100%" 
                                            Font-Bold="False" Theme="DevEx">
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx1:ASPxTextBox>
                                    </td>
                                    <td class="style3">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        &nbsp;</td>
                                    <td class="style7" valign="bottom">
                                        &nbsp;</td>
                                    <td class="style9" valign="bottom">
                                        &nbsp;</td>
                                    <td class="style5" valign="bottom">
                                        &nbsp;</td>
                                    <td class="style9" valign="bottom">
                                        &nbsp;</td>
                                    <td style="text-align: left" valign="bottom">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFF4F2" class="style3" width="120">
                                        Inc Start time:</td>
                                    <td bgcolor="#FFF4F2" width="20%">
                                        <dx1:ASPxDateEdit ID="IncStartTime" runat="server" BackColor="#FFF4F2" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm" EnableTheming="True" Font-Bold="True" 
                                            Font-Size="8pt" Theme="DevEx" Value='<%# Bind("INC_Start_Datetime") %>' 
                                            Width="200px">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx1:ASPxDateEdit>
                                    </td>
                                    <td class="style15" width="120">
                                        Freeze flag:</td>
                                    <td class="style14">
                                        <dx:ASPxComboBox ID="FreezeFlag" runat="server" BackColor="WhiteSmoke" 
                                            EnableTheming="True" Theme="DevEx" Value='<%# Bind("Freeze_Flag") %>' 
                                            Width="100px">
                                            <ClientSideEvents KeyDown="function(s, e) {
	if (e.htmlEvent.keyCode == 46)
    s.SetSelectedIndex(-1);
}" />
                                            <Items>
                                                <dx:ListEditItem Text="Yes" Value="Yes" />
                                                <dx:ListEditItem Text="No" Value="No" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td 
                                        style="border-bottom-width: 1px; border-left-width: 1px; border-color: #CCCCCC; " 
                                        width="120">
                                        &nbsp;</td>
                                    <td class="dxmBrdCor" width="20%" 
                                        style="border-width: 1px; border-color: #C0C0C0; border-left-style: solid">
                                        <span class="style12">* mandatory fields</span></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFF4F2" class="style3">
                                        <span class="style12">* </span>Scheduled start:</td>
                                    <td bgcolor="#FFF4F2">
                                        <dx1:ASPxDateEdit ID="SendToVendorOn" runat="server" BackColor="#FFF4F2" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm" EnableTheming="True" Font-Bold="False" 
                                            Font-Size="8pt" Theme="DevEx" Value='<%# Bind("Send_to_Vendor_Datetime") %>' 
                                            Width="200px">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx1:ASPxDateEdit>
                                    </td>
                                    <td class="style15">
                                        <span class="style3">Cancellation flag:</span></td>
                                    <td class="style14">
                                        <dx:ASPxComboBox ID="CancellationFlag" runat="server" BackColor="WhiteSmoke" 
                                            EnableTheming="True" Theme="DevEx" Value='<%# Bind("Cancellation_Flag") %>' 
                                            Width="100px">
                                            <ClientSideEvents KeyDown="function(s, e) {
	if (e.htmlEvent.keyCode == 46)
    s.SetSelectedIndex(-1);	
}" />
                                            <Items>
                                                <dx:ListEditItem Text="True" Value="True" />
                                                <dx:ListEditItem Text="False" Value="False" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="dxmBrdCor" rowspan="2" 
                                        style="border-width: 1px; border-color: #C0C0C0; border-left-style: solid">
                                        <span class="style12">** Attention: when Uploading VictusTickets, the specific ticket 
                                        will be automatically updated based on the TT Id value.</span></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFF4F2" class="style3">
                                        Response on:</td>
                                    <td bgcolor="#FFF4F2">
                                        <dx1:ASPxDateEdit ID="ResponseOn" runat="server" BackColor="#FFF4F2" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm" EnableTheming="True" Font-Size="8pt" 
                                            Theme="DevEx" Value='<%# Bind("Response_Datetime") %>' Width="200px">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                        </dx1:ASPxDateEdit>
                                    </td>
                                    <td class="style15">
                                        Kintec rej. status flag:</td>
                                    <td class="style14">
                                        <dx:ASPxComboBox ID="KintecRejStatusFlag" runat="server" BackColor="WhiteSmoke" 
                                            EnableTheming="True" Theme="DevEx" 
                                            Value='<%# Bind("Kintec_Rejection_Status_Flag") %>' Width="100px">
                                            <ClientSideEvents KeyDown="function(s, e) {
	if (e.htmlEvent.keyCode == 46)
    s.SetSelectedIndex(-1);	
}" />
                                            <Items>
                                                <dx:ListEditItem Text="True" Value="True" />
                                                <dx:ListEditItem Text="False" Value="False" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        Resolution on:</td>
                                    <td class="dxmBrdCor" style="background-color: #FFF4F2">
                                        <dx1:ASPxDateEdit ID="ResolutionOn" runat="server" BackColor="#FFF4F2" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm" EnableTheming="True" Font-Size="8pt" 
                                            Theme="DevEx" Value='<%# Bind("Resolution_Datetime") %>' Width="200px">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                        </dx1:ASPxDateEdit>
                                    </td>
                                    <td class="style3">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style3">
                                        &nbsp;</td>
                                    <td class="dxmBrdCor" rowspan="2" 
                                        style="border-width: 1px; border-color: #C0C0C0; border-left-style: solid">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        Inc End time:</td>
                                    <td class="dxmBrdCor" style="background-color: #FFF4F2">
                                        <dx1:ASPxDateEdit ID="IncEndTime" runat="server" BackColor="#FFF4F2" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" 
                                            EditFormatString="dd/MM/yyyy HH:mm" EnableTheming="True" Font-Bold="True" 
                                            Font-Size="8pt" Theme="DevEx" Value='<%# Bind("INC_End_Datetime") %>' 
                                            Width="200px">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx1:ASPxDateEdit>
                                    </td>
                                    <td class="style3">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style3">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td class="dxmBrdCor">
                                        &nbsp;</td>
                                    <td class="style11">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style11">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <dx:ASPxGridViewTemplateReplacement ID="Update" runat="server" 
                                ReplacementType="EditFormUpdateButton" />
                            <dx:ASPxGridViewTemplateReplacement ID="Cancel" runat="server" 
                                ReplacementType="EditFormCancelButton" />
                        </EditForm>
                    </Templates>
                    <SettingsCommandButton>
                        <EditButton Text="Edit">
                            <Image Height="10px" Url="~/Images/Edit.png">
                            </Image>
                        </EditButton>
                        <DeleteButton Text="Delete">
                            <Image Height="10px" Url="~/Images/delete.png">
                            </Image>
                        </DeleteButton>
                        <CancelButton Text="Cancel">
                            <Image Height="22px" Url="~/Images/Cancel.png">
                            </Image>
                        </CancelButton>
                        <UpdateButton Text="Save">
                            <Image Height="22px" Url="~/Images/Save.png">
                            </Image>
                        </UpdateButton>
                    </SettingsCommandButton>
</dx:ASPxGridView>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" 
        GridViewID="ASPxGridViewAddedVictusTickets" Landscape="True" 
        MaxColumnWidth="500" PaperKind="A4">
        <Styles>
            <Default Font-Size="8pt">
            </Default>
        </Styles>
        <PageHeader Left="Added VictusTickets" Right="[Page # of Pages #]">
        </PageHeader>
        <PageFooter Left="TBSP Task Management System" 
            Right="[Date Printed] [Time Printed]">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
