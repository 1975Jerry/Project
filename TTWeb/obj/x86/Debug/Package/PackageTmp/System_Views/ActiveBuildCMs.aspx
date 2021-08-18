﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiveBuildCMs.aspx.cs" Inherits="TTWeb.ActiveBuildCMs" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>










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
            text-align: right;
            color: #666666;
        }
        .style12
        {
            text-align: right;
            color: #666666;
            height: 14px;
        }
        .style13
        {
            height: 14px;
        }
        .style15
        {
            color: #990000;
        }
        .style16
        {
            text-align: right;
            color: #666666;
            font-size: 8pt;
        }
        </style>
</head>
<body style="font-size: 8pt">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <script language="javascript" type="text/javascript">
    function OnGetSelectedFieldValues(selectedValues) {
        for (var i = 0; i < 36; i++) {
            var editor = ASPxGridViewActiveBuildCMs.GetEditor(i + 1);
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
            GroupBoxCaptionOffsetY="-19px" HeaderText="Active BuildCMs" 
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
                        <td width="100%" valign="middle" align="left">Active VF Buildings' CM Tickets
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

	 if(e.item.name == &quot;CreateSRI&quot;) 
	{
        popupsri1.Show();
        CallbackSRI.PerformCallback(ASPxGridViewActiveBuildCMs.GetRowKey(ASPxGridViewActiveBuildCMs.GetFocusedRowIndex()));
    }

	 if(e.item.name == &quot;AddSuppl&quot;) 
	{          
		ASPxGridViewActiveBuildCMs.AddNewRow();
	}
}
                                    " />
                                <Items>
                                    <dx:MenuItem Name="CreateSRI" Text="Create SRI ">
                                        <Image AlternateText="New" Height="12px" Url="~/Images/star.png">
                                        </Image>
                                    </dx:MenuItem>
                                    <dx:MenuItem Name="AddSuppl" Text="Add Build CM Ticket">
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
    ClientInstanceName="ASPxGridViewActiveBuildCMs" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="BU_ID" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewActiveBuildCMs" 
    EnableViewState="False" 
        Theme="Metropolis" style="font-size: 8pt" 
        OnHtmlRowPrepared="ASPxGridViewActiveBuildCMs_HtmlRowPrepared" 
        OnRowInserting="ASPxGridViewActiveBuildCMs_RowInserting" 
        OnRowDeleting="ASPxGridViewActiveBuildCMs_RowDeleting" 
        OnRowUpdating="ASPxGridViewActiveBuildCMs_RowUpdating" 
        OnLoad="ASPxGridViewActiveBuildCMs_Load" 
        OnStartRowEditing="ASPxGridViewActiveBuildCMs_StartRowEditing" 
        OnHtmlRowCreated="ASPxGridViewActiveBuildCMs_HtmlRowCreated">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}"></ClientSideEvents>
<Columns>
    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Name="CommandButtons" Caption=" " ShowEditButton="True" ShowDeleteButton="True"/>
<dx:GridViewDataTextColumn FieldName="SRI" 
        ShowInCustomizationForm="True" Name="SRI" 
        Caption="SRI" VisibleIndex="3" Width="150px">
        <Settings AutoFilterCondition="Contains" />
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm">
    <ReadOnlyStyle BackColor="#ECE9D8">
    </ReadOnlyStyle>
    </PropertiesTextEdit>
</dx:GridViewDataTextColumn>
    <dx:GridViewDataComboBoxColumn Caption="Category" FieldName="CATEGORY" 
        Name="CATEGORY" ShowInCustomizationForm="True" VisibleIndex="8" 
        Width="100px">
        <Settings AutoFilterCondition="Contains" />
        <PropertiesComboBox MaxLength="4">
            <ValidationSettings>
                <RequiredField IsRequired="True" />
            </ValidationSettings>
        </PropertiesComboBox>
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataCheckColumn Caption="To be Scheduled" FieldName="ToBeScheduled" 
        Name="ToBeScheduled" ShowInCustomizationForm="True" VisibleIndex="1" 
        Width="70px">
    </dx:GridViewDataCheckColumn>
