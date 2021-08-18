<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InitiateSchedule.aspx.cs" Inherits="TTWeb.InitiateSchedule" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>












<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<script type="text/javascript">
    function ValidateProblemsGrid(sender, args) {
        if (ScheduleProblemsGrid.cpRowCount == 0) {
            args.IsValid = false;
            return;
        }
        args.IsValid = true;
    }
        </script>
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .newStyle1
        {
            font-size: small;
            font-family: "Times New Roman", Times, serif;
        }
        .style20
        {
            font-size: 8pt;
        }
        .style33
        {
            color: #999999;
        }
        .style34
        {
            text-align: right;
            color: #999999;
        }
        .style36
        {
            font-size: 8pt;
            font-family: "Times New Roman", Times, serif;
            color: #000066;
        }
        .style37
        {
            height: 26px;
        }
        .dxpcControl_SoftOrange
{
	font: 12px Tahoma;
	color: black;
	background-color: white;
	border: 4px solid #d3d3d3;
	padding: 1px;
	width: 200px;
}
.dxpcHeader_SoftOrange
{
	color: #5c5c5c;
	background: #f4f4f4;
	border-bottom: 1px dotted #5c5c5c;
}
.dxpcCloseButton_SoftOrange,
.dxpcPinButton_SoftOrange,
.dxpcRefreshButton_SoftOrange,
.dxpcCollapseButton_SoftOrange,
.dxpcMaximizeButton_SoftOrange
{
	padding: 1px;
}
.dxpcContent_SoftOrange
{
	color: #737373;
	white-space: normal;
	vertical-align: top;
}
.dxpcContentPaddings_SoftOrange 
{
	padding: 9px 12px 10px;
}
.dxpcFooter_SoftOrange
{
	color: #999999;
	background: #f4f4f4;
	border-top: 1px solid #E0E0E0;
}
        </style>
</head>
<body>
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <form id="form1" runat="server">

    <div style="background-color: #F4F4F4">

        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" 
            HeaderText="New Schedule" Height="256px" Theme="Metropolis" 
            Width="100%">
            <HeaderStyle HorizontalAlign="Center" Font-Size="X-Large" />
            <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">

    <table class="dxflInternalEditorTable_Metropolis">
        <tr>
            <td class="style33" style="text-align: right; padding-top: 3px;">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" ForeColor="Gray" 
                    style="font-family: 'Times New Roman', Times, serif; color: #000066;" 
                    Text="Initiate as member of:" CssClass="style20">
                </dx:ASPxLabel>
            </td>
            <td class="style33" style="text-align: right" width="150px">
                <dx:ASPxComboBox ID="ASPxComboBoxFromTeam" runat="server" ClientIDMode="AutoID" 
                    ClientInstanceName="fromteamcombo" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    EnableCallbackMode="True" EnableClientSideAPI="True" 
                    LoadingPanelImagePosition="Top" ShowShadow="False" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
                    <ClientSideEvents SelectedIndexChanged="function(s, e) 
                        {
                        
                        var value = fromteamcombo.GetValue().toString();
                    	/*toteamcombo.PerformCallback(value);*/
	                    /*SystemGroupComboBox.PerformCallback(value);*/
}" />

<SettingsLoadingPanel ImagePosition="Top"></SettingsLoadingPanel>

                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <DropDownButton>
                        <Image>
                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
                                PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                        </Image>
                    </DropDownButton>
                    <ValidationSettings Display="Dynamic">
                        <RequiredField IsRequired="True" />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                    <Border BorderStyle="None" />
                </dx:ASPxComboBox>
            </td>
            <td class="style33" style="text-align: right" width="50">
                <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Images/Route.png" 
                    ToolTip="Routing" CssClass="style20">
                </dx:ASPxImage>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" class="style34" 
        style="padding-top: 10px">
        <tr>
            <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px;" 
                width="100%">
                <dx:ASPxMenu ID="ASPxMenuInitiate" runat="server" Font-Bold="True" 
                    ItemAutoWidth="False" ItemImagePosition="Right" Theme="Glass" Width="100%" 
                    HorizontalAlign="Left">
                    <ClientSideEvents ItemClick="function(s, e) {
                    

