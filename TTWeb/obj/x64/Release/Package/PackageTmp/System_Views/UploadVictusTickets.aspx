<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadVictusTickets.aspx.cs" Inherits="TTWeb.UploadVictusTickets" %>

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
            font-size: 8pt;
        }
        .style3
        {
            width: 167px;
            text-align: center;
        }
        .style5
        {
            color: #003300;
            font-size: 12pt;
        }
        .style6
        {
            color: #CC0000;
            font-size: 12pt;
        }
        .dxtcRightAlignCell_SoftOrange,
.dxtcTabsCellWithTabPositionBottom_SoftOrange .dxtcRightAlignCell_SoftOrange 
{
	text-align: right;
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
        .style8
        {
            color: #CC3300;
            font-size: 9pt;
        }
        .style12
        {
            width: 156px;
            text-align: center;
        }
        .style13
        {
            font-size: 12pt;
        }
        .style14
        {
            color: #CC3300;
            font-size: 8pt;
        }
        </style>
</head>
<body>
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <script language="javascript" type="text/javascript">
    function OnGetSelectedFieldValues(selectedValues) {
        for (var i = 0; i < 36; i++) {
            var editor = ASPxGridViewUploadVictusTickets.GetEditor(i + 1);
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
</script>

    <form id="form1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" 
            CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="Upload VictusTickets" 
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
                        <td width="50%" valign="middle" align="left" style="width: 50%">Upload Victus Trouble Tickets </td>
                        <td align="left" style="width: 50%" valign="middle" width="50%">
                            <dx:ASPxMenu ID="ASPxMenu3" runat="server" 
                                HorizontalAlign="Right" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%">
                                <ClientSideEvents ItemClick="function(s, e) {
		window.pagegrid.Refresh();
}" />
                                <Items>
                                    <dx:MenuItem Name="Refresh" Text="Refresh">
                                        <Image Height="12px" Url="~/Images/refresh.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
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
                        <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px; width: 0%;" 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenuAttachment" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%" ClientInstanceName="menuAttachment" SeparatorWidth="0px" 
                                BackColor="White">
                                <ClientSideEvents ItemClick="function(s, e) {
	                                if(e.item.name == &quot;UploadFile&quot;) 	                                                        
	                                {
	                                uploadcontrol.SetVisible(true);
									menuAttachment.GetItemByName('CancelUploadFile').SetEnabled(true);
	                                menuAttachment.GetItemByName('UploadFile').SetEnabled(false);
	                                
                                    }

	                                if(e.item.name == &quot;CancelUploadFile&quot;) 
	                                {
	                                menuAttachment.GetItemByName('UploadFile').SetEnabled(true);
	                                uploadcontrol.SetVisible(false);
	                                menuAttachment.GetItemByName('CancelUploadFile').SetEnabled(false);
	                                }
                                }" />
                                <Items>
                                    <dx:MenuItem Name="UploadFile" Text="Upload New File ">
                                        <Image AlternateText="New" Height="12px" Url="~/Images/Add.png">
                                        </Image>
                                    </dx:MenuItem>
                                    <dx:MenuItem Name="CancelUploadFile" Text="Cancel Upload" ClientEnabled="False">
                                        <Image Height="12px" Url="~/Images/Cancel.png">
                                        </Image>
                                    </dx:MenuItem>
                                </Items>
                                <ItemStyle>
                                <Paddings PaddingRight="0px" />
                                </ItemStyle>
                                <BorderRight BorderWidth="0px" />
                            </dx:ASPxMenu>
                        </td>
                        <td class="style8" 
                            style="padding-right: 0px; border-right-width: 0px; margin-right: 0px; width: 50%; text-align: right;" 
                            width="100%">
                            Pending uploaded Tickets: please correct misspelled entries to save...</td>
                    </tr>
                </table>
                <table width="100%">
                <tr>
                <td>
                <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server"                                       
                    ClientIDMode="AutoID" ClientInstanceName="uploadcontrol" 
                    OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete"                                                                 
                    ShowProgressPanel="True" ShowUploadButton="True" Width="299px"    
                    CancelButtonHorizontalPosition="Left" CancelButtonSpacing="10px" 
                    Theme="SoftOrange">
                            <ValidationSettings AllowedFileExtensions=".xls"                                        
                                MaxFileSizeErrorText="File size exceeds the maximum allowed size, which is 5M" 
                                MaxFileSize="30000000">
                            </ValidationSettings>
                            <ClientSideEvents FileUploadComplete="function(s, e) {
                if (e.isValid)
                {
                    processcallback.PerformCallback();

	                menuAttachment.GetItemByName('UploadFile').SetEnabled(true);
	                menuAttachment.GetItemByName('CancelUploadFile').SetEnabled(false);
					uploadcontrol.SetVisible(false);

					timer.SetEnabled(true);
                    popup.Show();
                }
                }" Init="function(s, e) {
	      s.SetVisible(false);
               }" />

