<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SchEditControl.ascx.cs" Inherits="TTWeb.SchEditControl" %>
<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>















<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>













<style type="text/css">
    .style3
        {
            width: 100%;
        }
        .style4
        {}
    .style10
    {
        color: #336699;
        font-size: 8pt;
        text-align: right;
    }
    .style11
    {
        font-size: 8pt;
        text-align: right;
        background-color: #FFFFDF;
    }
    .style12
    {
        color: #999999;
        font-size: 8pt;
        text-align: left;
    }
    .style13
    {
        background-color: #FFFFE8;
    }
    .style14
    {
        color: #336699;
        background-color: #FFFFF0;
        text-align: right;
    }
    .dxflInternalEditorTable_Office2003Blue {
    width: 100%;
        font-size: 8pt;
    }
.dxeButtonEditButton_Aqua
{
	padding: 0px 2px;
}
.dxeButtonEditButton_Aqua,
.dxeSpinIncButton_Aqua,
.dxeSpinDecButton_Aqua,
.dxeSpinLargeIncButton_Aqua,
.dxeSpinLargeDecButton_Aqua
.dxeButtonEditButton_Aqua,
.dxeCalendarButton_Aqua,
.dxeSpinIncButton_Aqua,
.dxeSpinDecButton_Aqua,
.dxeSpinLargeIncButton_Aqua,
.dxeSpinLargeDecButton_Aqua
{
	vertical-align: Middle;
	border: 1px Solid #A3C0E8;
	cursor: pointer;
} 
.dxgvPreviewRow_Office2003Blue
{
	background-color: #FFEAEA;
}
    .style33
    {
        height: 3px;
    }
    .style37
    {
        color: #999999;
        font-size: 8pt;
        text-align: right;
    }
    .style39
    {
        color: #336699;
        font-size: 8pt;
        text-align: right;
        background-color: #F7F7F7;
    }
    .style40
    {
        background-color: #F0FFFC;
    }
    .style41
    {
        color: #336699;
        font-size: 8pt;
        text-align: right;
        background-color: #F0FFFC;
    }
    .style45
    {
        background-color: #F0FCFF;
    }
    .style46
    {
        color: #336699;
        font-size: 8pt;
        text-align: right;
        background-color: #F0FCFF;
    }
    .style48
    {
        font-size: 8pt;
        text-align: right;
        background-color: #94B6E8;
        color: #FFFFFF;
    }
    .style55
    {
        height: 32px;
        text-align: right;
    }
    .style57
    {
        font-size: 8pt;
        color: #336699;
    }
    .style67
    {
        color: #FFFFFF;
        text-align: right;
        background-color: #94B6E8;
    }
    .style68
    {
        font-size: 8pt;
        text-align: right;
        background-color: #9CBCEA;
        color: #FFFFFF;
    }
    .style73
    {
        font-size: 8pt;
        color: #FFFFFF;
        background-color: #8BABDA;
    }
    .style75
    {
        color: #2D6FD0;
    }
    .style79
    {
        background-color: #F7F7F7;
    }
    .style81
    {
        font-size: 8pt;
        color: #FFFFFF;
    }
    .style82
    {
        height: 3px;
        background-color: #FFF3F0;
    }
    .style83
    {
        color: #336699;
        font-size: 8pt;
        text-align: right;
        height: 3px;
        background-color: #FFF3F0;
    }
    .style84
    {
        background-color: #FFF3F0;
    }
    .style85
    {
        color: #336699;
        font-size: 8pt;
        text-align: right;
        background-color: #FFF3F0;
    }
    .style86
    {
        background-color: #FFFFF0;
    }
    .style87
    {
        color: #999999;
        font-size: 8pt;
    }
    .style88
    {
        color: #FFFFFF;
    }
    .style89
    {
        text-align: left;
        color: #FFFFFF;
    }
    .style90
    {
        color: #336699;
        background-color: #FFF3F0;
    }
    .style91
    {
        text-align: right;
        color: #999999;
    }
    .style93
    {
        color: #C0C0C0;
    }
    .style94
    {
        color: #993333;
        text-align: right;
    }
    .style95
    {
        color: #993333;
        font-weight: normal;
    }
    
    .Inline 
    {
        display: inline-table;
    }
    
    </style>
    <div>
<table class="style3" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                            <td colspan="4">
                                                    <dx:ASPxMenu ID="ASPxMenuTT" runat="server" ClientInstanceName="ASPxMenuTT" 
                                                        EnableTheming="True" HorizontalAlign="Left" ItemAutoWidth="False" Theme="Glass" 
                                                        Width="100%" SeparatorWidth="0px" EnableClientSideAPI="True" 
                                                        SeparatorHeight="0px">
                                                        
 <ClientSideEvents ItemClick="function(s, e) {
	                                                        if(e.item.name == &quot;Claim&quot;) 
		                                                        {
                                                                    maineditcontroltab.SetActiveTabIndex(0);
                                                                    claimcallback.PerformCallback();
		                                                        }
	                                                        if(e.item.name == &quot;Assign&quot;) 
		                                                        {
																	var element = s.GetMainElement();
			                                                        ClientPopupControlAssign.ShowAtElement(element);
		                                                        }
	                                                        if(e.item.name == &quot;Release&quot;) 
		                                                        {
																	var element = s.GetMainElement();
							                                        ClientPopupControlRelease.ShowAtElement(element);
		                                                        }
	                                                        if(e.item.name == &quot;Reject&quot;) 
		                                                        {
																if (confirm(&quot;Are you sure you want to permanently Cancel this task?&quot;)==true)
  																	{
																	  rejectcallback.PerformCallback();
																	}
		                                                        }
	                                                        if(e.item.name == &quot;Complete&quot;) 
		                                                        {
																if (confirm(&quot;Are you sure you want to complete this task?&quot;)==true)
  																	{
                                                                      window.ControlCallbackReason = 'complete';
                                                                      CallbackSaveSchedule.PerformCallback();
																	  //completecallback.PerformCallback();
																    }
		                                                        }
                                                        }" Init="function(s, e) {
	window.ControlCallbackReason = null;
}" />
 <Items>
                                                            
 <dx:MenuItem Name="Claim" Text="Claim Task">
                                                                <Image Height="12px" Url="~/Images/Claim.gif">
                                                                </Image>
                                                            </dx:MenuItem>
 <dx:MenuItem Name="Release" Text="Save &amp; Release to... ">
                                                                <Image Height="12px" Url="~/Images/Release.gif">
                                                                </Image>
                                                            </dx:MenuItem>
 <dx:MenuItem Name="Complete" Text="Save &amp; Complete ">
                                                                <Image Height="12px" Url="~/Images/Complete.gif">
                                                                </Image>
                                                            </dx:MenuItem>
 <dx:MenuItem Name="More" Text="More...">
                                                                <Items>
                                                                    <dx:MenuItem Name="Assign" Text="Save &amp; Assign to... ">
                                                                        <Image Height="12px" Url="~/Images/Assign.gif">
                                                                        </Image>
                                                                    </dx:MenuItem>
                                                                    <dx:MenuItem Name="Reject" Text="Save &amp; Cancel ">
                                                                        <Image Height="10px" Url="~/Images/delete.gif">
                                                                        </Image>
                                                                    </dx:MenuItem>
                                                                </Items>
                                                                <Image Height="12px" Url="~/Images/pen.png">
                                                                </Image>
                                                            </dx:MenuItem>
 </Items>
                                                        
 <BorderRight BorderWidth="0px" />
                                                        
 </dx:ASPxMenu>
                                                </td>
                                            <td width="1%">
                                                    <dx:ASPxMenu ID="ASPxMenuTTSave" runat="server" EnableTheming="True" 
                                                        Theme="Glass" Width="100%" SeparatorWidth="0px" SeparatorHeight="0px">
                                                        
 <ClientSideEvents ItemClick="function(s, e) {
if(e.item.name == &quot;Save&quot;) 
{
	CallbackSaveSchedule.PerformCallback();
}
}" />
 <Items>
                                                            
     <dx:MenuItem Name="Export" NavigateUrl="~/SchEdit_Report.aspx" Target="_blank" 
         Text="Export">
         <Image Height="12px" Url="~/Images/export.png">
         </Image>
         <ItemStyle ForeColor="Black" />
     </dx:MenuItem>
                                                            
 <dx:MenuItem Name="Save" Text="Save">
                                                                <Image Height="12px" Url="~/Images/save_m.png">
                                                                </Image>
                                                            </dx:MenuItem>
 </Items>
                                                        
 <BorderLeft BorderWidth="0px" />
                                                        
 </dx:ASPxMenu>
                                                </td>
                                            </tr>
                                             <tr>
                                            <td width="120px">
                                                    </td>

                                              <td width="120" >
                                                  &nbsp;</td>
                                                <td width="20%">
                                                    <dx:ASPxPopupControl ID="PopupControlRelease" runat="server" 
                                                        LoadContentViaCallback="OnFirstShow" AllowDragging="True"
                                                                     ShowFooter="True" 
                                                       HeaderText="Please choose team" 
                                                        ClientInstanceName="ClientPopupControlRelease" AllowResize="True" 
                                                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                                                        LoadingPanelImagePosition="Top" 
                                                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                                                        PopupHorizontalOffset="160" PopupVerticalOffset="30" >                                    
 <ContentCollection>                                    
 <dx:PopupControlContentControl ID="PopupControlContentControlToTeam" runat="server" Width="200px">
                                                            <div style="vertical-align:middle" align="left">
                                                               <dx:ASPxRadioButtonList ID="ASPxRadioButtonListToTeam" runat="server"
                                                                    ValueField="Hidden_To_Team_ID" TextField="To_Team" RepeatColumns="1" RepeatLayout="Table" 
                                                                    ClientInstanceName="ToTeam" EnableClientSideAPI="True" Width="100%" 
                                                                    ItemSpacing="5px">
                                                                    <ValidationSettings Display="None">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxRadioButtonList>
                                                            </div>
                                                        </dx:PopupControlContentControl>
 </ContentCollection>
                                                        
 <LoadingPanelImage Url="~/App_Themes/SoftOrange/Web/Loading.gif">
                                                        
 </LoadingPanelImage>
                                                        
 <HeaderStyle>
                                                        
 <Paddings PaddingBottom="3px" PaddingTop="3px" />
                                                        
 </HeaderStyle>
                                                        
 <FooterTemplate>
                                                            
 <table class="style3">
                                                                
 <tr>
                                                                    
 <td width="50%">
                                                                        
 </td>
                                                                    
 <td width="50%">
                                                                        
 <dx:ASPxButton ID="SendToteam" runat="server" AutoPostBack="False" ClientSideEvents-Click="function(s, e) { 
                                                                              if (ToTeam.GetIsValid())
                                                                              {
                                                                                window.ControlCallbackReason = 'release';
                                                                                CallbackSaveSchedule.PerformCallback();
                                                                              }
                                                                          }" 
         Text="Send" Width="100%" CausesValidation="False" >
     <ClientSideEvents Click="function(s, e) { 
if (ToTeam.GetIsValid() &amp;&amp; ToTeam.GetSelectedItem().text != &quot;Dispatcher&quot;)   /* customia */
{
  window.ControlCallbackReason = 'release';
  CallbackSaveSchedule.PerformCallback();
}