if((ASPxClientEdit.ValidateEditorsInContainer(null) == true) &amp;&amp; (ScheduleProblemsGrid.cpRowCount != 0))
{

		var element = s.GetMainElement();
		ClientPopupControlInitiate.ShowAtElement(element);
}                                        
else
{
   		e.processOnServer = false;
   		alert('Please, check required fields and add at least one ticket.');
}

}" />
                    <Items>
                        <dx:MenuItem Name="InitiateSchedule" Text="Initiate Schedule">
                            <Image AlternateText="New" Height="12px" Url="~/Images/Initiate.gif">
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
                <dx:ASPxMenu ID="ASPxMenuClose" runat="server" EnableTheming="True" 
                    ItemAutoWidth="False" RightToLeft="False" Theme="Glass" Width="100%" 
                    SeparatorHeight="0px" SeparatorWidth="0px">
                    <ClientSideEvents ItemClick="function(s, e) {
	
if (e.item.name == &quot;Cancel&quot;) 
{
	window.history.back();
}

}" />
                    <Items>
                        <dx:MenuItem Name="Cancel" Text="Cancel">
                            <Image Height="12px" Url="~/Images/Cancel.png">
                            </Image>
                            <ItemStyle>
                            <Paddings PaddingLeft="5px" />
                            <BorderLeft BorderStyle="None" />
                            </ItemStyle>
                        </dx:MenuItem>
                    </Items>
                    <ItemStyle HorizontalAlign="Right">
                    <Paddings PaddingLeft="0px" />
                    </ItemStyle>
                    <BorderLeft BorderWidth="0px" BorderStyle="None" />
                </dx:ASPxMenu>
            </td>
        </tr>
        <tr>
            <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px;" 
                width="100%">
                <dx:ASPxPopupControl ID="ASPxPopupControlInitiate" runat="server" 
                    AllowDragging="True" AllowResize="True" 
                    ClientInstanceName="ClientPopupControlInitiate" CssClass="style20" 
                    EnableTheming="True" HeaderText="Please choose recipient" 
                    LoadingPanelImagePosition="Top" 
                    OnWindowCallback="ASPxPopupControlInitiate_WindowCallback" 
                    PopupHorizontalOffset="120" PopupVerticalOffset="30" ShowFooter="True" 
                    Theme="SoftOrange">
                    <ClientSideEvents Shown="function(s, e) {
                    
	s.PerformCallback();
}" />
                    <HeaderStyle HorizontalAlign="Left">
                    <Paddings PaddingBottom="3px" PaddingTop="3px" />
                    </HeaderStyle>

<SettingsLoadingPanel ImagePosition="Top"></SettingsLoadingPanel>
                    <FooterTemplate>
                        <table class="dxflInternalEditorTable_Office2003Blue">
                            <tr>
                                <td width="50%">
                                    &nbsp;</td>
                                <td>
                                    <dx:ASPxButton ID="SendToteam" runat="server" AutoPostBack="False" Text="Send" 
                                        Theme="Office2010Silver" Width="100%">
                                        <ClientSideEvents Click="function(s, e) { 

if((ASPxClientEdit.ValidateEditorsInContainer(null) == true) &amp;&amp; (ScheduleProblemsGrid.cpRowCount != 0))
{

	if (ToTeam.GetIsValid())
	{
  	callbackinitiate.PerformCallback(ToTeam.GetSelectedItem().value);
	}
}                                        
else
{
   e.processOnServer = false;
   alert('Please, check required fields and add at least one ticket.');
}
}



" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </FooterTemplate>
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                            <dx:ASPxRadioButtonList ID="ASPxRadioButtonListToTeam" runat="server" 
                                ClientInstanceName="ToTeam" EnableClientSideAPI="True" ItemSpacing="5px" 
                                RepeatColumns="1" TextField="To_Team" Theme="Office2010Silver" 
                                ValueField="Hidden_To_Team_ID" Width="100%">
                                <ValidationSettings Display="None">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxRadioButtonList>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
            </td>
            <td style="border-left-width: 0px; padding-left: 0px; margin-left: 0px;">
                <span class="style20"></span>
            </td>
        </tr>
    </table>
    <table class="dxflInternalEditorTable_Office2003Blue">
        <tr>
            <td 
                width="100">
                &nbsp;</td>
            <td style="text-align: right;" colspan="5">
                <dx:ASPxImage ID="ASPxImage5" runat="server" ImageUrl="~/Images/schedule.png" 
                    ToolTip="Schedule" Width="34px">
                </dx:ASPxImage>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #CCCCCC; padding-top: 10px; padding-bottom: 4px;" 
                width="100">
                Schedule Date:</td>
            <td colspan="5" 
                
                style="border-bottom-style: solid; border-right-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #CCCCCC; border-bottom-color: #CCCCCC; padding-top: 10px; padding-bottom: 4px;">
                <dx:ASPxDateEdit ID="ASPxDateEditScheduleDate" runat="server" 
                    DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" 
                    EditFormatString="dd/MM/yyyy" Theme="PlasticBlue" 
                    Width="200px">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #CCCCCC; padding-top: 10px; padding-bottom: 4px;" 
                width="100">
                Schedule For:</td>
            <td style="border-bottom-style: solid; border-right-style: none; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #CCCCCC; border-bottom-color: #CCCCCC; padding-top: 10px; padding-bottom: 4px;" 
                width="220">
                <dx:ASPxComboBox ID="ASPxComboBoxToTeam" runat="server" ClientIDMode="AutoID" 
                    ClientInstanceName="toteamcombo" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                    CssPostfix="Aqua" EnableCallbackMode="True" EnableClientSideAPI="True" 
                    EnableTheming="True" LoadingPanelImagePosition="Top" ShowShadow="False" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Theme="PlasticBlue" 
                    Width="200px">
                    <ClientSideEvents EndCallback="function(s, e) {
	
toengineercombo.PerformCallback(toteamcombo.GetValue().toString());
toengineercombo2.PerformCallback(toteamcombo.GetValue().toString());
}" SelectedIndexChanged="function(s, e) 
{
toengineercombo.PerformCallback(toteamcombo.GetValue().toString());
toengineercombo2.PerformCallback(toteamcombo.GetValue().toString());
}" />

<SettingsLoadingPanel ImagePosition="Top"></SettingsLoadingPanel>

                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <DropDownButton>
                        <Image>
                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
                                PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                        </Image>
                    </DropDownButton>
                    <ValidationSettings Display="Dynamic">
                        <RequiredField IsRequired="True" />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
            <td style="border-right: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-bottom-style: solid; border-right-style: none; padding-top: 10px; padding-bottom: 4px; text-align: right;" 
                width="100">
                Engineer 1:</td>
            <td style="border-bottom-style: solid; border-right-style: none; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #CCCCCC; border-bottom-color: #CCCCCC; padding-top: 10px; padding-bottom: 4px;" 
                width="220px">
                <dx:ASPxComboBox ID="ASPxComboBoxToEngineer" runat="server" 
                    ClientIDMode="AutoID" ClientInstanceName="toengineercombo" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    EnableCallbackMode="True" EnableClientSideAPI="True" 
                    LoadingPanelImagePosition="Top" OnCallback="ASPxComboBoxToEngineer_Callback" 
                    ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                    Theme="PlasticBlue" Width="200px">
                    <ClientSideEvents SelectedIndexChanged="function(s, e) 
                        {
                        
                        var value = fromteamcombo.GetValue().toString();
                    	/*toteamcombo.PerformCallback(value);*/
	                    /*SystemGroupComboBox.PerformCallback(value);*/
}" />

<SettingsLoadingPanel ImagePosition="Top"></SettingsLoadingPanel>

                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <DropDownButton>
                        <Image>
                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
                                PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                        </Image>
                    </DropDownButton>
                    <ValidationSettings Display="Dynamic">
                        <RequiredField IsRequired="True" />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
            <td style="border-right: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-bottom-style: solid; border-right-style: none; padding-top: 10px; padding-bottom: 4px; text-align: right;" 
                width="100">
                Engineer 2:</td>
            <td style="border-right: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; padding-top: 10px; padding-bottom: 4px; text-align: left;">
                <dx:ASPxComboBox ID="ASPxComboBoxToEngineer2" runat="server" 
                    ClientIDMode="AutoID" ClientInstanceName="toengineercombo2" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    EnableCallbackMode="True" EnableClientSideAPI="True" 
                    LoadingPanelImagePosition="Top" OnCallback="ASPxComboBoxToEngineer2_Callback" 
                    ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                    Theme="PlasticBlue" Width="200px">
                    <ClientSideEvents EndCallback="function(s, e) {
	s.SetSelectedIndex(-1);
}" SelectedIndexChanged="function(s, e) 
                        {
                        
                        var value = fromteamcombo.GetValue().toString();
                    	/*toteamcombo.PerformCallback(value);*/
	                    /*SystemGroupComboBox.PerformCallback(value);*/
}" />

