<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SRICategory.aspx.cs" Inherits="TTWeb.SRICategory" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ClientIDMode="AutoID" 
            CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" 
            CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="SRI Category Configuration" 
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
                        <td width="100%" valign="middle" align="left">SRI Category Configuration
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
                        <td style="padding-right: 0px; border-right-width: 0px; margin-right: 0px;" 
                            width="100%">
                            <dx:ASPxMenu ID="ASPxMenu1" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                Width="100%">
                                <ClientSideEvents ItemClick="function(s, e) {
	gridViewSRICategory.AddNewRow()

		
}" />
                                <Items>
                                    <dx:MenuItem Name="NewSRICategory" Text="New SRI Category">
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

                <dx:ASPxGridView ID="ASPxGridViewSRICategory" runat="server" 
                    AutoGenerateColumns="False" ClientIDMode="AutoID" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" KeyFieldName="Hidden_id" 
                    OnRowDeleting="ASPxGridViewSRICategory_RowDeleting" 
                    OnRowInserting="ASPxGridViewSRICategory_RowInserting" 
                    OnRowUpdating="ASPxGridViewSRICategory_RowUpdating" Width="100%" 
                    EnableViewState="False" ClientInstanceName="gridViewSRICategory" 
                    Theme="Metropolis">
                    <ClientSideEvents Init="function(s, e) {
	window.pagegrid = s;
}" />


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

                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ButtonType="Image" ShowEditButton="True" ShowDeleteButton="True" ShowClearFilterButton="True"/>

                        <dx:GridViewDataTextColumn Caption="SRI Category" FieldName="SRI_Category" 
                            Name="SRI_Category" ShowInCustomizationForm="True" VisibleIndex="1">
                            <PropertiesTextEdit MaxLength="50">
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                            <Settings AutoFilterCondition="EndsWith" />
                        </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Prefix Number" FieldName="Prefix_number" 
                                Name="Prefix_number" ShowInCustomizationForm="True" VisibleIndex="2" 
                                Width="30%">
                                <PropertiesTextEdit MaxLength="3">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle HorizontalAlign="Left">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" 
                            Name="Hidden_id" ShowInCustomizationForm="True" Visible="False" 
                            VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="Updated on" FieldName="Last_Update" 
                                Name="Last_Update" ReadOnly="True" ShowInCustomizationForm="True" 
                                VisibleIndex="3" Width="30%">
                                <PropertiesDateEdit AllowUserInput="False" DisplayFormatInEditMode="True" 
                                    DisplayFormatString="dd/MM/yyyy HH:mm">
                                    <ReadOnlyStyle BackColor="#F4F4F4" ForeColor="#999999">
                                    </ReadOnlyStyle>
                                </PropertiesDateEdit>
                                <CellStyle ForeColor="#999999">
                                </CellStyle>
                            </dx:GridViewDataDateColumn>
                    </Columns>
                    <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" 
                        AllowFocusedRow="True" />
                    <SettingsPager ShowDefaultImages="False" PageSize="20" AlwaysShowPager="True">
                        <AllButton Text="All">
                        </AllButton>
                        <NextPageButton Text="Next &gt;">
                        </NextPageButton>
                        <PrevPageButton Text="&lt; Prev">
                        </PrevPageButton>
                        <PageSizeItemSettings Visible="True">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <SettingsEditing Mode="Inline" />
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFilterRowMenu="True" 
                        ShowGroupedColumns="True" ShowFilterBar="Visible" />
                    <SettingsCookies Enabled="True" Version="6" />
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
                    <SettingsCommandButton>
                        <EditButton Text="Edit SRI Category">
                            <Image Height="10px" Url="~/Images/Edit.png" ToolTip="Edit Group">
                            </Image>
                        </EditButton>
                        <NewButton Text="New SRI Category">
                            <Image Height="10px" Url="~/Images/Add.png" ToolTip="New Group">
                            </Image>
                        </NewButton>
                        <DeleteButton Text="Delete SRI Category">
                            <Image Height="10px" Url="~/Images/Delete.png" ToolTip="Delete Group">
                            </Image>
                        </DeleteButton>
                        <CancelButton Text="Cancel">
                            <Image Height="18px" Url="~/Images/Cancel.png" ToolTip="Cancel">
                            </Image>
                        </CancelButton>
                        <UpdateButton Text="Update">
                            <Image Height="18px" Url="~/Images/Save.png" ToolTip="Save">
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
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    </form>
</body>
</html>