<ClientSideEvents FileUploadComplete="function(s, e) {
                if (e.isValid)
                {
                    processcallback.PerformCallback();

	                menuAttachment.GetItemByName(&#39;UploadFile&#39;).SetEnabled(true);
	                menuAttachment.GetItemByName(&#39;CancelUploadFile&#39;).SetEnabled(false);
					uploadcontrol.SetVisible(false);

					timer.SetEnabled(true);
                    popup.Show();
                }
                }" Init="function(s, e) {
	      s.SetVisible(false);
               }"></ClientSideEvents>

                    <UploadButton>
                        <Image Height="18px" Url="~/Images/Upload.png">
                        </Image>
                    </UploadButton>
                    <CancelButton>
                        <Image Height="18px" Url="~/Images/Cancel.png">
                        </Image>
                    </CancelButton>
                    <Paddings PaddingBottom="5px" PaddingTop="5px" />

<Paddings PaddingTop="10px" PaddingBottom="5px"></Paddings>

                    <ButtonStyle ImageSpacing="5px">
                    </ButtonStyle>
                </dx:ASPxUploadControl>
                </td>
                </tr>
                </table>
                </td>
        </tr>
    </table>
                <dx:ASPxGridView runat="server" 
    ClientInstanceName="ASPxGridViewUploadVictusTicketsErrors" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    KeyFieldName="TT_Id" AutoGenerateColumns="False" Width="100%" 
    ClientIDMode="AutoID" ID="ASPxGridViewUploadVictusTicketsErrors" 
    OnRowUpdating="ASPxGridViewPendingtypes_RowUpdating" 
        Theme="Metropolis" style="font-size: 8pt">
<ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}" ></ClientSideEvents>
<Columns>
<dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" Width="50px" VisibleIndex="0" ShowEditButton="True"/>
<dx:GridViewDataTextColumn FieldName="SRI" ShowInCustomizationForm="True" 
        Name="SRI" Caption="SRI" VisibleIndex="1"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="TT_Id" ShowInCustomizationForm="True" 
        Name="TT_Id" Caption="TT Id" VisibleIndex="2"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="INC_Start_Datetime" 
        ShowInCustomizationForm="True" Name="INC_Start_Datetime" 
        Caption="INC_Start_Datetime" VisibleIndex="3" Visible="False">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="INC_End_Datetime" 
        ShowInCustomizationForm="True" Name="INC_End_Datetime" 
        Caption="INC_End_Datetime" VisibleIndex="4" Visible="False">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="TT_Creation_Datetime" 
        ShowInCustomizationForm="True" Name="TT_Creation_Datetime" 
        Caption="TT_Creation_Datetime" VisibleIndex="5" Visible="False">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Send_to_Vendor_Datetime" 
        ShowInCustomizationForm="True" Name="Send_to_Vendor_Datetime" 
        Caption="Send to Vendor on" VisibleIndex="6">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Node_Type" ShowInCustomizationForm="True" 
        Name="Node_Type" Caption="Node_Type" VisibleIndex="7" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Location" ShowInCustomizationForm="True" 
        Name="Location" Caption="Location" VisibleIndex="8"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Master_Node" ShowInCustomizationForm="True" 
        Name="Master_Node" Caption="Master_Node" VisibleIndex="9" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Priority" ShowInCustomizationForm="True" 
        Name="Priority" Caption="Priority" VisibleIndex="10"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Ticket_Type" ShowInCustomizationForm="True" 
        Name="Ticket_Type" Caption="Ticket_Type" VisibleIndex="11" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Short_Description" 
        ShowInCustomizationForm="True" Name="Short_Description" 
        Caption="Short_Description" VisibleIndex="12" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Cause_1_Level" ShowInCustomizationForm="True" 
        Name="Cause_1_Level" Caption="Cause_1_Level" VisibleIndex="13" 
        Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Cause_2_Level" ShowInCustomizationForm="True" 
        Name="Cause_2_Level" Caption="Cause_2_Level" VisibleIndex="14" 
        Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Affected_Nodes" 
        ShowInCustomizationForm="True" Name="Affected_Nodes" Caption="Affected_Nodes" 
        VisibleIndex="15" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="BSC" ShowInCustomizationForm="True" 
        Name="BSC" Caption="BSC" VisibleIndex="16" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="ISSUER" ShowInCustomizationForm="True" 
        Name="ISSUER" Caption="ISSUER" VisibleIndex="17" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Geographical_Location" 
        ShowInCustomizationForm="True" Name="Geographical_Location" 
        Caption="Geographical_Location" VisibleIndex="18" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Freeze_Flag" ShowInCustomizationForm="True" 
        Name="Freeze_Flag" Caption="Freeze" VisibleIndex="19"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Response_Freeze" 
        ShowInCustomizationForm="True" Name="Response_Freeze" Caption="Freeze Response" 
        VisibleIndex="20"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Response_Freeze_Reazons" 
        ShowInCustomizationForm="True" Name="Response_Freeze_Reazons" 
        Caption="Response_Freeze_Reazons" VisibleIndex="21" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Restore_Freeze" 
        ShowInCustomizationForm="True" Name="Restore_Freeze" Caption="Restore_Freeze" 
        VisibleIndex="22" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Restore_Freeze_Reazons" 
        ShowInCustomizationForm="True" Name="Restore_Freeze_Reazons" 
        Caption="Restore_Freeze_Reazons" VisibleIndex="23" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Status" ShowInCustomizationForm="True" 
        Name="Status" Caption="Status" VisibleIndex="24"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Current_Owner" ShowInCustomizationForm="True" 
        Name="Current_Owner" Caption="Current_Owner" VisibleIndex="25" 
        Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Cancellation_Flag" 
        ShowInCustomizationForm="True" Name="Cancellation_Flag" 
        Caption="Cancellation_Flag" VisibleIndex="26" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Cancellation_Datetime" 
        ShowInCustomizationForm="True" Name="Cancellation_Datetime" 
        Caption="Cancellation_Datetime" VisibleIndex="27" Visible="False">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Resolution_Datetime" 
        ShowInCustomizationForm="True" Name="Resolution_Datetime" 
        Caption="Resolution_Datetime" VisibleIndex="28" Visible="False">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Response_Datetime" 
        ShowInCustomizationForm="True" Name="Response_Datetime" 
        Caption="Response_Datetime" VisibleIndex="29" Visible="False">