if (ToTeam.GetIsValid() &amp;&amp; ToTeam.GetSelectedItem().text == &quot;Dispatcher&quot;)   /* customia */
{
  window.ControlCallbackReason = 'releaseForDispatcher';
  CallbackSaveSchedule.PerformCallback();
}

}" />
     </dx:ASPxButton>
 </td>
                                                                    
 </tr>
                                                                
 </table>
                                                            
 </FooterTemplate>
                                                        
 </dx:ASPxPopupControl>
                                                </td>
                                                <td>
                                                <dx:ASPxPopupControl ID="PopupControlAssign" runat="server" AllowDragging="True"
                                                                     ShowFooter="True" 
                                                       HeaderText="Please choose user" ClientInstanceName="ClientPopupControlAssign" 
                                                       onwindowcallback="PopupControl_WindowCallback" AllowResize="True" 
                                                       CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                                                       LoadingPanelImagePosition="Bottom" 
                                                       SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                                                      PopupHorizontalOffset="420" PopupVerticalOffset="30" 
                                                      EnableClientSideAPI="True" LoadContentViaCallback="OnFirstShow" 
                                                      PopupAction="None" 
                                                      oncustomjsproperties="PopupControlAssign_CustomJSProperties">
                                                    
 <LoadingPanelImage Url="~/App_Themes/SoftOrange/Web/Loading.gif">
                                                    
 </LoadingPanelImage>
                                                    <ClientSideEvents EndCallback="function(s, e) {
	if (ClientPopupControlAssign.cpButtonCount == 0)
    {
        assignbutton.SetEnabled(false);
    }
    else
    {   
        assignbutton.SetEnabled(true);
    }
}" />
 <HeaderStyle>
                                                    
 <Paddings PaddingBottom="3px" PaddingTop="3px" />                                     
 </HeaderStyle>                                   
 <FooterTemplate>                                 
 <table class="style3">                                                       
 <tr>                                               
 <td width="50%">                                                   
 </td>                                             
 <td width="50%">                                                              
 <dx:ASPxButton ID="AssignTT" runat="server" AutoPostBack="False" Text="Assign" 
         Width="100%" EnableClientSideAPI="True" ClientInstanceName="assignbutton" >
     <ClientSideEvents Click="function(s, e) { 
                                                                                if (teamusers.GetIsValid())
                                                                                {
                                                                                    window.ControlCallbackReason = 'assign';
                                                                                    CallbackSaveSchedule.PerformCallback();
                                                                                }
                                                                           }" />
     </dx:ASPxButton>
 </td>                                                               
 </tr>                                                   
 </table>                                      
 </FooterTemplate>                                
 <ContentCollection>
 <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">
                                                            <div style="vertical-align:middle">
                                                               <dx:ASPxRadioButtonList ID="ASPxRadioButtonList" runat="server"
                                                                    ValueField="ID" TextField="Name" RepeatColumns="1" 
                                                                    ClientInstanceName="teamusers" EnableClientSideAPI="True" 
                                                                    ItemSpacing="5px" Width="100%" ViewStateMode="Disabled" >
                                                                   <ValidationSettings Display="None">
                                                                       <RequiredField IsRequired="True" />
                                                                   </ValidationSettings>
                                                                </dx:ASPxRadioButtonList>
                                                            </div>
                                                        </dx:PopupControlContentControl>
 </ContentCollection>                             
 </dx:ASPxPopupControl>
                                                 </td>
                                                <td>
                                                    </td>
                                            </tr>
                                        </table>
                    <table class="style3">
                    <tr>
                        <td class="style4" colspan="2">
                            <table class="style3">
                                <tr>
                                    <td >
                                        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" 
                                            ClientIDMode="AutoID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                                            CssPostfix="PlasticBlue" Width="100%" 
                                            EnableClientSideAPI="True" ClientInstanceName="maineditcontroltab" 
                                            style="text-align: right" EnableCallBacks="True" 
                                            onactivetabchanged="ASPxPageControl1_ActiveTabChanged" >
                                            <TabPages>
                                                 <dx:TabPage Name="Visits" Text="Visits">
                                                     <TabImage Height="14px" Url="~/Images/user_info.png">
                                                     </TabImage>
                                                    <ContentCollection>
                                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                            <table class="dxflInternalEditorTable_Office2003Blue" cellpadding="0" 
                                                                cellspacing="0">
                                                                <tr>
                                                                    <td style="border-right: 1px solid #CCCCCC; border-left: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; padding: 3px; text-align: left; background-color: #F9F9F9; border-bottom-style: solid; border-left-style: none; border-bottom-width: 1px; border-left-width: 1px; border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-right-style: none;" 
                                                                        valign="top">
                                                                        <span class="style12">
                                                                        <dx:ASPxLabel ID="ASPxLabelInitiatorComments" runat="server" 
                                                                            ClientIDMode="AutoID" Font-Italic="False" Font-Size="8pt" 
                                                                            style="color: #990000; text-align: left; font-size: 8pt; font-weight: 700;" 
                                                                            Text="ASPxLabel">
                                                                        </dx:ASPxLabel>
                                                                        </span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style55">
                                                                        <span class="style11">
                                                                        <dx:ASPxImage ID="ASPxImage1" runat="server" Height="28px" 
                                                                            ImageUrl="~/Images/user_info.png" 
                                                                            style="text-align: right; background-color: #FFFFFF;" ToolTip="Departure" 
                                                                            Width="28px">
                                                                        </dx:ASPxImage>
                                                                        </span>
                                                                        </td>
                                                                </tr>
                                                                <tr>
                                                                    <td 
                                                                        
                                                                        style="border-width: 1px; border-color: #6999E0; border-top-style: solid; border-right-style: solid;" 
                                                                        class="style67">
                                                                        Departure <span class="style75"><strong><font size="3">/1</font></strong></span></td>
                                                                </tr>
                                                            </table>
                                                            <table class="dxflInternalEditorTable_Metropolis">
                                                                <tr>
                                                                    <td style="border-left: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; padding: 2px; text-align: right; background-color: #FFFFF0;" 
                                                                        width="120">
                                                                        <span class="style11"><span class="style14">Field engineer 1</span><span 
                                                                            class="style13">:</span></span></td>
                                                                    <td style="padding: 2px; text-align: left; background-color: #FFFFF0">
                                                                        <span class="style11">
                                                                        <dx:ASPxComboBox ID="ASPxComboEngineer1" runat="server" 
                                                                            ClientInstanceName="engineer1" EnableCallbackMode="True" 
                                                                            EnableClientSideAPI="True" Font-Size="8pt" Theme="Aqua" 
                                                                            ValueType="System.Int32" Width="210px">
                                                                            <ValidationSettings EnableCustomValidation="True">
                                                                            </ValidationSettings>
                                                                            <DisabledStyle ForeColor="Black">
                                                                            </DisabledStyle>
                                                                        </dx:ASPxComboBox>
                                                                        </span>
                                                                    </td>
                                                                    <td style="padding: 2px; border-left: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; background-color: #F0FFFC; text-align: right;" 
                                                                        width="120">
                                                                        <span class="style10">Departure time:</span></td>
                                                                    <td style="background-color: #F0FFFC; padding: 2px;">
                                                                        <dx:ASPxDateEdit ID="ASPxDateEditDeparture" runat="server" 
                                                                            ClientInstanceName="departuretime" DisplayFormatString="dd/MM/yyyy HH:mm" 
                                                                            EditFormat="DateTime" EditFormatString="dd/MM/yyyy HH:mm" 
                                                                            EnableClientSideAPI="True" Font-Size="8pt" MaxDate="2050-01-01" 
                                                                            MinDate="2000-01-01" style="font-size: 8pt" Theme="Aqua" Width="200px">
                                                                            <TimeSectionProperties Visible="True">
                                                                                <TimeEditProperties DisplayFormatString="HH:mm">
                                                                                </TimeEditProperties>
                                                                            </TimeSectionProperties>
                                                                            <ValidationSettings EnableCustomValidation="True">
                                                                            </ValidationSettings>
                                                                            <DisabledStyle ForeColor="Black">
                                                                            </DisabledStyle>
                                                                        </dx:ASPxDateEdit>
                                                                    </td>
                                                                    <td class="style10" 
                                                                        style="border-left: 1px solid #CCCCCC; padding: 2px; text-align: right; background-color: #F7F7F7; border-bottom-style: solid; border-left-style: solid; border-bottom-width: 1px; border-left-width: 1px; border-bottom-color: #CCCCCC; border-left-color: #CCCCCC;" 
                                                                        width="120">
                                                                        Vehicle:</td>
                                                                    <td style="padding: 2px; text-align: left; background-color: #F7F7F7">
                                                                        <span class="style11">
                                                                        <dx:ASPxComboBox ID="ASPxComboVehicle" runat="server" 
                                                                            ClientInstanceName="vehicle" EnableCallbackMode="True" 
                                                                            EnableClientSideAPI="True" Font-Size="8pt" Theme="Aqua" 
                                                                            ValueType="System.Int32" Width="200px">
                                                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	labelvehicle.SetText(&quot; &quot;);
}" />
                                                                            <ValidationSettings EnableCustomValidation="True">
                                                                            </ValidationSettings>
                                                                            <DisabledStyle ForeColor="Black">
                                                                            </DisabledStyle>
                                                                        </dx:ASPxComboBox>
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border-left: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; padding: 2px; text-align: right; background-color: #FFFFF0;">
                                                                        <span class="style11"><span class="style14">Field engineer 2</span><span 
                                                                            class="style13">:</span></span></td>
                                                                    <td style="padding: 2px; text-align: left; background-color: #FFFFF0">
                                                                        <span class="style11">
                                                                        <dx:ASPxComboBox ID="ASPxComboEngineer2" runat="server" 
                                                                            ClientInstanceName="engineer2" EnableCallbackMode="True" 
                                                                            EnableClientSideAPI="True" Font-Size="8pt" Theme="Aqua" 
                                                                            ValueType="System.Int32" Width="210px">
                                                                            <ClientSideEvents KeyDown="function(s, e) {
	                                                                                 // 'Delete' button key code = 46
                                                                                   if (e.htmlEvent.keyCode == 46)
                                                                                         s.SetSelectedIndex(-1);
                                                                                }" />
                                                                            <DisabledStyle ForeColor="Black">
                                                                            </DisabledStyle>
                                                                        </dx:ASPxComboBox>
                                                                        </span>
                                                                    </td>
                                                                    <td rowspan="2" 
                                                                        style="border-left: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; background-color: #F0FFFC;">
                                                                        &nbsp;</td>
                                                                    <td rowspan="2" 
                                                                        style="padding: 2px; text-align: left; background-color: #F0FFFC; vertical-align: top;" 
                                                                        valign="top">
                                                                        <span class="style11">
                                                                        <dx:ASPxMemo ID="ASPxMemoDeparture" runat="server" 
                                                                            ClientInstanceName="departurecomments" EnableClientSideAPI="True" 
                                                                            Font-Size="8pt" Height="40px" NullText="departure comments..." Theme="Aqua" 
                                                                            Width="95%">
                                                                            <NullTextStyle Font-Size="8pt" ForeColor="#CCCCCC">
                                                                            </NullTextStyle>
                                                                            <DisabledStyle ForeColor="#999999">
                                                                            </DisabledStyle>
                                                                        </dx:ASPxMemo>
                                                                        </span>
                                                                    </td>
                                                                    <td rowspan="2" style="background-color: #F2F2F2">
                                                                        &nbsp;</td>
                                                                    <td rowspan="2" 
                                                                        style="padding: 2px; text-align: right; background-color: #F2F2F2" 
                                                                        valign="top">
                                                                        <dx:ASPxLabel ID="ASPxLabelVehicle" runat="server" ClientIDMode="AutoID" 
                                                                            style="color: #3366CC; text-align: left; font-size: 8pt;" Text="n/a" 
                                                                            ClientInstanceName="labelvehicle">
                                                                        </dx:ASPxLabel>
                                                                    </td>
                                                                </tr>
                                                                <tr style="text-align: left">
                                                                    <td style="padding: 2px; border-left: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; text-align: right; background-color: #EEEEEE;">
                                                                        <span class="style10">Spare parts taken:</span></td>
                                                                    <td style="padding: 2px; text-align: left; background-color: #EEEEEE">
                                                                        <span class="style11">
                                                                        <%--<dx:ASPxComboBox ID="ASPxComboSpareParts" runat="server" Font-Size="8pt" 
                                                                            Theme="Aqua" Width="200px">
                                                                            <ClientSideEvents KeyDown="function(s, e) {
	                                                             // 'Delete' button key code = 46
                                                               if (e.htmlEvent.keyCode == 46)
                                                                     s.SetSelectedIndex(-1);

                                                            }" />
                                                                            <DisabledStyle ForeColor="Black">
                                                                            </DisabledStyle>
                                                                        </dx:ASPxComboBox>--%>

                                                                        <dx:ASPxDropDownEdit ID="ASPxDropDownSpareParts" ClientInstanceName="sparepartsdropdown" Width="210px" runat="server" AnimationType="None" Theme="Aqua" AllowUserInput="False">
                
        <DropDownWindowStyle BackColor="#EDEDED" />
        <DropDownWindowTemplate>
            <dx:ASPxListBox Width="100%" ID="listBoxspareparts" SelectionMode="CheckColumn" ClientInstanceName="spareparts" runat="server">
                <Border BorderStyle="None" />
                <BorderBottom BorderStyle="Solid" BorderWidth="1px" BorderColor="#DCDCDC" />
                <Items>
                    <dx:ListEditItem Text="(Select all)" />
                </Items>
                <ClientSideEvents SelectedIndexChanged="function(s,e) {OnListBoxSelectionChanged(sparepartsdropdown,e,s)}" />
            </dx:ASPxListBox>
            <table style="width: 100%" cellspacing="0" cellpadding="4">
                <tr>
                    <td align="right">
                        <dx:ASPxButton ID="ASPxButtonCloseDropDown1" AutoPostBack="False" runat="server" Text="Close">
                            <ClientSideEvents Click="function(s, e)
                            {
                                sparepartsdropdown.HideDropDown(); 
                            }" />
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </DropDownWindowTemplate>
         <ClientSideEvents TextChanged="function(s,e)
         {
            SynchronizeListBoxValues(sparepartsdropdown, spareparts);
         }" DropDown="function(s,e)
         {
            SynchronizeListBoxValues(sparepartsdropdown, spareparts);
         }" />
    </dx:ASPxDropDownEdit>
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <table class="dxflInternalEditorTable_PlasticBlue">
                                                                <tr>
                                                                    <td bgcolor="White" style="text-align: right">
                                                                        <dx:ASPxImage ID="ASPxImage9" runat="server" Height="28px" 
                                                                            ImageUrl="~/Images/truck.png">
                                                                        </dx:ASPxImage>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td bgcolor="#94B6E8" 
                                                                        style="border-right: 1px solid #6999E0; border-top: 1px solid #6999E0; text-align: right; border-left-color: #6999E0; border-left-width: 1px; border-bottom-color: #6999E0; border-bottom-width: 1px;">
                                                                        <span class="style81">Visits<span class="style75"><strong><font size="3"> /2</font></strong></span></span>&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                            <dx:ASPxMenu ID="ASPxMenuEvent" runat="server" EnableTheming="True" 
                                                                ItemAutoWidth="False" style="font-size: 8pt" Theme="Metropolis" 
                                                                Width="100%" BackColor="White" ClientIDMode="Static" Font-Size="8pt">
                                                                <%--<ClientSideEvents Init="function(s, e) 
                                                                        {
	                                                                        if (gridViewProblems.cpAddedRowCount &gt;2 || !gridViewProblems.cpEditable)
	                                                                        {
		                                                                        s.SetEnabled(false);
	                                                                        }
                                                                        }" ItemClick="function(s, e) 
                                                                        {
	                                                                        gridViewProblems.AddNewRow();
                                                                        }" />--%>
                                                                <ClientSideEvents ItemClick="function(s, e) {
    window.ControlCallbackReason = 'addticket';
    CallbackSaveSchedule.PerformCallback();
}" />
                                                                <Items>
                                                                    <dx:MenuItem Name="NewEvent" Text="Save &amp; Add Ticket">
                                                                        <Image Height="10px" Url="~/Images/Add.png">
                                                                        </Image>
                                                                    </dx:MenuItem>
                                                                </Items>
                                                            </dx:ASPxMenu>
                                                            <dx:ASPxGridView ID="ASPxGridViewProblems" runat="server" 
                                                                AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                                                ClientInstanceName="gridViewProblems" 
                                                                CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                                CssPostfix="Office2003Blue" KeyboardSupport="True" KeyFieldName="Hidden_id" 
                                                                OnCellEditorInitialize="ASPxGridViewProblems_CellEditorInitialize" 
                                                                OnCustomJSProperties="ASPxGridViewProblems_CustomJSProperties" 
                                                                OnRowInserting="ASPxGridViewProblems_RowInserting" 
                                                                OnCustomCallback="ASPxGridViewProblems_CustomCallback"
                                                                OnRowUpdating="ASPxGridViewProblems_RowUpdating" style="font-size: 8pt" 
                                                                Width="100%" EnableTheming="True" Theme="Aqua" 
                                                                Font-Names="8" 
                                                                OnLoad="ASPxGridViewProblems_Load" 
                                                                OnHtmlDataCellPrepared="ASPxGridViewProblems_HtmlDataCellPrepared" >
                                                                <ClientSideEvents EndCallback="function(s, e) {
	if (typeof(totalkilometers) != 'undefined')
	{
		totalkilometers.SetText(s.cpTotalKM + returntohome.GetNumber());
	}
    if (typeof(kilometersread) != 'undefined')
	{
		kilometersread.SetText(s.cpTotalKM + returntohome.GetNumber());
	}
}" />
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn ButtonType="Image" Name="CommandButtons" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Caption=" " ShowEditButton="True" ShowClearFilterButton="True"/>
                                                                    <dx:GridViewDataTextColumn Caption="Location" FieldName="Location" 
                                                                        Name="Location" ShowInCustomizationForm="True" VisibleIndex="2" 
                                                                        ReadOnly="True" Width="200px">
                                                                        <PropertiesTextEdit ClientInstanceName="SeverityText">
                                                                            <ReadOnlyStyle BackColor="WhiteSmoke">
                                                                            </ReadOnlyStyle>
                                                                        </PropertiesTextEdit>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Hidden_tt_id" FieldName="Hidden_tt_id" 
                                                                        Name="Hidden_tt_id" ShowInCustomizationForm="True" Visible="False" 
                                                                        VisibleIndex="13">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" 
                                                                        Name="Hidden_id" ShowInCustomizationForm="True" Visible="False" 
                                                                        VisibleIndex="24">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Priority" FieldName="Priority" 
                                                                        Name="Priority" ShowInCustomizationForm="True" VisibleIndex="24" 
                                                                        Visible="False">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataComboBoxColumn Caption="Site type" FieldName="SITE_TYPE" 
                                                                        Name="SITE_TYPE" ShowInCustomizationForm="True" VisibleIndex="11" Width="100px">
                                                                        <PropertiesComboBox TextField="Configuration_value" ValueField="Id" 
                                                                            ValueType="System.Int32">
                                                                        </PropertiesComboBox>
                                                                    </dx:GridViewDataComboBoxColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Site_type_id" FieldName="SITE_TYPE_ID" 
                                                                        Name="SITE_TYPE_ID" ShowInCustomizationForm="True" Visible="False" 
                                                                        VisibleIndex="17">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataDateColumn Caption="Arrival" FieldName="ARRIVAL_DATE" 
                                                                        Name="ARRIVAL_DATE" ShowInCustomizationForm="True" VisibleIndex="5" 
                                                                        Width="120px">
                                                                        <PropertiesDateEdit DisplayFormatInEditMode="True" 
                                                                            DisplayFormatString="dd/MM/yy HH:mm" EditFormat="DateTime" 
                                                                            EditFormatString="dd/MM/yy HH:mm">
                                                                            <TimeSectionProperties Visible="True">
                                                                            </TimeSectionProperties>
                                                                        </PropertiesDateEdit>
                                                                    </dx:GridViewDataDateColumn>
                                                                    <dx:GridViewDataDateColumn Caption="Departure" FieldName="DEPARTURE_DATE" 
                                                                        Name="DEPARTURE_DATE" ShowInCustomizationForm="True" VisibleIndex="6" 
                                                                        Width="120px">
                                                                        <PropertiesDateEdit DisplayFormatInEditMode="True" 
                                                                            DisplayFormatString="dd/MM/yy HH:mm" EditFormat="DateTime" 
                                                                            EditFormatString="dd/MM/yy HH:mm">
                                                                            <TimeSectionProperties Visible="True">
                                                                            </TimeSectionProperties>
                                                                        </PropertiesDateEdit>
                                                                    </dx:GridViewDataDateColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Intervention_category" 
                                                                        FieldName="INTERVENTION_CATEGORY" Name="INTERVENTION_CATEGORY" 
                                                                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Intervention_type" 
                                                                        FieldName="INTERVENTION_TYPE" Name="INTERVENTION_TYPE" 
                                                                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="19">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataSpinEditColumn Caption="Km to site" 
                                                                        FieldName="DISTANCE_TO_SITE" Name="DISTANCE_TO_SITE" 
                                                                        ShowInCustomizationForm="True" VisibleIndex="9" Width="60px">
                                                                        <PropertiesSpinEdit DisplayFormatString="g">
                                                                        </PropertiesSpinEdit>
                                                                    </dx:GridViewDataSpinEditColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Comments" FieldName="SITE_COMMENTS" 
                                                                        Name="SITE_COMMENTS" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="14">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="AA" FieldName="AA" Name="AA" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="20" Visible="False">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="SRIS" FieldName="SRIS" Name="SRIS" 
                                                                        ShowInCustomizationForm="True" Visible="False" 
                                                                        VisibleIndex="22">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="SOLVED" FieldName="SOLVED" Name="SOLVED" 
                                                                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="23">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataComboBoxColumn Caption="Visit?" FieldName="VISIT" Name="VISIT" 
                                                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="50px">
                                                                        <PropertiesComboBox>
                                                                            <Items>
                                                                                <dx:ListEditItem Text="Yes" Value="Yes" />
                                                                                <dx:ListEditItem Text="No" Value="No" />
                                                                            </Items>
                                                                        </PropertiesComboBox>
                                                                        <CellStyle Font-Bold="True" ForeColor="#3366CC">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataComboBoxColumn>
                                                                    <dx:GridViewDataCheckColumn Caption="4x4" FieldName="FOUR_WHEEL" Name="FOUR_WHEEL" ShowInCustomizationForm="True" VisibleIndex="10" Width="30px">
                                                                    </dx:GridViewDataCheckColumn>
                                                                </Columns>
                                                                <SettingsBehavior AllowGroup="False" 
                                                                    ColumnResizeMode="NextColumn" ConfirmDelete="True" AllowFocusedRow="True" 
                                                                    AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                <SettingsPager PageSize="2" mode="ShowAllRecords">
                                                                </SettingsPager>
                                                                <SettingsEditing Mode="Inline" />
                                                                <Settings ShowGroupButtons="False" />
                                                                <SettingsCookies Version="4" 
                                                                    StoreColumnsVisiblePosition="False" />
                                                                <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />

                                                                <Styles CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                                    CssPostfix="Office2003Blue">
                                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                    </Header>
                                                                    <DetailRow BackColor="Ivory">
                                                                    </DetailRow>
                                                                    <SelectedRow BackColor="White">
                                                                    </SelectedRow>
                                                                    <FocusedRow BackColor="#FCF9DF" ForeColor="Black">
                                                                        <BackgroundImage ImageUrl="~/Images/GridRowBack.png" Repeat="RepeatX" />
                                                                    </FocusedRow>
                                                                    <LoadingPanel ImageSpacing="10px">
                                                                    </LoadingPanel>
                                                                    <CommandColumn>
                                                                        <Paddings PaddingRight="2px" />
                                                                    </CommandColumn>
                                                                    <CommandColumnItem>
                                                                        <Paddings PaddingLeft="2px" />
                                                                    </CommandColumnItem>
                                                                </Styles>
                                                                <StylesEditors>
                                                                    <ProgressBar Height="25px">
                                                                    </ProgressBar>
                                                                </StylesEditors>
                                                                <Templates>
                                                                    <DetailRow>
                                                                        <table class="style3">
                                                                            <tr>
                                                                                <td class="style89" 
                                                                                    style="border-right: 1px solid #6999E0; border-top: 1px solid #6999E0; text-align: right; border-left-color: #6999E0; border-left-width: 1px; border-bottom-color: #6999E0; border-bottom-width: 1px; background-color: #94B6E8;" 
                                                                                    colspan="3">
                                                                                    Issues solved?<span class="style81"><span class="style75"><strong><font 
                                                                                        size="3"> /2.1</font></strong></span></span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 27%">&nbsp;</td>
                                                                                <td style="width: 3%">&nbsp;</td>
                                                                                <td style="width: 70%">&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="3">
                                                                                    <dx1:ASPxGridView ID="ASPxGridViewTickets" runat="server" AutoGenerateColumns="False" EnableTheming="True" Font-Size="8pt" KeyFieldName="Hidden_id" onbeforeperformdataselect="ASPxGridViewTickets_BeforePerformDataSelect" onhtmlrowprepared="ASPxGridViewTickets_HtmlRowPrepared" onload="ASPxGridViewTickets_Load" onrowupdating="ASPxGridViewTickets_RowUpdating" Theme="Aqua" Width="100%">
                                                                                        <Columns>
                                                                                            <dx1:GridViewCommandColumn ButtonType="Image" Caption=" " ShowEditButton="True" VisibleIndex="0" Width="60px" />
                                                                                            <dx1:GridViewDataTextColumn Caption="ID" FieldName="TT_ID" Name="TT_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                                                                <PropertiesTextEdit>
                                                                                                    <ReadOnlyStyle BackColor="WhiteSmoke">
                                                                                                    </ReadOnlyStyle>
                                                                                                </PropertiesTextEdit>
                                                                                            </dx1:GridViewDataTextColumn>
                                                                                            <dx1:GridViewDataTextColumn Caption="Issue" FieldName="EVENT" Name="EVENT" ReadOnly="True" VisibleIndex="1" Width="30%">
                                                                                                <PropertiesTextEdit>
                                                                                                    <ReadOnlyStyle BackColor="WhiteSmoke">
                                                                                                    </ReadOnlyStyle>
                                                                                                </PropertiesTextEdit>
                                                                                                <EditCellStyle Font-Size="8pt">
                                                                                                </EditCellStyle>
                                                                                            </dx1:GridViewDataTextColumn>
                                                                                            <dx1:GridViewDataComboBoxColumn Caption="Solved?" FieldName="SOLVED" Name="SOLVED" VisibleIndex="4" Width="15%">
                                                                                                <PropertiesComboBox>
                                                                                                    <Items>
                                                                                                        <dx1:ListEditItem Text="Yes" Value="Yes" />
                                                                                                        <dx1:ListEditItem Text="No" Value="No" />
                                                                                                        <dx1:ListEditItem Text="Partially" Value="Partially" />
                                                                                                    </Items>
                                                                                                </PropertiesComboBox>
                                                                                                <EditCellStyle Font-Size="8pt">
                                                                                                </EditCellStyle>
                                                                                                <CellStyle Font-Bold="True" ForeColor="#3366CC">
                                                                                                </CellStyle>
                                                                                            </dx1:GridViewDataComboBoxColumn>
                                                                                            <dx1:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" Name="Hidden_id" Visible="False" VisibleIndex="5">
                                                                                            </dx1:GridViewDataTextColumn>
                                                                                            <dx1:GridViewDataTextColumn Caption="Expert Info" FieldName="Expert_Comment" Name="Expert_Comment" ReadOnly="True" VisibleIndex="3">
                                                                                                <PropertiesTextEdit>
                                                                                                    <ReadOnlyStyle BackColor="WhiteSmoke">
                                                                                                    </ReadOnlyStyle>
                                                                                                </PropertiesTextEdit>
                                                                                                <CellStyle ForeColor="#666666">
                                                                                                </CellStyle>
                                                                                            </dx1:GridViewDataTextColumn>
                                                                                        </Columns>
                                                                                        <SettingsBehavior ColumnResizeMode="NextColumn" />
                                                                                        <SettingsPager Mode="ShowAllRecords">
                                                                                        </SettingsPager>
                                                                                        <SettingsEditing Mode="Inline" />
                                                                                        <SettingsCookies StoreColumnsVisiblePosition="False" Version="1" />
                                                                                        <Styles>
                                                                                            <CommandColumnItem>
                                                                                                <Paddings PaddingLeft="2px" />
                                                                                            </CommandColumnItem>
                                                                                        </Styles>
                                                                                        <SettingsCommandButton>
                                                                                            <EditButton Text="Edit">
                                                                                                <Image Height="10px" Url="~/Images/edit.png">
                                                                                                </Image>
                                                                                            </EditButton>
                                                                                            <CancelButton Text="Cancel">
                                                                                                <Image Height="18px" Url="~/Images/Cancel.png">
                                                                                                </Image>
                                                                                            </CancelButton>
                                                                                            <UpdateButton Text="Save">
                                                                                                <Image Height="18px" Url="~/Images/Save.png">
                                                                                                </Image>
                                                                                            </UpdateButton>
                                                                                        </SettingsCommandButton>
                                                                                    </dx1:ASPxGridView>
                                                                                    <br />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="border-right: 1px solid #6999E0; border-top: 1px solid #6999E0; text-align: right; border-left-color: #6999E0; border-left-width: 1px; border-bottom-color: #6999E0; border-bottom-width: 1px; background-color: #94B6E8; vertical-align: top;" 
                                                                                    height="20">
                                                                                    <span class="style88">Interventions on site</span><span class="style81"><span 
                                                                                        class="style75"><strong><font size="3"> /2.2</font></strong></span></span></td>
                                                                                <td>&nbsp;</td>
                                                                                <td class="style88" 
                                                                                    style="border-right: 1px solid #6999E0; border-top: 1px solid #6999E0; text-align: right; border-left-color: #6999E0; border-left-width: 1px; border-bottom-color: #6999E0; border-bottom-width: 1px; background-color: #94B6E8;">
                                                                                    &nbsp;Actions performed on site<span class="style81"><span class="style75"><strong><font 
                                                                                        ID="e"><span class="style95"> *</span></font><font ID="e" size="3"> /2.3</font></strong></span></span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <dx1:ASPxMenu ID="ASPxMenuAddIntervention" runat="server" BackColor="White" EnableTheming="True" Font-Size="8pt" Height="20px" onload="ASPxMenuAddAction_Load" Theme="Metropolis">
                                                                                        <ClientSideEvents ItemClick="function(s, e) {
	                                                                                            ASPxGridViewItemInterventionsCategory.AddNewRow()
                                                                                            }" />
                                                                                        <Items>
                                                                                            <dx1:MenuItem Name="AddIntervention" Text="Add Intervention">
                                                                                                <Image Height="10px" Url="~/Images/add.png">
                                                                                                </Image>
                                                                                            </dx1:MenuItem>
                                                                                        </Items>
                                                                                        <Border BorderStyle="None" />
                                                                                    </dx1:ASPxMenu>
                                                                                </td>
                                                                                <td>&nbsp;</td>
                                                                                <td>
                                                                                    <dx1:ASPxMenu ID="ASPxMenuAddAction" runat="server" BackColor="White" EnableTheming="True" Font-Size="8pt" onload="ASPxMenuAddAction_Load" Theme="Metropolis">
                                                                                        <ClientSideEvents ItemClick="function(s, e) {
	                                                                                            ASPxGridViewItemActions.AddNewRow()
                                                                                            }" />
                                                                                        <Items>
                                                                                            <dx1:MenuItem Name="AddAction" Text="Add Action">
                                                                                                <Image Height="10px" Url="~/Images/add.png">
                                                                                                </Image>
                                                                                            </dx1:MenuItem>
                                                                                        </Items>
                                                                                        <Border BorderStyle="None" />
                                                                                    </dx1:ASPxMenu>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="vertical-align: top">
                                                                                    <dx1:ASPxGridView ID="ASPxGridViewInterventionsCategory" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridViewItemInterventionsCategory" EnableTheming="True" Font-Size="8pt" KeyFieldName="Hidden_id" onbeforeperformdataselect="ASPxGridViewInterventionsCategory_BeforePerformDataSelect" oncelleditorinitialize="ASPxGridViewInterventionsCategory_CellEditorInitialize" onhtmlrowprepared="ASPxGridViewInterventionsCategory_HtmlRowPrepared" onload="ASPxGridViewInterventionsCategory_Load" onrowdeleting="ASPxGridViewInterventionsCategory_RowDeleting" onrowinserting="ASPxGridViewInterventionsCategory_RowInserting" onrowupdating="ASPxGridViewInterventionsCategory_RowUpdating" Theme="Aqua" Width="100%">
                                                                                        <Columns>
                                                                                            <dx1:GridViewCommandColumn ButtonType="Image" Caption=" " ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" Width="60px" />
                                                                                            <dx1:GridViewDataComboBoxColumn Caption="Intervention category" FieldName="INTERVENTION_CATEGORY" Name="INTERVENTION_CATEGORY" VisibleIndex="1">
                                                                                                <EditCellStyle Font-Size="8pt">
                                                                                                </EditCellStyle>
                                                                                            </dx1:GridViewDataComboBoxColumn>
                                                                                            <dx1:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" Name="Hidden_id" Visible="False" VisibleIndex="5">
                                                                                            </dx1:GridViewDataTextColumn>
                                                                                        </Columns>
                                                                                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                                                        <SettingsPager Mode="ShowAllRecords">
                                                                                        </SettingsPager>
                                                                                        <SettingsEditing Mode="Inline" />
                                                                                        <SettingsCookies StoreColumnsVisiblePosition="False" Version="2" />
                                                                                        <Styles>
                                                                                            <CommandColumnItem>
                                                                                                <Paddings PaddingLeft="2px" />
                                                                                            </CommandColumnItem>
                                                                                        </Styles>
                                                                                        <SettingsCommandButton>
                                                                                            <EditButton Text="Edit">
                                                                                                <Image Height="10px" Url="~/Images/edit.png">
                                                                                                </Image>
                                                                                            </EditButton>
                                                                                            <DeleteButton Text="Delete">
                                                                                                <Image Height="10px" Url="~/Images/delete.png">
                                                                                                </Image>
                                                                                            </DeleteButton>
                                                                                            <CancelButton Text="Cancel">
                                                                                                <Image Height="18px" Url="~/Images/cancel.png">
                                                                                                </Image>
                                                                                            </CancelButton>
                                                                                            <UpdateButton Text="Save">
                                                                                                <Image Height="18px" Url="~/Images/save.png">
                                                                                                </Image>
                                                                                            </UpdateButton>
                                                                                        </SettingsCommandButton>
                                                                                    </dx1:ASPxGridView>
                                                                                </td>
                                                                                <td>&nbsp;</td>
                                                                                <td>
                                                                                    <dx1:ASPxGridView ID="ASPxGridViewActions" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridViewItemActions" EnableTheming="True" Font-Size="8pt" KeyFieldName="Hidden_id" onbeforeperformdataselect="ASPxGridViewActions_BeforePerformDataSelect" oncelleditorinitialize="ASPxGridViewActions_CellEditorInitialize" onhtmlrowprepared="ASPxGridViewActions_HtmlRowPrepared" onload="ASPxGridViewActions_Load" onrowdeleting="ASPxGridViewActions_RowDeleting" onrowinserting="ASPxGridViewActions_RowInserting" onrowupdating="ASPxGridViewActions_RowUpdating" Theme="Aqua" Width="100%">
                                                                                        <Columns>
                                                                                            <dx1:GridViewCommandColumn ButtonType="Image" Caption=" " ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" Width="60px" />
                                                                                            <dx1:GridViewDataComboBoxColumn Caption="Type" FieldName="INTERVENTION_TYPE" Name="INTERVENTION_TYPE" VisibleIndex="2" Width="180px">
                                                                                                <EditCellStyle Font-Size="8pt">
                                                                                                </EditCellStyle>
                                                                                            </dx1:GridViewDataComboBoxColumn>
                                                                                            <dx1:GridViewDataTextColumn Caption="Comments" FieldName="COMMENTS" Name="COMMENTS" VisibleIndex="4">
                                                                                                <EditCellStyle Font-Size="8pt">
                                                                                                </EditCellStyle>
                                                                                                <CellStyle HorizontalAlign="Left">
                                                                                                </CellStyle>
                                                                                            </dx1:GridViewDataTextColumn>
                                                                                            <dx1:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" Name="Hidden_id" Visible="False" VisibleIndex="5">
                                                                                            </dx1:GridViewDataTextColumn>
                                                                                            <dx1:GridViewDataCheckColumn Caption="Charge?" FieldName="CHARGEABLE" Name="CHARGEABLE" Visible="False" VisibleIndex="3" Width="50px">
                                                                                            </dx1:GridViewDataCheckColumn>
                                                                                        </Columns>
                                                                                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                                                        <SettingsPager Mode="ShowAllRecords">
                                                                                        </SettingsPager>
                                                                                        <SettingsEditing Mode="Inline" />
                                                                                        <SettingsCookies StoreColumnsVisiblePosition="False" Version="3" />
                                                                                        <Styles>
                                                                                            <CommandColumnItem>
                                                                                                <Paddings PaddingLeft="2px" />
                                                                                            </CommandColumnItem>
                                                                                        </Styles>
                                                                                        <SettingsCommandButton>
                                                                                            <EditButton Text="Edit">
                                                                                                <Image Height="10px" Url="~/Images/edit.png">
                                                                                                </Image>
                                                                                            </EditButton>
                                                                                            <DeleteButton Text="Delete">
                                                                                                <Image Height="10px" Url="~/Images/delete.png">
                                                                                                </Image>
                                                                                            </DeleteButton>
                                                                                            <CancelButton Text="Cancel">
                                                                                                <Image Height="18px" Url="~/Images/cancel.png">
                                                                                                </Image>
                                                                                            </CancelButton>
                                                                                            <UpdateButton Text="Save">
                                                                                                <Image Height="18px" Url="~/Images/save.png">
                                                                                                </Image>
                                                                                            </UpdateButton>
                                                                                        </SettingsCommandButton>
                                                                                    </dx1:ASPxGridView>
                                                                                    <br />
                                                                                    <span class="style93" style="text-align: right"><span class="style94">*</span> Please review all action types (power, radio etc) and add comments where appropriate</span></td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                    </DetailRow>
                                                                </Templates>
                                                                <Border BorderWidth="0px" />
                                                                <SettingsCommandButton>
                                                                    <EditButton Text="Edit">
                                                                        <Image Height="10px" Url="~/Images/Edit.png">
                                                                        </Image>
                                                                    </EditButton>
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
                                                            <table class="dxflInternalEditorTable_Metropolis">
                                                                <tr>
                                                                    <td colspan="6" style="text-align: right; padding-top: 12px;">
                                                                        <span class="style11">
                                                                        <dx:ASPxImage ID="ASPxImage8" runat="server" Height="28px" 
                                                                            ImageUrl="~/Images/arrival.png" 
                                                                            style="text-align: right; background-color: #FFFFFF;" ToolTip="Return" 
                                                                            Width="28px">
                                                                        </dx:ASPxImage>
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style73" colspan="6" 
                                                                        
                                                                        style="border-right: 1px solid #6999E0; border-top: 1px solid #6999E0; text-align: right; border-left-color: #6999E0; border-left-width: 1px; border-bottom-color: #6999E0; border-bottom-width: 1px;" 
                                                                        width="120">
                                                                        Return to base <span class="style75"><strong><font size="3">/3</font></strong></span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border-left: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; padding: 2px; text-align: right; background-color: #EEEEEE;" 
                                                                        width="120">
                                                                        <span class="style10">Spare parts returned:</span></td>
                                                                    <td style="text-align: left; background-color: #EEEEEE">
                                                                        <span class="style11">
                                                                        <%--<dx:ASPxComboBox ID="ASPxComboSparePartsRet" runat="server" Font-Size="8pt" 
                                                                            Theme="Aqua" Width="200px">
                                                                            <ClientSideEvents KeyDown="function(s, e) {
	                                                                             // 'Delete' button key code = 46
                                                                               if (e.htmlEvent.keyCode == 46)
                                                                                     s.SetSelectedIndex(-1);
                                                                            }" />
                                                                            <DisabledStyle ForeColor="Black">
                                                                            </DisabledStyle>
                                                                        </dx:ASPxComboBox>--%>
                                                                        <dx:ASPxDropDownEdit ID="ASPxDropDownSparePartsRet" AllowUserInput="False" ClientInstanceName="sparepartsdropdownret" Width="210px" runat="server" 
                                                                            AnimationType="None" Theme="Aqua" >
                
        <DropDownWindowStyle BackColor="#EDEDED" />
        <DropDownWindowTemplate>
            <dx:ASPxListBox Width="100%" ID="listBoxsparepartsret" SelectionMode="CheckColumn" ClientInstanceName="sparepartsret" runat="server">
                <Border BorderStyle="None" />
                <BorderBottom BorderStyle="Solid" BorderWidth="1px" BorderColor="#DCDCDC" />
                <Items>
                    <dx:ListEditItem Text="(Select all)" />
                </Items>
                <ClientSideEvents SelectedIndexChanged="function(s,e) {OnListBoxSelectionChanged(sparepartsdropdownret,e,s)}" />
            </dx:ASPxListBox>
            <table style="width: 100%" cellspacing="0" cellpadding="4">
                <tr>
                    <td align="right">
                        <dx:ASPxButton ID="ASPxButtonCloseDropDown" AutoPostBack="False" runat="server" Text="Close">
                            <ClientSideEvents Click="function(s, e)
                            {
                                sparepartsdropdownret.HideDropDown(); 
                            }" />
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </DropDownWindowTemplate>
        <ClientSideEvents TextChanged="function(s,e)
         {
            SynchronizeListBoxValues(sparepartsdropdownret, sparepartsret);
         }" DropDown="function(s,e)
         {
            SynchronizeListBoxValues(sparepartsdropdownret, sparepartsret);
         }" />
    </dx:ASPxDropDownEdit>


                                                                        </span>
                                                                    </td>
                                                                    <td style="border-left: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; padding: 2px; text-align: right; background-color: #F0FFFC;" 
                                                                        width="120">
                                                                        <span class="style10"><span class="style57">Return to base time</span>:</span></td>
                                                                    <td style="text-align: left; background-color: #F0FFFC;">
                                                                        <span class="style11">
                                                                        <dx:ASPxDateEdit ID="ASPxDateEditReturn" runat="server" 
                                                                            ClientInstanceName="returntime" DisplayFormatString="dd/MM/yyyy HH:mm" 
                                                                            EditFormat="DateTime" EditFormatString="dd/MM/yyyy HH:mm" 
                                                                            EnableClientSideAPI="True" Font-Size="8pt" MaxDate="2050-01-01" 
                                                                            MinDate="2000-01-01" style="font-size: 8pt" Theme="Aqua" Width="200px">
                                                                            <TimeSectionProperties Visible="True">
                                                                                <TimeEditProperties DisplayFormatString="HH:mm">
                                                                                </TimeEditProperties>
                                                                            </TimeSectionProperties>
                                                                            <ValidationSettings EnableCustomValidation="True">
                                                                            </ValidationSettings>
                                                                            <DisabledStyle ForeColor="Black">
                                                                            </DisabledStyle>
                                                                        </dx:ASPxDateEdit>
                                                                        </span>
                                                                    </td>
                                                                    <td class="style57" 
                                                                        style="border-left: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; padding: 2px; text-align: right; background-color: #F1F8FE;" 
                                                                        width="120">
                                                                        Last Visit to Home (km):</td>
                                                                    <td style="border-bottom: 1px solid #808080; text-align: left; padding-top: 3px; padding-bottom: 4px; background-color: #F1F8FE;">
                                                                        <dx:ASPxSpinEdit ID="ASPxSpinReturnToHome" runat="server" 
                                                                            ClientInstanceName="returntohome" DecimalPlaces="1" EnableClientSideAPI="True" 
                                                                            Font-Size="8pt" Height="21px" MaxValue="1000" Number="0" style="font-size: 8pt" 
                                                                            Theme="Aqua" ToolTip="From the last visited site to home" Width="200px">
                                                                            <ClientSideEvents NumberChanged="function(s, e) {

 totalkilometers.SetText(gridViewProblems.cpTotalKM + s.GetNumber());
 kilometersread.SetText(gridViewProblems.cpTotalKM + s.GetNumber());
                                                                                

}" />
                                                                            <ValidationSettings EnableCustomValidation="True">
                                                                            </ValidationSettings>
                                                                            <DisabledStyle ForeColor="Black">
                                                                            </DisabledStyle>
                                                                        </dx:ASPxSpinEdit>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="120">
                                                                        </td>
                                                                    <td>
                                                                        </td>
                                                                    <td width="120">
                                                                        </td>
                                                                    <td>
                                                                        </td>
                                                                    <td class="style57" style="padding-top: 8px" width="120">
                                                                        Total km Registered:</td>
                                                                    <td style="text-align: left; padding-top: 8px;">
                                                                        <dx:ASPxLabel ID="ASPxLabelTotalKm" runat="server" ClientIDMode="AutoID" 
                                                                            style="color: #CC3300; text-align: left; font-size: 8pt;" Text="n/a" 
                                                                            ClientInstanceName="totalkilometers">
                                                                            <ClientSideEvents Init="function(s, e) {
	s.SetText(gridViewProblems.cpTotalKM + returntohome.GetNumber());
}" />
                                                                        </dx:ASPxLabel>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style10" style="padding-top: 5px" width="120">
                                                                        Field engineer comments:</td>
                                                                    <td colspan="5" style="padding-top: 5px">
                                                                        <dx:ASPxMemo ID="ASPxMemoEngineerComments" runat="server" ClientIDMode="AutoID" 
                                                                            ClientInstanceName="engineercomments" 
                                                                            CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                                            CssPostfix="Office2003Blue" EnableClientSideAPI="True" Font-Names="8" 
                                                                            Height="40px" SpriteCssFilePath="~/App_Themes/Office2003Blue/{0}/sprite.css" 
                                                                            style="font-size: 8pt" Theme="Aqua" Width="100%">
                                                                            <DisabledStyle ForeColor="Black">
                                                                            </DisabledStyle>
                                                                        </dx:ASPxMemo>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tr >
                                                            <td width="100%" style="padding-top: 12px; text-align: right;" colspan="2">
                                                                <dx:ASPxImage ID="ASPxImage3" runat="server" Height="30px" 
                                                                    ImageUrl="~/Images/expenses.png" ToolTip="Expenses" Width="30px">
                                                                </dx:ASPxImage>
                                                            </td>
                                                            </tr>
                                                                <tr>
                                                                    <td style="border-right: 1px solid #6999E0; border-top: 1px solid #6999E0; text-align: left; border-left-color: #6999E0; border-left-width: 1px; border-bottom-color: #6999E0; border-bottom-width: 1px; background-color: #8BABDA; border-top-style: solid; border-right-style: none; padding-left: 2px; padding-top: 1px; padding-bottom: 1px;" 
                                                                        width="50%">
                                                                        &nbsp;</td>
                                                                    <td style="border-right: 1px solid #6999E0; border-top: 1px solid #6999E0; text-align: right; border-left-color: #6999E0; border-left-width: 1px; border-bottom-color: #6999E0; border-bottom-width: 1px; background-color: #8BABDA; width: 50%; padding-right: 2px; padding-top: 1px; padding-bottom: 1px;" 
                                                                        width="50%">
                                                                        <span class="style81">Expenses</span>&nbsp;<span class="style75"><strong><font 
                                                                            size="3">/4,5,6,7</font></strong></span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left; background-color: #FFFFF0; padding-top: 8px; padding-bottom: 8px; padding-left: 2px;" 
                                                                        width="50%">
                                                                        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Font-Size="8pt" 
                                                                            Text="Show Expenses Panel &gt;&gt;" Theme="BlackGlass" 
                                                                            style="font-weight: 700" Cursor="pointer">
                                                                            <ClientSideEvents Click="function(s, e) {
	panelexpenses.SetVisible(!panelexpenses.GetVisible());
	var expanded = panelexpenses.GetVisible();
	if (expanded)
	{
		s.SetText('Hide Expenses Panel &lt;&lt;');
		ASPxLabelTE.SetVisible(false);
		totalcost0.SetVisible(false);
		ASPxLabelEA.SetVisible(false);
		startend0.SetVisible(false);
	}
	else
	{
        var cost = CalculateCost();
        var credit = CalculateCredit();

		totalcost0.SetText(String(cost+credit));
		s.SetText('Show Expenses Panel &gt;&gt;');
		ASPxLabelTE.SetVisible(true);
		totalcost0.SetVisible(true);
		ASPxLabelEA.SetVisible(true);
		startend0.SetVisible(true);
	}
}" />
                                                                        </dx:ASPxHyperLink>
                                                                    </td>
                                                                    <td class="style86" 
                                                                        
                                                                        style="padding-top: 8px; padding-bottom: 8px; padding-right: 2px; text-align: right;" 
                                                                        width="50%">
                                                                        <strong>
                                                                        <span class="style87">
                                                                        <dx:ASPxLabel ID="ASPxLabelTEA" runat="server" ClientInstanceName="ASPxLabelEA" 
                                                                            Font-Bold="True" style="font-size: 8pt; color: #999999" Text="Start - End km:">
                                                                        </dx:ASPxLabel>
                                                                        &nbsp;<dx:ASPxLabel ID="ASPxLabelTotalKmStartEnd0" runat="server" 
                                                                            ClientIDMode="AutoID" ClientInstanceName="startend0" Font-Bold="True" 
                                                                            Font-Size="8pt" style="color: #CC3300; text-align: left; font-size: 8pt;" 
                                                                            Text="n/a">
                                                                        </dx:ASPxLabel>
                                                                        </span>
                                                                        <dx:ASPxLabel ID="ASPxLabelTE" runat="server" ClientInstanceName="ASPxLabelTE" 
                                                                            Font-Bold="True" style="font-size: 8pt; color: #999999" 
                                                                            Text=", Total Expenses:">
                                                                        </dx:ASPxLabel>
                                                                        </strong>&nbsp;<strong><dx:ASPxLabel ID="ASPxLabelTotalCost0" runat="server" 
                                                                            ClientIDMode="AutoID" ClientInstanceName="totalcost0" Font-Bold="True" 
                                                                            Font-Size="8pt" style="color: #CC3300; text-align: left; font-size: 8pt;" 
                                                                            Text="n/a">
                                                                        </dx:ASPxLabel>
                                                                        </strong>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left; background-color: #F7FAF1" width="100%" 
                                                                        colspan="2">
                                                                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" BackColor="Ivory" 
                                                                            ClientInstanceName="panelexpenses" ClientVisible="False" 
                                                                            EnableClientSideAPI="True" Width="100%">
                                                                            <PanelCollection>
                                                                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                                                                    <table class="dxflInternalEditorTable_Office2003Blue" width="100%">
                                                                                        <tr>
                                                                                            <td colspan="2" 
                                                                                                
                                                                                                style="border-right: 1px solid #6999E0; border-top: 1px solid #6999E0; border-left-width: 1px; border-bottom-width: 1px; padding-right: 3px; border-left-color: #6999E0; border-bottom-color: #6999E0; background-color: #9CBCEA; text-align: right;">
                                                                                                <span class="style88">Kiilometers</span> <span class="style75"><font size="3">
                                                                                                <strong style="text-align: right">/4</strong></font></span></td>
                                                                                            <td width="100px">
                                                                                                &nbsp;</td>
                                                                                            <td class="style48" colspan="4" 
                                                                                                
                                                                                                
                                                                                                
                                                                                                style="border-color: #6999E0; border-top-style: solid; border-right-style: solid; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width: 1px; padding-right: 3px;">
                                                                                                Expenses <span class="style75"><font size="3"><strong>/5</strong></font></span></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style46" 
                                                                                                style="border-left-width: 1px; border-bottom-width: 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: #CCCCCC; border-left-color: #CCCCCC;">
                                                                                                Start km Indicator:</td>
                                                                                            <td class="style45">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinStart" runat="server" 
                                                                                                    ClientInstanceName="spinstart" DecimalPlaces="1" EnableClientSideAPI="True" 
                                                                                                    Font-Size="8pt" Height="21px" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
	startend.SetText(String(spinend.GetValue()-spinstart.GetValue()));
	startend0.SetText(String(spinend.GetValue()-spinstart.GetValue()));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                            </td>
                                                                                            <td width="100px">
                                                                                            </td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td style="border-left-width: 1px; background-color: #FFF3F0; border-left-color: #CCCCCC; border-left-style: solid;">
                                                                                                &nbsp;</td>
                                                                                            <td class="style90">
                                                                                                Cash </td>
                                                                                            <td class="style90">
                                                                                                Credit </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style46" 
                                                                                                style="border-bottom-style: solid; border-left-style: solid; border-bottom-width: 1px; border-left-width: 1px; border-bottom-color: #CCCCCC; border-left-color: #CCCCCC;" 
                                                                                                width="100px">
                                                                                                End km Indicator:</td>
                                                                                            <td class="style45" 
                                                                                                style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #808080; padding-bottom: 5px;">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinEnd" runat="server" ClientInstanceName="spinend" 
                                                                                                    DecimalPlaces="1" EnableClientSideAPI="True" Font-Size="8pt" Height="21px" 
                                                                                                    Number="0" style="font-size: 8pt" Theme="Aqua" Width="150px">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
	startend.SetText(String(spinend.GetValue()-spinstart.GetValue()));
	startend0.SetText(String(spinend.GetValue()-spinstart.GetValue()));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid; text-align: right;" 
                                                                                                width="140px">
                                                                                                Gas cost:</td>
                                                                                            <td class="style84" width="210">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinGas" runat="server" ClientInstanceName="spingas" 
                                                                                                    DecimalPlaces="2" EnableClientSideAPI="True" Font-Size="8pt" Height="21px" 
                                                                                                    MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" DisplayFormatString="N" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var cost = CalculateCost();
	totalcost.SetText(String(cost));
    totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));


}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelGas" runat="server" Font-Size="8pt" 
                                                                                                    style="color: #C0C0C0" CssClass="Inline">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinGas_credit" runat="server" 
                                                                                                    ClientInstanceName="spingas_credit" DecimalPlaces="2" 
                                                                                                    EnableClientSideAPI="True" Font-Size="8pt" Height="21px" MaxValue="5000" 
                                                                                                    Number="0" style="font-size: 8pt" Theme="Aqua" Width="150px" 
                                                                                                    DisplayFormatString="N" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var credit = CalculateCredit();
    totalcost0.SetText(String(credit));
    totalcostcredit.SetText(String(credit));

}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelGas_credit" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style37">
                                                                                                Start - End km:</td>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="ASPxLabelTotalKmStartEnd" runat="server" 
                                                                                                    ClientIDMode="AutoID" ClientInstanceName="startend" Font-Size="8pt" 
                                                                                                    style="color: #CC3300; text-align: left; font-size: 8pt;" Text="n/a">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-style: solid; border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-left-style: solid;">
                                                                                                Toll cost:</td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinToll" runat="server" ClientInstanceName="spintoll" 
                                                                                                    DecimalPlaces="2" EnableClientSideAPI="True" Font-Size="8pt" Height="21px" 
                                                                                                    MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" DisplayFormatString="N" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
        var cost = CalculateCost();
		totalcost.SetText(String(cost));
        totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelToll" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style84">
                                                                                                &nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style37">
                                                                                                Total km Registered:</td>
                                                                                            <td style="text-align: left">
                                                                                                <dx:ASPxLabel ID="ASPxLabelTotalKmRegistered" runat="server" 
                                                                                                    ClientIDMode="AutoID" ClientInstanceName="kilometersread" Font-Size="8pt" 
                                                                                                    style="color: #CC3300; text-align: left; font-size: 8pt;" Text="n/a">
                                                                                                    <ClientSideEvents Init="function(s, e) {
	s.SetText(gridViewProblems.cpTotalKM + returntohome.GetNumber());
}" />
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-style: solid; border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-left-style: solid;">
                                                                                                Consumables cost:</td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinConsumables" runat="server" 
                                                                                                    ClientInstanceName="consumablecost" DecimalPlaces="2" 
                                                                                                    EnableClientSideAPI="True" Font-Size="8pt" Height="21px" MaxValue="5000" 
                                                                                                    Number="0" style="font-size: 8pt" Theme="Aqua" Width="150px" 
                                                                                                    DisplayFormatString="N" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
        var cost = CalculateCost();
		totalcost.SetText(String(cost));
		totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelConsumables" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinConsumables_credit" runat="server" 
                                                                                                    ClientInstanceName="consumablecost_credit" DecimalPlaces="2" 
                                                                                                    EnableClientSideAPI="True" Font-Size="8pt" Height="21px" MaxValue="5000" 
                                                                                                    Number="0" style="font-size: 8pt" Theme="Aqua" Width="150px" 
                                                                                                    DisplayFormatString="N" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
        var credit = CalculateCredit();
        totalcost0.SetText(String(credit));
        totalcostcredit.SetText(String(credit));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelConsumables_credit" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style37">
                                                                                                &nbsp;</td>
                                                                                            <td style="text-align: left;">
                                                                                                &nbsp;</td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid">
                                                                                                Out of base:</td>
                                                                                            <td class="style84" 
                                                                                                style="border-bottom-color: #CCCCCC; border-bottom-width: 1px; border-bottom-style: solid;">
                                                                                                <dx:ASPxCheckBox ID="ASPxCheckOut" runat="server" CheckState="Unchecked" 
                                                                                                    ClientInstanceName="checkout" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    style="font-size: 8pt" Theme="DevEx">
                                                                                                    <ClientSideEvents CheckedChanged="function(s, e) {

	if (s.GetChecked() == false)
	{
	spinmeals.SetValue(0);
	spinmeals.SetEnabled(false);

        var cost = CalculateCost();
		totalcost.SetText(String(cost));
		totalcost0.SetText(String(cost));

		//var cash = CalculateCash();
    	costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));
	}

	if (s.GetChecked() == true)
	{
	spinmeals.SetEnabled(true);
	}
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxCheckBox>
                                                                                            </td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-style: solid; border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-left-style: none;">
                                                                                                Meals cost:</td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinMeals" runat="server" 
                                                                                                    ClientInstanceName="spinmeals" DecimalPlaces="2" EnableClientSideAPI="True" 
                                                                                                    Font-Size="8pt" Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" 
                                                                                                    Theme="Aqua" Width="150px" DisplayFormatString="N" CssClass="Inline">
                                                                                                    <ClientSideEvents Init="function(s, e) {
	
	if (checkout.GetChecked() == false)
	{
	s.SetEnabled(false);
	}
}" NumberChanged="function(s, e) {
        var cost = CalculateCost();
		totalcost.SetText(String(cost));
		totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelMeals" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style84">
                                                                                                &nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style33">
                                                                                                <dx:ASPxMenu ID="ASPxMenuCheckFleet" runat="server" BackColor="Ivory" 
                                                                                                    EnableTheming="True" Theme="Metropolis" ForeColor="Black">
                                                                                                    <Items>
                                                                                                        <dx:MenuItem Name="CheckFleet" NavigateUrl="~/System_Views/Fleet_Report.aspx" 
                                                                                                            Target="_blank" Text="Check Fleet">
                                                                                                            <Image Height="12px" Url="~/Images/question.png" Width="14px">
                                                                                                            </Image>
                                                                                                        </dx:MenuItem>
                                                                                                    </Items>
                                                                                                    <DisabledStyle ForeColor="#CCCCCC">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxMenu>
                                                                                            </td>
                                                                                            <td class="style33">
                                                                                                <dx:ASPxLabel ID="ASPxLabelTotalKmFleet" runat="server" ClientIDMode="AutoID" 
                                                                                                    ClientInstanceName="totalkilometers0" Font-Size="8pt" 
                                                                                                    style="color: #CC3300; text-align: left; font-size: 8pt;" Text="n/a" 
                                                                                                    ClientVisible="False">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style83" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid">
                                                                                                Overnight:</td>
                                                                                            <td class="style82" 
                                                                                                style="border-bottom-color: #CCCCCC; border-bottom-width: 1px; border-bottom-style: solid">
                                                                                                <dx:ASPxCheckBox ID="ASPxCheckOvernight" runat="server" CheckState="Unchecked" 
                                                                                                    ClientInstanceName="checkovernight" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    style="font-size: 8pt" Theme="DevEx">
                                                                                                    <ClientSideEvents CheckedChanged="function(s, e) {

	if (s.GetChecked() == false)
	{
	    spinovernight.SetValue(0);
	    spinovernight.SetEnabled(false);

	    spinovernight_credit.SetValue(0);
	    spinovernight_credit.SetEnabled(false);

        var cost = CalculateCost();
		totalcost.SetText(String(cost));
		totalcost0.SetText(String(cost));

		var credit = CalculateCredit();
        totalcostcredit.SetText(String(credit));
        
        //var cash = CalculateCash();
    	costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));
    }

	if (s.GetChecked() == true)
	{
	spinovernight.SetEnabled(true);
	spinovernight_credit.SetEnabled(true);	
	}
	
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxCheckBox>
                                                                                            </td>
                                                                                            <td class="style83" 
                                                                                                
                                                                                                style="border-bottom-color: #CCCCCC; border-bottom-width: 1px; border-bottom-style: solid; ">
                                                                                                Overnight cost:</td>
                                                                                            <td class="style82">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinOvernight" runat="server" 
                                                                                                    ClientInstanceName="spinovernight" DecimalPlaces="2" EnableClientSideAPI="True" 
                                                                                                    Font-Size="8pt" Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" 
                                                                                                    Theme="Aqua" Width="150px" DisplayFormatString="N" CssClass="Inline">
                                                                                                    <ClientSideEvents Init="function(s, e) {

	if (checkovernight.GetChecked() == false)
	{
	s.SetEnabled(false);
	}
}" NumberChanged="function(s, e) {
        var cost = CalculateCost();
		totalcost.SetText(String(cost));
		totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelOvernight" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style82">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinOvernight_credit" runat="server" 
                                                                                                    ClientInstanceName="spinovernight_credit" DecimalPlaces="2" 
                                                                                                    EnableClientSideAPI="True" Font-Size="8pt" Height="21px" MaxValue="5000" 
                                                                                                    Number="0" style="font-size: 8pt" Theme="Aqua" Width="150px" 
                                                                                                    DisplayFormatString="N" CssClass="Inline">
                                                                                                    <ClientSideEvents Init="function(s, e) {

	if (checkovernight.GetChecked() == false)
	{
	s.SetEnabled(false);
	}
}" NumberChanged="function(s, e) {
        var credit = CalculateCredit();
        totalcost0.SetText(String(credit));
        totalcostcredit.SetText(String(credit));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelOvernight_credit" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style33">
                                                                                                &nbsp;</td>
                                                                                            <td class="style33">
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid;">
                                                                                                Taxi cost:</td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinTaxi" runat="server" ClientInstanceName="spintaxi" 
                                                                                                    DecimalPlaces="2" DisplayFormatString="N" EnableClientSideAPI="True" 
                                                                                                    Font-Size="8pt" Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" 
                                                                                                    Theme="Aqua" Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var cost = CalculateCost();
	totalcost.SetText(String(cost));
    totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));


}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelTaxi" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinTaxi_credit" runat="server" 
                                                                                                    ClientInstanceName="spintaxi_credit" DecimalPlaces="2" DisplayFormatString="N" 
                                                                                                    EnableClientSideAPI="True" Font-Size="8pt" Height="21px" MaxValue="5000" 
                                                                                                    Number="0" style="font-size: 8pt" Theme="Aqua" Width="150px" 
                                                                                                    CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
        var credit = CalculateCredit();
        totalcost0.SetText(String(credit));
        totalcostcredit.SetText(String(credit));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelTaxi_credit" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style68" colspan="2" 
                                                                                                style="border-color: #6999E0; border-top-style: solid; border-right-style: solid; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width: 1px; padding-right: 3px;">
                                                                                                Overtimes <span class="style75"><font size="3"><strong>/6</strong></font></span></td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid;">
                                                                                                Parking cost:</td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinParking" runat="server" 
                                                                                                    ClientInstanceName="spinparking" DecimalPlaces="2" DisplayFormatString="N" 
                                                                                                    EnableClientSideAPI="True" Font-Size="8pt" Height="21px" MaxValue="5000" 
                                                                                                    Number="0" style="font-size: 8pt" Theme="Aqua" Width="150px" 
                                                                                                    CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var cost = CalculateCost();
	totalcost.SetText(String(cost));
    totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));


}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelParking" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinParking_credit" runat="server" 
                                                                                                    ClientInstanceName="spinparking_credit" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var credit = CalculateCredit();
    totalcost0.SetText(String(credit));
    totalcostcredit.SetText(String(credit));

}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelParking_credit" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style39" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid">
                                                                                                Overtime:</td>
                                                                                            <td class="style79">
                                                                                                <dx:ASPxCheckBox ID="ASPxCheckOvertime" runat="server" CheckState="Unchecked" 
                                                                                                    ClientInstanceName="checkovertime" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    style="font-size: 8pt" Theme="DevEx">
                                                                                                    <ClientSideEvents CheckedChanged="function(s, e) {
	if (s.GetChecked() == false)
	{
	spinovertime.SetValue(0);
	overtimecomments.SetText('');
	spinovertime.SetEnabled(false);
	overtimecomments.SetEnabled(false);
	}

	if (s.GetChecked() == true)
	{
	spinovertime.SetEnabled(true);
	overtimecomments.SetEnabled(true);
	}
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxCheckBox>
                                                                                            </td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid;">
                                                                                                Other car expenses:</td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinOtherCarExpenses" runat="server" 
                                                                                                    ClientInstanceName="spinothercarexpenses" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var cost = CalculateCost();
	totalcost.SetText(String(cost));
    totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));


}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelOtherCarExpenses" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinOtherCarExpenses_credit" runat="server" 
                                                                                                    ClientInstanceName="spinothercarexpenses_credit" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var credit = CalculateCredit();
    totalcost0.SetText(String(credit));
    totalcostcredit.SetText(String(credit));

}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelOtherCarExpenses_credit" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style39" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid">
                                                                                                Hours:</td>
                                                                                            <td class="style79">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinOvertime" runat="server" 
                                                                                                    ClientInstanceName="spinovertime" CssClass="Inline" DecimalPlaces="1" 
                                                                                                    EnableClientSideAPI="True" Font-Size="8pt" Height="21px" MaxValue="100" 
                                                                                                    Number="0" style="font-size: 8pt" Theme="Aqua" Width="150px">
                                                                                                    <ClientSideEvents Init="function(s, e) {
	if (checkovertime.GetChecked() == false)
	{
	s.SetEnabled(false)
	}
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelOvertime" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid;">
                                                                                                Ferry tickets:</td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinFerryTickets" runat="server" 
                                                                                                    ClientInstanceName="spinferrytickets" DecimalPlaces="2" DisplayFormatString="N" 
                                                                                                    EnableClientSideAPI="True" Font-Size="8pt" Height="21px" MaxValue="5000" 
                                                                                                    Number="0" style="font-size: 8pt" Theme="Aqua" Width="150px" 
                                                                                                    CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var cost = CalculateCost();
	totalcost.SetText(String(cost));
    totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));


}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelFerryTickets" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinFerryTickets_credit" runat="server" 
                                                                                                    ClientInstanceName="spinferrytickets_credit" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
        var credit = CalculateCredit();
        totalcost0.SetText(String(credit));
        totalcostcredit.SetText(String(credit));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelFerryTickets_credit" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style39" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid">
                                                                                                &nbsp;</td>
                                                                                            <td class="style79">
                                                                                                <span class="style11">
                                                                                                <dx:ASPxMemo ID="ASPxMemoOvertimeComments" runat="server" 
                                                                                                    ClientInstanceName="overtimecomments" EnableClientSideAPI="True" 
                                                                                                    Font-Size="8pt" Height="21px" NullText="overtimes authorized by..." 
                                                                                                    Theme="Aqua" Width="100%">
                                                                                                    <ClientSideEvents Init="function(s, e) {
	if (checkovertime.GetChecked() == false)
	{
	s.SetEnabled(false)
	}
}" />
                                                                                                    <NullTextStyle Font-Size="8pt" ForeColor="#CCCCCC">
                                                                                                    </NullTextStyle>
                                                                                                    <DisabledStyle ForeColor="#999999">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxMemo>
                                                                                                </span></td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid;">
                                                                                                Ferry car limit violation:</td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinFerryCarLimitViolation" runat="server" 
                                                                                                    ClientInstanceName="spinferrycarlimitviolation" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var cost = CalculateCost();
	totalcost.SetText(String(cost));
    totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));


}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelFerryCarLimitViolation" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinFerryCarLimitViolation_credit" runat="server" 
                                                                                                    ClientInstanceName="spinferrycarlimitviolation_credit" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
        var credit = CalculateCredit();
        totalcost0.SetText(String(credit));
        totalcostcredit.SetText(String(credit));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelFerryCarLimitViolation_credit" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style33">
                                                                                                &nbsp;</td>
                                                                                            <td class="style33">
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid;">
                                                                                                Airline tickets:</td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinAirlineTickets" runat="server" 
                                                                                                    ClientInstanceName="spinairlinetickets" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var cost = CalculateCost();
	totalcost.SetText(String(cost));
    totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));


}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelAirlineTickets" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinAirlineTickets_credit" runat="server" 
                                                                                                    ClientInstanceName="spinairlinetickets_credit" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