<SettingsLoadingPanel ImagePosition="Top"></SettingsLoadingPanel>

                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <DropDownButton>
                        <Image>
                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
                                PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                        </Image>
                    </DropDownButton>
                    <ValidationSettings Display="Dynamic">
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
        </tr>
    </table>
    <br />
    <table class="dxflInternalEditorTable_Metropolis">
        <tr>
            <td class="style34" colspan="2" style="padding-bottom: 6px">
                <dx:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/Images/issue.png" 
                    ToolTip="Issues">
                </dx:ASPxImage>
            </td>
        </tr>
        <tr>
            <td valign="top" width="100">
                <dx:ASPxMenu ID="ASPxMenu3" runat="server" EnableTheming="True" 
                    ItemImagePosition="Right" Theme="Metropolis" Width="100%">
                    <ClientSideEvents ItemClick="function(s, e) {
                    //popup.PerformCallback();
}" />
                    <Items>
                        <dx:MenuItem Name="AddTicket" Text="Add Ticket">
                            <Image Height="10px" Url="~/Images/add.png">
                            </Image>
                        </dx:MenuItem>
                    </Items>
                    <Border BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                </dx:ASPxMenu>
            </td>
            <td valign="top">
                <dx:ASPxGridView ID="ASPxGridViewScheduleProblems" runat="server" 
                    AutoGenerateColumns="False" ClientInstanceName="ScheduleProblemsGrid" 
                    CssFilePath="~/App_Themes/Office2003Olive/{0}/styles.css" 
                    CssPostfix="Office2003Olive" EnableTheming="True" Font-Size="Small" 
                    KeyFieldName="TT_Id" 
                    OnCustomJSProperties="ASPxGridViewScheduleProblems_CustomJSProperties" 
                    OnRowDeleting="ASPxGridViewScheduleProblems_RowDeleting" 
                    OnRowValidating="ASPxGridViewScheduleProblems_RowValidating" 
                    style="font-size: 8pt" Theme="Office2003Blue" Width="95%" 
                    OnCustomCallback="ASPxGridViewScheduleProblems_CustomCallback">
                    <Columns>
                        <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ShowDeleteButton="True"/>
                        <dx:GridViewDataTextColumn Caption="TT Id" FieldName="TT_Id" Name="TT_Id" 
                            ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="SRI" FieldName="SRI" Name="SRI" 
                            ShowInCustomizationForm="True" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Priority" FieldName="Priority" 
                            Name="Priority" ShowInCustomizationForm="True" VisibleIndex="4">
                            <PropertiesTextEdit ClientInstanceName="SeverityText" 
                                EnableClientSideAPI="True">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Event" FieldName="Event" Name="Event" 
                            ShowInCustomizationForm="True" VisibleIndex="5">
                            <PropertiesTextEdit DisplayFormatInEditMode="True" 
                                DisplayFormatString="dd/MM/yyyy HH:mm">
                                <MaskSettings Mask="dd/MM/yyyy HH:mm" />
                                <ValidationSettings CausesValidation="True" Display="Dynamic">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Location" FieldName="Location" 
                            Name="Location" ShowInCustomizationForm="True" VisibleIndex="3">
                            <PropertiesTextEdit DisplayFormatInEditMode="True" 
                                DisplayFormatString="dd/MM/yyyy HH:mm">
                                <MaskSettings Mask="dd/MM/yyyy HH:mm" />
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior ColumnResizeMode="Control" ConfirmDelete="True" />
                    <SettingsPager Visible="False">
                    </SettingsPager>
                    <SettingsEditing Mode="Inline" />
                    <Styles CssFilePath="~/App_Themes/Office2003Olive/{0}/styles.css" 
                        CssPostfix="Office2003Olive">
                        <Header Font-Size="8pt" ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <Cell Font-Size="8pt">
                        </Cell>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                        <CommandColumnItem>
                            <Paddings PaddingLeft="3px" />
                        </CommandColumnItem>
                    </Styles>
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <SettingsCommandButton>
                        <DeleteButton Text="Delete">
                            <Image Height="10px" Url="~/Images/Delete.png">
                            </Image>
                        </DeleteButton>
                        <CancelButton Text="Cancel">
                            <Image Height="18px" Url="~/Images/Cancel.png">
                            </Image>
                        </CancelButton>
                        <UpdateButton Text="Save">
                            <Image Height="18px" Url="~/Images/Save.png">
                            </Image>
                        </UpdateButton>
                    </SettingsCommandButton>
                </dx:ASPxGridView>
            </td>
        </tr>
        <tr>
            <td valign="top" width="100">
                </span></td>
            <td valign="top">
                <dx:ASPxPopupControl ID="PopupControl" runat="server" AllowDragging="True" 
                    AllowResize="True" PopupElementID="ASPxMenu3" AppearAfter="0" ClientInstanceName="popup" 
                    EnableClientSideAPI="True" HeaderText="Please choose:" 
                    Theme="Aqua" Width="1000px" CloseAction="CloseButton" 
                    ShowSizeGrip="True" 
                    OnWindowCallback="PopupControl_WindowCallback" LoadingPanelDelay="0" 
                    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
                    Modal="True" CssClass="style20" Height="500px" ResizingMode="Postponed" 
                    ShowMaximizeButton="True">
                    <ClientSideEvents Shown="function(s, e) {
	s.PerformCallback();

}" AfterResizing="function(s, e) {
	ticketsgrid.AdjustControl();
	var height = Math.max(0, s.GetHeight());
    ticketsgrid.SetHeight(height);
}" EndCallback="function(s, e) {
	var height = Math.max(0, s.GetHeight());
    ticketsgrid.SetHeight(height);
}" />
                    <HeaderStyle Font-Size="Small" />