<PropertiesTextEdit DisplayFormatInEditMode="True" 
        DisplayFormatString="dd/MM/yy HH:mm"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Kintec_Rejection_Status_Flag" 
        ShowInCustomizationForm="True" Name="Kintec_Rejection_Status_Flag" 
        Caption="Kintec Rejection" VisibleIndex="30"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Last_Kintec_Rejection_Flag" 
        ShowInCustomizationForm="True" Name="Last_Kintec_Rejection_Flag" 
        Caption="Last_Kintec_Rejection_Flag" VisibleIndex="31" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Last_VF_Rejection_Flag" 
        ShowInCustomizationForm="True" Name="Last_VF_Rejection_Flag" 
        Caption="Last_Rejection_Flag" VisibleIndex="32" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="ECO_Spare_Parts_RMA_No" 
        ShowInCustomizationForm="True" Name="ECO_Spare_Parts_RMA_No" 
        Caption="ECO_Spare_Parts_RMA_No" VisibleIndex="33" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="AssignTo" ShowInCustomizationForm="True" 
        Name="AssignTo" Caption="AssignTo" VisibleIndex="34" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Duration" ShowInCustomizationForm="True" 
        Name="Duration" Caption="Duration" VisibleIndex="35" Visible="False"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Alarm_Severity" 
        ShowInCustomizationForm="True" Name="Alarm_Severity" Caption="Alarm_Severity" 
        VisibleIndex="36" Visible="False"></dx:GridViewDataTextColumn>