var credit = CalculateCredit();
        totalcost0.SetText(String(credit));
        totalcostcredit.SetText(String(credit));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelAirlineTickets_credit" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style68" colspan="2" 
                                                                                                style="border-color: #6999E0; border-top-style: solid; border-right-style: solid; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width: 1px; padding-right: 3px;">
                                                                                                Advance <span class="style75"><font size="3"><strong>/7</strong></font></span></td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid;">
                                                                                                Airline overweight:</td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinAirlineOverweight" runat="server" 
                                                                                                    ClientInstanceName="spinairlineoverweight" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var cost = CalculateCost();
	totalcost.SetText(String(cost));
    totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));


}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelAirlineOverweight" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinAirlineOverweight_credit" runat="server" 
                                                                                                    ClientInstanceName="spinairlineoverweight_credit" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
        var credit = CalculateCredit();
        totalcost0.SetText(String(credit));
        totalcostcredit.SetText(String(credit));

}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelAirlineOverweight_credit" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style41" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid">
                                                                                                Advance:</td>
                                                                                            <td class="style40">
                                                                                                <dx:ASPxCheckBox ID="ASPxCheckAdvance" runat="server" CheckState="Unchecked" 
                                                                                                    ClientInstanceName="checkadvance" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    style="font-size: 8pt" Theme="DevEx">
                                                                                                    <ClientSideEvents CheckedChanged="function(s, e) {

	if (s.GetChecked() == false)
	{
	spinadvance.SetValue(0);
	spinadvance.SetEnabled(false);
    costadvance.SetText(CalculateCost());
	}

	if (s.GetChecked() == true)
	{
	spinadvance.SetEnabled(true);
    costadvance.SetText(CalculateCost()-spinadvance.GetValue());
	}	
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxCheckBox>
                                                                                            </td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td class="style85" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid;">
                                                                                                Other tickets:</td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinOtherTickets" runat="server" 
                                                                                                    ClientInstanceName="spinothertickets" DecimalPlaces="2" DisplayFormatString="N" 
                                                                                                    EnableClientSideAPI="True" Font-Size="8pt" Height="21px" MaxValue="5000" 
                                                                                                    Number="0" style="font-size: 8pt" Theme="Aqua" Width="150px" 
                                                                                                    CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var cost = CalculateCost();
	totalcost.SetText(String(cost));
    totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));


}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelOtherTickets" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style84">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinOtherTickets_credit" runat="server" 
                                                                                                    ClientInstanceName="spinothertickets_credit" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    /*var cost = CalculateCost();
	totalcost.SetText(String(cost));
    totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));
    totalcostcredit.SetText(String(cost));*/
    var credit = CalculateCredit();
        totalcost0.SetText(String(credit));
        totalcostcredit.SetText(String(credit));

}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelOtherTickets_credit" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style41" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid">
                                                                                                Advance amount:</td>
                                                                                            <td class="style40" 
                                                                                                style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #808080; padding-bottom: 5px;">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinAdvance" runat="server" 
                                                                                                    ClientInstanceName="spinadvance" CssClass="Inline" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" Font-Size="8pt" Height="21px" MaxValue="5000" 
                                                                                                    Number="0" style="font-size: 8pt" Theme="Aqua" Width="150px">
                                                                                                    <ClientSideEvents Init="function(s, e) {

	if (checkadvance.GetChecked() == false)
	{
	s.SetEnabled(false);
	}	
}" NumberChanged="function(s, e) {
      var cash = CalculateCost();
      costadvance.SetText(String(Math.round((cash-spinadvance.GetValue())*100)/100));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelAdvance" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td class="style83" 
                                                                                                style="border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid; border-left-style: solid; padding-bottom: 5px;">
                                                                                                Office expenses:</td>
                                                                                            <td class="style82" 
                                                                                                style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #808080; padding-bottom: 5px;">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinOfficeExpenses" runat="server" 
                                                                                                    ClientInstanceName="spinofficeexpenses" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    var cost = CalculateCost();
	totalcost.SetText(String(cost));
    totalcost0.SetText(String(cost));

	//var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cost-spinadvance.GetValue())*100)/100));


}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelOfficeExpenses" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td class="style82" 
                                                                                                style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #808080; padding-bottom: 5px;">
                                                                                                <dx:ASPxSpinEdit ID="ASPxSpinOfficeExpenses_credit" runat="server" 
                                                                                                    ClientInstanceName="spinofficeexpenses_credit" DecimalPlaces="2" 
                                                                                                    DisplayFormatString="N" EnableClientSideAPI="True" Font-Size="8pt" 
                                                                                                    Height="21px" MaxValue="5000" Number="0" style="font-size: 8pt" Theme="Aqua" 
                                                                                                    Width="150px" CssClass="Inline">
                                                                                                    <ClientSideEvents NumberChanged="function(s, e) {
    /*var cost = CalculateCost();
	totalcost.SetText(String(cost));
    totalcost0.SetText(String(cost));

	var cash = CalculateCash();
    costadvance.SetText(String(Math.round((cash-spinadvance.GetValue())*100)/100));
    totalcostcredit.SetText(String(cost));*/
    var credit = CalculateCredit();
        totalcost0.SetText(String(credit));
        totalcostcredit.SetText(String(credit));
}" />
                                                                                                    <DisabledStyle ForeColor="Black">
                                                                                                    </DisabledStyle>
                                                                                                </dx:ASPxSpinEdit>
                                                                                                <dx:ASPxLabel ID="ASPxLabelOfficeExpenses_credit" runat="server" CssClass="Inline" 
                                                                                                    Font-Size="8pt" style="color: #C0C0C0">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right; padding-top: 5px;" class="style91">
                                                                                                Cash - Advance:</td>
                                                                                            <td style="padding-top: 5px;">
                                                                                                <dx:ASPxLabel ID="ASPxLabelCostMinusAdvance" runat="server" 
                                                                                                    ClientIDMode="AutoID" ClientInstanceName="costadvance" Font-Size="8pt" 
                                                                                                    style="color: #CC3300; text-align: left; font-size: 8pt;" Text="n/a">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="style37" style="padding-top: 5px; padding-bottom: 5px">
                                                                                                Total cash/credit:</td>
                                                                                            <td style="text-align: left; padding-top: 5px; padding-bottom: 5px;">
                                                                                                <dx:ASPxLabel ID="ASPxLabelTotalCost" runat="server" ClientIDMode="AutoID" 
                                                                                                    ClientInstanceName="totalcost" Font-Size="8pt" 
                                                                                                    style="color: #CC3300; text-align: left; font-size: 8pt;" Text="n/a">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td style="text-align: left; padding-top: 5px; padding-bottom: 5px;">
                                                                                                <dx:ASPxLabel ID="ASPxLabelTotalCostCredit" runat="server" 
                                                                                                    ClientIDMode="AutoID" ClientInstanceName="totalcostcredit" Font-Size="8pt" 
                                                                                                    style="color: #CC3300; text-align: left; font-size: 8pt;" Text="n/a">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="style10">
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="style37">
                                                                                                &nbsp;</td>
                                                                                            <td 
                                                                                                colspan="2">
                                                                                                &nbsp;</td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </dx:PanelContent>
                                                                            </PanelCollection>
                                                                        </dx:ASPxPanel>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>
                                            <dx:TabPage Name="Comments" Text="Comments">
                                                    <TabImage Height="14px" Url="~/Images/comments.png">
                                                    </TabImage>
                                                    <ContentCollection>
                                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                                        <table class="style3">
                                                                            <tr>
                                                                                <td>
                                                                                    <dx:ASPxMenu ID="ASPxMenuActions" runat="server" BackColor="White" 
                                                                                        EnableTheming="True" ItemAutoWidth="False" Theme="Metropolis" Width="100%">
                                                                                        <ClientSideEvents Init="function(s, e) {
	                                                                                        if(!gridviewInterventions.cpAllowNewIntervention)
	                                                                                        {
		                                                                                        s.SetEnabled(false);
	                                                                                        }
	                                                                                        else 
	                                                                                        {
                                                                                                s.SetEnabled(true);
	                                                                                        }
                                                                                        }" ItemClick="function(s, e) {
	                                                                                        gridviewInterventions.AddNewRow();

                                                                                        }" />
                                                                                        <Items>
                                                                                            <dx:MenuItem Text="New Comment">
                                                                                                <Image Height="10px" Url="~/Images/Add.png">
                                                                                                </Image>
                                                                                            </dx:MenuItem>
                                                                                        </Items>
                                                                                    </dx:ASPxMenu>
                                                                                </td>
                                                                            </tr>
                                                                            </table>
                                                                            <dx:ASPxGridView ID="ASPxGridViewInterventions" runat="server" 
                                                                                        AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                                                                        ClientInstanceName="gridviewInterventions" 
                                                                                        CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                                                        CssPostfix="Office2003Blue" KeyboardSupport="True" KeyFieldName="Hidden_id" 
                                                                                        OnCellEditorInitialize="ASPxGridViewInterventions_CellEditorInitialize" 
                                                                                        OnCommandButtonInitialize="ASPxGridViewInterventions_CommandButtonInitialize" 
                                                                                        OnCustomJSProperties="ASPxGridViewInterventions_CustomJSProperties" 
                                                                                        OnHtmlRowPrepared="ASPxGridViewInterventions_HtmlRowPrepared" 
                                                                                        OnRowDeleting="ASPxGridViewInterventions_RowDeleting" 
                                                                                        OnRowInserting="ASPxGridViewInterventions_RowInserting" 
                                                                                        OnRowUpdating="ASPxGridViewInterventions_RowUpdating" 
                                                                            Width="100%" style="font-size: 8pt" Theme="Office2003Blue">
                                                                                        <Columns>
                                                                                            <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" ShowEditButton="True" ShowDeleteButton="True" ShowCancelButton="True" ShowUpdateButton="True"/>
                                                                                            <dx:GridViewDataTextColumn Caption="From" FieldName="Team" Name="Team" 
                                                                                                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" 
                                                                                                Width="150px">
                                                                                                <PropertiesTextEdit>
                                                                                                    <ReadOnlyStyle BackColor="#F4F4F4" Font-Italic="True" ForeColor="#999999">
                                                                                                    </ReadOnlyStyle>
                                                                                                </PropertiesTextEdit>
                                                                                            </dx:GridViewDataTextColumn>
                                                                                            <dx:GridViewDataTextColumn Caption="Tooltip" FieldName="Tooltip" Name="Tooltip" 
                                                                                                ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                            <dx:GridViewDataTextColumn Caption="Hidden_update_right" 
                                                                                                FieldName="Hidden_update_right" Name="Hidden_update_right" 
                                                                                                ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                            <dx:GridViewDataTextColumn Caption="Hidden_id" FieldName="Hidden_id" 
                                                                                                Name="Hidden_id" ShowInCustomizationForm="True" Visible="False" 
                                                                                                VisibleIndex="6">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                            <dx:GridViewDataTextColumn Caption="Hidden_sch_id" FieldName="Hidden_sch_id" 
                                                                                                Name="Hidden_sch_id" ShowInCustomizationForm="True" Visible="False" 
                                                                                                VisibleIndex="6">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                            <dx:GridViewDataTextColumn Caption="Hidden_team_id" FieldName="Hidden_team_id" 
                                                                                                Name="Hidden_team_id" ShowInCustomizationForm="True" Visible="False" 
                                                                                                VisibleIndex="6">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                            <dx:GridViewDataMemoColumn Caption="Comments" FieldName="Comments" 
                                                                                                Name="Comments" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                                            </dx:GridViewDataMemoColumn>
                                                                                        </Columns>
                                                                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" 
                                                                                            ConfirmDelete="True" EnableRowHotTrack="True" />
                                                                                        <SettingsEditing Mode="Inline" />
                                                                                        <SettingsCookies Version="1" />
                                                                                        <Styles CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                                                            CssPostfix="Office2003Blue">
                                                                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                                            </Header>
                                                                                            <LoadingPanel ImageSpacing="10px">
                                                                                            </LoadingPanel>
                                                                                            <CommandColumn Spacing="2px">
                                                                                            </CommandColumn>
                                                                                        </Styles>
                                                                                        <StylesEditors>
                                                                                            <ProgressBar Height="25px">
                                                                                            </ProgressBar>
                                                                                        </StylesEditors>
                                                                                        <SettingsCommandButton>
                                                                                            <EditButton Text="Edit Action">
                                                                                                <Image Height="10px" Url="~/Images/Edit.png">
                                                                                                </Image>
                                                                                            </EditButton>
                                                                                            <NewButton Text="Add Action">
                                                                                                <Image Height="10px" Url="~/Images/Add.png">
                                                                                                </Image>
                                                                                            </NewButton>
                                                                                            <DeleteButton Text="Delete Action">
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
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>
                                                <dx:TabPage Name="Attachements" Text="Attachments" >
                                                    <TabImage Height="14px"  Url="~/Images/paperclip.png"></TabImage>
                                                    <ContentCollection>
                                                        <dx:ContentControl ID="ContentControl3" runat="server" SupportsDisabledAttribute="True">
                                                        <table width="100%">
                                                        <tr>
                                                            <td>
                                                                <dx:ASPxMenu ID="ASPxMenuAttachment" runat="server" BackColor="White" 
                                                                    ClientInstanceName="menuAttachment" ItemAutoWidth="False" 
                                                                    OnInit="ASPxMenuAttachment_Init" SeparatorWidth="0px" Theme="Metropolis"
                                                                    Width="100%">
                                                                    <ClientSideEvents ItemClick="function(s, e) {
	                                                                        if(e.item.name == &quot;AddAttachment&quot;) 
	                                                                        {
	                                                                            uploadcontrol.SetVisible(true);
	                                                                            menuAttachment.GetItemByName('AddAttachment').SetEnabled(false);
	                                                                            menuAttachment.GetItemByName('CancelAttachment').SetEnabled(true);
                                                                            }

	                                                                        if(e.item.name == &quot;CancelAttachment&quot;) 
	                                                                        {
	                                                                            menuAttachment.GetItemByName('AddAttachment').SetEnabled(true);
	                                                                            uploadcontrol.SetVisible(false);
	                                                                            menuAttachment.GetItemByName('CancelAttachment').SetEnabled(false);
	                                                                        }
                                                                        }" />
                                                                    <Items>
                                                                        <dx:MenuItem Name="AddAttachment" Text="Add Attachment">
                                                                            <Image Height="10px" Url="~/Images/add.png">
                                                                            </Image>
                                                                        </dx:MenuItem>
                                                                        <dx:MenuItem ClientEnabled="False" Name="CancelAttachment" Text="Cancel">
                                                                            <Image Height="10px" Url="~/Images/cancel.png">
                                                                            </Image>
                                                                        </dx:MenuItem>
                                                                    </Items>
                                                                </dx:ASPxMenu>
                                                                </td>
                                                            <td style="width: -200%">
                                                                    &nbsp;</td>
                                                        </tr>
                                                            <tr>
                                                                <td>
                                                                    <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" 
                                                                        CancelButtonHorizontalPosition="Left" CancelButtonSpacing="10px" 
                                                                        ClientIDMode="AutoID" ClientInstanceName="uploadcontrol" ClientVisible="False" 
                                                                        OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" 
                                                                        ShowProgressPanel="True" ShowUploadButton="True" Theme="Metropolis" 
                                                                        Width="299px">
                                                                        <ValidationSettings AllowedFileExtensions=".jpg, .xls, .jpeg, .bmp, .tif, .tiff, .pdf, .txt, .doc, .gif" 
                                                                            MaxFileSize="2097152" 
                                                                            MaxFileSizeErrorText="File size exceeds the maximum allowed size, which is 2M">
                                                                        </ValidationSettings>
                                                                        <ClientSideEvents FileUploadComplete="function(s, e) 
                                                                                {
                                                                                    if (e.isValid)
                                                                                    {
					                                                                    menuAttachment.GetItemByName('AddAttachment').SetEnabled(true);
					                                                                    menuAttachment.GetItemByName('CancelAttachment').SetEnabled(false);
	                                                                                    s.SetVisible(false);
                                                                                        gridviewattachments.Refresh();
                                                                                     }
                                                                                }" />

                                                                        <UploadButton>
                                                                            <Image Height="18px" Url="~/Images/upload.png">
                                                                            </Image>
                                                                        </UploadButton>
                                                                        <CancelButton>
                                                                            <Image Height="18px" Url="~/Images/Cancel.png">
                                                                            </Image>
                                                                        </CancelButton>
                                                                        <Paddings PaddingBottom="5px" PaddingTop="10px" />