<SettingsLoadingPanel Delay="0"></SettingsLoadingPanel>
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True" Width="100%">
                        <table width="100%">
                        <tr>
                            <td>
                                <table class="dxflInternalEditorTable_Office2010Silver">
                                    <tr>
                                        <td width="100%">
                                            <dx:ASPxMenu ID="ASPxMenu4" runat="server" BackColor="White" 
                                                EnableTheming="True" ItemAutoWidth="False" Theme="Metropolis" Width="100%">
                                                <ClientSideEvents ItemClick="function(s, e) {
	              ScheduleProblemsGrid.PerformCallback(ticketsgrid.GetSelectedKeysOnPage());
                  popup.Hide();
}" />
                                                <Items>
                                                    <dx:MenuItem Name="AddTick" Text="Add Tickets to Schedule">
                                                        <Image Height="12px" Url="~/Images/add.png">
                                                        </Image>
                                                    </dx:MenuItem>
                                                </Items>
                                            </dx:ASPxMenu>
                                        </td>
                                        <td>
                                            <dx:ASPxMenu ID="ASPxMenu5" runat="server" BackColor="White" 
                                                EnableTheming="True" ItemAutoWidth="False" Theme="Metropolis" Width="100%">
                                                <ClientSideEvents ItemClick="function(s, e) {
