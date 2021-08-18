<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompletedChargeable.aspx.cs" Inherits="TTWeb.CompletedChargeable" %>

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
        }
        .style15
        {
            color: #990000;
        }
        </style>
</head>
<body style="font-size: 8pt">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <script language="javascript" type="text/javascript">
    function OnGetSelectedFieldValues(selectedValues) {
        for (var i = 0; i < 36; i++) {
            var editor = ASPxGridViewCompletedChargeable.GetEditor(i + 1);
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
            GroupBoxCaptionOffsetY="-19px" HeaderText="Completed Chargeable" 
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
                        <td width="100%" valign="middle" align="left">Completed Chargeable Tickets
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
    ClientInstanceName="ASPxGridViewCompletedChargeable" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="CH_ID" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewCompletedChargeable" 
    EnableViewState="False" 
        Theme="Metropolis" style="font-size: 8pt" 
        OnHtmlRowPrepared="ASPxGridViewCompletedChargeable_HtmlRowPrepared" 
        OnRowInserting="ASPxGridViewCompletedChargeable_RowInserting" 
        OnRowDeleting="ASPxGridViewCompletedChargeable_RowDeleting" 
        OnRowUpdating="ASPxGridViewCompletedChargeable_RowUpdating" 
        OnLoad="ASPxGridViewCompletedChargeable_Load" 
        OnStartRowEditing="ASPxGridViewCompletedChargeable_StartRowEditing" 
        OnHtmlRowCreated="ASPxGridViewCompletedChargeable_HtmlRowCreated">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}"></ClientSideEvents>
<Columns>
    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Name="CommandButtons" Caption=" " Visible="False"/>
<dx:GridViewDataTextColumn FieldName="SRI" 
        ShowInCustomizationForm="True" Name="SRI" 
        Caption="SRI" VisibleIndex="3" ReadOnly="True" Width="150px">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm">
    <ReadOnlyStyle BackColor="#ECE9D8">
    </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="DESCRIPTION" ShowInCustomizationForm="True" 
        Name="DESCRIPTION" Caption="Description" VisibleIndex="8">
    <PropertiesTextEdit MaxLength="4">
        <MaskSettings Mask="0000" />
        <ValidationSettings>
            <RequiredField IsRequired="True" />
        </ValidationSettings>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataCheckColumn Caption="To be Scheduled" FieldName="ToBeScheduled" 
        Name="ToBeScheduled" ShowInCustomizationForm="True" VisibleIndex="1" 
        Width="70px">
    </dx:GridViewDataCheckColumn>
<dx:GridViewDataTextColumn FieldName="CH_ID" ShowInCustomizationForm="True" 
        Name="CH_ID" Caption="ID" 
        VisibleIndex="2" ReadOnly="True" Width="80px">
    <PropertiesTextEdit>
        <ReadOnlyStyle BackColor="#ECE9D8">
        </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataComboBoxColumn FieldName="STATUS" 
        Name="STATUS" ShowInCustomizationForm="True" VisibleIndex="16" 
        Caption="Status">
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




    <dx:GridViewDataTextColumn Caption="Project" FieldName="PROJECT" 
        Name="PROJECT" ShowInCustomizationForm="True" VisibleIndex="4">
        <PropertiesTextEdit>
            <ValidationSettings>
                <RequiredField IsRequired="True" />
            </ValidationSettings>
        </PropertiesTextEdit>
        <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>

            


        <dx:GridViewDataComboBoxColumn Caption="Site" FieldName="SITE" Name="SITE" 
        ShowInCustomizationForm="True" VisibleIndex="5">
            <PropertiesComboBox>
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataComboBoxColumn>




    <dx:GridViewDataDateColumn Caption="Request date" FieldName="REQUEST_DATE" 
        Name="REQUEST_DATE" ShowInCustomizationForm="True" VisibleIndex="10" 
        Width="70px" Visible="False">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>




<dx:GridViewDataTextColumn FieldName="SITE_TYPE" ShowInCustomizationForm="True" 
        Name="SITE_TYPE" Caption="Type" VisibleIndex="6" Width="60px" 
        Visible="False">
    <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>




    <dx:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" Name="Tooltip" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="31">
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataTextColumn Caption="AED" FieldName="AED" 
        Name="AED" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
        <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataDateColumn Caption="Offer date" FieldName="OFFER_DATE" 
        Name="OFFER_DATE" ShowInCustomizationForm="True" VisibleIndex="11" 
        Width="70px">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>
    <dx:GridViewDataDateColumn Caption="Approval date" FieldName="APPROVAL_DATE" 
        Name="APPROVAL_DATE" ShowInCustomizationForm="True" VisibleIndex="12" 
        Width="70px">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>
    <dx:GridViewDataDateColumn Caption="Completion date" 
        FieldName="COMPLETION_DATE" Name="COMPLETION_DATE" 
        ShowInCustomizationForm="True" VisibleIndex="13" Width="70px">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>
    <dx:GridViewDataDateColumn Caption="Invoice date" FieldName="INVOICE_DATE" 
        Name="INVOICE_DATE" ShowInCustomizationForm="True" VisibleIndex="14" 
        Width="70px" Visible="False">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>

            


    <dx:GridViewDataTextColumn Caption="Notes" FieldName="NOTES" Name="NOTES" 
        ShowInCustomizationForm="True" VisibleIndex="15" Visible="False">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Region" FieldName="REGION" 
        Name="REGION" ShowInCustomizationForm="True" 
        VisibleIndex="7" Width="90px">
        <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataTextColumn Caption="PO" FieldName="PO" Name="PO" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="17">
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

<SettingsCookies Enabled="True" Version="4" StoreColumnsVisiblePosition="False"></SettingsCookies>

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
                        <EditForm>
                            <table cellpadding="0" cellspacing="0" class="dxflInternalEditorTable" 
                                width="100%">
                                <tr>
                                    <td style="border-top: 2px solid #000066; text-align: right; padding-top: 8px; padding-bottom: 8px; border-top-style: solid; border-bottom-style: none; border-width: 2px 2px 1px 2px; border-color: #000066 #000066 #808080 #000066;" 
                                        width="120">
                                        To be Scheduled:</td>
                                    <td style="border-top-style: solid; border-width: 2px 1px 1px 2px; border-color: #000066 #808080 #808080 #000066; padding-top: 8px; padding-bottom: 8px; border-right-style: none; border-bottom-style: none;">
                                        <dx:ASPxCheckBox ID="ASPxCheckBoxToBeScheduled" runat="server" 
                                            CheckState="Unchecked" Font-Size="8pt" style="font-size: 8pt" 
                                            Theme="Metropolis" Value='<%# Bind("ToBeScheduled") %>' Font-Bold="True">
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td style="border-top: 2px solid #000066; padding-right: 2px; padding-top: 8px; padding-bottom: 8px; background-color: #EAF4FF; text-align: right; border-left-color: #000066; border-left-width: 2px; border-right-color: #000066; border-right-width: 2px; border-bottom-color: #000066; border-bottom-width: 2px;" 
                                        width="120">
                                        <span class="style15">* </span>Status:</td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066; background-color: #EAF4FF;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxStatus" runat="server" BackColor="#F9FCFF" 
                                            EnableTheming="True" Font-Bold="True" Font-Size="8pt" 
                                            Text='<%# Bind("STATUS") %>' Theme="Aqua" Width="200px">
                                            <Items>
                                                <dx:ListEditItem Text="Offer Pending" Value="Offer Pending" />
                                                <dx:ListEditItem Text="Pending Approval" Value="Pending Approval" />
                                                <dx:ListEditItem Text="Pending Execution" Value="Pending Execution" />
                                                <dx:ListEditItem Text="Executed (Not Invoiced)" 
                                                    Value="Executed (Not Invoiced)" />
                                                <dx:ListEditItem Text="Invoiced (Completed)" Value="Invoiced (Completed)" />
                                            </Items>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066; padding-top: 8px; padding-bottom: 8px; background-color: #EAF4FF;" 
                                        width="120">
                                        &nbsp;</td>
                                    <td style="padding: 4px; border-right-style: solid; border-width: 2px 1px 1px 1px; border-color: #000066; border-top-style: solid; text-align: right; background-color: #EAF4FF;">
                                        <dx:ASPxImage ID="ASPxImage1" runat="server" Height="22px" 
                                            ImageUrl="~/Images/Edit.png">
                                        </dx:ASPxImage>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-bottom: 8px; background-color: #EAF4FF;" 
                                        valign="middle">
                                        <span class="style15">* </span>Project:</td>
                                    <td style="background-color: #EAF4FF; padding-right: 2px; padding-bottom: 8px; padding-left: 2px;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxProject" runat="server" BackColor="#F9FCFF" 
                                            ClientInstanceName="projectcombo" EnableTheming="True" Font-Bold="True" 
                                            Font-Size="8pt" ForeColor="#003399" Text='<%# Bind("PROJECT") %>' Theme="Aqua" 
                                            Width="200px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	combodescription.PerformCallback(projectcombo.GetText());
    combosite.PerformCallback(projectcombo.GetText());
}" />
                                            <Items>
                                                <dx:ListEditItem Text="VF Net" Value="VF Net" />
                                                <dx:ListEditItem Text="VF Build" Value="VF Build" />
                                                <dx:ListEditItem Text="Cosmote Net" Value="Cosmote Net" />
                                                <dx:ListEditItem Text="Cosmote Build" Value="Cosmote Build" />
                                                <dx:ListEditItem Text="OTE" Value="OTE" />
                                                <dx:ListEditItem Text="Wind" Value="Wind" />
                                            </Items>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style11" 
                                        style="padding-right: 2px; background-color: #EAF4FF; padding-bottom: 8px;" 
                                        valign="middle">
                                        SRI:</td>
                                    <td style="background-color: #EAF4FF; padding-bottom: 8px;">
                                        <dx:ASPxTextBox ID="ASPxTextBoxSRI" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" 
                                            Text='<%# Bind("SRI") %>' 
                                            Theme="Aqua" Width="200px" 
                                            BackColor="#F9FCFF">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style11" 
                                        style="border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #EAF4FF; border-bottom-style: none; padding-bottom: 8px; border-top-style: none; border-left-style: none;" 
                                        valign="middle">
                                        ID:</td>
                                    <td style="border-style: none solid none none; border-width: 1px; border-color: #808080 #000066 #808080 #000080; background-color: #EAF4FF; padding-bottom: 8px;">
                                        <dx:ASPxTextBox ID="ASPxTextBoxID" runat="server" EnableTheming="True" 
                                            Font-Bold="False" Font-Size="8pt" ReadOnly="True" Text='<%# Bind("CH_ID") %>' 
                                            Theme="Aqua" Width="200px">
                                            <ReadOnlyStyle BackColor="#F4F4F4">
                                            </ReadOnlyStyle>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 4px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        <span class="style15">*</span> Site:</td>
                                    <td style="padding: 2px 2px 4px 2px; background-color: #FFFFE6;">
                                        <dx:ASPxComboBox ID="Site" runat="server" BackColor="#FFFFE6" 
                                            DropDownStyle="DropDown" Font-Size="8pt" Theme="Aqua" 
                                            Value='<%# Bind("SITE") %>' Width="200px" IncrementalFilteringDelay="500" 
                                            IncrementalFilteringMode="Contains" Font-Bold="True" 
                                            ClientInstanceName="combosite" oncallback="Site_Callback" 
                                            EnableCallbackMode="True">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style11" style="padding-right: 2px; background-color: #FFFBFF; padding-bottom: 4px;" 
                                        valign="middle">
                                        <span class="style15">* </span>Description:</td>
                                    <td style="border-width: 1px; border-color: #000066; background-color: #FFFBFF; padding-bottom: 4px; border-right-style: solid;" 
                                        colspan="3">
                                        <dx:ASPxComboBox ID="ASPxComboBoxDescription" runat="server" 
                                            BackColor="#FFFBFF" DropDownStyle="DropDown" EnableTheming="True" 
                                            Font-Bold="True" Font-Size="8pt" MaxLength="100" 
                                            Text='<%# Bind("DESCRIPTION") %>' Theme="Aqua" Width="86%" 
                                            ClientInstanceName="combodescription" 
                                            oncallback="ASPxComboBoxDescription_Callback">
                                            <ItemStyle VerticalAlign="Top" />
                                            <ListBoxStyle VerticalAlign="Top" Wrap="True">
                                            </ListBoxStyle>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        &nbsp;Type:</td>
                                    <td class="style13" style="padding: 2px; background-color: #FFFFE6;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxType" runat="server" BackColor="#FFFFE6" 
                                            EnableTheming="True" Font-Size="8pt" Theme="Aqua" 
                                            Width="200px" Text='<%# Bind("SITE_TYPE") %>'>
                                            <Items>
                                                <dx:ListEditItem Text="Mainland" Value="Mainland" />
                                                <dx:ListEditItem Text="Island" Value="Island" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; " 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        Request date:</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF;" 
                                        class="style13">
                                        <dx:ASPxDateEdit ID="ASPxDateEditRequest" runat="server" BackColor="#FFFBFF" 
                                            DisplayFormatString="dd/MM/yyyy" Font-Size="8pt" Theme="Aqua" 
                                            Value='<%# Bind("REQUEST_DATE") %>' Width="200px">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        Region:</td>
                                    <td class="style13" style="padding: 2px; background-color: #FFFFE6;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxRegion" runat="server" BackColor="#FFFFE6" 
                                            EnableTheming="True" Font-Size="8pt" Text='<%# Bind("REGION") %>' Theme="Aqua" 
                                            Width="200px">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; " valign="middle">
                                        AED:</td>
                                    <td class="style13">
                                        <dx:ASPxTextBox ID="ASPxTextBoxAED" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" Text='<%# Bind("AED") %>' Theme="Aqua" Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        Offer date:</td>
                                    <td class="style13" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF;">
                                        <dx:ASPxDateEdit ID="ASPxDateEditOffer" runat="server" BackColor="#FFFBFF" 
                                            DisplayFormatString="dd/MM/yyyy" Font-Size="8pt" Theme="Aqua" 
                                            Value='<%# Bind("OFFER_DATE") %>' Width="200px">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 4px; padding-bottom: 2px; " 
                                        valign="middle">
                                        Notes:</td>
                                    <td class="style13" colspan="3" rowspan="3" style="padding: 2px; ">
                                        <dx:ASPxMemo ID="ASPxMemoNotes" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" Height="60px" Text='<%# Bind("NOTES") %>' Theme="Aqua" 
                                            Width="100%">
                                        </dx:ASPxMemo>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        Approval date:</td>
                                    <td class="style13" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF;">
                                        <dx:ASPxDateEdit ID="ASPxDateEditApproval" runat="server" BackColor="#FFFBFF" 
                                            DisplayFormatString="dd/MM/yyyy" Font-Size="8pt" Theme="Aqua" 
                                            Value='<%# Bind("APPROVAL_DATE") %>' Width="200px">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; " 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF; padding-top: 2px;" 
                                        valign="middle">
                                        Completion date:</td>
                                    <td class="style13" 
                                        
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF; padding-top: 2px;" 
                                        valign="middle">
                                        <dx:ASPxDateEdit ID="ASPxDateEditCompletion" runat="server" BackColor="#FFFBFF" 
                                            DisplayFormatString="dd/MM/yyyy" Font-Size="8pt" Theme="Aqua" 
                                            Value='<%# Bind("COMPLETION_DATE") %>' Width="200px">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; " 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        Invoice date:</td>
                                    <td class="style13" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF;">
                                        <dx:ASPxDateEdit ID="ASPxDateEditInvoice" runat="server" BackColor="#FFFBFF" 
                                            DisplayFormatString="dd/MM/yyyy" Font-Size="8pt" Theme="Aqua" 
                                            Value='<%# Bind("INVOICE_DATE") %>' Width="200px">
                                        </dx:ASPxDateEdit>
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
                                        &nbsp;</td>
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
                        <DetailRow>
                            <table cellpadding="0" cellspacing="0" class="dxflInternalEditorTable" 
                                width="100%">
                                <tr>
                                    <td style="border-top: 2px solid #000066; text-align: right; border-left-color: #000066; border-left-width: 2px; border-right-color: #000066; border-right-width: 2px; border-bottom-color: #000066; border-bottom-width: 2px; padding-top: 8px; padding-bottom: 8px;" 
                                        width="120">
                                        To be Scheduled:</td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066; padding-top: 8px; padding-bottom: 8px;">
                                        <dx:ASPxCheckBox ID="ASPxCheckBoxToBeScheduled" runat="server" 
                                            CheckState="Unchecked" Font-Bold="True" Font-Size="8pt" ReadOnly="True" 
                                            style="font-size: 8pt" Theme="Metropolis" Value='<%# Bind("ToBeScheduled") %>'>
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td style="border-top: 2px solid #000066; padding-right: 2px; padding-top: 8px; padding-bottom: 8px; background-color: #EAF4FF; text-align: right; border-left-color: #000066; border-left-width: 2px; border-right-color: #000066; border-right-width: 2px; border-bottom-color: #000066; border-bottom-width: 2px;" 
                                        width="120">
                                        <span class="style15">* </span>Status:</td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066; background-color: #EAF4FF;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxStatus" runat="server" BackColor="#F9FCFF" 
                                            EnableTheming="True" Font-Bold="True" Font-Size="8pt" ReadOnly="True" 
                                            Text='<%# Bind("STATUS") %>' Theme="Aqua" Width="200px" 
                                            ClientEnabled="False" ForeColor="Black">
                                            <Items>
                                                <dx:ListEditItem Text="Offer Pending" Value="Offer Pending" />
                                                <dx:ListEditItem Text="Pending Approval" Value="Pending Approval" />
                                                <dx:ListEditItem Text="Pending Execution" Value="Pending Execution" />
                                                <dx:ListEditItem Text="Executed (Not Invoiced)" 
                                                    Value="Executed (Not Invoiced)" />
                                                <dx:ListEditItem Text="Invoiced (Completed)" Value="Invoiced (Completed)" />
                                            </Items>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td style="border-top-style: solid; border-width: 2px; border-color: #000066; padding-top: 8px; padding-bottom: 8px; background-color: #EAF4FF;" 
                                        width="120">
                                        &nbsp;</td>
                                    <td style="padding: 4px; border-right-style: solid; border-width: 2px 1px 1px 1px; border-color: #000066; border-top-style: solid; text-align: right; background-color: #EAF4FF;">
                                        <dx:ASPxImage ID="ASPxImage2" runat="server" Height="28px" 
                                            ImageUrl="~/Images/issue.png">
                                        </dx:ASPxImage>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-bottom: 8px; background-color: #EAF4FF;" 
                                        valign="middle">
                                        <span class="style15">* </span>Project:</td>
                                    <td style="padding: 2px 2px 8px 2px; background-color: #EAF4FF;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxProject" runat="server" BackColor="#F9FCFF" 
                                            ClientEnabled="False" EnableTheming="True" Font-Bold="True" Font-Size="8pt" 
                                            ForeColor="#003399" ReadOnly="True" Text='<%# Bind("PROJECT") %>' Theme="Aqua" 
                                            Width="200px">
                                            <Items>
                                                <dx:ListEditItem Text="VF Net" Value="VF Net" />
                                                <dx:ListEditItem Text="VF Build" Value="VF Build" />
                                                <dx:ListEditItem Text="Cosmote Net" Value="Cosmote Net" />
                                                <dx:ListEditItem Text="Cosmote Build" Value="Cosmote Build" />
                                                <dx:ListEditItem Text="OTE" Value="OTE" />
                                                <dx:ListEditItem Text="Wind" Value="Wind" />
                                            </Items>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style11" 
                                        style="padding-right: 2px; background-color: #EAF4FF; padding-bottom: 8px;" 
                                        valign="middle">
                                        SRI:</td>
                                    <td style="background-color: #EAF4FF; padding-bottom: 8px;">
                                        <dx:ASPxTextBox ID="ASPxTextBoxSRI" runat="server" BackColor="#F9FCFF" 
                                            EnableTheming="True" Font-Size="8pt" ReadOnly="True" Text='<%# Bind("SRI") %>' 
                                            Theme="Aqua" Width="200px" ClientEnabled="False" ForeColor="Black">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style11" 
                                        style="padding-right: 2px; background-color: #EAF4FF; border-bottom-style: 8; padding-bottom: 8px;" 
                                        valign="middle">
                                        ID:</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #EAF4FF; padding-bottom: 8px;">
                                        <dx:ASPxTextBox ID="ASPxTextBoxID" runat="server" EnableTheming="True" 
                                            Font-Bold="False" Font-Size="8pt" ForeColor="Black" ReadOnly="True" 
                                            Text='<%# Bind("CH_ID") %>' Theme="Aqua" Width="200px">
                                            <ReadOnlyStyle BackColor="#F4F4F4">
                                            </ReadOnlyStyle>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 4px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        <span class="style15">*</span> Site:</td>
                                    <td style="padding: 2px 2px 4px 2px; background-color: #FFFFE6;">
                                        <dx:ASPxComboBox ID="Site" runat="server" BackColor="#FFFFE6" 
                                            DropDownStyle="DropDown" Font-Size="8pt" IncrementalFilteringDelay="500" 
                                            IncrementalFilteringMode="Contains" ReadOnly="True" Theme="Aqua" 
                                            Value='<%# Bind("SITE") %>' Width="200px" Font-Bold="True" 
                                            ClientEnabled="False" ForeColor="Black">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style11" 
                                        style="padding-right: 2px; background-color: #FFFBFF; padding-bottom: 4px;" 
                                        valign="middle">
                                        <span class="style15">* </span>Description:</td>
                                    <td colspan="3" 
                                        style="border-width: 1px; border-color: #000066; background-color: #FFFBFF; padding-bottom: 4px; border-right-style: solid;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxDescription" runat="server" 
                                            BackColor="#FFFBFF" DropDownStyle="DropDown" EnableTheming="True" 
                                            Font-Bold="True" Font-Size="8pt" MaxLength="100" ReadOnly="True" 
                                            Text='<%# Bind("DESCRIPTION") %>' Theme="Aqua" Width="90%" 
                                            ClientEnabled="False" ForeColor="Black">
                                            <ItemStyle VerticalAlign="Top" />
                                            <ListBoxStyle VerticalAlign="Top" Wrap="True">
                                            </ListBoxStyle>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        &nbsp;Type:</td>
                                    <td class="style13" style="padding: 2px; background-color: #FFFFE6;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxType" runat="server" BackColor="#FFFFE6" 
                                            EnableTheming="True" Font-Size="8pt" ReadOnly="True" 
                                            Text='<%# Bind("SITE_TYPE") %>' Theme="Aqua" Width="200px" 
                                            ClientEnabled="False" ForeColor="Black">
                                            <Items>
                                                <dx:ListEditItem Text="Mainland" Value="Mainland" />
                                                <dx:ListEditItem Text="Island" Value="Island" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; " valign="middle">
                                        AED:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="ASPxTextBoxAED" runat="server" ClientEnabled="False" 
                                            EnableTheming="True" Font-Size="8pt" ForeColor="Black" ReadOnly="True" 
                                            Text='<%# Bind("AED") %>' Theme="Aqua" Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        Request date:</td>
                                    <td class="style13" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF;">
                                        <dx:ASPxDateEdit ID="ASPxDateEditRequest" runat="server" BackColor="#FFFBFF" 
                                            DisplayFormatString="dd/MM/yyyy" Font-Size="8pt" ReadOnly="True" Theme="Aqua" 
                                            Value='<%# Bind("REQUEST_DATE") %>' Width="200px" ClientEnabled="False" 
                                            ForeColor="Black">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; background-color: #FFFFE6;" 
                                        valign="middle">
                                        Region:</td>
                                    <td class="style13" style="padding: 2px; background-color: #FFFFE6;">
                                        <dx:ASPxComboBox ID="ASPxComboBoxRegion" runat="server" BackColor="#FFFFE6" 
                                            EnableTheming="True" Font-Size="8pt" ReadOnly="True" 
                                            Text='<%# Bind("REGION") %>' Theme="Aqua" Width="200px" 
                                            ClientEnabled="False" ForeColor="Black">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; " valign="middle">
                                        PO:</td>
                                    <td class="style13">
                                        <dx:ASPxTextBox ID="ASPxTextBoxPO" runat="server" ClientEnabled="False" 
                                            EnableTheming="True" Font-Size="8pt" ForeColor="Black" ReadOnly="True" 
                                            Text='<%# Bind("PO") %>' Theme="Aqua" Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        Offer date:</td>
                                    <td class="style13" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF;">
                                        <dx:ASPxDateEdit ID="ASPxDateEditOffer" runat="server" BackColor="#FFFBFF" 
                                            DisplayFormatString="dd/MM/yyyy" Font-Size="8pt" ReadOnly="True" Theme="Aqua" 
                                            Value='<%# Bind("OFFER_DATE") %>' Width="200px" ClientEnabled="False" 
                                            ForeColor="Black">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 4px; padding-bottom: 2px; " 
                                        valign="middle">
                                        Notes:</td>
                                    <td class="style13" colspan="3" rowspan="3" style="padding: 2px; ">
                                        <dx:ASPxMemo ID="ASPxMemoNotes" runat="server" EnableTheming="True" 
                                            Font-Size="8pt" Height="60px" ReadOnly="True" Text='<%# Bind("NOTES") %>' 
                                            Theme="Aqua" Width="100%">
                                        </dx:ASPxMemo>
                                    </td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        Approval date:</td>
                                    <td class="style13" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF;">
                                        <dx:ASPxDateEdit ID="ASPxDateEditApproval" runat="server" BackColor="#FFFBFF" 
                                            DisplayFormatString="dd/MM/yyyy" Font-Size="8pt" ReadOnly="True" Theme="Aqua" 
                                            Value='<%# Bind("APPROVAL_DATE") %>' Width="200px" ClientEnabled="False" 
                                            ForeColor="Black">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; " 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF; padding-top: 2px;" 
                                        valign="middle">
                                        Completion date:</td>
                                    <td class="style13" 
                                        
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF; padding-top: 2px;">
                                        <dx:ASPxDateEdit ID="ASPxDateEditCompletion" runat="server" BackColor="#FFFBFF" 
                                            DisplayFormatString="dd/MM/yyyy" Font-Size="8pt" ReadOnly="True" Theme="Aqua" 
                                            Value='<%# Bind("COMPLETION_DATE") %>' Width="200px" ClientEnabled="False" 
                                            ForeColor="Black">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" 
                                        style="padding-right: 2px; padding-top: 2px; padding-bottom: 2px; " 
                                        valign="middle">
                                        &nbsp;</td>
                                    <td class="style12" style="padding-right: 2px; background-color: #FFFBFF;" 
                                        valign="middle">
                                        Invoice date:</td>
                                    <td class="style13" 
                                        style="border-right-style: solid; border-width: 1px; border-color: #000066; background-color: #FFFBFF;">
                                        <dx:ASPxDateEdit ID="ASPxDateEditInvoice" runat="server" BackColor="#FFFBFF" 
                                            DisplayFormatString="dd/MM/yyyy" Font-Size="8pt" ReadOnly="True" Theme="Aqua" 
                                            Value='<%# Bind("INVOICE_DATE") %>' Width="200px" ClientEnabled="False" 
                                            ForeColor="Black">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" style="padding-right: 2px; text-align: left;">
                                        &nbsp;</td>
                                    <td style="border-right-style: solid; border-width: 1px; border-color: #000066">
                                        &nbsp;</td>
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
        GridViewID="ASPxGridViewCompletedChargeable" Landscape="True" PaperKind="A4">
        <Styles>
            <Default Font-Size="8pt">
            </Default>
        </Styles>
        <PageHeader Left="Completed Chargeable Tickets" 
            Right="[Page # of Pages #]">
        </PageHeader>
        <PageFooter Left="TBSP Task Management System" 
            Right="[Date Printed] [Time Printed]">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