<dx:GridViewDataTextColumn FieldName="BU_ID" ShowInCustomizationForm="True" 
        Name="BU_ID" Caption="ID" 
        VisibleIndex="2" ReadOnly="True" Width="80px">
        <Settings AutoFilterCondition="Contains" />
    <PropertiesTextEdit>
        <ReadOnlyStyle BackColor="#ECE9D8">
        </ReadOnlyStyle>
    </PropertiesTextEdit>
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataComboBoxColumn FieldName="JUSTIFICATION" 
        Name="JUSTIFICATION" ShowInCustomizationForm="True" VisibleIndex="10" 
        Caption="Justification" Width="100px">
        <Settings AutoFilterCondition="Contains" />
        <PropertiesComboBox>
            <Items>
                <dx:ListEditItem Text="Shelter" Value="Shelter" />
                <dx:ListEditItem Text="Antenna" Value="Antenna" />
                <dx:ListEditItem Text="Second Visit" Value="Second Visit" />
            </Items>
            <ValidationSettings>
                <RequiredField IsRequired="True" />
            </ValidationSettings>
        </PropertiesComboBox>

        <Settings FilterMode="DisplayText" />

    </dx:GridViewDataComboBoxColumn>


        <dx:GridViewDataComboBoxColumn Caption="Site" FieldName="SITE" Name="SITE" 
        ShowInCustomizationForm="True" VisibleIndex="5">
            <PropertiesComboBox>
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataComboBoxColumn>




    <dx:GridViewDataDateColumn Caption="Notification Date" FieldName="NOTIFICATION_DATE" 
        Name="NOTIFICATION_DATE" ShowInCustomizationForm="True" VisibleIndex="4" 
        ToolTip="Restore_Freeze" Width="110px">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy HH:mm">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>




    <dx:GridViewDataComboBoxColumn Caption="Priority" FieldName="PRIORITY" 
        Name="PRIORITY" ShowInCustomizationForm="True" VisibleIndex="7" 
        Width="80px">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>


    <dx:GridViewDataComboBoxColumn Caption="Cancel" FieldName="CANCELLED" 
        Name="CANCELLED" ShowInCustomizationForm="True" VisibleIndex="11" 
        Width="50px" ReadOnly="True">
        <PropertiesComboBox ShowImageInEditBox="True">
            <Items>
                <dx:ListEditItem ImageUrl="~/Images/reject.png" Text=" " Value="True" />
                <dx:ListEditItem Text=" " Value="False" />
            </Items>
            <ItemStyle Font-Size="0pt" HorizontalAlign="Center" />
            <ReadOnlyStyle BackColor="#ECE9D8">
            </ReadOnlyStyle>
            <Style HorizontalAlign="Center">
            </Style>
        </PropertiesComboBox>
        <Settings AllowAutoFilter="True" />

                <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False">
                </CellStyle>
    </dx:GridViewDataComboBoxColumn>


    <dx:GridViewDataTextColumn Caption="Work Order" FieldName="WORK_ORDER" Name="WORK_ORDER" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataDateColumn Caption="Completed on" FieldName="COMPLETED_ON" 
        Name="COMPLETED_ON" ShowInCustomizationForm="True" VisibleIndex="12" 
        Width="130px">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy HH:mm">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>




<dx:GridViewDataTextColumn FieldName="REGION" ShowInCustomizationForm="True" 
        Name="REGION" Caption="Region" VisibleIndex="6" Width="100px">
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>




    <dx:GridViewDataTextColumn Caption="Updated_on" FieldName="Updated_on" 
        Name="Updated_on" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="24">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Updated_by" FieldName="Updated_by" 
        Name="Updated_by" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="25">
    </dx:GridViewDataTextColumn>

            


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