</Columns>

<SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                    AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" 
                    ConfirmDelete="True"></SettingsBehavior>

<SettingsPager PageSize="20" ShowDefaultImages="False" Visible="False">
<AllButton Text="All"></AllButton>

<NextPageButton Text="Next &gt;"></NextPageButton>

<PrevPageButton Text="&lt; Prev"></PrevPageButton>

<PageSizeItemSettings Visible="True"></PageSizeItemSettings>
</SettingsPager>

                    <SettingsEditing Mode="EditForm" />

                    <SettingsText EmptyDataRow="Pending uploaded VictusTickets..." />

<SettingsCookies Version="7"></SettingsCookies>

<Styles CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css">
<Header SortingImageSpacing="10px" ImageSpacing="10px" BackColor="#0066CC" 
        ForeColor="White"></Header>

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


                                                 <table bgcolor="White" class="style1" width="100%">
                                                    <tr>
                                                       <td class="style3" width="120">
                                                            &nbsp;</td>
                                                        <td width="20%">
                                                            &nbsp;</td>
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
                                                                ForeColor="#990000" style="font-weight: 700" Text='<%# Bind("SRI") %>' 
                                                                Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3" width="120">
                                                            TT id:</td>
                                                        <td width="20%">
                                                            <dx:ASPxTextBox ID="TTId" runat="server" Font-Bold="True" Font-Size="8pt" 
                                                                ForeColor="#336699" style="font-weight: 700" Text='<%# Bind("TT_Id") %>'
                                                                Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3" width="120">
                                                            Priority:</td>
                                                        <td width="20%">
                                                            <dx:ASPxTextBox ID="Priority" runat="server" Font-Bold="True" Font-Size="8pt" 
                                                                ForeColor="#336699" style="font-weight: 700" Text='<%# Bind("Priority") %>' 
                                                                Width="100%">
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
                                                                ForeColor="#336699" Text='<%# Bind("Ticket_Type") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3" 
                                                            style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                                            Status:</td>
                                                        <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                                            <dx:ASPxTextBox ID="Status" runat="server" Font-Bold="True" Font-Size="8pt" 
                                                                ForeColor="#336699" style="font-weight: 700" Text='<%# Bind("Status") %>' 
                                                                Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3" 
                                                            style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                                            Current Owner:</td>
                                                        <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; padding-bottom: 5px;">
                                                            <dx:ASPxTextBox ID="CurrentOwner" runat="server" Font-Bold="True" 
                                                                Font-Size="8pt" ForeColor="#336699" Text='<%# Bind("Current_Owner") %>' 
                                                                Width="100%">
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
                                                        <td class="style14" valign="bottom">
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
                                                            <dx:ASPxTextBox ID="SRI32" runat="server" BackColor="#FFF4F2" Font-Size="8pt" 
                                                                NullText=" " Text='<%# Bind("INC_Start_Datetime") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td bgcolor="#FFFFF4" class="style3" width="120">
                                                            Node type:</td>
                                                        <td bgcolor="#FFFFF4" width="20%">
                                                            <dx:ASPxTextBox ID="SRI33" runat="server" BackColor="#FFFFF4" Font-Size="8pt" 
                                                                Text='<%# Bind("Node_Type") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td bgcolor="#FFFFF4" class="style3" width="120">
                                                            Short description:</td>
                                                        <td bgcolor="#FFFFF4" colspan="2" width="20%">
                                                            <dx:ASPxTextBox ID="SRI34" runat="server" BackColor="#FFFFF4" Font-Size="8pt" 
                                                                Text='<%# Bind("Short_Description") %>' Width="100%">
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
                                                            <dx:ASPxTextBox ID="SRI1" runat="server" BackColor="#FFF4F2" Font-Size="8pt" 
                                                                NullText=" " Text='<%# Bind("INC_End_Datetime") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td bgcolor="#FFFFF4" class="style3">
                                                            Location:</td>
                                                        <td bgcolor="#FFFFF4">
                                                            <dx:ASPxTextBox ID="SRI5" runat="server" BackColor="#FFFFF4" Font-Size="8pt" 
                                                                Text='<%# Bind("Location") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td bgcolor="#FFFFF4" class="style3">
                                                            Alarm severity:</td>
                                                        <td bgcolor="#FFFFF4" colspan="2">
                                                            <dx:ASPxTextBox ID="SRI37" runat="server" BackColor="#FFFFF4" Font-Size="8pt" 
                                                                Text='<%# Bind("Alarm_Severity") %>' Width="100%">
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
                                                            <dx:ASPxTextBox ID="SRI2" runat="server" BackColor="#FFF4F2" Font-Size="8pt" 
                                                                NullText=" " Text='<%# Bind("TT_Creation_Datetime") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3">
                                                            Master node:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="SRI6" runat="server" Font-Size="8pt" 
                                                                Text='<%# Bind("Master_Node") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3">
                                                            Cause 2:</td>
                                                        <td colspan="2">
                                                            <dx:ASPxTextBox ID="SRI11" runat="server" Font-Size="8pt" 
                                                                Text='<%# Bind("Cause_1_Level") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFF4F2" class="style3">
                                                            Send to vendor on:</td>
                                                        <td bgcolor="#FFF4F2">
                                                            <dx:ASPxTextBox ID="SRI35" runat="server" BackColor="#FFF4F2" Font-Bold="False" 
                                                                Font-Size="8pt" ForeColor="Blue" NullText=" " 
                                                                Text='<%# Bind("Send_to_Vendor_Datetime") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3">
                                                            Affected nodes:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="SRI36" runat="server" Font-Size="8pt" 
                                                                Text='<%# Bind("Affected_Nodes") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3">
                                                            Cause 1:</td>
                                                        <td colspan="2">
                                                            <dx:ASPxTextBox ID="SRI12" runat="server" Font-Size="8pt" 
                                                                Text='<%# Bind("Cause_2_Level") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFF4F2" class="style3">
                                                            Response on:</td>
                                                        <td bgcolor="#FFF4F2">
                                                            <dx:ASPxTextBox ID="SRI38" runat="server" BackColor="#FFF4F2" Font-Size="8pt" 
                                                                NullText=" " Text='<%# Bind("Response_Datetime") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3">
                                                            BSC:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="SRI39" runat="server" Font-Size="8pt" 
                                                                Text='<%# Bind("BSC") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3">
                                                            Spare parts No:</td>
                                                        <td colspan="2">
                                                            <dx:ASPxTextBox ID="SRI40" runat="server" Font-Size="8pt" 
                                                                Text='<%# Bind("ECO_Spare_Parts_RMA_No") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFF4F2" class="style3">
                                                            Resolution on:</td>
                                                        <td bgcolor="#FFF4F2">
                                                            <dx:ASPxTextBox ID="SRI41" runat="server" BackColor="#FFF4F2" Font-Size="8pt" 
                                                                NullText=" " Text='<%# Bind("Resolution_Datetime") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3">
                                                            Geogr. location:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="SRI42" runat="server" Font-Size="8pt" 
                                                                Text='<%# Bind("Geographical_Location") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3">
                                                            Issuer:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="SRI43" runat="server" Font-Size="8pt" 
                                                                Text='<%# Bind("ISSUER") %>' Width="100%">
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
                                                            <dx:ASPxTextBox ID="SRI15" runat="server" Font-Size="8pt" 
                                                                Text='<%# Bind("AssignTo") %>' Width="100%">
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
                                                        <td class="style14" valign="bottom">
                                                            <em>Cancelled?</em></td>
                                                        <td class="style6" valign="bottom" width="120">
                                                            &nbsp;</td>
                                                        <td class="style14" valign="bottom">
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
                                                            <dx:ASPxTextBox ID="SRI44" runat="server" BackColor="WhiteSmoke" 
                                                                Font-Bold="True" Font-Size="8pt" Text='<%# Bind("Freeze_Flag") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td bgcolor="#F8F8F8" class="style3" width="120">
                                                            <span class="style3">Cancellation flag:</span></td>
                                                        <td bgcolor="#F8F8F8">
                                                            <dx:ASPxTextBox ID="SRI45" runat="server" BackColor="WhiteSmoke" 
                                                                Font-Bold="True" Font-Size="8pt" Text='<%# Bind("Cancellation_Flag") %>' 
                                                                Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td bgcolor="#F8F8F8" class="style3" width="120">
                                                            Kintec rej. status flag:</td>
                                                        <td bgcolor="#F8F8F8">
                                                            <dx:ASPxTextBox ID="SRI46" runat="server" BackColor="WhiteSmoke" 
                                                                Font-Bold="True" Font-Size="8pt" 
                                                                Text='<%# Bind("Kintec_Rejection_Status_Flag") %>' Width="100%">
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
                                                            <dx:ASPxTextBox ID="SRI47" runat="server" BackColor="WhiteSmoke" 
                                                                Font-Size="8pt" Text='<%# Bind("Response_Freeze") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td bgcolor="#F8F8F8" class="style3">
                                                            <span class="style3">Cancellation on:</span></td>
                                                        <td bgcolor="#F8F8F8">
                                                            <dx:ASPxTextBox ID="SRI48" runat="server" BackColor="WhiteSmoke" 
                                                                Font-Size="8pt" NullText=" " Text='<%# Bind("Cancellation_Datetime") %>' 
                                                                Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td bgcolor="#F8F8F8" class="style3">
                                                            Last Kintec rej. flag:</td>
                                                        <td bgcolor="#F8F8F8">
                                                            <dx:ASPxTextBox ID="SRI49" runat="server" BackColor="WhiteSmoke" 
                                                                Font-Size="8pt" Text='<%# Bind("Last_Kintec_Rejection_Flag") %>' Width="100%">
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
                                                            <dx:ASPxTextBox ID="SRI20" runat="server" BackColor="WhiteSmoke" 
                                                                Font-Size="8pt" Text='<%# Bind("Response_Freeze_Reazons") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="style3">
                                                            <span class="style3"></span>
                                                        </td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td bgcolor="#F8F8F8" class="style3">
                                                            Last rej. flag:</td>
                                                        <td bgcolor="#F8F8F8">
                                                            <dx:ASPxTextBox ID="SRI29" runat="server" BackColor="WhiteSmoke" 
                                                                Font-Size="8pt" Text='<%# Bind("Last_VF_Rejection_Flag") %>' Width="100%">
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
                                                            <dx:ASPxTextBox ID="SRI21" runat="server" BackColor="WhiteSmoke" 
                                                                Font-Size="8pt" Text='<%# Bind("Restore_Freeze") %>' Width="100%">
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
                                                            <dx:ASPxTextBox ID="SRI22" runat="server" BackColor="WhiteSmoke" 
                                                                Font-Size="8pt" Text='<%# Bind("Restore_Freeze_Reazons") %>' Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
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
                                                        <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px;">
                                                            &nbsp;</td>
                                                        <td style="border-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-right-style: solid; border-right-width: 1px;">
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>







                           <dx:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormUpdateButton"/>
                           <dx:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormCancelButton"/>
                        </EditForm>
                    </Templates>
                    <SettingsCommandButton>
                        <EditButton Text="Edit">
                            <Image ToolTip="Edit Group" Height="10px" Url="~/Images/Edit.png">
                            </Image>
                        </EditButton>
                        <CancelButton Text="Cancel">
                            <Image ToolTip="Cancel" Height="24px" Url="~/Images/Cancel.png">
                            </Image>
                        </CancelButton>
                        <UpdateButton Text="Update">
                            <Image ToolTip="Save Group" Height="24px" Url="~/Images/Save.png">
                            </Image>
                        </UpdateButton>
                        <ClearFilterButton Text="Clear Filter">
                            <Image Height="20px" Url="~/Images/ClearFilter.png">
                            </Image>
                        </ClearFilterButton>
                    </SettingsCommandButton>
                    </dx:ASPxGridView>
                </dx:PanelContent>
        </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <dx:ASPxCallback ID="ASPxCallback1" runat="server" 
        ClientInstanceName="processcallback" oncallback="ASPxCallback1_Callback" 
        oncustomjsproperties="ASPxCallback1_CustomJSProperties">
        <ClientSideEvents CallbackComplete="function(s, e) {
        menuAttachment.SetEnabled(true);
		ASPxGridViewUploadVictusTicketsErrors.Refresh();

		timer.SetEnabled(false);
        popup.Hide();
		
		popup2.Show();
        processedrows.SetText(s.cpgoodrows);
        errorrows.SetText(s.cperrorrows);
}" />
    </dx:ASPxCallback>
    <dx:ASPxTimer ID="ASPxTimer1" runat="server" ClientInstanceName="timer" 
        Interval="1000">
        <ClientSideEvents Init="function(s, e) {
	s.SetEnabled(false);
}" Tick="function(s, e) {
	progresscallback.PerformCallback();
}" />
    </dx:ASPxTimer>
    <dx:ASPxCallback ID="ASPxCallback2" runat="server" 
        ClientInstanceName="progresscallback" 
        oncallback="ASPxCallbackProgress_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {
        progressbar.SetPosition(e.result);
}" />
    </dx:ASPxCallback>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" 
        ClientInstanceName="popup" EnableCallbackAnimation="True" 
        EnableClientSideAPI="True" HeaderText="Upload progress..." Height="80px" 
        Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" 
        PopupVerticalAlign="WindowCenter" ShowCloseButton="False" Theme="SoftOrange" 
        Width="300px" CloseAction="CloseButton">
        <HeaderStyle Font-Size="Small" />
        <ContentCollection>
