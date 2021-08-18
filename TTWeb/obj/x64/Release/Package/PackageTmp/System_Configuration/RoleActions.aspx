﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleActions.aspx.cs" Inherits="TTWeb.RoleActions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>











<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>






<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            color: #CC3300;
        }
        .style4
        {
            color: #CC3300;
            font-size: 7pt;
        }
        .style5
        {
            color: #993300;
        }
        .imagePreviewCell
        {
            text-align: left;
        }
        .cr-htmlattributevalue
        {
            color: #999999;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
        CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" CssPostfix="Office2010Blue" 
        GroupBoxCaptionOffsetY="-19px" 
        SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" 
        Width="100%" ClientInstanceName="ASPxRoundPanel" HeaderText="Role Actions" 
        EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px" 
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
                        <td width="50%" valign="middle" align="left">Available Actions per Role (Menu Configuration)
                        </td>
                        <td width="50%" valign="middle" align="right">

                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True" >
            <div id="RoundPanelDiv" style="height: 100%; ">
                <table class="style1">
                    <tr>
                        <td>


<table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px;" 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenu1" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%">
                                <ClientSideEvents ItemClick="function(s, e) {
	ASPxGridViewRoleActions.AddNewRow()

		
}" />
                                <Items>
                                    <dx:MenuItem Name="NewAction" Text="New Action">
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

                            <dx:ASPxGridView ID="ASPxGridViewRoleActions" runat="server" 
                                ClientIDMode="AutoID" ClientInstanceName="ASPxGridViewRoleActions" 
                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                                CssPostfix="PlasticBlue" Width="100%" AutoGenerateColumns="False" 
                                KeyFieldName="Hidden_ID" OnRowInserting="ASPxGridViewRoleActions_RowInserting" 
                                OnRowUpdating="ASPxGridViewRoleActions_RowUpdating" 
                                OnHtmlRowCreated="ASPxGridViewRoleActions_HtmlRowCreated" 
                                OnCustomJSProperties="ASPxGridViewRoleActions_CustomJSProperties" 
                                OnRowDeleting="ASPxGridViewRoleActions_RowDeleting" 
                                OnHtmlRowPrepared="ASPxGridViewRoleActions_HtmlRowPrepared" 
                                ViewStateMode="Enabled" 
                                
                                OnCommandButtonInitialize="ASPxGridViewRoleActions_CommandButtonInitialize" 
                                OnStartRowEditing="ASPxGridViewRoleActions_StartRowEditing" 
                                Theme="Metropolis">
                                <ClientSideEvents EndCallback="function(s, e) {
	                                                            if (s.cpOperation !='nop')
                                                                {
                                                                    var frames = top.frames;
                                                                    var content = window.frames['_content'];
                                                                    var navbarcontrol = document.getElementById('ctl00$ContentPlaceHolder1$ASPxSplitter1$ASPxNavBarMain');
                                                                }
                                                            }" Init="function(s, e) {
	window.pagegrid = s;
}"/>


                    <Styles>
                        <Header SortingImageSpacing="10px" ImageSpacing="10px" BackColor="#0066CC" 
                            ForeColor="White"></Header>
                        <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                        <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX"></BackgroundImage>
                        </FocusedRow>

                        <CommandColumnItem>
                            <Paddings PaddingLeft="3px"/>
                        </CommandColumnItem>
                    </Styles>
                    <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="50px" ButtonType="Image" ShowEditButton="True" ShowDeleteButton="True" ShowClearFilterButton="True"/>            
                                    <dx:GridViewDataTextColumn Caption="Role" FieldName="Role" Name="Role" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Level Number" FieldName="Level_number" 
                                        Name="Level_number" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Level Name" FieldName="Level_name" 
                                        Name="Level_name" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Action Number" FieldName="Action_number" 
                                        Name="Action_number" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Action" FieldName="Action" Name="Action" 
                                        ShowInCustomizationForm="True" VisibleIndex="5">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Url" FieldName="URL" Name="Url" 
                                        ShowInCustomizationForm="True" VisibleIndex="6">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataCheckColumn Caption="Persistent Action" 
                                        FieldName="Persistent_Action" Name="Persistent_Action" 
                                        ShowInCustomizationForm="True" VisibleIndex="7">
                                        <PropertiesCheckEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesCheckEdit>
                                    </dx:GridViewDataCheckColumn>
                                    <dx:GridViewDataBinaryImageColumn Caption="Image" FieldName="Icon" 
                                Name="Icon" ShowInCustomizationForm="True" VisibleIndex="8">
                                        <PropertiesBinaryImage ImageHeight="14px" ImageWidth="14px">
                                            <EmptyImage Height="12px" Url="~/Images/MissingImage.png" Width="12px">
                                            </EmptyImage>
                                        </PropertiesBinaryImage>
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                            </dx:GridViewDataBinaryImageColumn>
                                    <dx:GridViewDataTextColumn Caption="Hidden_Role_id" FieldName="Hidden_Role_id" 
                                        Name="Hidden_Role_id" ShowInCustomizationForm="True" Visible="False" 
                                        VisibleIndex="9">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
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
                                <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterRowMenu="True" 
                                    ShowGroupedColumns="True" />
                                <SettingsCookies Enabled="True" Version="6" />
                                <StylesEditors>
                                    <CalendarHeader Spacing="11px">
                                    </CalendarHeader>
                                    <ProgressBar Height="25px">
                                    </ProgressBar>
                                </StylesEditors>
                                <Templates>
                                    <EditForm>
                                        <table class="style2" bgcolor="White" 
                                            style="border-top-style: solid; border-right-style: solid; border-width: 2px 3px 2px 2px; border-color: #000080">
                                            <tr>
                                                <td class="dxtcRightAlignCell_Office2003Blue" width="120">
                                                    <span class="style3">*</span> Role:</td>
                                                <td style="border-right-style: solid; border-bottom-style: solid; border-width: 1px; border-color: #C0C0C0; padding-bottom: 5px; padding-top: 10px;" 
                                                    width="250px" colspan="6">
                                                    <dx:ASPxComboBox ID="ASPxComboBoxRoles" runat="server" ClientIDMode="AutoID" 
                                                        CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003Blue" 
                                                        SpriteCssFilePath="~/App_Themes/Office2003Blue/{0}/sprite.css" 
                                                        ViewStateMode="Enabled" Width="100%" Text='<%# Bind("Role") %>'>
                                                        <LoadingPanelImage Url="~/App_Themes/Office2003Blue/Web/Loading.gif">
                                                        </LoadingPanelImage>
                                                        <ButtonStyle Width="13px">
                                                        </ButtonStyle>
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td width="100">
                                                    &nbsp;</td>
                                                <td style="text-align: center; width: 300px;">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="dxtcRightAlignCell_Office2003Blue">
                                                    <span class="style3">* </span>Level Name:</td>
                                                <td style="border-bottom-style: solid; border-width: 1px; border-color: #C0C0C0; padding-bottom: 5px; padding-top: 5px;" 
                                                    colspan="6">
                                                    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" ClientIDMode="AutoID" 
                                                        CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003Blue" 
                                                        SpriteCssFilePath="~/App_Themes/Office2003Blue/{0}/sprite.css" 
                                                        Text='<%# Bind("Level_name") %>' Width="400px">
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td class="dxtcRightAlignCell_Office2003Blue" 
                                                    style="border-bottom-style: solid; border-width: 1px; border-color: #C0C0C0; padding-bottom: 3px;">
                                                    <span class="style3">* </span>Level Number:</td>
                                                <td style="border-right-style: solid; border-bottom-style: solid; border-width: 1px; border-color: #C0C0C0; padding-bottom: 5px; padding-top: 5px;">
                                                    <dx:ASPxSpinEdit ID="ASPxSpinEdit1" runat="server" AllowNull="False" 
                                                        ClientIDMode="AutoID" CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003Blue" Height="21px" MaxValue="1000" Number="0" 
                                                        NumberType="Integer" 
                                                        SpriteCssFilePath="~/App_Themes/Office2003Blue/{0}/sprite.css" 
                                                        Value='<%# Bind("Level_number") %>' Width="60px">
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxSpinEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="dxtcRightAlignCell_Office2003Blue">
                                                    <span class="style3">* </span>Action Name:</td>
                                                <td style="border-bottom-style: solid; border-width: 1px; border-color: #C0C0C0; padding-bottom: 3px;" 
                                                    colspan="6">
                                                    <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" ClientIDMode="AutoID" 
                                                        CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003Blue" 
                                                        SpriteCssFilePath="~/App_Themes/Office2003Blue/{0}/sprite.css" 
                                                        Text='<%# Bind("Action") %>' Width="400px">
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td class="dxtcRightAlignCell_Office2003Blue" 
                                                    style="border-bottom-style: solid; border-width: 1px; border-color: #C0C0C0; padding-bottom: 3px;">
                                                    <span class="style3">* </span>Action Number:</td>
                                                <td style="border-right-style: solid; border-bottom-style: solid; border-width: 1px; border-color: #C0C0C0; padding-bottom: 5px;">
                                                    <dx:ASPxSpinEdit ID="ASPxSpinEdit2" runat="server" ClientIDMode="AutoID" 
                                                        CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003Blue" Height="21px" MaxValue="1000" Number="0" 
                                                        NumberType="Integer" 
                                                        SpriteCssFilePath="~/App_Themes/Office2003Blue/{0}/sprite.css" 
                                                        Value='<%# Bind("Action_number") %>' Width="60px">
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxSpinEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="dxtcRightAlignCell_Office2003Blue" 
                                                    style="padding-bottom: 5px; padding-top: 10px;">
                                                    Target URL:</td>
                                                <td colspan="8" 
                                                    style="border-right-style: solid; border-bottom-style: solid; border-width: 1px; border-color: #C0C0C0; padding-bottom: 5px; padding-top: 10px;">
                                                    <dx:ASPxTextBox ID="ASPxTextBoxURL" runat="server" ClientIDMode="AutoID" 
                                                        CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003Blue" 
                                                        SpriteCssFilePath="~/App_Themes/Office2003Blue/{0}/sprite.css" 
                                                        Text='<%# Bind("URL") %>' Width="580px">
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="dxtcRightAlignCell_Office2003Blue" 
                                                    style="padding-top: 5px; ">
                                                    Persistent Action: </td>
                                                <td style="border-right-style: solid; border-bottom-style: solid; border-width: 1px; border-color: #C0C0C0; padding-top: 5px; padding-left: 10px;" 
                                                    colspan="6">
                                                    <dx:ASPxCheckBox ID="ASPxCheckBoxPersistent" runat="server" ClientIDMode="AutoID" 
                                                        CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003Blue" ReadOnly="True" 
                                                        SpriteCssFilePath="~/App_Themes/Office2003Blue/{0}/sprite.css" 
                                                        Value='<%# Bind("Persistent_Action") %>' Checked="True" 
                                                        CheckState="Unchecked" ViewStateMode="Enabled">
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxCheckBox>
                                                </td>
                                                <td align="center" class="imagePreviewCell" style="padding-top: 10px" 
                                                    valign="top" colspan="2">
                                                    <dx:ASPxLabel ID="ASPxLabelPersistent" runat="server" 
                                                        ClientInstanceName="uploadlabel" Font-Names="Verdana" Font-Size="7pt" 
                                                        ForeColor="#669999" style="text-align: left" 
                                                        Text="** Persistent action: you cannot change Role and URL values" 
                                                        Visible="False">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="dxtcRightAlignCell_Office2003Blue" 
                                                    style="padding-top: 10px; padding-bottom: 10px">
                                                    Image:</td>
                                                <td style="padding-left: 10px; padding-top: 5px;" width="30">
                                                    <dx:ASPxBinaryImage ID="ASPxBinaryIcon" runat="server" 
                                                        ClientInstanceName="imagedb" Height="20px" Value='<%# Bind("Icon") %>' 
                                                        Width="20px">
                                                        <EmptyImage Url="~/Images/MissingImage.png">
                                                        </EmptyImage>
                                                    </dx:ASPxBinaryImage>
                                                </td>
                                                <td style="padding-top: 10px; padding-bottom: 10px; text-align: right;" 
                                                    valign="middle" width="30">
                                                    <dx:ASPxLabel ID="ASPxLabelNew" runat="server" ClientInstanceName="newlabel" 
                                                        Font-Names="Verdana" Font-Size="7pt" ForeColor="#669999" 
                                                        style="text-align: right; font-size: 8pt; color: #000000;" Text="New:" 
                                                        ClientVisible="False">
                                                    </dx:ASPxLabel>
                                                </td>
                                                <td style="padding-left: 10px; padding-top: 5px;" valign="middle" width="30">
                                                    <dx:ASPxImage ID="ASPxImagePreview" runat="server" 
                                                        ClientInstanceName="imagepreview" Height="20px" Width="20px" 
                                                        ClientVisible="False" ViewStateMode="Enabled">
                                                        <EmptyImage Url="~/Images/MissingImage.png">
                                                        </EmptyImage>
                                                    </dx:ASPxImage>
                                                </td>
                                                <td style="padding-left: 10px; padding-top: 5px;" width="100">
                                                    <dx1:ASPxButton ID="ASPxButtonAddAtachment" runat="server" align="left" 
                                                        AutoPostBack="False" CausesValidation="False" ClientIDMode="AutoID" 
                                                        ClientInstanceName="addattachment" Cursor="pointer" EnableClientSideAPI="True" 
                                                        EnableDefaultAppearance="False" EnableTheming="False" Font-Italic="True" 
                                                        Font-Size="8pt" ForeColor="Blue" HorizontalAlign="Left" 
                                                        style="text-align: left" Text="Change Image" Width="100px">
                                                        <ClientSideEvents Click="function(s, e) {
	uploadcontrol.SetVisible(true);
	uploadlabel.SetVisible(true);
	s.SetEnabled(false);
	clearattachment.SetEnabled(false);
    canceladdattachment.SetVisible(true);

}" />
                                                        <Border BorderWidth="0px" />
                                                    </dx1:ASPxButton>
                                                </td>
                                                <td style="padding-left: 10px; padding-top: 5px;" width="80">
                                                    <dx1:ASPxButton ID="ASPxButtonClear" runat="server" align="left" 
                                                        AutoPostBack="False" CausesValidation="False" ClientIDMode="AutoID" 
                                                        ClientInstanceName="clearattachment" Cursor="pointer" 
                                                        EnableClientSideAPI="True" EnableDefaultAppearance="False" 
                                                        EnableTheming="False" Font-Italic="True" Font-Size="8pt" ForeColor="Red" 
                                                        HorizontalAlign="Left" style="text-align: left" 
                                                        Text="Clear Image" Width="80px">
                                                        <ClientSideEvents Click="function(s, e) {
	var imgSrc = imagepreview;
	imgSrc.SetImageUrl(&quot;~/Images/MissingImage.png&quot;);
	imagepreview.SetVisible(true);
	newlabel.SetVisible(true);
	CallbackDelete.PerformCallback();
}" />
                                                        <Border BorderWidth="0px" />
                                                    </dx1:ASPxButton>
                                                </td>
                                                <td style="border-width: 1px; border-color: #C0C0C0; padding-left: 10px; border-right-style: solid; padding-top: 5px;" 
                                                    align="left">
                                                    <dx1:ASPxButton ID="ASPxButtonCancelAttachment" runat="server" align="left" 
                                                        AutoPostBack="False" CausesValidation="False" ClientIDMode="AutoID" 
                                                        ClientInstanceName="canceladdattachment" Cursor="pointer" 
                                                        EnableClientSideAPI="True" EnableDefaultAppearance="False" 
                                                        EnableTheming="False" Font-Italic="True" Font-Size="8pt" ForeColor="Blue" 
                                                        Height="15px" HorizontalAlign="Left" style="font-size: 8pt" Text="Cancel">
                                                        <ClientSideEvents Click="function(s, e) {
	addattachment.SetEnabled(true);
	clearattachment.SetEnabled(true);
	uploadcontrol.SetVisible(false);
	uploadlabel.SetVisible(false);
    s.SetVisible(false);
}" Init="function(s, e) {
	s.SetVisible(false);
}" />
                                                        <Border BorderWidth="0px" />
                                                        <DisabledStyle BackColor="#F4F4F4">
                                                        </DisabledStyle>
                                                    </dx1:ASPxButton>
                                                </td>
                                                <td align="center" class="imagePreviewCell" valign="top">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="dxtcRightAlignCell_Office2003Blue" align="right">
                                                    &nbsp;</td>
                                                <td colspan="6" 
                                                    style="border-right-style: solid; border-bottom-style: solid; border-width: 1px; border-color: #C0C0C0; padding-right: 10px; padding-bottom: 5px;">
                                                    <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" 
                                                        ClientIDMode="AutoID" ClientInstanceName="uploadcontrol" ClientVisible="False" 
                                                        EnableTheming="True" onfileuploadcomplete="ASPxUploadControl1_FileUploadComplete" 
                                                        ShowUploadButton="True" Theme="Office2010Blue" Width="100%" 
                                                        FileUploadMode="OnPageLoad">
                                                        <ValidationSettings AllowedFileExtensions=".jpg, .jpeg, .jpe, .gif, .png" 
                                                            MaxFileSize="20480">
                                                        </ValidationSettings>
                                                        <ClientSideEvents FileUploadComplete="function(s, e) {
	var imgSrc = imagepreview;
	var date = new Date();

	imgSrc.SetImageUrl(&quot;~/Images/MissingImage.png&quot;);
	imgSrc.SetImageUrl(&quot;~/Images/UploadImages/Image.png&quot; + &quot;?dx=&quot; + date.getTime());

	uploadcontrol.SetVisible(false);
	uploadlabel.SetVisible(false);
	addattachment.SetEnabled(true);
    clearattachment.SetEnabled(true);
	canceladdattachment.SetVisible(false);

	imagepreview.SetVisible(true);
	newlabel.SetVisible(true);
}" />
                                                        <UploadButton Text="    Upload">
                                                            <Image Height="16px" Url="~/Images/Upload.png" Width="16px">
                                                            </Image>
                                                        </UploadButton>
                                                        <Paddings PaddingBottom="5px" />
                                                    </dx:ASPxUploadControl>
                                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="uploadlabel" 
                                                        ClientVisible="False" Font-Names="Verdana" Font-Size="7pt" ForeColor="#669999" 
                                                        style="text-align: right" 
                                                        Text="Allowed image types: jpeg, gif, png. Maximum file size: 20 K">
                                                    </dx:ASPxLabel>
                                                </td>
                                                <td align="right">
                                                    &nbsp;</td>
                                                <td class="style4" valign="top" style="text-align: right">
                                                    * <span class="style5">mandatory fields</span></td>
                                            </tr>
                                        </table>
                                        <div style="text-align: left; padding: 2px 2px 2px 10px; background-color: #FFFFFF; border-right-style: solid; border-right-width: 3px; border-right-color: #000080;">
                                                                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" runat="server" 
                                                                            ReplacementType="EditFormUpdateButton">
                                                                        </dx:ASPxGridViewTemplateReplacement>
                                                                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" runat="server" 
                                                                            ReplacementType="EditFormCancelButton">
                                                                        </dx:ASPxGridViewTemplateReplacement>
                                                                    </div>
                                    </EditForm>
                                </Templates>
                                <SettingsCommandButton>
                                    <EditButton Text="Edit">
                                        <Image Height="10px" Url="~/Images/Edit.png" ToolTip="Edit Group">
                                        </Image>
                                    </EditButton>
                                    <NewButton Text="New">
                                        <Image Height="10px" Url="~/Images/Add.png" ToolTip="New Group">
                                        </Image>
                                    </NewButton>
                                    <DeleteButton Text="Delete">
                                        <Image Height="10px" Url="~/Images/Delete.png" ToolTip="Delete Group">
                                        </Image>
                                    </DeleteButton>
                                    <CancelButton Text="Cancel">
                                        <Image Height="25px" Url="~/Images/CancelNew.png" ToolTip="Cancel">
                                        </Image>
                                    </CancelButton>
                                    <UpdateButton Text="Update">
                                        <Image Height="25px" Url="~/Images/SaveNew.png" ToolTip="Save Group">
                                        </Image>
                                    </UpdateButton>
                                    <ClearFilterButton Text="Clear Filter">
                                        <Image Height="20px" Url="~/Images/ClearFilter.png">
                                        </Image>
                                    </ClearFilterButton>
                                </SettingsCommandButton>
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                </table>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <dx:ASPxCallback ID="ASPxCallbackDelete" runat="server" 
        ClientInstanceName="CallbackDelete" oncallback="ASPxCallbackDelete_Callback">
    </dx:ASPxCallback>
   </form>
</body>
</html>