<Paddings PaddingTop="10px" PaddingBottom="5px"></Paddings>

                                                                        <ButtonStyle ImageSpacing="5px">
                                                                        </ButtonStyle>
                                                                    </dx:ASPxUploadControl>
                                                                </td>
                                                                <td style="width: -200%">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                        <table width ="100%">
                                                        <tr>
                                                        <td>
                                                            <dx:ASPxGridView ID="ASPxGridViewAttachments" runat="server" 
                                                                AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                                                ClientInstanceName="gridviewattachments" 
                                                                CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                                CssPostfix="Office2003Blue" KeyFieldName="Hidden_attacment_id" 
                                                                OnCommandButtonInitialize="ASPxGridViewAttachments_CommandButtonInitialize" 
                                                                OnCustomJSProperties="ASPxGridViewAttachments_CustomJSProperties" 
                                                                OnRowDeleting="ASPxGridViewAttachments_RowDeleting" Theme="Office2003Blue" 
                                                                Width="100%">
                                                                <ClientSideEvents Init="function(s, e) {
	menuAttachment.GetItem(0).SetEnabled(s.cpAllowInsert);
}" />
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" ShowDeleteButton="True"/>
                                                                    <dx:GridViewDataTextColumn Caption="Num" FieldName="Num" Name="Num" 
                                                                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Uploaded by" FieldName="Uploaded_by" 
                                                                        Name="Uploaded_by" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="2" Width="25%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataDateColumn Caption="Uploaded on" FieldName="Uploaded_on" 
                                                                        Name="Uploaded_on" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="3" Width="25%">
                                                                        <PropertiesDateEdit DisplayFormatInEditMode="True" 
                                                                            DisplayFormatString="dd/MM/yyyy HH:mm">
                                                                        </PropertiesDateEdit>
                                                                    </dx:GridViewDataDateColumn>
                                                                    <dx:GridViewDataHyperLinkColumn Caption="Filename" 
                                                                        FieldName="Hidden_attacment_id" Name="File_name" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="4" Width="50%">
                                                                        <PropertiesHyperLinkEdit EnableClientSideAPI="True" 
                                                                            NavigateUrlFormatString="~/DocumentDisplay.aspx?rid={0}" Target="_blank" 
                                                                            TextField="File_name">
                                                                        </PropertiesHyperLinkEdit>
                                                                        <CellStyle HorizontalAlign="Left">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataHyperLinkColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Hidden_attacment_id" 
                                                                        FieldName="Hidden_attacment_id" Name="Hidden_attacment_id" ReadOnly="True" 
                                                                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataCheckColumn Caption="Hidden_delete_right" 
                                                                        FieldName="Hidden_delete_right" Name="Hidden_delete_right" ReadOnly="True" 
                                                                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                                    </dx:GridViewDataCheckColumn>
                                                                </Columns>
                                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" 
                                                                    ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                                <SettingsCookies Version="1" />
                                                                <Styles CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                                    CssPostfix="Office2003Blue">
                                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                    </Header>
                                                                    <LoadingPanel ImageSpacing="10px">
                                                                    </LoadingPanel>
                                                                </Styles>
                                                                <StylesEditors>
                                                                    <ProgressBar Height="25px">
                                                                    </ProgressBar>
                                                                </StylesEditors>
                                                                <SettingsCommandButton>
                                                                    <DeleteButton Text="Delete">
                                                                        <Image Height="10px" Url="~/Images/delete.png">
                                                                        </Image>
                                                                    </DeleteButton>
                                                                </SettingsCommandButton>
                                                            </dx:ASPxGridView>
                                                         </td>
                                                         </tr>
                                                         </table>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>
                                                    <dx:TabPage Name="RelatedTickets" Text="Location History">
                                                        <TabImage Height="14px" Url="~/Images/related.png">
                                                        </TabImage>
                                                    <ContentCollection>
                                                        <dx:ContentControl ID="ContentControl5" runat="server" SupportsDisabledAttribute="True">
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                <dx:ASPxGridView ID="ASPxGridViewRelatedTickets" runat="server" 
                                AutoGenerateColumns="False" EnableTheming="True" style="font-size: 8pt" 
                                Theme="Office2003Blue" Width="100%" 
                                ClientInstanceName="relatedticketsGrid" 
                                OnHtmlDataCellPrepared="ASPxGridViewLocation_HtmlDataCellPrepared" 
                                OnHtmlRowPrepared="ASPxGridViewLocation_HtmlRowPrepared">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Event Date" FieldName="Event_date" 
                                        Name="Event_date" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>


                                     <dx:GridViewDataComboBoxColumn Caption="Type" FieldName="Type" 
                                        Name="Type" ShowInCustomizationForm="True" VisibleIndex="3" 
                                        Width="50px">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem ImageUrl="~/Images/ticket.png" Text=" " Value="Ticket" />
                                                <dx:ListEditItem ImageUrl="~/Images/car.png" Text=" " Value="Visit" />
                                            </Items>
                                        </PropertiesComboBox>
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataComboBoxColumn>


                                    <dx:GridViewDataTextColumn Caption="Id" FieldName="ID" Name="ID" 
                                        ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Status" FieldName="Status" Name="Status" 
                                        ShowInCustomizationForm="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="Location" FieldName="Location" 
                                        GroupIndex="0" Name="Location" ShowInCustomizationForm="True" SortIndex="0" 
                                        SortOrder="Ascending" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataComboBoxColumn FieldName="Priority" 
                                        Name="Priority" ShowInCustomizationForm="True" VisibleIndex="1" 
                                        Width="30px">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem ImageUrl="~/Images/bullet_red.png" Text=" " Value="HIGH" />
                                                <dx:ListEditItem ImageUrl="~/Images/bullet_yellow.png" Text=" " Value="LOW" />
                                                <dx:ListEditItem ImageUrl="~/Images/bullet_blue.png" Text=" " 
                                                    Value="MEDIUM" />
                                            </Items>
                                        </PropertiesComboBox>
                                        <HeaderStyle>
                                        <Border BorderStyle="None" />
                                        </HeaderStyle>
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataComboBoxColumn>

                                    <dx:GridViewDataComboBoxColumn Caption="Freeze" FieldName="Freeze_Flag" 
                                        Name="Freeze_Flag" ShowInCustomizationForm="True" VisibleIndex="7" 
                                        ToolTip="Freeze_Flag" Width="50px">
                                        <PropertiesComboBox ShowImageInEditBox="True">
                                            <Items>
                                                <dx:ListEditItem ImageUrl="~/Images/Suspended.png" Text=" " Value="Yes" />
                                                <dx:ListEditItem Text=" " Value="No" />
                                            </Items>
                                            <ItemStyle Font-Size="0pt" HorizontalAlign="Center" />
                                            <Style HorizontalAlign="Center">
                                            </Style>
                                        </PropertiesComboBox>
                                        <Settings AllowAutoFilter="True" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataComboBoxColumn>

                                    <dx:GridViewDataTextColumn Caption="Visit" FieldName="Visit" Name="Visit" 
                                        ShowInCustomizationForm="True" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Solved" FieldName="Solved" Name="Solved" 
                                        ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Description" FieldName="Description" 
                                        Name="Description" ShowInCustomizationForm="True" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                    <SettingsCookies Version="2" />
                                <Styles>
                                    <GroupRow BackColor="White">
                                    </GroupRow>
                                    <Row BackColor="WhiteSmoke">
                                    </Row>
                                </Styles>
                            </dx:ASPxGridView>
                                          </td>
                                                </tr>
                                                      <tr>
                                                          <td>                                                            
                                                              </td>
                                                            </tr>
                                                            </table>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>
                                                <dx:TabPage Name="RoutingHistory" Text="Routing History">
                                                    <TabImage Height="14px" Url="~/Images/clock.png">
                                                    </TabImage>
                                                    <ContentCollection>
                                                        <dx:ContentControl ID="ContentControl4" runat="server" SupportsDisabledAttribute="True">
                                                                        <dx:ASPxGridView ID="ASPxGridViewRoutingHistory" runat="server" 
                                                                            AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                                                            CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                                            CssPostfix="Office2003Blue" KeyFieldName="Step" Width="100%" 
                                                                            ClientInstanceName="routinghistoryGrid" KeyboardSupport="True" 
                                                                            Font-Size="8pt" Theme="Office2003Blue">
                                                                            <SettingsBehavior ColumnResizeMode="NextColumn"></SettingsBehavior>
                                                                            <Columns>
                                                                                <dx:GridViewDataTextColumn Caption="Step" FieldName="Step" Name="Step" 
                                                                                    ReadOnly="True" ShowInCustomizationForm="True" 
                                                                                    VisibleIndex="0" Width="50px">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn Caption="Team" FieldName="Team" Name="Team" 
                                                                                    ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn Caption="Status" FieldName="Status" Name="Status" 
                                                                                    ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn Caption="Severity" FieldName="Severity" 
                                                                                    Name="Severity" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                                    VisibleIndex="2" Visible="False">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataDateColumn Caption="Received On" FieldName="Receive_time" 
                                                                                    Name="Receive_time" ReadOnly="True" ShowInCustomizationForm="True" 
                                                                                    VisibleIndex="3">
                                                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                                                                    </PropertiesDateEdit>
                                                                                </dx:GridViewDataDateColumn>
                                                                                <dx:GridViewDataTextColumn Caption="Step dur (hours)" 
                                                                                    FieldName="Step_dur_h" Name="Step_dur_h" 
                                                                                    ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                                    <CellStyle HorizontalAlign="Left">
                                                                                    </CellStyle>
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataDateColumn Caption="Intervention On" 
                                                                                    FieldName="Intervention_on" Name="Intervention_on" ReadOnly="True" 
                                                                                    ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                                                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                                                                    </PropertiesDateEdit>
                                                                                </dx:GridViewDataDateColumn>
                                                                                <dx:GridViewDataTextColumn Caption="Response dur (hours)" 
                                                                                    FieldName="Resp_dur_h" Name="Resp_dur_h" ShowInCustomizationForm="True" 
                                                                                    VisibleIndex="6" Visible="False">
                                                                                </dx:GridViewDataTextColumn>
                                                                            </Columns>

                                                                            <SettingsCookies Version="1" />


                                                                            <Styles CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                                                                                CssPostfix="Office2003Blue">
                                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                                </Header>
                                                                                <Row BackColor="#FCFCFC">
                                                                                </Row>
                                                                                <LoadingPanel ImageSpacing="10px">
                                                                                </LoadingPanel>
                                                                            </Styles>
                                                                            <StylesEditors>
                                                                                <ProgressBar Height="25px">
                                                                                </ProgressBar>
                                                                            </StylesEditors>
                                                                        </dx:ASPxGridView>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>
                                            </TabPages>
                                 <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Web/tcLoading.gif">
                            </LoadingPanelImage>