<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
    <dx:ASPxProgressBar ID="ASPxProgressBar1" runat="server" 
        ClientInstanceName="progressbar" CustomDisplayFormat="" Height="50px" 
        Theme="SoftOrange" Width="100%">
    </dx:ASPxProgressBar>
            </dx:PopupControlContentControl>
</ContentCollection>
    </dx:ASPxPopupControl>
    <br />
    <dx:ASPxPopupControl ID="ASPxPopupControl2" runat="server" 
        ClientInstanceName="popup2" EnableCallbackAnimation="True" 
        EnableClientSideAPI="True" HeaderText="Upload status" Height="100px" 
        Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" 
        PopupVerticalAlign="WindowCenter" Theme="SoftOrange" 
        Width="300px" CloseAction="CloseButton">
        <HeaderStyle Font-Size="Small" />
        <ContentCollection>
<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
    <table class="dxflInternalEditorTable_Aqua">
        <tr>
            <td class="style12" width="20%" rowspan="2">
                <dx:ASPxImage ID="ASPxImage7" runat="server" Height="30px" 
                    ImageUrl="~/Images/finish.png" style="text-align: center">
                </dx:ASPxImage>
            </td>
            <td width="40%">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" CssClass="style5" 
                    Text="Rows Inserted" Font-Size="8pt">
                </dx:ASPxLabel>
                <font size="3">:</font></td>
            <td width="30%" style="padding-top: 4px">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" ClientInstanceName="processedrows" 
                    style="color: #003300; " Text="0" CssClass="style13" Font-Bold="True" 
                    Font-Size="8pt">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" CssClass="style6" 
                    Text="Rows Pending" Font-Size="8pt">
                </dx:ASPxLabel>
                <font size="3">:</font></td>
            <td style="padding-top: 4px">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" ClientInstanceName="errorrows" 
                    style="color: #CC0000; " Text="0" CssClass="style13" Font-Bold="True" 
                    Font-Size="8pt">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
            </dx:PopupControlContentControl>
</ContentCollection>
    </dx:ASPxPopupControl>
    </form>
</body>
</html>
