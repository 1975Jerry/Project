<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompletedWindPMs.aspx.cs" Inherits="TTWeb.CompletedWindPMs" %>

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
            height: 26px;
        }
        </style>
</head>
<body style="font-size: 8pt">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <script language="javascript" type="text/javascript">
    function OnGetSelectedFieldValues(selectedValues) {
        for (var i = 0; i < 36; i++) {
            var editor = ASPxGridViewCompletedWindPMs.GetEditor(i + 1);
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
            GroupBoxCaptionOffsetY="-19px" HeaderText="Completed PMs" 
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
                        <td width="100%" valign="middle" align="left" class="style11">Completed Wind PMs
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
    ClientInstanceName="ASPxGridViewCompletedWindPMs" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="PM_ID" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewCompletedWindPMs" 
    EnableViewState="False" 
        Theme="Metropolis" style="font-size: 8pt" 
        OnHtmlRowPrepared="ASPxGridViewCompletedWindPMs_HtmlRowPrepared">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}"></ClientSideEvents>
<Columns>
    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Name="CommandButtons" Caption=" " Visible="False"/>
<dx:GridViewDataTextColumn FieldName="SRI" 
        ShowInCustomizationForm="True" Name="SRI" 
        Caption="SRI" VisibleIndex="3" ReadOnly="True" Width="140px">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm">
    <ReadOnlyStyle BackColor="#F9F8F2">
    </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
</dx:GridViewDataTextColumn>




    <dx:GridViewDataComboBoxColumn Caption="Year" FieldName="PM_YEAR" 
        Name="PM_YEAR" ShowInCustomizationForm="True" VisibleIndex="10" 
        Width="70px">
        <PropertiesComboBox MaxLength="4" DropDownStyle="DropDown">
            <ValidationSettings>
                <RequiredField IsRequired="True" />
            </ValidationSettings>
        </PropertiesComboBox>
        <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataCheckColumn Caption="To be Scheduled" FieldName="ToBeScheduled" 
        Name="ToBeScheduled" ShowInCustomizationForm="True" VisibleIndex="1" 
        Width="70px" Visible="False">
    </dx:GridViewDataCheckColumn>
<dx:GridViewDataTextColumn FieldName="PM_ID" ShowInCustomizationForm="True" 
        Name="PM_ID" Caption="PM Id" 
        VisibleIndex="2" ReadOnly="True" Width="80px">
    <PropertiesTextEdit>
        <ReadOnlyStyle BackColor="#F9F8F2">
        </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataTextColumn>


        <dx:GridViewDataTextColumn Caption="PM Type" FieldName="PM_Type" 
        Name="PM_Type" ShowInCustomizationForm="True" VisibleIndex="6" Width="70px">
    </dx:GridViewDataTextColumn>


        <dx:GridViewDataComboBoxColumn Caption="Type" FieldName="TYPE" 
        Name="TYPE" ShowInCustomizationForm="True" VisibleIndex="7" Width="80px">
        <PropertiesComboBox DropDownStyle="DropDown">
            <ValidationSettings>
                <RequiredField IsRequired="True" />
            </ValidationSettings>
        </PropertiesComboBox>
            <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>




        <dx:GridViewDataComboBoxColumn Caption="Site" FieldName="Site" Name="Site" 
        ShowInCustomizationForm="True" VisibleIndex="4">
            <PropertiesComboBox IncrementalFilteringDelay="500" 
                IncrementalFilteringMode="Contains">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
    </dx:GridViewDataComboBoxColumn>




    <dx:GridViewDataTextColumn Caption="Comments" FieldName="Comments" 
        Name="Comments" ShowInCustomizationForm="True" VisibleIndex="12" 
        ToolTip="Restore_Freeze">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataSpinEditColumn Caption="Site No" FieldName="SiteNo" 
        Name="SiteNo" ShowInCustomizationForm="True" VisibleIndex="5" Width="50px">
        <PropertiesSpinEdit DisplayFormatString="g">
        </PropertiesSpinEdit>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataSpinEditColumn>




    <dx:GridViewDataDateColumn Caption="Completed on" FieldName="VISIT_DATE" 
        Name="VISIT_DATE" ShowInCustomizationForm="True" VisibleIndex="11" 
        Width="110px">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yy" MaxDate="2100-01-01" 
            MinDate="2008-01-01" DisplayFormatInEditMode="True" 
            EditFormatString="dd/MM/yy">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>


    <dx:GridViewDataComboBoxColumn FieldName="SiteCateg" 
        Name="SiteCateg" ShowInCustomizationForm="True" VisibleIndex="8" 
        Caption="Site Cat" Width="80px">
        <PropertiesComboBox DropDownStyle="DropDown">
        </PropertiesComboBox>

        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />

    </dx:GridViewDataComboBoxColumn>


    <dx:GridViewDataComboBoxColumn Caption="Region" FieldName="Region" 
        Name="Region" ShowInCustomizationForm="True" VisibleIndex="9" 
        Width="80px">
        <PropertiesComboBox>
            <ValidationSettings>
                <RequiredField IsRequired="True" />
            </ValidationSettings>
        </PropertiesComboBox>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    </dx:GridViewDataComboBoxColumn>

            


    <dx:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" 
        Name="Tooltip" ShowInCustomizationForm="True" VisibleIndex="13" 
        Visible="False">
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

<SettingsEditing Mode="Inline"></SettingsEditing>

                    <Settings ShowFilterBar="Visible" ShowFilterRowMenu="True" 
                        ShowGroupPanel="True" 
                        ShowHeaderFilterButton="True" ShowFilterRow="True" />

<SettingsCookies Enabled="True" Version="34" StoreColumnsVisiblePosition="False"></SettingsCookies>

                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />


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
        GridViewID="ASPxGridViewCompletedWindPMs" Landscape="True" 
        MaxColumnWidth="500" PaperKind="A4">
        <Styles>
            <Default Font-Size="8pt">
            </Default>
        </Styles>
        <PageHeader Left="Completed Wind PMs" Right="[Page # of Pages #]">
        </PageHeader>
        <PageFooter Left="TBSP Task Management System" 
            Right="[Date Printed] [Time Printed]">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
