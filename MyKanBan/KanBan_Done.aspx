<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KanBan_Done.aspx.cs" Inherits="MyKanBan.KanBan_Done" EnableEventValidation="false" ValidateRequest="false"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="kanbanTitle">
    <div class="kanbanTitle_label">
        <h1 id="kanban_Title_<%= KanBanObj.ID.ToString() %>">
            <%= KanBanObj.Name %> - Paper Bin
        </h1>
    </div>
    <div class="kanbanTitle_legend" style="margin-left:20px;padding-top:27px;">
        <div class="kanbanTitle_legendItem" style="background-color:#96B232;">&nbsp;</div>
        <h1 style="color:#96B232;">Finished</h1>
        <div class="kanbanTitle_legendItem" style="background-color:#898989;">&nbsp;</div>
        <h1 style="color:#898989;">Removed</h1>
    </div>
</div>
<div class="clear"></div>
<div class="kanbanContainer">
    <div class="innerContainer" id="conMember" style="width:auto;">
        <div class="kanbanTable">
            <table id="tblMember" class="kanbanBoard" cellpadding="0" cellspacing="0">
                <asp:Literal ID="litTable" runat="server"></asp:Literal>
            </table>
        </div>
    </div>
</div>
<div class="mask" id="KanBanMask" style="display:none;">
</div> 
<asp:UpdatePanel ID="upLane" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Button ID="btnArchiveLane" runat="server" CssClass="hidden_button" OnClick="btnArchiveLane_Click" />
    </ContentTemplate>
</asp:UpdatePanel>
<div class="mask_popup" id="divStory" style="width:650px;display:none;margin-left:-305px; margin-top:-260px;">
    <div class="mask_dialog">
        <asp:UpdatePanel ID="upStory" runat="server" UpdateMode="Conditional" ViewStateMode="Enabled" ><ContentTemplate>
        <div class="mask_header">
            <div class="mask_title" style="width:500px;height:23px;"><asp:Literal ID="txtStory_Title" runat="server"></asp:Literal></div>
            <div class="mask_close_button" onclick="KanBan.CloseStory();"><img alt="close" src="./Images/close.png" /></div>
            <div class="mask_close_button" onclick="KanBan.SlideRight();"><img alt="right" src="./Images/arrow_right.png" /></div>
            <div class="mask_close_button" onclick="KanBan.SlideLeft();"><img alt="left" src="./Images/arrow_left.png" /></div>
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
                        <div class="mask_InputPair_input"><asp:DropDownList ID="ddlStoryTaskType" runat="server" Enabled="false"></asp:DropDownList></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Name:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtStoryName" Enabled="false" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Status:</div>
                        <div class="mask_InputPair_input"><asp:DropDownList ID="ddlStoryType" Enabled="false" runat="server"></asp:DropDownList></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Stage:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtStoryStatus" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Prior:</div>
                        <div class="mask_InputPair_input"><asp:DropDownList ID="ddlStoryPrior" Enabled="false" runat="server"></asp:DropDownList></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">TFS:</div>
                        <div class="mask_InputPair_input">
                            <asp:DropDownList ID="ddlTFSServer" Enabled="false" runat="server" Width="75" DataTextField="Project" DataValueField="ID"></asp:DropDownList>
                            <asp:TextBox ID="txtStoryTFS" Enabled="false" runat="server" Width="85"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Due Date:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtDueDate" runat="server" Enabled="false" style="cursor:pointer;"></asp:TextBox></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">PM Size:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtPMEst" Enabled="false" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">PM Complete:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtPM" Enabled="false" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Dev Size:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtDevEst" Enabled="false" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Dev Complete:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtDev" Enabled="false" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Test Size:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtTestEst" Enabled="false" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="mask_InputPair">
                        <div class="mask_InputPair_label">Test Complete:</div>
                        <div class="mask_InputPair_input"><asp:TextBox ID="txtTest" Enabled="false" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair" style="width:620px;">
                        <div class="mask_InputPair_label">Description:</div>
                        <div class="mask_InputPair_input" style="width:480px;"><asp:TextBox ID="txtStoryDesc" Enabled="false" runat="server" TextMode="MultiLine" style="width:465px;height:80px;"></asp:TextBox></div>
                    </div>
                    <div class="clear"></div>
                    <div class="mask_InputPair" style="width:620px;">
                        <div class="mask_InputPair_label">PMs:</div>
                        <div class="mask_InputPair_input" style="width:360px;float:left;">
                            <asp:ListView ID="lstPM" runat="server">
                                <LayoutTemplate>
                                    <div class="mask_InputPair_UserList"><asp:PlaceHolder runat="server" ID="itemPlaceholder" /></div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div class="mask_InputPair_User"><a href="im:<sip:<%#Eval("Alias") %>@microsoft.com>"><%#Eval("Alias") %></a></div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <div class="mask_InputPair_input" style="width:120px;">
                        </div>
                    </div>
                    <div class="mask_InputPair" style="width:620px;">
                        <div class="mask_InputPair_label">Engineers:</div>
                        <div class="mask_InputPair_input" style="width:360px;float:left;">
                            <asp:ListView ID="lstEngineer" runat="server" >
                                <LayoutTemplate>
                                    <div class="mask_InputPair_UserList"><asp:PlaceHolder runat="server" ID="itemPlaceholder" /></div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div class="mask_InputPair_User"><a href="im:<sip:<%#Eval("Alias") %>@microsoft.com>"><%#Eval("Alias") %></a></div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <div class="mask_InputPair_input" style="width:120px;">
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
                <div class="mask_button" style="width:80px;" onclick="KanBan.CloseStory();">Close</div>
                <a id="lnkEmail" runat="server"><div class="mask_button" style="width:80px;" onclick="">Email</div></a>
                <asp:Button ID="btnUpdateStory" runat="server" CssClass="hidden_button" OnClick="btnUpdateStory_Click" />
            </div>
        </div>
        </ContentTemplate></asp:UpdatePanel>
    </div>
</div>
<script language="javascript" type="text/javascript">
    function ExtendList() {
        var tbl = document.getElementById("tblMember");
        var con = document.getElementById("conMember");
        if (tbl) {
            var targetWidth = tbl.offsetWidth + 2500;
            ApoJS.Animation.SetWidth(con, con.offsetWidth, targetWidth, 35, 20, 0.5, function () {
                
            });
        }
    }

    function ArchiveLane(nID) {
        __doPostBack('<%=btnArchiveLane.UniqueID %>', nID)
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

    KanBan.FRAME_NUM = 2;
    KanBan.FRAME_WIDTH = 645;
    KanBan.Init(function () { ExtendList(); });
</script>
</asp:Content>
