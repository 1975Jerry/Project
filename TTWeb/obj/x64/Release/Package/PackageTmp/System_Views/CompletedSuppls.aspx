<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompletedSuppls.aspx.cs" Inherits="TTWeb.CompletedSuppls" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>










<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
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
        </style>
</head>
<body style="font-size: 8pt">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <script language="javascript" type="text/javascript">
    function OnGetSelectedFieldValues(selectedValues) {
        for (var i = 0; i < 36; i++) {
            var editor = ASPxGridViewCompletedSuppls.GetEditor(i + 1);
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
            GroupBoxCaptionOffsetY="-19px" HeaderText="Completed Suppls" 
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
                        <td width="100%" valign="middle" align="left">Completed VF Implementation & Supplementary Tickets
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
                <dx:ASPxGridView runat="server" 
    ClientInstanceName="ASPxGridViewCompletedSuppls" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="SUP_ID" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewCompletedSuppls" 
    EnableViewState="False" 
        Theme="Metropolis" style="font-size: 8pt" 
        OnCellEditorInitialize="ASPxGridViewCompletedSuppls_CellEditorInitialize">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}"></ClientSideEvents>
<Columns>
    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Name="CommandButtons" Visible="False"/>
<dx:GridViewDataTextColumn FieldName="SRI" 
        ShowInCustomizationForm="True" Name="SRI" 
        Caption="SRI" VisibleIndex="2" ReadOnly="True">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm">
    <ReadOnlyStyle BackColor="#ECE9D8">
    </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="STATUS" ShowInCustomizationForm="True" 
        Name="STATUS" Caption="Status" VisibleIndex="5">
    <PropertiesTextEdit MaxLength="4">
        <MaskSettings Mask="0000" />
        <ValidationSettings>
            <RequiredField IsRequired="True" />
        </ValidationSettings>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="SUP_ID" ShowInCustomizationForm="True" 
        Name="SUP_ID" Caption="ID" 
        VisibleIndex="1" ReadOnly="True">
    <PropertiesTextEdit>
        <ReadOnlyStyle BackColor="#ECE9D8">
        </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataComboBoxColumn FieldName="CATEGORY" 
        Name="CATEGORY" ShowInCustomizationForm="True" VisibleIndex="7" 
        Caption="Category">
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

        <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />

    </dx:GridViewDataComboBoxColumn>


        <dx:GridViewDataComboBoxColumn Caption="Name" FieldName="NAME" Name="NAME" 
        ShowInCustomizationForm="True" VisibleIndex="3">
            <PropertiesComboBox>
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataComboBoxColumn>




    <dx:GridViewDataDateColumn Caption="On date" FieldName="FOR_DATE" 
        Name="FOR_DATE" ShowInCustomizationForm="True" ToolTip="Restore_Freeze" 
        VisibleIndex="9">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>

            


<dx:GridViewDataTextColumn FieldName="SITE_NO" ShowInCustomizationForm="True" 
        Name="SITE_NO" Caption="Site no" VisibleIndex="4">
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>




    <dx:GridViewDataTextColumn Caption="When &gt;" FieldName="DEAD_LINE" 
        Name="DEAD_LINE" ShowInCustomizationForm="True" VisibleIndex="8">
        <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>




    <dx:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" Name="Tooltip" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="26">
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataTextColumn Caption="Type" FieldName="TYPE" 
        Name="TYPE" ShowInCustomizationForm="True" VisibleIndex="6">
        <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataTextColumn Caption="VF_CODE" FieldName="VF_CODE" Name="VF_CODE" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="25">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="SITE_NO" FieldName="SITE_NO" Name="SITE_NO" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="SAP_ORDER" FieldName="SAP_ORDER" 
        Name="SAP_ORDER" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="11">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="ACTIVITY" FieldName="ACTIVITY" 
        Name="ACTIVITY" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="12">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="ORDER_DESCRIPTION" 
        FieldName="ORDER_DESCRIPTION" Name="ORDER_DESCRIPTION" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="RESPONSIBLE_PERSON" 
        FieldName="RESPONSIBLE_PERSON" Name="RESPONSIBLE_PERSON" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="FOCAL_PERSON" FieldName="FOCAL_PERSON" 
        Name="FOCAL_PERSON" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="15">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="REQUEST_DATE" FieldName="REQUEST_DATE" 
        Name="REQUEST_DATE" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="16">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataDateColumn Caption="Execute date" FieldName="EXECUTE_DATE" 
        Name="EXECUTE_DATE" ShowInCustomizationForm="True" VisibleIndex="17">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>
    <dx:GridViewDataTextColumn Caption="COMMENTS_VF" FieldName="COMMENTS_VF" 
        Name="COMMENTS_VF" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="18">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="COMMENTS_TBSP" FieldName="COMMENTS_TBSP" 
        Name="COMMENTS_TBSP" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="19">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="VF_NOTIF_MAIL_DATE" 
        FieldName="VF_NOTIF_MAIL_DATE" Name="VF_NOTIF_MAIL_DATE" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="20">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="TBSP_CONTR_NOTIF_DATE" 
        FieldName="TBSP_CONTR_NOTIF_DATE" Name="TBSP_CONTR_NOTIF_DATE" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="21">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="RESPONSIBLE" FieldName="RESPONSIBLE" 
        Name="RESPONSIBLE" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="22">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Updated_on" FieldName="Updated_on" 
        Name="Updated_on" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="23">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Updated_by" FieldName="Updated_by" 
        Name="Updated_by" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="24">
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

                    <SettingsEditing Mode="Inline" />

                    <Settings ShowFilterBar="Visible" ShowFilterRowMenu="True" 
                        ShowGroupPanel="True" 
                        ShowHeaderFilterButton="True" ShowFilterRow="True" />

<SettingsCookies Enabled="True" Version="2" StoreColumnsVisiblePosition="False"></SettingsCookies>

                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />


<Styles CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css">
<Header SortingImageSpacing="10px" ImageSpacing="10px" BackColor="#0066CC" 
        ForeColor="White" Wrap="True"></Header>

    <Row BackColor="#F2FFFD">
    </Row>

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
                        <DetailRow>
                            <table cellpadding="0" cellspacing="0" class="dxflInternalEditorTable" 
                                width="100%">
                                <tr>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066" 
                                        width="120">
                                        &nbsp;</td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066">
                                        &nbsp;</td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066" 
                                        width="120">
                                        &nbsp;</td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066">
                                        &nbsp;</td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066" 
                                        width="120">
                                        &nbsp;</td>
                                    <td style="padding: 4px; border-right-style: solid; border-width: 2px 1px 1px 1px; border-color: #000066; border-top-style: solid; text-align: right;">
                                        <dx:ASPxImage ID="ASPxImage1" runat="server" Height="28px" 
                                            ImageUrl="~/Images/issue.png">
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
                                            Font-Bold="True" Font-Size="8pt" ReadOnly="True" Text='<%# Bind("SUP_ID") %>' 
                                            Theme="Aqua" Width="200px">
                                            <ReadOnlyStyle BackColor="#F4F4F4">
                                            </ReadOnlyStyle>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px" valign="middle">
                                        SRI:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" ReadOnly="True" Text='<%# Bind("SRI") %>' Theme="Aqua" 
                                            Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px" valign="middle">
                                        VF Code:</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066">
                                        <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" ReadOnly="True" Text='<%# Bind("VF_CODE") %>' Theme="Aqua" 
                                            Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        Location:</td>
                                    <td style="padding: 2px; background-color: #FFFFE6;">
                                        <dx:ASPxTextBox ID="ASPxTextBox20" runat="server" BackColor="#FFFFE6" 
                                            EnableTheming="True" Font-Size="8pt" ReadOnly="True" Text='<%# Bind("NAME") %>' 
                                            Theme="Aqua" Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        Site no:</td>
                                    <td style="background-color: #FFFFE6;">
                                        <dx:ASPxTextBox ID="ASPxTextBox17" runat="server" BackColor="#FFFFE6" 
                                            EnableTheming="True" Font-Size="8pt" ReadOnly="True" 
                                            Text='<%# Bind("SITE_NO") %>' Theme="Aqua" Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px" valign="middle">
                                        SAP order:</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066">
                                        <dx:ASPxTextBox ID="ASPxTextBox5" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" ReadOnly="True" Text='<%# Bind("SAP_ORDER") %>' Theme="Aqua" 
                                            Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        Type:</td>
                                    <td class="style13" style="padding: 2px; background-color: #FFFFE6;">
                                        <dx:ASPxTextBox ID="ASPxTextBox18" runat="server" BackColor="#FFFFE6" 
                                            EnableTheming="True" Font-Size="8pt" ReadOnly="True" Text='<%# Bind("TYPE") %>' 
                                            Theme="Aqua" Width="200px">
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        Status:</td>
                                    <td class="style13" style="background-color: #FFFFE6;">
                                        <dx:ASPxTextBox ID="ASPxTextBox7" runat="server" BackColor="#FFFFE6" 
                                            EnableTheming="True" Font-Bold="True" Font-Size="8pt" ReadOnly="True" 
                                            Text='<%# Bind("STATUS") %>' Theme="Aqua" Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style12" style="padding-right: 2px" valign="middle">
                                        Request date:</td>
                                    <td class="style13" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066">
                                        <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" 
                                            DisplayFormatString="dd/MM/yyyy" EnableTheming="True" Font-Size="8pt" 
                                            ReadOnly="True" Theme="Aqua" Value='<%# Bind("REQUEST_DATE") %>' Width="200px">
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px;" 
                                        valign="middle">
                                        Category:</td>
                                    <td style="padding: 2px">
                                        <dx:ASPxTextBox ID="ASPxTextBox19" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" ReadOnly="True" Text='<%# Bind("CATEGORY") %>' Theme="Aqua" 
                                            Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px" valign="middle">
                                        Activity:</td>
                                    <td colspan="3" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066">
                                        <dx:ASPxTextBox ID="ASPxTextBox9" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" ReadOnly="True" Text='<%# Bind("ACTIVITY") %>' Theme="Aqua" 
                                            Width="90%">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; background-color: #FFF2FF;" 
                                        valign="middle">
                                        When:</td>
                                    <td style="padding: 2px; background-color: #FFF2FF;">
                                        <dx:ASPxTextBox ID="ASPxTextBox10" runat="server" BackColor="#FFF2FF" 
                                            EnableTheming="True" Font-Size="8pt" ReadOnly="True" 
                                            Text='<%# Bind("DEAD_LINE") %>' Theme="Aqua" Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px; background-color: #FFF2FF;" 
                                        valign="middle">
                                        &gt; For date:</td>
                                    <td style="background-color: #FFF2FF">
                                        <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" BackColor="#FFF2FF" 
                                            DisplayFormatString="dd/MM/yyyy" Font-Size="8pt" ReadOnly="True" Theme="Aqua" 
                                            Value='<%# Bind("FOR_DATE") %>' Width="200px">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style11" style="padding-right: 2px; background-color: #FFF2FF;" 
                                        valign="middle">
                                        Execute date:</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFF2FF;">
                                        <dx:ASPxDateEdit ID="ASPxDateEdit3" runat="server" BackColor="#FFF2FF" 
                                            DisplayFormatString="dd/MM/yyyy" Font-Size="8pt" ReadOnly="True" Theme="Aqua" 
                                            Value='<%# Bind("EXECUTE_DATE") %>' Width="200px">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 6px; padding-bottom: 2px;" 
                                        valign="middle">
                                        Order description:</td>
                                    <td colspan="5" 
                                        style="padding: 6px 2px 2px 2px; border-right-style: solid; border-width: 1px; border-color: #000066">
                                        <dx:ASPxMemo ID="ASPxMemo1" runat="server" EnableTheming="True" Font-Size="8pt" 
                                            ReadOnly="True" Text='<%# Bind("ORDER_DESCRIPTION") %>' 
                                            Theme="Aqua" Width="95%" Rows="2">
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px;" 
                                        valign="middle">
                                        Comments VF:</td>
                                    <td colspan="5" 
                                        style="padding: 2px; border-right-style: solid; border-width: 1px; border-color: #000066">
                                        <dx:ASPxMemo ID="ASPxMemo2" runat="server" EnableTheming="True" Font-Size="8pt" 
                                            ReadOnly="True" Text='<%# Bind("COMMENTS_VF") %>' Theme="Aqua" 
                                            Width="95%" Rows="2">
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 6px;" 
                                        valign="middle">
                                        Comments TBSP:</td>
                                    <td colspan="5" 
                                        style="padding: 2px 2px 6px 2px; border-right-style: solid; border-width: 1px; border-color: #000066">
                                        <dx:ASPxMemo ID="ASPxMemo3" runat="server" EnableTheming="True" Font-Size="8pt" 
                                            ReadOnly="True" Text='<%# Bind("COMMENTS_TBSP") %>' Theme="Aqua" 
                                            Width="95%" Rows="2">
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px;" 
                                        valign="middle">
                                        Responsible:</td>
                                    <td style="padding: 2px">
                                        <dx:ASPxTextBox ID="ASPxTextBox14" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" ReadOnly="True" Text='<%# Bind("RESPONSIBLE") %>' Theme="Aqua" 
                                            Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px" valign="middle">
                                        Responsible person:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="ASPxTextBox15" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" ReadOnly="True" Text='<%# Bind("RESPONSIBLE_PERSON") %>' 
                                            Theme="Aqua" Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px" valign="middle">
                                        Focal person:</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066">
                                        <dx:ASPxTextBox ID="ASPxTextBox16" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" ReadOnly="True" Text='<%# Bind("FOCAL_PERSON") %>' Theme="Aqua" 
                                            Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px;" 
                                        valign="middle">
                                        VF Notif mail date:</td>
                                    <td style="padding: 2px">
                                        <dx:ASPxDateEdit ID="ASPxDateEdit4" runat="server" 
                                            DisplayFormatString="dd/MM/yy HH:mm" Font-Size="8pt" ReadOnly="True" 
                                            Theme="Aqua" Value='<%# Bind("VF_NOTIF_MAIL_DATE") %>' Width="200px">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style11" style="padding-right: 2px" valign="middle">
                                        TBSP Contr Notif date:</td>
                                    <td>
                                        <dx:ASPxDateEdit ID="ASPxDateEdit5" runat="server" 
                                            DisplayFormatString="dd/MM/yy HH:mm" Font-Size="8pt" ReadOnly="True" 
                                            Theme="Aqua" Value='<%# Bind("TBSP_CONTR_NOTIF_DATE") %>' Width="200px">
                                            <TimeSectionProperties Visible="True">
                                            </TimeSectionProperties>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="style11" style="padding-right: 2px">
                                        &nbsp;</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066">
                                        &nbsp;</td>
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
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Size="8pt" ForeColor="Maroon" 
                                            Text='<%# Bind("Updated_on") %>'>
                                        </dx:ASPxLabel>
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
                                            Text='<%# Bind("Updated_by") %>'>
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
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
        GridViewID="ASPxGridViewCompletedSuppls" Landscape="True" PaperKind="A4">
        <Styles>
            <Default Font-Size="8pt">
            </Default>
        </Styles>
        <PageHeader Left="Completed Implementation &amp; Supplementary Tickets" 
            Right="[Page # of Pages #]">
        </PageHeader>
        <PageFooter Left="TBSP Task Management System" 
            Right="[Date Printed] [Time Printed]">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
