<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kanban.aspx.cs" Inherits="HMKanBan.Kanban" MasterPageFile="Site.Master" EnableEventValidation="false" ValidateRequest="false" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="./Styles/KanBan_FixedHeader.css?v=<%= HMKanBan.SiteMaster.DATE_STRING %>" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div class="kanbanTitle">
    <div class="kanbanTitle_label">
        <h1 id="kanban_Title_<%= KanBanObj.ID.ToString() %>">
            <%= KanBanObj.Name %>
        </h1>
    </div>
    <div class="kanbanTitle_button" style="margin-left:20px;">
        <img alt="Add Lane" src="./Images/add_big.png" onclick="KanBan.NewLaneClient();" />
    </div>
    <div class="kanbanTitle_button" style="">
        <img alt="Config Kanban" src="./Images/conf_big.png" onclick="KanBan.UpdateKanBan(<%= KanBanObj.ID.ToString() %>)" />
    </div>
    <div class="kanbanTitle_legend" style="margin-left:20px;padding-top:27px;">
        <asp:Literal ID="litLegend" runat="server"></asp:Literal>
    </div>
</div>
<div class="clear"></div>
<div class="kanbanContainer">
    <div class="kanbanTable" style="width:<%= KanBanWidth %>px">
        <table id="tblKanban" class="kanbanBoard" cellpadding="0" cellspacing="0">
            <tr class="StageRow" id="divHeader">
                <th class="FirstColumn"></th>
                <asp:Literal ID="litColumnsHead" runat="server"></asp:Literal>
            </tr>
            <asp:Literal ID="litLanes" runat="server"></asp:Literal>
        </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</div>
