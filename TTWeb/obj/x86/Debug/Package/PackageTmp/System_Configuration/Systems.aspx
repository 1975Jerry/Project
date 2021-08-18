<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Systems.aspx.cs" Inherits="TTWeb.Systems" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>









<%@ Register assembly="DevExpress.Web.ASPxTreeList.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dx" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style6
        {
            text-align: right;
        }
        .style8
        {
            text-align: right;
        }
        .style9
        {
            text-align: right;
            color: #666666;
        }
        .style10
        {
            color: #999999;
            text-align: right;
        }
        .style20
        {
            text-align: right;
        }
        .style22
        {
            color: #993300;
        }
        .style23
        {
            color: #993300;
            font-size: 7pt;
            text-align: right;
        }
        .style24
        {
            font-size: 6pt;
            color: #0066FF;
        }
        .style25
        {
            color: #0066FF;
        }
        .style26
        {
            color: #993300;
            font-size: 7pt;
        }
        .style27
        {
            text-align: left;
        }
        </style>
</head>
<body>
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" 
            CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="CI List" 
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
                        <td width="100%" valign="middle" align="left">Configuration Items Management [> Related Configuration Items]
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <table class="style1">
        <tr>
            <td bgcolor="White">
                
                                    <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px;" 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenu1" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%">
                                <ClientSideEvents ItemClick="function(s, e) {
	ASPxGridViewSystems.AddNewRow()

		
}" />
                                <Items>
                                    <dx:MenuItem Name="NewCI" Text="New Configuration Item">
                                        <Image AlternateText="New" Height="10px" Url="~/Images/Add.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
                                <ItemStyle>
                                <Paddings PaddingRight="0px" />
                                </ItemStyle>
                                <BorderRight BorderWidth="0px" />
                            </dx:ASPxMenu>
                        </td>
                        <td style="border-left-width: 0px; padding-left: 0px; margin-left: 0px;">
                            <dx:ASPxMenu ID="ASPxMenu2" runat="server" EnableTheming="True" 
                                ItemAutoWidth="False" RightToLeft="False" Theme="Metropolis" Width="100%">
                                <ClientSideEvents ItemClick="function(s, e) {
	window.pagegrid.Refresh();
}" />
                                <Items>
                                    <dx:MenuItem Name="Refresh" Text="Refresh">
                                        <Image Height="10px" Url="~/Images/Refresh.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
                                <ItemStyle HorizontalAlign="Right">
                                <Paddings PaddingLeft="0px" />
                                </ItemStyle>
                                <BorderLeft BorderWidth="0px" />
                            </dx:ASPxMenu>
                        </td>
                    </tr>
                </table>


                <dx:ASPxGridView ID="ASPxGridViewSystems" runat="server" 
                    AutoGenerateColumns="False" ClientIDMode="AutoID" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" KeyFieldName="Hidden_id" 
                    OnRowDeleting="ASPxGridViewSystems_RowDeleting" 
                    OnRowInserting="ASPxGridViewSystems_RowInserting" 
                    OnRowUpdating="ASPxGridViewSystems_RowUpdating" Width="100%" 
                    OnHtmlDataCellPrepared="ASPxGridViewSystems_HtmlDataCellPrepared" 
                    OnDetailRowExpandedChanged="ASPxGridViewSystems_DetailRowExpandedChanged" 
                    OnHtmlEditFormCreated="ASPxGridViewSystems_HtmlEditFormCreated" 
                    OnInitNewRow="ASPxGridViewSystems_InitNewRow1" 
                    OnStartRowEditing="ASPxGridViewSystems_StartRowEditing1" 
                                        ClientInstanceName="ASPxGridViewSystems" EnableViewState="False" 
                                        Theme="Metropolis">
                    <ClientSideEvents  Init="function(s, e) {
	window.pagegrid = s;
}" DetailRowCollapsing="function(s, e) {

}" DetailRowExpanding="function(s, e) {

}" FocusedRowChanged="function(s, e) {

}" EndCallback="function(s, e) {

                        if (s.cpUpdatedMessage) {
                            alert(s.cpUpdatedMessage);
                            delete s.cpUpdatedMessage;
                        }
                    
}" />

                    <Styles>
<Header SortingImageSpacing="10px" ImageSpacing="10px" BackColor="#0066CC" ForeColor="White"></Header>