<ClientSideEvents ActiveTabChanged="function(s, e) {
	if (s.GetActiveTabIndex() == 1)
    {
        if (typeof (kilometersread) != 'undefined') 
        {
            //kilometersread.SetText(String(CalculateKms()));
        }
    }
}" />
                                            
 <Paddings PaddingLeft="5px" PaddingTop="3px" PaddingRight="5px"></Paddings>
 <ContentStyle>
 <Border BorderWidth="0px" />                             
 <Border BorderWidth="0px">               
 </Border>                 
 </ContentStyle>                                  
 </dx:ASPxPageControl>
                                    </td>
                                </tr>
                            </table>
                        </td>
                             
                    </tr>
                </table>
            </div>
<dx:ASPxCallback ID="ASPxCallbackClaimButton" runat="server" 
    ClientInstanceName="claimcallback" 
    oncallback="ASPxCallbackClaimButton_Callback" ClientIDMode="AutoID">
    <ClientSideEvents CallbackComplete="function(s, e) {
	visibleindexcallback.PerformCallback();
}" />
</dx:ASPxCallback>

<dx:ASPxCallback ID="ASPxCallbackReleaseButton" runat="server" 
    ClientInstanceName="releasecallback" 
    oncallback="ASPxCallbackReleaseButton_Callback">
    <ClientSideEvents CallbackComplete="function(s, e) {
	window.pagegrid.CollapseAllDetailRows();
}" />
</dx:ASPxCallback>