<div class="mask" id="KanBanMask" style="display:none;">
</div> 
<div class="mask_popup" id="divStory" style="width:650px;display:none;margin-left:-305px; margin-top:-260px;">
    <div class="mask_dialog">
        <asp:UpdatePanel ID="upStory" runat="server" UpdateMode="Conditional" ViewStateMode="Enabled" ><ContentTemplate>
        <div class="mask_header">
            <div class="mask_title" style="width:500px;height:23px;"><asp:Literal ID="txtStory_Title" runat="server"></asp:Literal></div>
            <div class="mask_close_button" onclick="KanBan.CloseStory();"><img alt="close" src="./Images/close.png" /></div>
            <div runat="server" id="btnRight" class="mask_close_button" onclick="KanBan.SlideRight();"><img alt="right" src="./Images/arrow_right.png" /></div>
            <div runat="server" id="btnLeft" class="mask_close_button" onclick="KanBan.SlideLeft();"><img alt="left" src="./Images/arrow_left.png" /></div>
        </div>
        <div class="mask_stage" id="divStory_Body">
            <div class="mask_frame" style="height:445px;width:1300px;padding-top:10px;padding-bottom:15px;">
                <div class="mask_body" style="width:645px;">
                    <asp:HiddenField ID="txtStoryID" runat="server" />
                    <asp:HiddenField ID="txtStoryLaneID" runat="server" />
                    <asp:HiddenField ID="txtStepID" runat="server" />
                    <asp:HiddenField ID="txtStatusStory" runat="server" />
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Type:</div>
                        <div class="mask_InputPair_input"><asp:DropDownList ID="ddlStoryTaskType" runat="server"></asp:DropDownList></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Name:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtStoryName" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Status:</div>
                        <div class="mask_InputPair_input"><asp:DropDownList ID="ddlStoryType" runat="server"></asp:DropDownList></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Stage:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtStoryStatus" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Prior:</div>
                        <div class="mask_InputPair_input"><asp:DropDownList ID="ddlStoryPrior" runat="server"></asp:DropDownList></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">TFS:</div>
                        <div class="mask_InputPair_input">
                            <asp:DropDownList ID="ddlTFSServer" runat="server" Width="75" DataTextField="Project" DataValueField="ID"></asp:DropDownList>
                            <asp:TextBox ID="txtStoryTFS" runat="server" Width="55"></asp:TextBox>
                            <asp:LinkButton ID="lnkRetrieve" runat="server" Text="Sync" OnClick="lnkRetrieve_Click" OnClientClick="StartRetrieveTFS();"></asp:LinkButton>
                            <asp:Image ID="imgLoading" style="display:none;" Height="11" Width="20" runat="server" ImageUrl="./Images/loading.gif" />
                        </div>
                    </div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Due Date:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtDueDate" runat="server" style="cursor:pointer;"></asp:TextBox><ajaxToolkit:CalendarExtender ID="extCalendar" runat="server" TargetControlID="txtDueDate" CssClass="StoryDiv_Calendar" ></ajaxToolkit:CalendarExtender></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">PM Size:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtPMEst" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">PM Complete:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtPM" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Dev Size:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtDevEst" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Dev Complete:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtDev" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Test Size:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtTestEst" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Test Complete:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtTest" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair" style="width:620px;">
                        <div class="mask_InputPair_label">Description:</div>
                        <div class="mask_InputPair_input" style="width:480px;"><asp:TextBox ID="txtStoryDesc" runat="server" TextMode="MultiLine" style="width:465px;height:80px;"></asp:TextBox></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair" style="width:620px;height:25px;"">
                        <div class="mask_InputPair_label">PMs:</div>
                        <div class="mask_InputPair_input" style="width:360px;float:left;">
                            <asp:ListView ID="lstPM" runat="server" OnItemDataBound="PMListView_ItemDataBound">
                                <LayoutTemplate>
                                    <div class="mask_InputPair_UserList"><asp:PlaceHolder runat="server" ID="itemPlaceholder" /></div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div class="mask_InputPair_User"><a href="im:<sip:<%#Eval("Alias") %>@microsoft.com>"><%#Eval("Alias") %></a><asp:LinkButton ID="lnkPMRemove" runat="server" CssClass="mask_InputPair_removeButton" ClientIDMode="AutoID" OnClick="PMRemoveButton_Click">&times;</asp:LinkButton></div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <div class="mask_InputPair_input" style="width:120px;">
                            <div class="mask_InputPair_addButton">
                                <asp:DropDownList ID="ddlPM" runat="server" Width="80"></asp:DropDownList>&nbsp;&nbsp;<asp:LinkButton ID="lnkPM" runat="server" OnClick="AddAssign_Click" CommandName="PM">Add</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair" style="width:620px;height:25px;">
                        <div class="mask_InputPair_label">Engineers:</div>
                        <div class="mask_InputPair_input" style="width:360px;float:left;">
                            <asp:ListView ID="lstEngineer" runat="server" OnItemDataBound="EGListView_ItemDataBound" >
                                <LayoutTemplate>
                                    <div class="mask_InputPair_UserList"><asp:PlaceHolder runat="server" ID="itemPlaceholder" /></div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div class="mask_InputPair_User"><a href="im:<sip:<%#Eval("Alias") %>@microsoft.com>"><%#Eval("Alias") %></a><asp:LinkButton ID="lnkEGRemove" runat="server" CssClass="mask_InputPair_removeButton" ClientIDMode="AutoID" OnClick="EGRemoveButton_Click">&times;</asp:LinkButton></div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <div class="mask_InputPair_input" style="width:120px;">
                            <div class="mask_InputPair_addButton">
                                <asp:DropDownList ID="ddlEngineer" runat="server" Width="80"></asp:DropDownList>&nbsp;&nbsp;<asp:LinkButton ID="lnkEng" runat="server" OnClick="AddAssign_Click" CommandName="EG">Add</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mask_body" style="width:645px;height:410px;">
                    <asp:Literal ID="litColumnLog" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
        <div class="mask_footer">
            <div class="mask_buttonList">
                <div class="mask_button_left" style="width:80px;border-color:#EEEEEE;color:#FFFFFF;background-color:#339933;<%= FunctionButtonStyle %>" onclick=" if (KanBan.FinishClientEvent(document.getElementById('<%= txtStoryName.ClientID %>').value)) { __doPostBack('<%=btnUpdateStoryStatus.UniqueID %>', 'Finish');}">Finish</div>
                <div class="mask_button_left" style="width:80px;border-color:#EEEEEE;color:#FFFFFF;background-color:#E51400;<%= FunctionButtonStyle %>" onclick=" if (KanBan.RemoveClientEvent(document.getElementById('<%= txtStoryName.ClientID %>').value)) { __doPostBack('<%=btnUpdateStoryStatus.UniqueID %>', 'Remove');}">Remove</div>
                <div class="mask_button" style="width:80px;" onclick="__doPostBack('<%=btnStorySubmit.UniqueID %>', '');">Save</div>
                <a id="lnkEmail" runat="server"><div class="mask_button" style="width:80px;" onclick="">Email</div></a>
                <asp:Button ID="btnStorySubmit" runat="server" CssClass="hidden_button" OnClick="btnStory_Click" />
                <asp:Button ID="btnUpdateStoryStatus" runat="server" CssClass="hidden_button" OnClick="btnUpdateStoryStatus_Click" />
                <asp:Button ID="btnUpdateStoryStep" runat="server" CssClass="hidden_button" OnClick="btnUpdateStoryStep_Click" />
                <asp:Button ID="btnUpdateStory" runat="server" CssClass="hidden_button" OnClick="btnUpdateStory_Click" />
            </div>
        </div>
        </ContentTemplate></asp:UpdatePanel>
    </div>
