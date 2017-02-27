<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KanBan_ColumnGroup.aspx.cs" Inherits="HMKanBan.KanBan_ColumnGroup" EnableEventValidation="false" ValidateRequest="false"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="./Styles/KanBan_FixedHeader.css?v=<%= HMKanBan.SiteMaster.DATE_STRING %>" rel="stylesheet" type="text/css" />
    <link href="./Styles/KanBan_Tile.css?v=<%= HMKanBan.SiteMaster.DATE_STRING %>" rel="stylesheet" type="text/css" />
    <link href="./Styles/KanBan_ColumnGroup.css?v=<%= HMKanBan.SiteMaster.DATE_STRING %>" rel="stylesheet" type="text/css" />
    <link href="./Styles/KanBan_FixedHeader.css?v=<%= HMKanBan.SiteMaster.DATE_STRING %>" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="kanbanTitle">
    <div class="kanbanTitle_label">
        <h1 id="kanban_Title_<%= KanBanObj.ID.ToString() %>">
            <%= KanBanObj.Name %>
        </h1>
    </div>
    <div class="kanbanTitle_legend" style="margin-left:20px;padding-top:27px;">
        <asp:Literal ID="litLegend" runat="server"></asp:Literal>
    </div>
</div>
<div class="clear"></div>
<div class="kanbanContainer">
    <div class="innerContainer" id="conGrp" style="width:auto;">
        <div class="kanbanTable">
            <table id="tblGrp" class="columnGroupBoard" cellpadding="0" cellspacing="0">
                <tr class="StageRow">
                    <th class="FirstColumn">&nbsp;</th>
                    <asp:Literal ID="litHeader" runat="server"></asp:Literal>
                </tr>
                <asp:Literal ID="litBody" runat="server"></asp:Literal>
            </table>
        </div>
    </div>
</div>
<script language="javascript" type="text/javascript" src="./Scripts/KanBan_FixedHeader.js?v=<%= HMKanBan.SiteMaster.DATE_STRING %>"></script>
<script language="javascript" type="text/javascript" src="./Scripts/KanBan_FixedHeader.js?v=<%= HMKanBan.SiteMaster.DATE_STRING %>"></script>
<script language="javascript" type="text/javascript">
    function Init() {
        KanBan_FixedHeader.HeaderName = "Flyer";
        KanBan_FixedHeader.MenuObj = document.getElementById("divMenu");
        KanBan_FixedHeader.PageObj = document.getElementById("divPage");
    }
    function ExtendList() {
        var tbl = document.getElementById("tblGrp");
        var con = document.getElementById("conGrp");
        if (con && tbl) {
            var targetWidth = tbl.offsetWidth + 2500;
            ApoJS.Animation.SetWidth(con, con.offsetWidth, targetWidth, 35, 20, 0.5, function () {
            });
        }
    }
    window.onload = function () {
        KanBan.Init(function () {
            Init();
            ExtendList();
            KanBan_FixedHeader.Init();
        });
    }
</script>
</asp:Content>