ticketsgrid.Refresh();
}" />
                                                <Items>
                                                    <dx:MenuItem Name="Refresh" Text="Refresh">
                                                        <Image Height="12px" Url="~/Images/refresh.png">
                                                        </Image>
                                                    </dx:MenuItem>
                                                </Items>
                                            </dx:ASPxMenu>
                                        </td>
                                    </tr>
                                </table>
                                <dx:ASPxGridView ID="ASPxGridViewTickets" runat="server" 
                                AutoGenerateColumns="False" Width="100%" KeyFieldName="TT_Id" 
                                    ClientInstanceName="ticketsgrid" EnableTheming="True" style="font-size: 8pt" 
                                    Theme="Metropolis" >
                                <Columns>
                                    <dx:GridViewCommandColumn ShowInCustomizationForm="False" ShowSelectCheckbox="True" VisibleIndex="0" Width="50px" Caption=" " ShowClearFilterButton="True"/>
                                    <dx:GridViewDataTextColumn Caption="SRI" FieldName="SRI" Name="SRI" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TT ID" FieldName="TT_Id" Name="TT_Id" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="100px">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Location" FieldName="Location" 
                                        Name="Location" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Event" FieldName="Event" Name="Event" 
                                        ShowInCustomizationForm="True" VisibleIndex="7">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Priority" FieldName="Priority" 
                                        Name="Priority" ShowInCustomizationForm="True" VisibleIndex="6" 
                                        Width="100px">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Caption="Date" FieldName="TDate" Name="TDate" 
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="110px">
                                        <PropertiesDateEdit DisplayFormatString="dd/MM/yy HH:mm">
                                        </PropertiesDateEdit>
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Caption="From" FieldName="Source" Name="Source" 
                                        ShowInCustomizationForm="True" VisibleIndex="8" Width="80px">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataCheckColumn Caption="Scheduled Once?" FieldName="Scheduled" 
                                        Name="Scheduled" ShowInCustomizationForm="True" VisibleIndex="10" 
                                        Width="70px">
                                    </dx:GridViewDataCheckColumn>
                                    <dx:GridViewDataTextColumn Caption="Region" FieldName="Region" Name="Region" 
                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="80px">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" ColumnResizeMode="NextColumn" />
                                    <SettingsPager PageSize="20" AlwaysShowPager="True">
                                    </SettingsPager>
                                <SettingsEditing Mode="Inline" />
                                <Settings ShowFilterRow="True" VerticalScrollBarMode="Visible" 
                                        ShowHeaderFilterButton="True" ShowFilterRowMenu="True" />
                                    <SettingsCookies Version="7" />
                                    <Styles>
                                        <Header BackColor="#ECFFE6" Wrap="True">
                                        </Header>
                                    </Styles>
                                </dx:ASPxGridView>
                            </td>
                        </tr>
                        <tr>
                        <td>
                            &nbsp;</td>
                        </tr>
                        </table>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
            </td>
        </tr>
    </table>
    <br class="style20" />
    <table class="dxflInternalEditorTable_Office2003Olive" width="100%">
        <tr>
            <td style="text-align: right; padding-bottom: 4px; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #CCCCCC; padding-top: 4px;" 
                width="100" valign="top">
                <span class="style36">Comments</span><span class="style20">:</span></td>
            <td style="padding-bottom: 4px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #CCCCCC; border-bottom-color: #CCCCCC">
                <dx:ASPxMemo ID="ASPxMemoComments" runat="server" ClientIDMode="AutoID" 
                    CssClass="style20" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                    CssPostfix="Aqua" HorizontalAlign="Left" NullText="Free Text (max 2000)" 
                    Rows="3" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="95%" 
                    Font-Size="8pt">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxMemo>
            </td>
        </tr>
    </table>
    <br />
    <table class="dxflInternalEditorTable_Office2003Olive" width="100%">
        <tr>
            <td colspan="4"  style="text-align: right" >
                <dx:ASPxImage ID="ASPxImage4" runat="server" Height="32px" 
                    ImageUrl="~/Images/paperclip.png" ToolTip="Attachments">
                </dx:ASPxImage>
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="4" >
                <dx:ASPxGridView ID="ASPxGridViewAttachments" runat="server" align="right" 
                    AutoGenerateColumns="False" ClientInstanceName="gridviewattachments" 
                    ClientVisible="False" CssClass="style20" KeyFieldName="Hidden_attacment_id" 
                    OnCustomJSProperties="ASPxGridViewAttachments_CustomJSProperties" 
                    OnRowDeleting="ASPxGridViewAttachments_RowDeleting" Width="260px">
                    <Columns>
                        <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px" ShowDeleteButton="True">
                            <CellStyle BackColor="#F4F4F4">
                                <BorderRight BorderStyle="None"/>
                            </CellStyle>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="Uploaded by" FieldName="Uploaded_by" 
                            Name="Uploaded_by" ShowInCustomizationForm="True" Visible="False" 
                            VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Uploaded on" FieldName="Uploaded_on" 
                            Name="Uploaded_on" ShowInCustomizationForm="True" Visible="False" 
                            VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Filename" FieldName="Filename" 
                            Name="Filename" ShowInCustomizationForm="True" VisibleIndex="3" Width="160px">
                            <PropertiesTextEdit DisplayFormatString="{0}" EnableClientSideAPI="True">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#F4F4F4" />
                            <CellStyle BackColor="#F4F4F4" Font-Size="8pt" ForeColor="Black" 
                                HorizontalAlign="Right">
                                <BorderLeft BorderStyle="None" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Hidden_attacment_id" 
                            FieldName="Hidden_attacment_id" Name="Hidden_attacment_id" ReadOnly="True" 
                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" AllowGroup="False" 
                        AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" AllowSort="False" 
                        ConfirmDelete="True" />
                    <SettingsPager Mode="ShowAllRecords" PageSize="1">
                    </SettingsPager>
                    <Settings ShowColumnHeaders="False" ShowGroupButtons="False" 
                        ShowHeaderFilterBlankItems="False" ShowStatusBar="Hidden" />
                    <SettingsText EmptyDataRow=" " />
                    <Styles>
                        <Table BackColor="#F4F4F4">
                        </Table>
                        <FocusedRow Font-Italic="True" Font-Underline="True" ForeColor="Black">
                        </FocusedRow>
                        <Cell BackColor="#F4F4F4" Font-Size="8pt">
                        </Cell>
                    </Styles>
                    <Border BorderStyle="None" />
                    <SettingsCommandButton>
                        <DeleteButton Text="Delete">
                            <Image Height="10px" Url="~/Images/Delete.png">
                            </Image>
                        </DeleteButton>
                    </SettingsCommandButton>
                </dx:ASPxGridView>
            </td>
        </tr>
        <tr>
            <td class="style37">
            </td>
            <td class="style37" width="100">
                <span class="style20"></span></td>
            <td class="style37" width="100">
                <dx:ASPxButton ID="ASPxButtonCancelAttachment" runat="server" align="right" 
                    AutoPostBack="False" BackColor="#F4F4F4" CausesValidation="False" 
                    ClientIDMode="AutoID" ClientInstanceName="canceladdattachment" Cursor="pointer" 
                    EnableClientSideAPI="True" EnableDefaultAppearance="False" 
                    EnableTheming="True" Font-Italic="True" Font-Size="9pt" ForeColor="#993333" 
                    Height="15px" HorizontalAlign="Center" Text="Cancel" Width="100px" Theme="Metropolis">
                    <ClientSideEvents Click="function(s, e) {
	addattachment.SetEnabled(true);
	uploadcontrol.SetVisible(false);
    s.SetVisible(false);
}" Init="function(s, e) {
	s.SetVisible(false);
}" />
                    <Border BorderColor="#F4F4F4" />
                    <DisabledStyle BackColor="#F4F4F4">
                    </DisabledStyle>
                </dx:ASPxButton>
            </td>
            <td class="style37" width="100">
                <dx:ASPxButton ID="ASPxButtonAddAtachment" runat="server" align="right" 
                    AutoPostBack="False" BackColor="#F4F4F4" CausesValidation="False" 
                    ClientIDMode="AutoID" ClientInstanceName="addattachment" Cursor="pointer" 
                    EnableClientSideAPI="True" EnableDefaultAppearance="False" 
                    EnableTheming="True" Font-Italic="True" Font-Size="9pt" ForeColor="#3366CC" 
                    HorizontalAlign="Right" Text="Add Attachment" Width="100px" Theme="Metropolis">
                    <ClientSideEvents Click="function(s, e) {
	uploadcontrol.SetVisible(true);
	s.SetEnabled(false);
    canceladdattachment.SetVisible(true);

}" />
                    <Border BorderColor="#F4F4F4" />
                </dx:ASPxButton>
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" 
                    AddUploadButtonsHorizontalPosition="Right" align="right" 
                    CancelButtonHorizontalPosition="Right" ClientIDMode="AutoID" 
                    ClientInstanceName="uploadcontrol" 
                    OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" 
                    ShowProgressPanel="True" ShowUploadButton="True" Theme="Office2010Blue" 
                    CssClass="style20">
                    <ValidationSettings AllowedFileExtensions=".jpg, .xls, .jpeg, .bmp, .tif, .tiff, .pdf, .txt, .doc">
                    </ValidationSettings>
                    <ClientSideEvents FileUploadComplete="function(s, e) {
    if (e.isValid)
    {
	    addattachment.SetEnabled(true);
	    canceladdattachment.SetVisible(false);
	    s.SetVisible(false);
        gridviewattachments.Refresh();
    }
}" FileUploadStart="function(s, e) {
        gridviewattachments.SetVisible(true);
}" Init="function(s, e) {
	s.SetVisible(false);
}" />
                    <UploadButton Text="   Upload">
                        <Image Height="16px" Url="~/Images/Upload.png" Width="16px">
                        </Image>
                    </UploadButton>
                </dx:ASPxUploadControl>
            </td>
        </tr>
    </table>
    <dx:ASPxCallback ID="ASPxCallbackInitiate" runat="server" 
        ClientInstanceName="callbackinitiate" 
        OnCallback="ASPxCallbackInitiate_Callback">
    </dx:ASPxCallback>
    <br class="style20" />
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>

    </div>


    </form>
</body>
</html>