</div>
<div class="mask_popup" id="divLane" style="width:380px;display:none;margin-left:-190px; margin-top:-85px;">
    <div class="mask_dialog">
        <asp:UpdatePanel ID="upLane" runat="server" UpdateMode="Conditional" ViewStateMode="Enabled" ><ContentTemplate>
        <div class="mask_header">
            <div class="mask_title" id="divLane_title"><asp:Literal ID="txtLane_Title" runat="server"></asp:Literal></div>
            <div class="mask_close_button" onclick="KanBan.CloseLane();"><img alt="close" src="./Images/close.png" /></div>
        </div>
        <div class="mask_body" style="padding-top:15px;padding-bottom:5px;">
            <asp:HiddenField ID="txtLaneID" runat="server" />
            <asp:HiddenField ID="txtStatusLane" runat="server" />
            <div class="mask_InputPair">
                <div class="mask_InputPair_label">Name:</div>
                <div class="mask_InputPair_input"><asp:TextBox ID="txtLaneName" runat="server"></asp:TextBox></div>
            </div>
            <div class="mask_InputPair">
                <div class="mask_InputPair_label">Type:</div>
                <div class="mask_InputPair_input"><asp:DropDownList ID="ddlLaneType" runat="server"></asp:DropDownList></div>
            </div>
        </div>
        <div class="mask_footer">
            <div class="mask_buttonList">
                <div class="mask_button_left" style="width:80px;border-color:#EEEEEE;color:#FFFFFF;background-color:#339933;<%= FunctionButtonStyle %>" onclick=" if (KanBan.FinishClientEvent(document.getElementById('<%= txtLaneName.ClientID %>').value)) { __doPostBack('<%=btnUpdateLaneStatus.UniqueID %>', 'Finish');}">Finish</div>
                <div class="mask_button_left" style="width:80px;border-color:#EEEEEE;color:#FFFFFF;background-color:#E51400;<%= FunctionButtonStyle %>" onclick=" if (KanBan.RemoveClientEvent(document.getElementById('<%= txtLaneName.ClientID %>').value)) { __doPostBack('<%=btnUpdateLaneStatus.UniqueID %>', 'Remove');}">Remove</div>
                <div class="mask_button" style="width:80px;" onclick="__doPostBack('<%=btnLaneSubmit.UniqueID %>', '');">Save</div>
                <asp:Button ID="btnLaneSubmit" runat="server" CssClass="hidden_button" OnClick="btnLane_Click" />
                <asp:Button ID="btnUpdateLane" runat="server" CssClass="hidden_button" OnClick="btnUpdateLane_Click" />
                <asp:Button ID="btnUpdateLaneStatus" runat="server" CssClass="hidden_button" OnClick="btnUpdateLaneStatus_Click" />
            </div>
        </div>
        </ContentTemplate></asp:UpdatePanel>
    </div>
</div>
<div id="divHover" style="display:none;">
</div>
<div class="mask_popup" id="divKanBan" style="width:380px;display:none;margin-left:-190px; margin-top:-85px;">
    <div class="mask_dialog">
        <asp:UpdatePanel ID="upKanBan" runat="server" UpdateMode="Conditional" ViewStateMode="Enabled" ><ContentTemplate>
        <div class="mask_header">
            <div class="mask_title" id="divKanBan_Title"><asp:Literal ID="txtKanBan_Title" runat="server"></asp:Literal></div>
            <div class="mask_close_button" onclick="KanBan.CloseKanBan();"><img alt="close" src="./Images/close.png" /></div>
        </div>
        <div class="mask_body" style="padding-top:15px;padding-bottom:5px;">
            <asp:HiddenField ID="txtKanBanID" runat="server" />
            <div class="mask_InputPair">
                <div class="mask_InputPair_label">Name:</div>
                <div class="mask_InputPair_input"><asp:TextBox ID="txtKanBanName" runat="server"></asp:TextBox></div>
            </div>
        </div>
        <div class="mask_footer">
            <div class="mask_buttonList">
                <div class="mask_button" style="width:80px;" onclick="__doPostBack('<%=btnKanBanSubmit.UniqueID %>', '');">Save</div>
                <asp:Button ID="btnKanBanSubmit" runat="server" CssClass="hidden_button" OnClick="btnKanBan_Click" />
                <asp:Button ID="btnUpdateKanBan" runat="server" CssClass="hidden_button" OnClick="btnUpdateKanBan_Click" />
            </div>
        </div>
        </ContentTemplate></asp:UpdatePanel>
    </div>