<FocusedRow BackColor="#FCF9DF" ForeColor="Black">
<BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX"></BackgroundImage>
</FocusedRow>

                        <CommandColumnItem>
                            <Paddings PaddingLeft="3px"/>
                        </CommandColumnItem>
                    </Styles>

                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Rel/s" FieldName="Relations" 
                            Name="Relations" ShowInCustomizationForm="True" VisibleIndex="6" Width="50px">
                            <PropertiesTextEdit EnableFocusedStyle="False">
                            </PropertiesTextEdit>
                            <Settings AllowSort="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="50px" ButtonType="Image" ShowEditButton="True" ShowDeleteButton="True" ShowCancelButton="True" ShowUpdateButton="True" ShowClearFilterButton="True"/>
                        <dx:GridViewDataTextColumn Caption="Configuration Item" FieldName="System" Name="System" 
                            ShowInCustomizationForm="True" VisibleIndex="1" Width="20%">
                            <PropertiesTextEdit>
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn Caption="CI Group" FieldName="System_Group" 
                            Name="System_Group" ShowInCustomizationForm="True" VisibleIndex="2" 
                            Width="15%">
                            <PropertiesComboBox ValueType="System.String" Spacing="0" 
                                TextField="System_Group">
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn Caption="CI Info" FieldName="System_Info" 
                            Name="System_Info" ShowInCustomizationForm="True" VisibleIndex="3" 
                            Width="15%">
                            <PropertiesTextEdit MaxLength="50">
                            </PropertiesTextEdit>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="CI Area" FieldName="System_Area" 
                            Name="System_Area" ShowInCustomizationForm="True" 
                            VisibleIndex="4" Width="15%">
                            <PropertiesTextEdit MaxLength="50">
                            </PropertiesTextEdit>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Process" FieldName="Process" Name="Process" 
                            ShowInCustomizationForm="True" VisibleIndex="10">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Latitude" FieldName="Latitude" 
                            Name="Latitude" ShowInCustomizationForm="True" VisibleIndex="7" 
                            Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Longitude" FieldName="Longitude" 
                            Name="Longitude" ShowInCustomizationForm="True" VisibleIndex="8" 
                            Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" 
                            Name="Hidden_id" ShowInCustomizationForm="True" Visible="False" 
                            VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn Caption="Coord/s" FieldName="Coordinates" 
                            Name="Coordinates" ShowInCustomizationForm="True" VisibleIndex="5" 
                            Width="60px">
                        </dx:GridViewDataCheckColumn>
                    </Columns>
                    <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" 
                        AllowFocusedRow="True" />
                    <SettingsPager PageSize="20" ShowDefaultImages="False" AlwaysShowPager="True">
                        <AllButton Text="All">
                        </AllButton>
                        <NextPageButton Text="Next &gt;">
                        </NextPageButton>
                        <PrevPageButton Text="&lt; Prev">
                        </PrevPageButton>
                        <PageSizeItemSettings Visible="True">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFilterBar="Visible" 
                        ShowFilterRowMenu="True" ShowGroupedColumns="True" />
                    <SettingsCookies Enabled="True" Version="12" />
                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
                    <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                        CssPostfix="PlasticBlue">
                        <Header ImageSpacing="10px" SortingImageSpacing="10px">
                        </Header>
                        <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                        <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                        </FocusedRow>
                    </Styles>
                    <StylesEditors>
                        <CalendarHeader Spacing="11px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <Templates>
                        <EditForm>
                            <div style="background-color: #FFFFFF; border-right-style: solid; border-right-width: 2px; border-right-color: #666666;">
                                <dx:ASPxPageControl ID="ASPxPageControlSystems" runat="server" 
                                    ActiveTabIndex="0" EnableTheming="True" Theme="PlasticBlue" 
                                    Width="100%">
                                    <TabPages>
                                        <dx:TabPage Text="Configuration Item">
                                            <ContentCollection>
                                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                    <table class="style1" 
                                                        style="border-style: solid solid none none; background-color: #FFFFFF; border-top-width: 1px; border-right-width: 2px; border-top-color: #666666; border-right-color: #666666;">
                                                        <tr>
                                                            <td class="style9" width="120">
                                                                &nbsp;</td>
                                                            <td class="style10">
                                                                &nbsp;</td>
                                                            <td class="style10" width="40%">
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style9" style="padding-bottom: 5px">
                                                                <span class="style22">*</span> Configuration Item:
                                                            </td>
                                                            <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxSystem" runat="server" MaxLength="50" 
                                                                    Text='<%# Bind("System") %>' Width="80%">
                                                                    <ValidationSettings CausesValidation="True">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <Border BorderColor="#6699FF" BorderWidth="1px" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td rowspan="3" style="text-align: center">
                                                                <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/Images/SystemNew.png" 
                                                                    IsPng="True">
                                                                </dx:ASPxImage>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style9" style="padding-bottom: 5px">
                                                                <span class="style22">*</span> CI Group:</td>
                                                            <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                                <dx:ASPxComboBox ID="ASPxComboBoxSystemGroup" runat="server" 
                                                                    Text='<%# Bind("System_Group") %>' Width="80%">
                                                                    <ValidationSettings CausesValidation="True">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <Border BorderColor="#6699FF" BorderWidth="1px" />
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style9">
                                                                <span class="style22">*</span> Process:</td>
                                                            <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0">
                                                                <dx:ASPxDropDownEdit ID="ASPxDropDownEditProcess" runat="server" 
                                                                    ClientInstanceName="checkComboBox" EnableAnimation="False" 
                                                                    SkinID="CheckComboBox" Text='<%# Bind("Process") %>' Width="210px">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBoxProcess" runat="server" 
                                                                            ClientInstanceName="checkListBox" SelectionMode="CheckColumn" 
                                                                            SkinID="CheckComboBoxListBox" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                                            <Items>
                                                                                <dx:ListEditItem Text="(Select all)" />
                                                                            </Items>
                                                                            <ClientSideEvents SelectedIndexChanged="function(s,e) {OnListBoxSelectionChanged(s,e,checkComboBox)}" />
                                                                        </dx:ASPxListBox>
                                                                        <table cellpadding="4" cellspacing="0" style="width: 100%">
                                                                            <tr>
                                                                                <td align="right">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" 
                                                                                        Text="Close">
                                                                                        <ClientSideEvents Click="function(s, e){ checkComboBox.HideDropDown(); }" />
                                                                                    </dx:ASPxButton>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </DropDownWindowTemplate>
                                                                    <DropDownWindowStyle BackColor="#EDEDED">
                                                                    </DropDownWindowStyle>
                                                                    <ValidationSettings CausesValidation="True">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <Border BorderColor="#6699FF" BorderWidth="1px" />
                                                                </dx:ASPxDropDownEdit>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style9" height="20px">
                                                                &nbsp;</td>
                                                            <td class="style23">
                                                                &nbsp;</td>
                                                            <td class="style23">
                                                                * mandatory</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style9" height="1" style="line-height: 1px">
                                                                &nbsp;</td>
                                                            <td class="style23" colspan="2" height="1" 
                                                                style="border-bottom: 1px solid #C0C0C0; text-align: right; padding-right: 0px; margin-right: 0px; line-height: 1px;">
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style9" style="padding-top: 5px">
                                                                CI info:</td>
                                                            <td colspan="2" style="padding-top: 5px">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxSystemInfo" runat="server" MaxLength="50" 
                                                                    Text='<%# Bind("System_info") %>' Width="50%">
                                                                    <Border BorderColor="#6699FF" BorderWidth="1px" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style9">
                                                                CI Area:</td>
                                                            <td colspan="2">
                                                                <dx:ASPxComboBox ID="ASPxComboBoxSystemArea" runat="server" 
                                                                    Text='<%# Bind("System_Area") %>' Width="50%">
                                                                    <ValidationSettings CausesValidation="True">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <Border BorderColor="#6699FF" BorderWidth="1px" />
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table class="style1" 
                                                        style="background-color: #FFFFFF; border-right-style: solid; border-right-width: 2px; border-right-color: #666666;">
                                                        <tr>
                                                            <td class="style6" width="90">
                                                                &nbsp;</td>
                                                            <td width="30">
                                                                &nbsp;</td>
                                                            <td valign="top" width="10">
                                                                &nbsp;</td>
                                                            <td width="30">
                                                                &nbsp;</td>
                                                            <td width="10">
                                                                &nbsp;</td>
                                                            <td width="50">
                                                                &nbsp;</td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td class="style8" width="90">
                                                                &nbsp;</td>
                                                            <td width="30">
                                                                &nbsp;</td>
                                                            <td valign="top" width="10">
                                                                &nbsp;</td>
                                                            <td width="30">
                                                                &nbsp;</td>
                                                            <td width="10">
                                                                &nbsp;</td>
                                                            <td width="50">
                                                                &nbsp;</td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style9" width="120">
                                                                <span class="style22">**</span> Latitude:</td>
                                                            <td class="style20" 
                                                                style="border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: #6699FF; border-bottom-color: #6699FF; border-left-color: #6699FF" 
                                                                width="30">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxLatDeg" runat="server" CssClass="style13" 
                                                                    HorizontalAlign="Right" MaxLength="2" Width="100%">
                                                                    <MaskSettings IncludeLiterals="None" Mask="00" />
                                                                    <ValidationSettings Display="None">
                                                                    </ValidationSettings>
                                                                    <Border BorderStyle="None" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td class="style24" valign="top" width="10">
                                                                <strong>o</strong></td>
                                                            <td width="30">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxLatMin" runat="server" CssClass="style14" 
                                                                    HorizontalAlign="Right" MaxLength="2" Width="100%">
                                                                    <MaskSettings Mask="00" />
                                                                    <ValidationSettings Display="None">
                                                                    </ValidationSettings>
                                                                    <Border BorderStyle="None" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td class="style25" width="10">
                                                                <strong>&#39;</strong></td>
                                                            <td width="40">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxLatSec" runat="server" CssClass="style15" 
                                                                    HorizontalAlign="Right" MaxLength="6" Width="100%">
                                                                    <MaskSettings Mask="00.00" />
                                                                    <ValidationSettings Display="None">
                                                                    </ValidationSettings>
                                                                    <Border BorderStyle="None" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td class="style25" width="10">
                                                                <strong>&quot;</strong></td>
                                                            <td class="style9" width="90">
                                                                <span class="style22">** </span>Longitude:</td>
                                                            <td width="30">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxlonDeg" runat="server" CssClass="style16" 
                                                                    HorizontalAlign="Right" MaxLength="2" Width="100%">
                                                                    <MaskSettings Mask="00" />
                                                                    <ValidationSettings Display="None">
                                                                    </ValidationSettings>
                                                                    <Border BorderStyle="None" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td class="style24" valign="top" width="10">
                                                                <strong>o</strong></td>
                                                            <td width="30">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxLonMin" runat="server" CssClass="style17" 
                                                                    HorizontalAlign="Right" MaxLength="2" Width="100%">
                                                                    <MaskSettings Mask="00" />
                                                                    <ValidationSettings Display="None">
                                                                    </ValidationSettings>
                                                                    <Border BorderStyle="None" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td class="style25" width="10">
                                                                <strong>&#39;</strong></td>
                                                            <td width="40">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxLonSec" runat="server" CssClass="style18" 
                                                                    HorizontalAlign="Right" MaxLength="6" Width="100%">
                                                                    <MaskSettings Mask="00.00" />
                                                                    <ValidationSettings Display="None">
                                                                    </ValidationSettings>
                                                                    <Border BorderStyle="None" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td class="style25">
                                                                <strong>&quot;</strong></td>
                                                        </tr>
                                                        <tr style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                            <td class="style9" colspan="14">
                                                                <span class="style26">** degrees <sup><strong>o</strong></sup> / minutes <strong>
                                                                &#39;</strong> / seconds <strong>&quot;</strong></span>
                                                            </td>
                                                        </tr>
                                                        <tr style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                            <td class="style27" colspan="14">
                                                                <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" runat="server" 
                                                                    ColumnID="" ReplacementType="EditFormUpdateButton" />
                                                                <dx:ASPxGridViewTemplateReplacement ID="CancelButton" runat="server" 
                                                                    ColumnID="" ReplacementType="EditFormCancelButton" />
                                                            </td>
                                                        </tr>
                                                        <tr style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                            <td class="style27" colspan="14">
                                                                <dx:ASPxTextBox ID="ASPxTextBoxHidden_id" runat="server" MaxLength="50" 
                                                                    Text='<%# Bind("Hidden_id") %>' Visible="False" Width="100px">
                                                                    <Border BorderColor="#6699FF" BorderWidth="1px" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                        <dx:TabPage Text="Relations' List">
                                            <ContentCollection>
                                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                    
                                                     <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenu2" runat="server" ItemAutoWidth="False" Theme="DevEx" 
                                Width="100%" OnInit="ASPxMenu2_Init">
                                <ClientSideEvents ItemClick="function(s, e) {
	ASPxGridViewRelations.AddNewRow()

		
}" />
                                <Items>
                                    <dx:MenuItem Name="AddRel" Text="New Relation">
                                        <Image AlternateText="New" Height="10px" Url="~/Images/Add.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
                                <ItemStyle>
                                <Paddings PaddingRight="0px" />
                                </ItemStyle>
                            </dx:ASPxMenu>
                        </td>

                    </tr>
                </table>

                                                    <dx:ASPxGridView ID="ASPxGridViewRelations" runat="server" 
                                                        AutoGenerateColumns="False" ClientIDMode="AutoID" EnableTheming="True" 
                                                        KeyFieldName="Hidden_A_system_id;Hidden_B_system_id;Hidden_rel_type_id" 
                                                        OnBeforePerformDataSelect="ASPxGridViewRelations_BeforePerformDataSelect" 
                                                        Theme="Office2003Blue" Width="100%" 
                                                        OnCellEditorInitialize="ASPxGridViewRelations_CellEditorInitialize" 
                                                        OnRowDeleting="ASPxGridViewRelations_RowDeleting" 
                                                        OnRowInserting="ASPxGridViewRelations_RowInserting" 
                                                        OnRowUpdating="ASPxGridViewRelations_RowUpdating" EnableViewState="False" 
                                                         ClientInstanceName="ASPxGridViewRelations">
                                                        <ClientSideEvents EndCallback="function(s, e) {

}" />
                                                        <Columns>
                                                            <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ShowEditButton="True" ShowDeleteButton="True" ShowCancelButton="True" ShowUpdateButton="True"/>
                                                            <dx:GridViewDataComboBoxColumn Caption="CI_A" FieldName="System_A" 
                                                                Name="System_A" ShowInCustomizationForm="True" VisibleIndex="5" 
                                                                Width="20%" Visible="False">
                                                                <PropertiesComboBox DropDownRows="10">
                                                                    <ValidationSettings ErrorDisplayMode="None">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesComboBox>
                                                            </dx:GridViewDataComboBoxColumn>
                                                            <dx:GridViewDataComboBoxColumn Caption="Relation" FieldName="Rel_type" 
                                                                Name="Rel_type" ShowInCustomizationForm="True" VisibleIndex="1" 
                                                                Width="15%">
                                                                <PropertiesComboBox>
                                                                    <ValidationSettings ErrorDisplayMode="None">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesComboBox>
                                                            </dx:GridViewDataComboBoxColumn>
                                                            <dx:GridViewDataComboBoxColumn Caption="Related Configuration Item" FieldName="System_B" 
                                                                Name="System_B" ShowInCustomizationForm="True" VisibleIndex="2" 
                                                                Width="30%">
                                                                <PropertiesComboBox DropDownRows="10">
                                                                    <ValidationSettings ErrorDisplayMode="None">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesComboBox>
                                                            </dx:GridViewDataComboBoxColumn>
                                                            <dx:GridViewDataComboBoxColumn Caption="Depenencies" FieldName="Depend_on" 
                                                                Name="Depend_on" ShowInCustomizationForm="True" VisibleIndex="3" 
                                                                Width="20%">
                                                                <PropertiesComboBox EnableFocusedStyle="False">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="None" Value="0" />
                                                                        <dx:ListEditItem Text="Related on CI" Value="1" />
                                                                        <dx:ListEditItem Text="CI on Related" Value="2" />
                                                                        <dx:ListEditItem Text="Both Ways" Value="3" />
                                                                    </Items>
                                                                </PropertiesComboBox>
                                                            </dx:GridViewDataComboBoxColumn>
                                                            <dx:GridViewDataTextColumn Caption="Info" FieldName="Relation_info" 
                                                                Name="Relation_info" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Hidden_A_system_id" 
                                                                FieldName="Hidden_A_system_id" Name="Hidden_A_system_id" 
                                                                ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Hidden_rel_type_id" 
                                                                FieldName="Hidden_rel_type_id" Name="Hidden_rel_type_id" 
                                                                ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Hidden_B_system_id" 
                                                                FieldName="Hidden_B_system_id" Name="Hidden_B_system_id" 
                                                                ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" 
                                                            ConfirmDelete="True" />
                                                        <SettingsPager AlwaysShowPager="True">
                                                        </SettingsPager>
                                                        <SettingsEditing Mode="Inline" />
                                                        <Settings ShowGroupedColumns="True" ShowGroupPanel="True" />
                                                        <Styles>
                                                            <FocusedRow BackColor="#FCF9DF" ForeColor="Black" VerticalAlign="Top">
                                                                <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                                                            </FocusedRow>
                                                        </Styles>
                                                        <SettingsCommandButton>
                                                            <EditButton>
                                                                <Image Height="10px" ToolTip="Edit Relation" Url="~/Images/Edit.png">
                                                                </Image>
                                                            </EditButton>
                                                            <NewButton>
                                                                <Image Height="10px" ToolTip="New Relation" Url="~/Images/Add.png">
                                                                </Image>
                                                            </NewButton>
                                                            <DeleteButton>
                                                                <Image Height="10px" ToolTip="Delete Relation" Url="~/Images/Delete.png">
                                                                </Image>
                                                            </DeleteButton>
                                                            <CancelButton Text="Cancel">
                                                                <Image Height="18px" ToolTip="Cancel" Url="~/Images/Cancel.png">
                                                                </Image>
                                                            </CancelButton>
                                                            <UpdateButton Text="Save">
                                                                <Image Height="18px" ToolTip="Save" Url="~/Images/Save.png">
                                                                </Image>
                                                            </UpdateButton>
                                                        </SettingsCommandButton>
                                                    </dx:ASPxGridView>
                                                     <dx:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/Images/Return.png" 
                                                         IsPng="True" ToolTip="Return" Width="25px">
                                                         <ClientSideEvents Click="function(s, e) {
	ASPxGridViewSystems.CancelEdit();
}" />
                                                     </dx:ASPxImage>
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                    </TabPages>
                                </dx:ASPxPageControl>
                            </div>

                        </EditForm>
                        <DetailRow>
                            <dx:ASPxPageControl ID="ASPxPageControlSystems" runat="server" ActiveTabIndex="0" 
                                Width="100%" EnableTheming="True" Theme="PlasticBlue">
                                <TabPages>
                                    <dx:TabPage Text="Configuration Item">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                <table class="style1" 
                                                    style="border-style: solid solid none none; background-color: #FFFFFF; border-top-width: 1px; border-right-width: 2px; border-top-color: #666666; border-right-color: #666666;">
                                                    <tr>
                                                        <td class="style9" width="120">
                                                            &nbsp;</td>
                                                        <td class="style10">
                                                            &nbsp;</td>
                                                        <td class="style10" width="40%">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style9" style="padding-bottom: 5px">
                                                            &nbsp;Configuration Item:
                                                        </td>
                                                        <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                            <dx:ASPxTextBox ID="ASPxTextBoxSystem" runat="server" Text='<%# Bind("System") %>' 
                                                                Width="80%" MaxLength="50" ReadOnly="True">
                                                                <Border BorderColor="#6699FF" BorderWidth="1px" />
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td rowspan="3" style="text-align: center">
                                                            <dx:ASPxImage ID="ASPxImage2" runat="server" 
                                                                ImageUrl="~/Images/SystemNew.png" IsPng="True">
                                                            </dx:ASPxImage>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style9" style="padding-bottom: 5px">
                                                            &nbsp;CI Group:</td>
                                                        <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                            <dx:ASPxComboBox ID="ASPxComboBoxSystemGroup" runat="server" 
                                                                Text='<%# Bind("System_Group") %>' Width="80%" ReadOnly="True" 
                                                                Enabled="False">
                                                                <DropDownButton Enabled="False">
                                                                </DropDownButton>
                                                                <Border BorderColor="#6699FF" BorderWidth="1px" />
                                                                <DisabledStyle ForeColor="Black">
                                                                </DisabledStyle>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style9">
                                                            &nbsp;Process:</td>
                                                        <td style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0">
                                                            <dx:ASPxDropDownEdit ID="ASPxDropDownEditProcess" runat="server" 
                                                                ClientInstanceName="checkComboBox" EnableAnimation="False" 
                                                                SkinID="CheckComboBox" Text='<%# Bind("Process") %>' Width="210px" 
                                                                ReadOnly="True" Enabled="False">
                                                                <DropDownWindowTemplate>
                                                                    <dx:ASPxListBox ID="listBoxProcess" runat="server" 
                                                                        ClientInstanceName="checkListBox" SelectionMode="CheckColumn" 
                                                                        SkinID="CheckComboBoxListBox" Width="100%">
                                                                        <Border BorderStyle="None" />
                                                                        <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <Items>
                                                                            <dx:ListEditItem Text="(Select all)" />
                                                                        </Items>
                                                                        <ClientSideEvents SelectedIndexChanged="function(s,e) {OnListBoxSelectionChanged(s,e,checkComboBox)}" />
                                                                    </dx:ASPxListBox>
                                                                    <table cellpadding="4" cellspacing="0" style="width: 100%">
                                                                        <tr>
                                                                            <td align="right">
                                                                                <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" 
                                                                                    Text="Close">
                                                                                    <ClientSideEvents Click="function(s, e){ checkComboBox.HideDropDown(); }" />
                                                                                </dx:ASPxButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </DropDownWindowTemplate>
                                                                <DropDownWindowStyle BackColor="#EDEDED">
                                                                </DropDownWindowStyle>
                                                                <DropDownButton Enabled="False">
                                                                </DropDownButton>
                                                                <Border BorderColor="#6699FF" BorderWidth="1px" />
                                                                <DisabledStyle ForeColor="Black">
                                                                </DisabledStyle>
                                                            </dx:ASPxDropDownEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style9" height="20px">
                                                            &nbsp;</td>
                                                        <td class="style23">
                                                            &nbsp;</td>
                                                        <td class="style23">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style9" height="1" style="line-height: 1px">
                                                            &nbsp;</td>
                                                        <td class="style23" colspan="2" height="1" 
                                                            style="border-bottom: 1px solid #C0C0C0; text-align: right; padding-right: 0px; margin-right: 0px; line-height: 1px;">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style9" style="padding-top: 5px">
                                                            CI info:</td>
                                                        <td style="padding-top: 5px" colspan="2">
                                                            <dx:ASPxTextBox ID="ASPxTextBoxSystemInfo" runat="server" MaxLength="50" 
                                                                Text='<%# Bind("System_info") %>' Width="50%" ReadOnly="True">
                                                                <Border BorderColor="#6699FF" BorderWidth="1px" />
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style9">
                                                            CI Area:</td>
                                                        <td colspan="2">
                                                            <dx:ASPxComboBox ID="ASPxComboBoxSystemArea" runat="server" Enabled="False" 
                                                                ReadOnly="True" Text='<%# Bind("System_Area") %>' Width="50%">
                                                                <DropDownButton Enabled="False">
                                                                </DropDownButton>
                                                                <Border BorderColor="#6699FF" BorderWidth="1px" />
                                                                <DisabledStyle ForeColor="Black">
                                                                </DisabledStyle>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table class="style1" 
                                                    style="background-color: #FFFFFF; border-right-style: solid; border-right-width: 2px; border-right-color: #666666;">
                                                    <tr>
                                                        <td class="style6" width="90">
                                                            &nbsp;</td>
                                                        <td width="30">
                                                            &nbsp;</td>
                                                        <td valign="top" width="10">
                                                            &nbsp;</td>
                                                        <td width="30">
                                                            &nbsp;</td>
                                                        <td width="10">
                                                            &nbsp;</td>
                                                        <td width="50">
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td class="style8" width="90">
                                                            &nbsp;</td>
                                                        <td width="30">
                                                            &nbsp;</td>
                                                        <td valign="top" width="10">
                                                            &nbsp;</td>
                                                        <td width="30">
                                                            &nbsp;</td>
                                                        <td width="10">
                                                            &nbsp;</td>
                                                        <td width="50">
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style9" width="120">
                                                            &nbsp;Latitude:</td>
                                                        <td class="style20" width="30" 
                                                            style="border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: #6699FF; border-bottom-color: #6699FF; border-left-color: #6699FF">
                                                            <dx:ASPxTextBox ID="ASPxTextBoxLatDeg" runat="server" CssClass="style13" 
                                                                HorizontalAlign="Right" MaxLength="2" Width="100%" ReadOnly="True">
                                                                <MaskSettings IncludeLiterals="None" Mask="00" />
                                                                <ValidationSettings Display="Dynamic">
                                                                </ValidationSettings>
                                                                <Border BorderStyle="None" />
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style24" valign="top" width="10">
                                                            <strong>o</strong></td>
                                                        <td width="30">
                                                            <dx:ASPxTextBox ID="ASPxTextBoxLatMin" runat="server" CssClass="style14" 
                                                                HorizontalAlign="Right" MaxLength="2" Width="100%" ReadOnly="True">
                                                                <MaskSettings Mask="00" />
                                                                <ValidationSettings Display="Dynamic">
                                                                </ValidationSettings>
                                                                <Border BorderStyle="None" />
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td width="10" class="style25">
                                                            <strong>&#39;</strong></td>
                                                        <td width="40">
                                                            <dx:ASPxTextBox ID="ASPxTextBoxLatSec" runat="server" CssClass="style15" 
                                                                HorizontalAlign="Right" MaxLength="6" Width="100%" ReadOnly="True">
                                                                <MaskSettings Mask="00.00" />
                                                                <ValidationSettings Display="Dynamic">
                                                                </ValidationSettings>
                                                                <Border BorderStyle="None" />
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td width="10" class="style25">
                                                            <strong>&quot;</strong></td>
                                                        <td class="style9" width="90">
                                                            <span class="style22">&nbsp;</span>Longitude:</td>
                                                        <td width="30">
                                                            <dx:ASPxTextBox ID="ASPxTextBoxlonDeg" runat="server" CssClass="style16" 
                                                                HorizontalAlign="Right" MaxLength="2" Width="100%" ReadOnly="True">
                                                                <MaskSettings Mask="00" />
                                                                <ValidationSettings Display="Dynamic">
                                                                </ValidationSettings>
                                                                <Border BorderStyle="None" />
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style24" valign="top" width="10">
                                                            <strong>o</strong></td>
                                                        <td width="30">
                                                            <dx:ASPxTextBox ID="ASPxTextBoxLonMin" runat="server" CssClass="style17" 
                                                                HorizontalAlign="Right" MaxLength="2" Width="100%" ReadOnly="True">
                                                                <MaskSettings Mask="00" />
                                                                <ValidationSettings Display="Dynamic">
                                                                </ValidationSettings>
                                                                <Border BorderStyle="None" />
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td width="10" class="style25">
                                                            <strong>&#39;</strong></td>
                                                        <td width="40">
                                                            <dx:ASPxTextBox ID="ASPxTextBoxLonSec" runat="server" CssClass="style18" 
                                                                HorizontalAlign="Right" MaxLength="6" Width="100%" ReadOnly="True">
                                                                <MaskSettings Mask="00.00" />
                                                                <ValidationSettings Display="Dynamic">
                                                                </ValidationSettings>
                                                                <Border BorderStyle="None" />
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style25">
                                                            <strong>&quot;</strong></td>
                                                    </tr>
                                                    <tr style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                        <td class="style9" colspan="14">
                                                            <span class="style26">degrees <sup><strong>o</strong></sup> / minutes <strong>
                                                            &#39;</strong> / seconds <strong>&quot;</strong></span>
                                                        </td>
                                                    </tr>
                                                    <tr style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #C0C0C0; padding-bottom: 5px;">
                                                        <td class="style27" colspan="14">
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="Relations' List">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxGridView ID="ASPxGridViewRelations" runat="server" 
                                                    AutoGenerateColumns="False" EnableTheming="True" 
                                                    OnBeforePerformDataSelect="ASPxGridViewRelations_BeforePerformDataSelect" 
                                                    Theme="Office2003Blue" Width="100%" 
                                                    KeyFieldName="System_A;System_B;Rel_type" ClientIDMode="AutoID">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ButtonType="Image" Width="70px" Visible="False" ShowCancelButton="True" ShowUpdateButton="True"/>
                                                        <dx:GridViewDataTextColumn Caption="From CI" FieldName="System_A" 
                                                            Name="System_A" ShowInCustomizationForm="True" VisibleIndex="1" 
                                                            Width="20%" Visible="False">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Relation" FieldName="Rel_type" 
                                                            Name="Rel_type" ShowInCustomizationForm="True" VisibleIndex="2" 
                                                            Width="15%">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Related Configuration Item" FieldName="System_B" 
                                                            Name="System_B" ShowInCustomizationForm="True" VisibleIndex="3" 
                                                            Width="30%">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="Dependencies" FieldName="Depend_on" 
                                                            Name="Depend_on" ShowInCustomizationForm="True" VisibleIndex="4" Width="20%">
                                                            <PropertiesComboBox EnableFocusedStyle="False">
                                                                <Items>
                                                                    <dx:ListEditItem Text="None" Value="0" />
                                                                    <dx:ListEditItem Text="Related on CI" Value="1" />
                                                                    <dx:ListEditItem Text="CI on Related" Value="2" />
                                                                    <dx:ListEditItem Text="Both Ways" Value="3" />
                                                                </Items>
                                                            </PropertiesComboBox>
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataTextColumn Caption="Info" FieldName="Relation_info" 
                                                            Name="Relation_info" ShowInCustomizationForm="True" VisibleIndex="5">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Hidden_from_system_id" 
                                                            FieldName="Hidden_from_system_id" Name="Hidden_from_system_id" 
                                                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Hidden_to_system_id" 
                                                            FieldName="Hidden_to_system_id" Name="Hidden_to_system_id" 
                                                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" 
                                                        ConfirmDelete="True" />
                                                    <SettingsPager AlwaysShowPager="True">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline" />
                                                    <Settings ShowGroupedColumns="True" ShowGroupPanel="True" />
                                                    <Styles>
                                                        <FocusedRow BackColor="#FCF9DF" ForeColor="Black" VerticalAlign="Top">
                                                            <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                                                        </FocusedRow>
                                                    </Styles>
                                                    <SettingsCommandButton>
                                                        <EditButton>
                                                            <Image Height="10px" ToolTip="Edit Relation" Url="~/Images/Edit.png">
                                                            </Image>
                                                        </EditButton>
                                                        <NewButton>
                                                            <Image Height="10px" Url="~/Images/Add.png" ToolTip="New Relation">
                                                            </Image>
                                                        </NewButton>
                                                        <DeleteButton>
                                                            <Image Height="10px" Url="~/Images/Delete.png" ToolTip="Delete Relation">
                                                            </Image>
                                                        </DeleteButton>
                                                        <CancelButton Text="Cancel">
                                                            <Image Height="18px" ToolTip="Cancel" Url="~/Images/Cancel.png">
                                                            </Image>
                                                        </CancelButton>
                                                        <UpdateButton Text="Save">
                                                            <Image Height="18px" ToolTip="Save" Url="~/Images/Save.png">
                                                            </Image>
                                                        </UpdateButton>
                                                    </SettingsCommandButton>
                                                </dx:ASPxGridView>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                </TabPages>
                            </dx:ASPxPageControl>
                        </DetailRow>
                    </Templates>
                    <SettingsCommandButton>
                        <EditButton Text="Edit CI">
                            <Image Height="10px" Url="~/Images/Edit.png">
                            </Image>
                        </EditButton>
                        <NewButton Text="New CI">
                            <Image Height="10px" Url="~/Images/Add.png">
                            </Image>
                        </NewButton>
                        <DeleteButton Text="Delete CI">
                            <Image Height="10px" Url="~/Images/Delete.png">
                            </Image>
                        </DeleteButton>
                        <CancelButton Text="Cancel">
                            <Image Height="25px" Url="~/Images/CancelNew.png">
                            </Image>
                        </CancelButton>
                        <UpdateButton Text="Save">
                            <Image Height="25px" Url="~/Images/SaveNew.png">
                            </Image>
                        </UpdateButton>
                        <ClearFilterButton Text="Clear Filter">
                            <Image Height="20px" Url="/Images/ClearFilter.png">
                            </Image>
                        </ClearFilterButton>
                    </SettingsCommandButton>
                </dx:ASPxGridView>
            </td>
        </tr>
    </table>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    </form>
</body>
</html>
