<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Relations.aspx.cs" Inherits="TTWeb.Relations" %>

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
    </style>
</head>
<body>
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/Scripts/JScriptFunctions.js") %>"></script>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" 
            ClientIDMode="AutoID" CssFilePath="~/App_Themes/Office2010Blue/{0}/styles.css" 
            CssPostfix="Office2010Blue" 
            GroupBoxCaptionOffsetY="-19px" HeaderText="Relations" 
            SpriteCssFilePath="~/App_Themes/Office2010Blue/{0}/sprite.css" 
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
                        <td width="100%" valign="middle" align="left">Configuration Items' Relations List
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
                                        <dx:ASPxMenu ID="ASPxMenu3" runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                            Width="100%">
                                            <ClientSideEvents ItemClick="function(s, e) {
	ASPxGridViewRelations.AddNewRow()

		
}" />
                                            <Items>
                                                <dx:MenuItem Name="NewRelation" Text="New Relation">
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
                                        <dx:ASPxMenu ID="ASPxMenu4" runat="server" EnableTheming="True" 
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


                <dx:ASPxGridView ID="ASPxGridViewRelations" runat="server" 
                    AutoGenerateColumns="False" ClientIDMode="AutoID" KeyFieldName="Hidden_A_system_id;Hidden_B_system_id;Hidden_rel_type_id" 
                    OnCellEditorInitialize="ASPxGridViewRelations_CellEditorInitialize" 
                    OnRowDeleting="ASPxGridViewRelations_RowDeleting" 
                    OnRowInserting="ASPxGridViewRelations_RowInserting" 
                    OnRowUpdating="ASPxGridViewRelations_RowUpdating" Width="100%" 
                    EnableViewState="False" EnableTheming="True" Theme="Metropolis" 
                    ClientInstanceName="ASPxGridViewRelations">
                    <ClientSideEvents EndCallback="function(s, e) {

}" Init="function(s, e) {
	window.pagegrid = s;
}" />
                    <Columns>
                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="80px" ButtonType="Image" ShowEditButton="True" ShowDeleteButton="True" ShowCancelButton="True" ShowUpdateButton="True"/>
                        <dx:GridViewDataComboBoxColumn Caption="Configuration Item" 
                            FieldName="System_A" Name="System_A" ShowInCustomizationForm="True" 
                            VisibleIndex="1" Width="20%">
                            <PropertiesComboBox DropDownRows="10">
                                <ValidationSettings ErrorDisplayMode="None">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Relation" FieldName="Rel_type" 
                            Name="Rel_type" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%">
                            <PropertiesComboBox>
                                <ValidationSettings ErrorDisplayMode="None">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Related Configuration Item" 
                            FieldName="System_B" Name="System_B" ShowInCustomizationForm="True" 
                            VisibleIndex="3" Width="20%">
                            <PropertiesComboBox DropDownRows="10">
                                <ValidationSettings ErrorDisplayMode="None">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Depenencies" FieldName="Depend_on" 
                            Name="Depend_on" ShowInCustomizationForm="True" VisibleIndex="4" Width="15%">
                            <PropertiesComboBox EnableFocusedStyle="False">
                                <Items>
                                    <dx:ListEditItem Text="None" Value="0" />
                                    <dx:ListEditItem Text="Related on CI" Value="1" />
                                    <dx:ListEditItem Text="CI on Related" Value="2" />
                                    <dx:ListEditItem Text="Both Ways" Value="3" />
                                </Items>
                            </PropertiesComboBox>
                            <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn Caption="Info" FieldName="Relation_info" 
                            Name="Relation_info" ShowInCustomizationForm="True" VisibleIndex="5">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Hidden_A_system_id" FieldName="Hidden_A_system_id" 
                            Name="Hidden_A_system_id" ShowInCustomizationForm="True" Visible="False" 
                            VisibleIndex="6">
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
                    <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" 
                        AllowFocusedRow="True" />
                    <SettingsPager PageSize="20" AlwaysShowPager="True">
                    <PageSizeItemSettings Visible="True">
                    </PageSizeItemSettings>
                    </SettingsPager>
                    <SettingsEditing Mode="Inline" />
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFilterRowMenu="True" 
                        ShowGroupedColumns="True" ShowFilterBar="Visible" />
                    <SettingsCookies Enabled="True" Version="3" />
                    <Styles>
                        <Header BackColor="#0066CC" ForeColor="White">
                        </Header>
                        <FocusedRow BackColor="#FCF9DF" ForeColor="Black" VerticalAlign="Top">
                        <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                        </FocusedRow>
                        <CommandColumnItem>
                            <Paddings PaddingLeft="3px" />
                        </CommandColumnItem>
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