<dx:ASPxCallback ID="ASPxCallbackComlpeteButton" runat="server" 
    ClientInstanceName="completecallback" 
    oncallback="ASPxCallbackComlpeteButton_Callback" ClientIDMode="AutoID">
    <ClientSideEvents CallbackComplete="function(s, e) {
	window.pagegrid.CollapseAllDetailRows();
	window.pagegrid.Refresh();
}" />
</dx:ASPxCallback>

<dx:ASPxCallback ID="ASPxCallbackVisibleIndex" runat="server" 
    ClientInstanceName="visibleindexcallback" 
    oncallback="ASPxCallbackVisibleIndex_Callback" ClientIDMode="AutoID">
    <ClientSideEvents CallbackComplete="function(s, e) {
    window.pagegrid.ExpandRow(e.result, false);
}" />
</dx:ASPxCallback>
<dx:ASPxCallback ID="ASPxCallbackSaveSchedule" runat="server" 
    ClientInstanceName="CallbackSaveSchedule" 
    oncallback="ASPxCallbackSaveSchedule_Callback">
    <ClientSideEvents CallbackComplete="function(s, e) {
    if (window.ControlCallbackReason =='release')
    {
        if (gridViewProblems.cpValidate)
        {
            if (ValidateSchEditControl())
            {
                releasecallback.PerformCallback(ToTeam.GetSelectedItem().value);
                ClientPopupControlRelease.Hide();
            }
            else
            {
                alert('Validation Error');
            }
        }
        else
        {
            releasecallback.PerformCallback(ToTeam.GetSelectedItem().value);
            ClientPopupControlRelease.Hide();
        }
    }
    else if (window.ControlCallbackReason =='releaseForDispatcher')  /*customia */
    {
            releasecallback.PerformCallback(ToTeam.GetSelectedItem().value);
            ClientPopupControlRelease.Hide();
    }
    else if (window.ControlCallbackReason =='complete')
    {
        if (gridViewProblems.cpValidate)
        {
            if (ValidateSchEditControl())
            {
                completecallback.PerformCallback();
            }
            else
            {
	            alert('Validation Error');
            }
        }
        else
        {
            completecallback.PerformCallback();
        }
    }
    else if (window.ControlCallbackReason =='assign')
    {
        callbackassign.PerformCallback(teamusers.GetSelectedItem().value);
    }
    else if (window.ControlCallbackReason == 'addticket')
    {
        if(e.result='0')
        {
        popup.ShowAtElement( s.GetMainElement() );
        }
        else
        {
            alert('Validation Error');
        }
    }
    else
    {
	    alert('Save was completed succesfully')
    }
    window.ControlCallbackReason = '';

}" />
</dx:ASPxCallback>

