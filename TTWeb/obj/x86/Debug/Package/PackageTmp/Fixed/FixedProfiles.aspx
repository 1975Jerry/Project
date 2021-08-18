<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FixedProfiles.aspx.cs" Inherits="TTWeb.User_Management.FixedProfiles" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>










<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style23
        {
            color: #999999;
            text-align: left;
            font-size: 9pt;
        }
        .style24
        {
            text-align: right;
            color: #666666;
        }
        .style22
        {
            color: #993300;
        }
        .style25
        {
            text-align: right;
            color: #993300;
            font-size: 7pt;
        }
        .style27
        {
            color: #999999;
            text-align: right;
            font-size: 8pt;
        }
        .auto-style4 {
            font-size: 8pt;
            width: 160px;
        }
        .auto-style5 {
            font-size: 8pt;
            color: #CCCCCC;
        }
        .auto-style6 {
            font-size: 8pt;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" 
        ClientIDMode="AutoID" CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" 
        CssPostfix="Office2010Blue" 
        GroupBoxCaptionOffsetY="-19px" 
        SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" 
        HeaderText="FixedProfiles" EnableDefaultAppearance="False" 
            GroupBoxCaptionOffsetX="6px" Cursor="default" Theme="Metropolis">
        <ContentPaddings PaddingBottom="10px" PaddingLeft="9px" PaddingRight="11px" 
                PaddingTop="10px" />
            <HeaderStyle Font-Size="Small">
            <Paddings PaddingBottom="6px" PaddingLeft="9px" PaddingRight="11px" 
                PaddingTop="3px" />
            </HeaderStyle>
            <HeaderTemplate>
                <table style="width: 100%">
                    <tr>
                        <td width="100%" valign="middle" align="left">Fixed Engineers Profile Management
                        </td>
                        
                    </tr>
                </table>
            </HeaderTemplate>
        <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <table class="style1">
        <tr>
            <td>
                <div>
                    
                    <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px;" 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenu1" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%" OnLoad="ASPxMenu1_Load">
                                <ClientSideEvents ItemClick="function(s, e) {
	userlistgrid.AddNewRow()

		
}" />
                                <Items>
                                    <dx:MenuItem Name="NewProfile" Text="New Profile">
                                        <Image AlternateText="New" Height="10px" Url="~/Images/Add.png">
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
                                <BackgroundImage ImageUrl="~/Images/back2.png" />
                                <BorderLeft BorderWidth="0px" />
                            </dx:ASPxMenu>
                        </td>
                    </tr>
                </table>


                    <dx:ASPxGridView ID="ASPxGridViewProfileList" runat="server" AutoGenerateColumns="False"
                        ClientIDMode="AutoID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
                        CssPostfix="PlasticBlue" KeyFieldName="ID" Width="100%"
                        OnInitNewRow="ASPxGridViewProfileList_InitNewRow" ClientInstanceName="userlistgrid"
                        OnRowDeleting="ASPxGridViewProfileList_RowDeleting" 
                        OnCustomJSProperties="ASPxGridViewProfileList_CustomJSProperties" 
                        OnRowInserting="ASPxGridViewProfileList_RowInserting" 
                        EnableViewState="False" 
                        OnRowUpdating="ASPxGridViewProfileList_RowUpdating" 
                        OnHtmlEditFormCreated="ASPxGridViewProfileList_HtmlEditFormCreated" 
                        Theme="Metropolis" OnHtmlRowPrepared="ASPxGridViewProfileList_HtmlRowPrepared" >
                        <ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}" />
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="50px" ButtonType="Image" Name="EditButtons" ShowEditButton="True" ShowDeleteButton="True" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn Caption="Engineer" FieldName="TT_USER" Name="TT_USER"
                                ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                <Settings AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="From day" FieldName="FROM_DAY" 
                                Name="FROM_DAY" ShowInCustomizationForm="True" VisibleIndex="4" Width="90px">
                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                </PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="Areas" FieldName="Areas" Name="Areas" 
                                ShowInCustomizationForm="True" VisibleIndex="14">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SLAs" FieldName="SLAS" Name="SLAS" 
                                ShowInCustomizationForm="True" VisibleIndex="13" Width="80px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn Caption="Enabled" FieldName="FIXED_USER_ENABLED" 
                                Name="FIXED_USER_ENABLED" ShowInCustomizationForm="True" VisibleIndex="2" 
                                Width="60px">
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataTextColumn Caption="ID" FieldName="ID" 
                                Name="ID" ShowInCustomizationForm="True"
                                VisibleIndex="16" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="USER_ID" FieldName="USER_ID" Name="USER_ID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="17">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn Caption="Temporary" FieldName="TEMPORARY" Name="TEMPORARY" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataDateColumn Caption="To day" FieldName="TO_DAY" Name="TO_DAY" ShowInCustomizationForm="True" VisibleIndex="5" Width="90px">
                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                </PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="SLA1" FieldName="SLA1" Name="SLA1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SLA2" FieldName="SLA2" Name="SLA2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="19">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SLA3" FieldName="SLA3" Name="SLA3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="20">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SLA4" FieldName="SLA4" Name="SLA4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="21">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SLA5" FieldName="SLA5" Name="SLA5" ShowInCustomizationForm="True" Visible="False" VisibleIndex="22">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SLA6" FieldName="SLA6" Name="SLA6" ShowInCustomizationForm="True" Visible="False" VisibleIndex="23">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SLA7" FieldName="SLA7" Name="SLA7" ShowInCustomizationForm="True" Visible="False" VisibleIndex="24">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SLA8" FieldName="SLA8" Name="SLA8" ShowInCustomizationForm="True" Visible="False" VisibleIndex="25">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SLA9" FieldName="SLA9" Name="SLA9" ShowInCustomizationForm="True" Visible="False" VisibleIndex="26">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SLA10" FieldName="SLA10" Name="SLA10" ShowInCustomizationForm="True" Visible="False" VisibleIndex="27">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SLA11" FieldName="SLA11" Name="SLA11" ShowInCustomizationForm="True" Visible="False" VisibleIndex="28">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SLA12" FieldName="SLA12" Name="SLA12" ShowInCustomizationForm="True" Visible="False" VisibleIndex="29">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="MON_FROM" FieldName="MON_FROM" Name="MON_FROM" ShowInCustomizationForm="True" Visible="False" VisibleIndex="30">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="MON_TO" FieldName="MON_TO" Name="MON_TO" ShowInCustomizationForm="True" Visible="False" VisibleIndex="31">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="TUE_FROM" FieldName="TUE_FROM" Name="TUE_FROM" ShowInCustomizationForm="True" Visible="False" VisibleIndex="32">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="TUE_TO" FieldName="TUE_TO" Name="TUE_TO" ShowInCustomizationForm="True" Visible="False" VisibleIndex="33">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="WED_FROM" FieldName="WED_FROM" Name="WED_FROM" ShowInCustomizationForm="True" Visible="False" VisibleIndex="34">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="WED_TO" FieldName="WED_TO" Name="WED_TO" ShowInCustomizationForm="True" Visible="False" VisibleIndex="35">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="THU_FROM" FieldName="THU_FROM" Name="THU_FROM" ShowInCustomizationForm="True" Visible="False" VisibleIndex="36">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="THU_TO" FieldName="THU_TO" Name="THU_TO" ShowInCustomizationForm="True" Visible="False" VisibleIndex="37">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="FRI_FROM" FieldName="FRI_FROM" Name="FRI_FROM" ShowInCustomizationForm="True" Visible="False" VisibleIndex="38">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="FRI_TO" FieldName="FRI_TO" Name="FRI_TO" ShowInCustomizationForm="True" Visible="False" VisibleIndex="39">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SAT_FROM" FieldName="SAT_FROM" Name="SAT_FROM" ShowInCustomizationForm="True" Visible="False" VisibleIndex="40">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SAT_TO" FieldName="SAT_TO" Name="SAT_TO" ShowInCustomizationForm="True" Visible="False" VisibleIndex="41">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SUN_FROM" FieldName="SUN_FROM" Name="SUN_FROM" ShowInCustomizationForm="True" Visible="False" VisibleIndex="42">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SUN_TO" FieldName="SUN_TO" Name="SUN_TO" ShowInCustomizationForm="True" Visible="False" VisibleIndex="43">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SUN" FieldName="SUN" Name="SUN" ShowInCustomizationForm="True" VisibleIndex="12" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SAT" FieldName="SAT" Name="SAT" ShowInCustomizationForm="True" VisibleIndex="11" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="FRI" FieldName="FRI" Name="FRI" ShowInCustomizationForm="True" VisibleIndex="10" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="THU" FieldName="THU" Name="THU" ShowInCustomizationForm="True" VisibleIndex="9" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="WED" FieldName="WED" Name="WED" ShowInCustomizationForm="True" VisibleIndex="8" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="TUE" FieldName="TUE" Name="TUE" ShowInCustomizationForm="True" VisibleIndex="7" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="MON" FieldName="MON" Name="MON" ShowInCustomizationForm="True" VisibleIndex="6" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn Caption="On Leave" FieldName="ON_LEAVE" Name="ON_LEAVE" ShowInCustomizationForm="True" VisibleIndex="15" Width="60px">
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" Name="Tooltip" ShowInCustomizationForm="True" Visible="False" VisibleIndex="44">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" 
                            AllowFocusedRow="True" />
                        <SettingsPager PageSize="20" ShowDefaultImages="False">
                            <AllButton Text="All">
                            </AllButton>
                            <NextPageButton Text="Next &gt;">
                            </NextPageButton>
                            <PrevPageButton Text="&lt; Prev">
                            </PrevPageButton>
                            <PageSizeItemSettings Visible="True">
                            </PageSizeItemSettings>
                        </SettingsPager>
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFilterRowMenu="True" 
                            ShowFilterBar="Visible" />
                        <SettingsCookies Enabled="True" StoreColumnsWidth="False" Version="18" 
                            StoreColumnsVisiblePosition="False" />

                        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                            CssPostfix="PlasticBlue">
                            <Header ImageSpacing="10px" SortingImageSpacing="10px" BackColor="#0066CC" 
                                ForeColor="White">
                            </Header>
                            <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                            <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                            </FocusedRow>
                            <CommandColumnItem>
                                <Paddings PaddingLeft="3px" />
                            </CommandColumnItem>
                        </Styles>
                        <StylesEditors>
                            <CalendarHeader Spacing="11px">
                            </CalendarHeader>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <Templates>
                            <DetailRow>
                                <div>
                                </div>
                            </DetailRow>
                            <EditForm>
                                <table class="style1" cellpadding="0" cellspacing="0" bgcolor="#0099CC">
                                    <tr>
                                        <td style="color: #FFFFFF; font-size: 8pt; ">Engineer Profile</td>
                                        <td style="color: #FFFFFF; font-size: 8pt; text-align: right; background-color: #FFFFFF;" width="80">
                                            <dx:ASPxImage ID="ASPxImage1" runat="server" Height="26px" ImageUrl="~/images/Users.png" ShowLoadingImage="true">
                                            </dx:ASPxImage>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table bgcolor="White" cellpadding="0" cellspacing="0" class="style1">
                                    <tr>
                                        <td class="auto-style6" style="border-left: 1px solid #0066CC; border-right: 1px none #0066CC; border-top: 1px solid #0066CC; border-bottom: 1px solid #C0C0C0; color: #000000; border-color: #C0C0C0; padding-left: 2px;" width="100">Engineer &gt;</td>
                                        <td style="border-style: solid none solid none; border-width: 1px; border-color: #C0C0C0; padding-bottom: 4px; padding-top: 4px;" valign="middle" width="260">
                                            <dx:ASPxComboBox ID="ASPxComboBoxUser" runat="server" Caption="Name:" EnableTheming="True" Font-Size="8pt" Text='<%# Bind("TT_USER") %>' Theme="MetropolisBlue" Value='<%# Bind("USER_ID") %>' ValueType="System.Int32" Width="200px" OnInit="ASPxComboBoxUser_Init">
                                                <ItemStyle Font-Size="8pt" />
                                                <Paddings PaddingBottom="2px" PaddingTop="2px" />
                                                <ValidationSettings Display="Dynamic">
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <CaptionStyle Font-Size="8pt">
                                                </CaptionStyle>
                                            </dx:ASPxComboBox>
                                        </td>
                                        <td style="border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-width: 1px; border-color: #C0C0C0" width="260">
                                            <dx:ASPxCheckBox ID="ASPxCheckBoxEnabled" runat="server" CheckState="Unchecked" EnableTheming="True" Font-Size="8pt" Text="Enabled?" TextAlign="Left" Theme="MetropolisBlue" Value='<%# Bind("FIXED_USER_ENABLED") %>' style="font-weight: 700">
                                            </dx:ASPxCheckBox>
                                        </td>
                                        <td style="background-color: #FFFFFF">&nbsp;</td>
                                    </tr>
                                </table>
                                <br />
                                <table bgcolor="#FFF2F2" cellpadding="0" cellspacing="0" class="style1">
                                    <tr>
                                        <td style="border-top-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 2px; border-color: #C0C0C0; padding-left: 2px;" width="100">
                                            <dx:ASPxCheckBox ID="ASPxCheckBoxTemporary" runat="server" CheckState="Unchecked" EnableTheming="True" Font-Size="8pt" Text="Temporary?" TextAlign="Left" Theme="MetropolisBlue" Value='<%# Bind("TEMPORARY") %>'>
                                            </dx:ASPxCheckBox>
                                        </td>
                                        <td style="border-width: 2px; border-color: #C0C0C0; padding-top: 4px; padding-bottom: 4px; border-top-style: solid; border-bottom-style: solid;" width="260">
                                            <dx:ASPxDateEdit ID="ASPxDateEditFromDay" runat="server" Caption="Valid from day:" EnableTheming="True" Font-Size="8pt" Theme="MetropolisBlue" Value='<%# Bind("FROM_DAY") %>'>
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td style="border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-width: 2px; border-color: #C0C0C0" width="260">
                                            <dx:ASPxDateEdit ID="ASPxDateEditToDay" runat="server" Caption="Valid to day:" Font-Size="8pt" Theme="MetropolisBlue" Value='<%# Bind("TO_DAY") %>'>
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td bgcolor="White" style="color: #FFFFFF">&nbsp;</td>
                                    </tr>
                                </table>
                                <span class="auto-style5">&nbsp;</span><br />
                                <table bgcolor="#FFFFEC" cellpadding="0" cellspacing="0" class="style1">
                                    <tr>
                                        <td class="auto-style6" style="border-top-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 1px; border-color: #C0C0C0; padding-left: 2px;" width="100">On leave &gt;</td>
                                        <td style="border-width: 1px; border-color: #C0C0C0; padding-top: 4px; padding-bottom: 4px; border-top-style: solid; border-bottom-style: solid;" width="260">
                                            <dx:ASPxDateEdit ID="ASPxDateEditOnLeaveFrom" runat="server" Caption="On leave from:" EnableTheming="True" Font-Size="8pt" Theme="MetropolisBlue" Value='<%# Bind("ON_LEAVE_FROM") %>'>
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td style="border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-width: 1px; border-color: #C0C0C0" width="260">
                                            <dx:ASPxDateEdit ID="ASPxDateEditOnLeaveTo" runat="server" Caption="On leave to:" EnableTheming="True" Font-Size="8pt" Theme="MetropolisBlue" Value='<%# Bind("ON_LEAVE_TO") %>'>
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td bgcolor="White">&nbsp;</td>
                                    </tr>
                                </table>
                                <br />
                                <dx:ASPxCheckBoxList ID="ASPxCheckBoxListSLAs" runat="server" Caption="Engineer SLAs:" Font-Size="8pt" RepeatDirection="Horizontal" Theme="MetropolisBlue">
                                    <Items>
                                        <dx:ListEditItem Text="SLA1" Value="SLA1" />
                                        <dx:ListEditItem Text="SLA2" Value="SLA2" />
                                        <dx:ListEditItem Text="SLA3" Value="SLA3" />
                                        <dx:ListEditItem Text="SLA4" Value="SLA4" />
                                        <dx:ListEditItem Text="SLA5" Value="SLA5" />
                                        <dx:ListEditItem Text="SLA6" Value="SLA6" />
                                        <dx:ListEditItem Text="SLA7" Value="SLA7" />
                                        <dx:ListEditItem Text="SLA8" Value="SLA8" />
                                        <dx:ListEditItem Text="SLA9" Value="SLA9" />
                                        <dx:ListEditItem Text="SLA10" Value="SLA10" />
                                        <dx:ListEditItem Text="SLA11" Value="SLA11" />
                                        <dx:ListEditItem Text="SLA12" Value="SLA12" />
                                    </Items>
                                    <CaptionSettings Position="Left" />
                                    <CaptionStyle Font-Size="8pt">
                                    </CaptionStyle>
                                </dx:ASPxCheckBoxList>
                                <span class="auto-style4">
                                <br />
                                </span>
                                <table style="padding-top: 2px" width="600">
                                    <tr>
                                        <td colspan="5" style="padding-bottom: 4px"><span class="auto-style6">Work day hours (00 to 24):</span></td>
                                        <td rowspan="8" valign="top">
                                            <dx:ASPxGridView ID="ASPxGridViewAreas" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="MetropolisBlue" KeyFieldName="CONFIG_VALUE_ID" OnRowDeleting="ASPxGridViewAreas_RowDeleting" OnRowInserting="ASPxGridViewAreas_RowInserting" OnCellEditorInitialize="ASPxGridViewAreas_CellEditorInitialize">
                                                <SettingsPager PageSize="7">
                                                    <Summary Text="{0} of {1} ({2} items)" />
                                                </SettingsPager>
                                                <SettingsEditing Mode="Inline">
                                                </SettingsEditing>
                                                <SettingsBehavior ConfirmDelete="True" />
                                                <SettingsCommandButton>
                                                    <NewButton Text="Add">
                                                        <Image Height="10px" Url="~/Images/Add.png">
                                                        </Image>
                                                    </NewButton>
                                                    <UpdateButton Text="Save">
                                                        <Image Height="18px" Url="~/Images/Save.png">
                                                        </Image>
                                                    </UpdateButton>
                                                    <CancelButton Text="Cancel">
                                                        <Image Height="18px" Url="~/Images/Cancel.png">
                                                        </Image>
                                                    </CancelButton>
                                                    <DeleteButton Text="Delete">
                                                        <Image Height="10px" Url="~/Images/Delete.png">
                                                        </Image>
                                                    </DeleteButton>
                                                </SettingsCommandButton>
                                                <SettingsText EmptyDataRow="Save profile first..." />
                                                <Columns>
                                                    <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="60px">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn Caption="ID" FieldName="CONFIG_VALUE_ID" Name="CONFIG_VALUE_ID" Visible="False" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="PROFILE_ID" FieldName="PROFILE_ID" Name="PROFILE_ID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataComboBoxColumn Caption="Areas:" FieldName="CONFIGURATION_VALUE" Name="CONFIGURATION_VALUE" VisibleIndex="1" Width="100px">
                                                    </dx:GridViewDataComboBoxColumn>
                                                </Columns>
                                                <Styles>
                                                    <Header Font-Size="8pt">
                                                        <Border BorderWidth="0px" />
                                                    </Header>
                                                    <EmptyDataRow Font-Size="8pt" ForeColor="#CCCCCC">
                                                    </EmptyDataRow>
                                                    <Cell Font-Size="8pt">
                                                        <Border BorderWidth="0px" />
                                                    </Cell>
                                                    <PagerBottomPanel Font-Size="8pt">
                                                    </PagerBottomPanel>
                                                    <CommandColumn>
                                                        <Border BorderWidth="0px" />
                                                    </CommandColumn>
                                                </Styles>
                                                <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </dx:ASPxGridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style6" width="40">MON</td>
                                        <td width="1%">
                                            <dx:ASPxTextBox ID="ASPxTextBoxMonFrom" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("MON_FROM") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="text-align: center" width="10">-</td>
                                        <td width="1%">
                                            <dx:ASPxTextBox ID="ASPxTextBoxMonTo" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("MON_TO") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td width="120">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style6">TUE</td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBoxTueFrom" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("TUE_FROM") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="text-align: center">-</td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBoxTueTo" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("TUE_TO") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style6">WED</td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBoxWedFrom" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("WED_FROM") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="text-align: center">-</td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBoxWedTo" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("WED_TO") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style6">THU</td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBoxThuFrom" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("THU_FROM") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="text-align: center">-</td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBoxThuTo" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("THU_TO") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style6">FRI</td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBoxFriFrom" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("FRI_FROM") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="text-align: center">-</td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBoxFriTo" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("FRI_TO") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style6">SAT</td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBoxSatFrom" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("SAT_FROM") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="text-align: center">-</td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBoxSatTo" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("SAT_TO") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style6">SUN</td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBoxSunFrom" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("SUN_FROM") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="text-align: center">-</td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBoxSunTo" runat="server" Font-Size="8pt" MaxLength="2" Text='<%# Bind("SUN_TO") %>' Theme="MetropolisBlue" Width="30px">
                                                <MaskSettings Mask="99" PromptChar=" " />
                                                <ValidationSettings Display="Dynamic">
                                                </ValidationSettings>
                                                <Border BorderColor="#CCCCCC" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement1" runat="server" ReplacementType="EditFormUpdateButton" />
                                <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement2" runat="server" ReplacementType="EditFormCancelButton" />
                            </EditForm>
                        </Templates>
                        <SettingsCommandButton>
                            <EditButton Text="Edit User">
                                <Image Height="10px" Url="~/Images/Edit.png">
                                </Image>
                            </EditButton>
                            <NewButton Text="New User">
                                <Image Height="10px" Url="~/Images/Add.png">
                                </Image>
                            </NewButton>
                            <DeleteButton Text="Delete User">
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
                                <Image Height="20px" Url="~/Images/ClearFilter.png">
                                </Image>
                            </ClearFilterButton>
                        </SettingsCommandButton>
                    </dx:ASPxGridView>
                </div>
            </td>
        </tr>
    </table>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
 <script type="text/javascript">
     function OnUpdateClick(editor) {
         if (ASPxClientEdit.ValidateGroup("NewRow"))
             userlistgrid.UpdateEdit();
     }
</script>
    </form>
 </body>
</html>