<SettingsCookies Enabled="True" Version="3" StoreColumnsVisiblePosition="False"></SettingsCookies>

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
                            <table cellpadding="0" cellspacing="0" class="dxflInternalEditorTable" 
                                width="100%" style="font-size: 8pt">
                                <tr>
                                    <td style="border-top: 2px solid #000066; text-align: right; border-left-color: #000066; border-left-width: 2px; border-right-color: #000066; border-right-width: 2px; border-bottom-color: #000066; border-bottom-width: 2px; padding-top: 8px; padding-bottom: 8px;" 
                                        width="120">
                                        To be Scheduled:</td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066; padding-top: 8px; padding-bottom: 8px;">
                                        <dx:ASPxCheckBox ID="ASPxCheckBoxToBeScheduled" runat="server" 
                                            CheckState="Unchecked" Font-Size="8pt" style="font-size: 8pt" 
                                            Theme="Metropolis" Value='<%# Bind("ToBeScheduled") %>' Font-Bold="True">
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066" 
                                        width="120">
                                        &nbsp;</td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066">
                                        &nbsp;</td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066" 
                                        width="120">
                                        &nbsp;</td>
                                    <td style="padding: 4px; border-right-style: solid; border-width: 2px 1px 1px 1px; border-color: #000066; border-top-style: solid; text-align: right;">
                                        <dx:ASPxImage ID="ASPxImage1" runat="server" Height="22px" 
                                            ImageUrl="~/Images/Edit.png">
                                        </dx:ASPxImage>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px;" 
                                        valign="middle">
                                        ID:</td>
                                    <td style="padding: 2px">
                                        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" EnableTheming="True" 
                                            Font-Bold="True" Font-Size="8pt" ReadOnly="True" Text='<%# Bind("BU_ID") %>' 
                                            Theme="Aqua" Width="200px">
                                            <ReadOnlyStyle BackColor="#F4F4F4">
                                            </ReadOnlyStyle>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px" valign="middle">
                                        SRI:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" Text='<%# Bind("SRI") %>' Theme="Aqua" Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px" valign="middle">
                                        &nbsp;</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        <span class="style15">*</span> Site:</td>
                                    <td style="padding: 2px; background-color: #FFFFE6;">
                                        <dx:ASPxComboBox ID="Location" runat="server" BackColor="#FFFFE6" 
                                            DropDownStyle="DropDown" Font-Size="8pt" Theme="Aqua" 
                                            Value='<%# Bind("SITE") %>' Width="200px" IncrementalFilteringDelay="500" 
                                            IncrementalFilteringMode="Contains">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        Region:</td>
                                    <td style="background-color: #FFFFE6;">
                                        <dx:ASPxComboBox ID="Region" runat="server" BackColor="#FFFFE6" Font-Size="8pt" 
                                            IncrementalFilteringDelay="500" IncrementalFilteringMode="Contains" 
                                            Theme="Aqua" Value='<%# Bind("REGION") %>' Width="200px">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px" valign="middle">
                                        Priority:</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066">
                                        <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" EnableTheming="True" 
                                            Font-Bold="False" Font-Size="8pt" Text='<%# Bind("PRIORITY") %>' Theme="Aqua" 
                                            Width="200px">
                                            <Items>
                                                <dx:ListEditItem Text="High" Value="High" />
                                                <dx:ListEditItem Text="Medium" Value="Medium" />
                                                <dx:ListEditItem Text="Low" Value="Low" />
                                                <dx:ListEditItem Text="Not CM" Value="Not CM" />
                                            </Items>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; " 
                                        valign="middle">
                                        &nbsp;Category:</td>
                                    <td class="style13" style="padding: 2px; ">
                                        <dx:ASPxComboBox ID="Category" runat="server" BackColor="#FFFFE6" 
                                            EnableTheming="True" Font-Size="8pt" Theme="Aqua" 
                                            Width="200px" Text='<%# Bind("CATEGORY") %>' DropDownStyle="DropDown" 
                                            IncrementalFilteringDelay="500" IncrementalFilteringMode="Contains">
                                            <Items>
                                                <dx:ListEditItem Text="Implementation" Value="Implementation" />
                                                <dx:ListEditItem Text="Supplementary" Value="Supplementary" />
                                            </Items>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; " 
                                        valign="middle">
                                        Justification:</td>
                                    <td class="style13">
                                        <dx:ASPxComboBox ID="Justification" runat="server" 
                                            EnableTheming="True" Font-Bold="False" Font-Size="8pt" Theme="Aqua" 
                                            Width="200px" Text='<%# Bind("JUSTIFICATION") %>' DropDownStyle="DropDown" 
                                            IncrementalFilteringDelay="500" IncrementalFilteringMode="Contains">
                                            <Items>
                                                <dx:ListEditItem Text="Open" Value="Open" />
                                                <dx:ListEditItem Text="Closed" Value="Closed" />
                                                <dx:ListEditItem Text="Pending" Value="Pending" />
                                                <dx:ListEditItem Text="Cancelled" Value="Cancelled" />
                                                <dx:ListEditItem Text="Pending VF" Value="Pending VF" />
                                                <dx:ListEditItem Text="Access Problem" Value="Access Problem" />
                                            </Items>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style12" style="padding-right: 2px" valign="middle">
                                        Cancelled:</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066" 
                                        class="style13">
                                        <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" CheckState="Unchecked" 
                                            Font-Size="8pt" style="font-size: 8pt; font-weight: 700" Theme="Aqua" 
                                            Value='<%# Bind("CANCELLED") %>'>
                                        </dx:ASPxCheckBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; background-color: #FFF2FF;" 
                                        valign="middle">
                                        <span class="style15">*</span> Notific. date:</td>
                                    <td style="padding: 2px; background-color: #FFF2FF;">
                                        <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" BackColor="#FFF2FF" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" Font-Size="8pt" Theme="Aqua" 
                                            Value='<%# Bind("NOTIFICATION_DATE") %>' Width="200px">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style11" style="padding-right: 2px; background-color: #F2FFFC;" 
                                        valign="middle">
                                        Completed on:</td>
                                    <td style="background-color: #F2FFFC">
                                        <dx:ASPxDateEdit ID="ASPxDateEdit3" runat="server" BackColor="#F2FFFC" 
                                            DisplayFormatString="dd/MM/yyyy HH:mm" Font-Size="8pt" Theme="Aqua" 
                                            Value='<%# Bind("COMPLETED_ON") %>' Width="200px">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style11" style="padding-right: 2px; " 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066; ">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style16" 
                                        style="padding-right: 2px; padding-top: 6px; padding-bottom: 2px;" 
                                        valign="middle">
                                        Work order:</td>
                                    <td colspan="5" 
                                        style="padding: 6px 2px 2px 2px; border-right-style: solid; border-width: 1px; border-color: #000066">
                                        <dx:ASPxMemo ID="ASPxMemo1" runat="server" EnableTheming="True" Font-Size="8pt" 
                                            Text='<%# Bind("WORK_ORDER") %>' Theme="Aqua" 
                                            Width="95%" Rows="2">
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" style="padding-right: 2px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style11" style="padding-right: 2px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style11" style="padding-right: 2px">
                                        &nbsp;</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066">
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Font-Size="8pt" ForeColor="Maroon" 
                                            style="font-style: italic" Text='<%# Bind("Updated_by") %>'>
                                        </dx:ASPxLabel>
                                        &nbsp;<dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Size="8pt" ForeColor="Maroon" 
                                            Text='<%# Bind("Updated_on") %>' style="font-style: italic">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" style="padding-right: 2px; text-align: left;">
                                        <dx:ASPxGridViewTemplateReplacement ID="TempRep" runat="server" 
                                            ReplacementType="EditFormUpdateButton" />
                                        <dx:ASPxGridViewTemplateReplacement ID="TempRep2" runat="server" 
                                            ReplacementType="EditFormCancelButton" />
                                    </td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </EditForm>
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
    <dx:ASPxCallback ID="ASPxCallbackSRI" runat="server" 
        oncallback="ASPxCallbackSRI_Callback" ClientInstanceName="CallbackSRI">
        <ClientSideEvents CallbackComplete="function(s, e) {