<dx:ASPxCallback ID="ASPxCallbackReject" runat="server" 
    ClientInstanceName="rejectcallback" oncallback="ASPxCallbackReject_Callback">
    <ClientSideEvents CallbackComplete="function(s, e) {
	    window.pagegrid.CollapseAllDetailRows();
        window.pagegrid.Refresh();
}" />
</dx:ASPxCallback>
                <dx:ASPxCallback ID="ASPxCallbackAssign" runat="server" 
    ClientInstanceName="callbackassign" oncallback="ASPxCallbackAssign_Callback">
                    <ClientSideEvents CallbackComplete="function(s, e) {
                    ClientPopupControlAssign.Hide();
                    window.pagegrid.CollapseAllDetailRows();
                    //window.pagegrid.Refresh();
}" />
</dx:ASPxCallback>
                <dx:ASPxPopupControl runat="server" 
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
    Modal="True" AppearAfter="0" 
                CloseAction="CloseButton" AllowDragging="True" AllowResize="True" 
                ClientInstanceName="popup" EnableClientSideAPI="True" 
                HeaderText="Please choose:" LoadingPanelDelay="0" ShowSizeGrip="True" 
                Theme="Aqua" Width="1000px" CssClass="style20" ID="PopupControl" 
                OnWindowCallback="PopupControl_WindowCallback" Height="500px" 
    ResizingMode="Postponed" ShowMaximizeButton="True">
