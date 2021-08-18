<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpertTicketsLog.aspx.cs" Inherits="TTWeb.ExpertTicketsLog" %>

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
            font-size: 8pt;
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
	text-align: left;
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
        
         .styleEditForm
        {
            font-size: 8pt;
        }
        .style2
        {
            font-size: 8pt;
            color: #0099CC;
        }
        .style3
        {
            font-size: 8pt;
            color: #FF6666;
        }
        .style4
        {
            color: #0099CC;
        }
        .style7
        {
            font-size: 8pt;
            color: #FFFFFF;
            height: 8px;
            text-align: right;
        }
        .style8
        {
            color: #FFFFFF;
            text-align: right;
            font-family: Tahoma;
            font-size: 8pt;
        }
        .style9
        {
            font-size: 8pt;
            color: #FFFFFF;
            height: 8px;
            text-align: right;
            background-color: #0099CC;
        }
        </style>


</head>
<body style="font-size: 8pt">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <script language="javascript" type="text/javascript">
    function OnGetSelectedFieldValues(selectedValues) {
        for (var i = 0; i < 36; i++) {
            var editor = ASPxGridViewExpertTicketsLog.GetEditor(i + 1);
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
            GroupBoxCaptionOffsetY="-19px" HeaderText="Active CosTickets" 
            SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" 
            Width="100%" EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px" 
            Theme="Metropolis" style="text-align: left">
            <ContentPaddings PaddingBottom="10px" PaddingLeft="9px" PaddingRight="11px" 
                PaddingTop="10px" />
            <HeaderStyle Font-Size="Small">
            <Paddings PaddingBottom="6px" PaddingLeft="9px" PaddingRight="11px" 
                PaddingTop="3px" />
            </HeaderStyle>
            <HeaderTemplate>
                <table style="width: 100%">
                    <tr>
                        <td width="100%" valign="middle" align="left">Expert Processed Solved Trouble Tickets Log
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
    ClientInstanceName="ASPxGridViewExpertTicketsLog" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="TT_Id;Source" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewExpertTicketsLog" 
    EnableViewState="False" 
        Theme="Metropolis" style="font-size: 8pt;" 
        OnHtmlRowPrepared="ASPxGridViewExpertTicketsLog_HtmlRowPrepared" 
        OnLoad="ASPxGridViewExpertTicketsLog_Load" 
                    OnHtmlDataCellPrepared="ASPxGridViewExpertTicketsLog_HtmlDataCellPrepared">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}"></ClientSideEvents>
<Columns>
    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Name="CommandButtons" Caption=" " Visible="False" ShowCancelButton="True" ShowUpdateButton="True"/>
<dx:GridViewDataTextColumn FieldName="Source" 
        ShowInCustomizationForm="True" Name="Source" 
        Caption="Source" VisibleIndex="3" Width="90px" ReadOnly="True">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm" MaxLength="30">
    <ReadOnlyStyle BackColor="WhiteSmoke">
    </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
    <EditFormSettings Visible="False" />
</dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Status" FieldName="STATUS" Name="STATUS" 
        ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Width="80px">
        <PropertiesTextEdit MaxLength="30">
        </PropertiesTextEdit>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
        <EditFormSettings Visible="False" />
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataCheckColumn Caption="Processed" FieldName="Processed" 
        Name="Processed" ReadOnly="True" ShowInCustomizationForm="True" 
        VisibleIndex="1" Width="60px">
        <EditFormSettings Visible="False" />
    </dx:GridViewDataCheckColumn>
<dx:GridViewDataTextColumn FieldName="TT_Id" ShowInCustomizationForm="True" 
        Name="TT_Id" Caption="TT ID" 
        VisibleIndex="2" Width="130px" ReadOnly="True">
    <PropertiesTextEdit MaxLength="30">
        <ReadOnlyStyle BackColor="WhiteSmoke">
        </ReadOnlyStyle>
    </PropertiesTextEdit>
    <Settings AutoFilterCondition="Contains" />
    <EditFormSettings Visible="False" />
    </dx:GridViewDataTextColumn>

<dx:GridViewDataTextColumn FieldName="Priority" ShowInCustomizationForm="True" 
        Name="Priority" Caption="Priority" VisibleIndex="7" ReadOnly="True" 
        Width="80px">
    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
    <EditFormSettings Visible="False" />
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Site" FieldName="Location" Name="Location" 
        ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Width="180px">
        <PropertiesTextEdit MaxLength="100">
        </PropertiesTextEdit>
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
        <EditFormSettings Visible="False" />
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataDateColumn Caption="Event time" FieldName="Tdate" 
        Name="Tdate" ShowInCustomizationForm="True" VisibleIndex="4" 
        Width="110px" ReadOnly="True">
        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" 
            DisplayFormatInEditMode="True" EditFormat="Custom" 
            EditFormatString="dd/MM/yyyy HH:mm" AllowUserInput="False">
            <TimeSectionProperties Visible="True">
                <TimeEditProperties EditFormatString="HH:mm">
                </TimeEditProperties>
            </TimeSectionProperties>
        </PropertiesDateEdit>
        <EditFormSettings Visible="False" />
    </dx:GridViewDataDateColumn>




    <dx:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" 
        Name="Tooltip" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="16">
        <EditFormSettings Visible="False" />
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataTextColumn Caption="Expert comments" FieldName="Comment_short" 
        Name="Comment_short" ReadOnly="True" ShowInCustomizationForm="True" 
        VisibleIndex="11">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
        <EditFormSettings Visible="False" />
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataMemoColumn Caption="Comment" FieldName="Comment" Name="Comment" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="21">
        <EditFormSettings Caption="Comment" ColumnSpan="2" RowSpan="1" Visible="False" 
            VisibleIndex="6" />
    </dx:GridViewDataMemoColumn>
    <dx:GridViewDataCheckColumn Caption="Climber" FieldName="Climber" 
        Name="Climber" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="15">
        <EditFormSettings Caption="Climber" CaptionLocation="Near" ColumnSpan="1" 
            RowSpan="1" Visible="False" VisibleIndex="1" />
    </dx:GridViewDataCheckColumn>
    <dx:GridViewDataCheckColumn Caption="Electrician" FieldName="Electrician" 
        Name="Electrician" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="17">
        <EditFormSettings Caption="Electrician" CaptionLocation="Near" ColumnSpan="1" 
            RowSpan="1" Visible="False" VisibleIndex="2" />
    </dx:GridViewDataCheckColumn>
    <dx:GridViewDataCheckColumn Caption="AirCondition" FieldName="AirCondition" 
        Name="AirCondition" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="18">
        <EditFormSettings Caption="Air Condition expert" CaptionLocation="Near" 
            ColumnSpan="1" RowSpan="1" Visible="False" VisibleIndex="3" />
    </dx:GridViewDataCheckColumn>
    <dx:GridViewDataCheckColumn Caption="SpareParts" FieldName="SpareParts" 
        Name="SpareParts" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="19">
        <EditFormSettings Caption="Spare Parts" CaptionLocation="Near" ColumnSpan="1" 
            RowSpan="1" Visible="False" VisibleIndex="4" />
    </dx:GridViewDataCheckColumn>
    <dx:GridViewDataCheckColumn Caption="Instruments" FieldName="Instruments" 
        Name="Instruments" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="20">
        <EditFormSettings Caption="Instruments" CaptionLocation="Near" ColumnSpan="1" 
            RowSpan="1" Visible="False" VisibleIndex="5" />
    </dx:GridViewDataCheckColumn>

            


    <dx:GridViewDataDateColumn Caption="Updated on" FieldName="Updated_on" 
        Name="Updated_on" ShowInCustomizationForm="True" VisibleIndex="8" Width="110px">
        <PropertiesDateEdit DisplayFormatInEditMode="True" 
            DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="Custom" 
            EditFormatString="dd/MM/yyyy HH:mm">
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>

            


    <dx:GridViewDataTextColumn Caption="Updated" FieldName="Updated" Name="Updated" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="10" Width="15px">
        <PropertiesTextEdit>
            <Style ForeColor="#FF3300">
            </Style>
        </PropertiesTextEdit>
        <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataTextColumn Caption="Last Updated by Expert" 
        FieldName="Last_updated_by_expert" Name="Last_updated_by_expert" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" 
            ShowInFilterControl="True" />
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Ticket Type" FieldName="Ticket_Type" 
        Name="Ticket_Type" ShowInCustomizationForm="True" Visible="False" 
        VisibleIndex="13">
        <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" 
            ShowInFilterControl="True" />
    </dx:GridViewDataTextColumn>

            


    <dx:GridViewDataTextColumn Caption="Region_Resp_Comment" 
        FieldName="Region_Resp_Comment" Name="Region_Resp_Comment" 
        ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
    </dx:GridViewDataTextColumn>


    <dx:GridViewDataTextColumn Caption="By" FieldName="Last_Processed_by" Name="Last_Processed_by" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9" Width="40px">
        <PropertiesTextEdit>
            <ReadOnlyStyle BackColor="#ECE9D8">
            </ReadOnlyStyle>
        </PropertiesTextEdit>
        <CellStyle HorizontalAlign="Center">
        </CellStyle>
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

<SettingsCookies Enabled="True" Version="37"></SettingsCookies>

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
                            <table class="dxflInternalEditorTable_Aqua">
                                <tr>
                                    <td>
                                        <dx:ASPxGridView ID="ASPxGridViewExpertTicketsH" runat="server" OnBeforePerformDataSelect="ASPxGridViewExpertTicketsH_BeforePerformDataSelect" Theme="Metropolis" Width="100%" AutoGenerateColumns="False" EnableTheming="True">
                                            <Columns>
                                                <dx:GridViewDataDateColumn Caption="On" FieldName="Updated_on" Name="Updated_on" ReadOnly="True" VisibleIndex="1" Width="120px">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yy HH:mm" EncodeHtml="False">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn Caption="By" FieldName="TT_USER" Name="TT_USER" ReadOnly="True" VisibleIndex="2" Width="200px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Comment" FieldName="Comment" Name="Comment" ReadOnly="True" VisibleIndex="3">
                                                    <PropertiesTextEdit EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataComboBoxColumn Caption=" " FieldName="UpdatedBy" 
                                                Name="UpdatedBy" VisibleIndex="0" 
                                                Width="22px" ReadOnly="True">
                                                <PropertiesComboBox ShowImageInEditBox="True">
                                                    <Items>
                                                        <dx:ListEditItem ImageUrl="~/Images/arrow_right.png" Text=" " Value="E" />
                                                        <dx:ListEditItem ImageUrl="~/Images/undo.png" Text=" " Value="R" />
                                                    </Items>
                                                    <ItemStyle Font-Size="0pt" HorizontalAlign="Center" />
                                                    <Style HorizontalAlign="Center">
                                                    </Style>
                                                </PropertiesComboBox>
                                                <Settings AllowAutoFilter="True" />
                                             <HeaderStyle>
                                            <Border BorderStyle="None" />
                                            </HeaderStyle>
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False">
                                                <BorderRight BorderStyle="None" />
                                            </CellStyle>
                                            </dx:GridViewDataComboBoxColumn>

                                            </Columns>
                                            <Settings ShowTitlePanel="True" />
                                            <SettingsBehavior ColumnResizeMode="NextColumn" />
                                            <SettingsCookies Enabled="True" Version="1" />
                                            <SettingsText Title="Expert &amp; Region Responsible Log" />
                                            <Styles>
                                                <Header BackColor="#0099CC" Font-Size="8pt" ForeColor="White">
                                                    <Paddings PaddingBottom="1px" />
                                                </Header>
                                                <AlternatingRow BackColor="#F9F9F9">
                                                </AlternatingRow>
                                                <Cell Font-Size="8pt">
                                                </Cell>
                                                <TitlePanel Font-Size="8pt" ForeColor="Gray" HorizontalAlign="Right">
                                                </TitlePanel>
                                            </Styles>
                                        </dx:ASPxGridView>
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
        GridViewID="ASPxGridViewExpertTicketsLog" Landscape="True" PaperKind="A4">
        <Styles>
            <Default Font-Size="8pt">
            </Default>
        </Styles>
        <PageHeader Left="Expert Tickets Preprocessing " 
            Right="[Page # of Pages #]">
        </PageHeader>
        <PageFooter Left="TBSP Task Management System" 
            Right="[Date Printed] [Time Printed]">
        </PageFooter>
    </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