if (e.result.split(';')[2] == &quot;no&quot;)
{
	    popupsri1.Hide();
        popupsri2.Show();
		processedrows.SetText(e.result.split(';')[0]);
		errorrows.SetText(e.result.split(';')[1]);
        ASPxGridViewActiveBuildCMs.Refresh();
} 
else
{
		popupsri1.Hide();
}
	
}" />
    </dx:ASPxCallback>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" 
        GridViewID="ASPxGridViewActiveBuildCMs" Landscape="True" PaperKind="A4">
        <Styles>
            <Default Font-Size="8pt">
            </Default>
        </Styles>
        <PageHeader Left="Active Buildings' CM Tickets" 
            Right="[Page # of Pages #]">
        </PageHeader>
        <PageFooter Left="TBSP Task Management System" 
            Right="[Date Printed] [Time Printed]">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    <dx:ASPxPopupControl ID="ASPxPopupControlSRI1" runat="server" 
        ClientInstanceName="popupsri1" EnableCallbackAnimation="True" 
        EnableClientSideAPI="True" HeaderText="SRI generation process" Height="100px" 
        Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" 
        PopupVerticalAlign="WindowCenter" Theme="Aqua" 
        Width="300px" ShowCloseButton="False" CloseAction="CloseButton">
        <HeaderStyle Font-Size="Small" />
        <ContentCollection>
<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
    <table class="dxflInternalEditorTable_Aqua">
        <tr>
            <td width="40%" class="style10">
                Genarating SRI identification. Please wait...</td>
        </tr>
    </table>
            </dx:PopupControlContentControl>
</ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="ASPxPopupControlSRI2" runat="server" 
        ClientInstanceName="popupsri2" EnableCallbackAnimation="True" 
        EnableClientSideAPI="True" HeaderText="New SRI generated" Height="100px" 
        Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" 
        PopupVerticalAlign="WindowCenter" Theme="Aqua" 
        Width="300px" CloseAction="CloseButton">
        <HeaderStyle Font-Size="Small" />
        <ContentCollection>
<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
    <table class="dxflInternalEditorTable_Aqua">
        <tr>
            <td width="40%" style="width: 70%">
                <span class="style10">SRI id:<br />  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </span>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" ClientInstanceName="processedrows" 
                    CssClass="style10" Font-Bold="True" Font-Size="8pt" 
                    style="color: #CC0000; font-weight: 700;" Text="0">
                </dx:ASPxLabel>
                &nbsp;<br class="style10" /> <span class="style10">has been assigned for the 
                Ticket
                </span>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" ClientInstanceName="errorrows" 
                    CssClass="style10" Font-Size="8pt" style="color: #000000; " Text="0">
                </dx:ASPxLabel>
                <span class="style10">. </span></td>
        </tr>
    </table>
            </dx:PopupControlContentControl>
</ContentCollection>
    </dx:ASPxPopupControl>
    </form>
</body>
</html>