<ClientSideEvents Shown="function(s, e) {
	s.PerformCallback();

}" AfterResizing="function(s, e) {
	ticketsgrid.AdjustControl();
	var height = Math.max(0, s.GetHeight());
    ticketsgrid.SetHeight(height);
}" EndCallback="function(s, e) {
	var height = Math.max(0, s.GetHeight());
    ticketsgrid.SetHeight(height);
}"></ClientSideEvents>

<HeaderStyle Font-Size="Small"></HeaderStyle>
<ContentCollection>
<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True" 
        Width="100%">
                        <table width="100%">
                        <tr>
                            <td>
                                <dx:ASPxMenu runat="server" ItemAutoWidth="False" Theme="Metropolis" 
                                    Width="100%" BackColor="White" EnableTheming="True" ID="ASPxMenu4">
<ClientSideEvents ItemClick="function(s, e) 
{
	if (confirm(&quot;Are you sure you want to add the selected tickets? This operation cannot be undone!&quot;)==true)
	{
		
		gridViewProblems.PerformCallback(ticketsgrid.GetSelectedKeysOnPage());
		popup.Hide();
	}
}"></ClientSideEvents>
<Items>
<dx:MenuItem Name="AddTick" Text="Add Tickets to Schedule">
<Image Height="12px" Url="~/Images/add.png"></Image>
</dx:MenuItem>
</Items>
</dx:ASPxMenu>

                                <dx:ASPxGridView runat="server" ClientInstanceName="ticketsgrid" 
                                    KeyFieldName="TT_Id" AutoGenerateColumns="False" Theme="Metropolis" 
                                    Width="100%" EnableTheming="True" ID="ASPxGridViewTickets" 
                                    style="font-size: 8pt"><Columns>
<dx:GridViewCommandColumn ShowSelectCheckbox="True" ShowInCustomizationForm="False" Width="60px" VisibleIndex="0" Caption=" " ShowClearFilterButton="True"/>
<dx:GridViewDataTextColumn FieldName="SRI" ShowInCustomizationForm="True" Name="SRI" Caption="SRI" VisibleIndex="2" 
                                            Width="150px">
    <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="TT_Id" ShowInCustomizationForm="True" Name="TT_Id" Caption="TT ID" 
                                            VisibleIndex="3" Width="100px">
    <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Location" ShowInCustomizationForm="True" Name="Location" Caption="Location" 
                                            VisibleIndex="4">
    <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Event" ShowInCustomizationForm="True" Name="Event" Caption="Event" 
                                            VisibleIndex="7">
    <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Priority" ShowInCustomizationForm="True" Name="Priority" Caption="Priority" 
                                            VisibleIndex="6" Width="100px">
    <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="Date" FieldName="TDate" Name="TDate" 
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="110px">
                                            <PropertiesDateEdit DisplayFormatString="dd/MM/yy HH:mm">
                                            </PropertiesDateEdit>
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="From" FieldName="Source" Name="Source" 
                                            ShowInCustomizationForm="True" VisibleIndex="8" Width="100px">
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

<SettingsBehavior AllowSelectByRowClick="True" ColumnResizeMode="NextColumn"></SettingsBehavior>

<SettingsPager AlwaysShowPager="True"></SettingsPager>

<SettingsEditing Mode="Inline"></SettingsEditing>

<Settings ShowFilterRow="True" ShowHeaderFilterButton="True" VerticalScrollBarMode="Visible" 
                                        ShowFilterRowMenu="True"></Settings>
                                    <SettingsCookies Version="5" />
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

                                                    