</div>
<script language="javascript" type="text/javascript" src="./Scripts/KanBan_FixedHeader.js?v=<%= HMKanBan.SiteMaster.DATE_STRING %>"></script>
<script type="text/javascript">
    var xPos, yPos;
    var prm = Sys.WebForms.PageRequestManager.getInstance();

    function BeginRequestHandler(sender, args) {
        if ($get('divStory_Body') != null) {
            // Get X and Y positions of scrollbar before the partial postback
            xPos = $get('divStory_Body').scrollLeft;
            yPos = $get('divStory_Body').scrollTop;
        }
    }

    function EndRequestHandler(sender, args) {
        if ($get('divStory_Body') != null) {
            // Set X and Y positions back to the scrollbar
            // after partial postback
            $get('divStory_Body').scrollLeft = xPos;
            $get('divStory_Body').scrollTop = yPos;
        }
    }

    prm.add_beginRequest(BeginRequestHandler);
    prm.add_endRequest(EndRequestHandler);
 </script>
<script language="javascript" type="text/javascript">
    function Init() {
        KanBan.StepList = "<%= StepIDList %>";
        KanBan.ColumnList = "<%= ColumnsIDList %>";
        KanBan.StoryList = "<%= StoryIDList %>";
        KanBan_FixedHeader.FloatingOffset = 10;
        KanBan_FixedHeader.FloatingName = "FloatingColumn";
        KanBan_FixedHeader.HeaderName = "Flyer";
        KanBan_FixedHeader.MenuObj = document.getElementById("divMenu");
        KanBan_FixedHeader.PageObj = document.getElementById("divPage");
    }
    KanBan.ClearLane = function () {
        var txt = document.getElementById("<%= txtLaneID.ClientID %>");
        txt.value = "";
    }
    KanBan.UpdateLane = function (laneID) {
        var obj = document.getElementById("<%= txtLaneID.ClientID %>");
        if (obj) {
            obj.value = laneID;
            __doPostBack('<%=btnUpdateLane.UniqueID %>', '');
        }
    }
    KanBan.NewLaneClient = function () {
        KanBan.ClearLane();
        __doPostBack('<%=btnUpdateLane.UniqueID %>', '');
    }
    KanBan.ClearStory = function () {
        var txt = document.getElementById("<%= txtStoryID.ClientID %>");
        txt.value = "";
    }
    KanBan.UpdateStory = function (storyID) {
        var obj = document.getElementById("<%= txtStoryID.ClientID %>");
        if (obj) {
            obj.value = storyID;
            __doPostBack('<%=btnUpdateStory.UniqueID %>', '');
        }
    }
    KanBan.NewStoryClient = function (laneID) {
        var obj = document.getElementById("<%= txtStoryLaneID.ClientID %>");
        KanBan.ClearStory();
        obj.value = laneID;
        __doPostBack('<%=btnUpdateStory.UniqueID %>', '');
    }
    KanBan.UpdateStoryStatus = function (storyClientID, setpClientID)
    {
        var nStoryID = storyClientID.substring(storyClientID.indexOf('_') + 1, storyClientID.length);
        var nStepID = setpClientID.substring(setpClientID.indexOf('_') + 1, setpClientID.lastIndexOf('_'));
        var obj = document.getElementById("<%= txtStoryID.ClientID %>");
        obj.value = nStoryID;
        obj = document.getElementById("<%= txtStepID.ClientID %>");
        obj.value = nStepID;
        __doPostBack('<%=btnUpdateStoryStep.UniqueID %>', '');
    }
    KanBan.ClearKanBan = function () {
        var txt = document.getElementById("<%= txtKanBanID.ClientID %>");
        txt.value = "";
    }
    KanBan.UpdateKanBan = function (kanbanID) {
        var obj = document.getElementById("<%= txtKanBanID.ClientID %>");
        if (obj) {
            obj.value = kanbanID;
            __doPostBack('<%=btnUpdateKanBan.UniqueID %>', '');
        }
    }

    KanBan.FRAME_NUM = 2;
    KanBan.FRAME_WIDTH = 645;

    function StartRetrieveTFS() {
        var lnk = document.getElementById("<%= lnkRetrieve.ClientID %>");
        var img = document.getElementById("<%= imgLoading.ClientID %>");

        img.style.display = "";
        lnk.style.display = "none";
    }
    function StopRetrieveTFS() {
        var lnk = document.getElementById("<%= lnkRetrieve.ClientID %>");
        var img = document.getElementById("<%= imgLoading.ClientID %>");

        img.style.display = "none";
        lnk.style.display = "";
    }
    window.onload = function () {
        Init();
        KanBan.Init(function () {
            KanBan.InitPos();
            KanBan_FixedHeader.Init();
        });
    }
</script>
</asp:Content>
