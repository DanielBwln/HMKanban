<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TFS.aspx.cs" Inherits="HMKanBan.TFS" EnableEventValidation="false" ValidateRequest="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="./Styles/KanBan_TFS.css?v=<%= HMKanBan.SiteMaster.DATE_STRING %>" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="kanbanContainer">
    <span style="color:#898989; font-size:22px;">1. Select Query(<span style="color:#1BA1E2;">blue</span>) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. Click Button(<span style="color:#339933;">green</span>) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. Check the items out :-) </span>
</div>
<div class="kanbanContainer">
    <div class="innerContainer" id="conTFS" style="width:auto;">
        <fieldset>
            <legend>Query</legend>
            <div class="kanbanTable">
                <table id="tblTFS" class="tfsBoard" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="tfsQueryList">
                            <div class="QueryList">
                                <asp:Literal ID="litQueryList" runat="server"></asp:Literal>
                            </div>
                        </td>
                        <td class="tfsQuery">
                            <asp:UpdatePanel ID="upQuery" runat="server" UpdateMode="Conditional" ViewStateMode="Enabled"><ContentTemplate>
                                <asp:HiddenField ID="hidQueryID" runat="server" />
                                <asp:HiddenField ID="hidQueryType" runat="server" />
                                <asp:Button ID="btnQueryChange" runat="server" CssClass="hidden_button" OnClick="btnQueryChange_Click" />
                                <asp:Button ID="btnRunQuery" runat="server" CssClass="hidden_button" OnClick="btnRunQuery_Click" />
                                <asp:TextBox ID="txtQuery" CssClass="QueryInput" runat="server" TextMode="MultiLine" Enabled="false"></asp:TextBox>
                            </ContentTemplate></asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tfs_button_list">
                <div id="ActionButton" name="ActionButton" class="tfs_button" style="width:220px;" onclick="SelectButton('lost',this);">List un-KanBanned Items</div>
                <div id="ActionButton" name="ActionButton" class="tfs_button" style="width:220px;" onclick="SelectButton('all',this);">List All Items</div>
            </div>
        </fieldset>
    </div>
</div>
<div class="clear"></div>
<br />
<div class="kanbanContainer">
    <fieldset>
        <legend>TFS Items</legend>
        <div id="divLoading" class="tfs_list" style="display:none;text-align:center;">
            <img alt="Loading" src="./Images/loading_long.gif" />
        </div>
        <div id="divTFSList" class="tfs_list">
            <asp:UpdatePanel ID="upTable" runat="server" UpdateMode="Conditional"><ContentTemplate>
                <asp:DataGrid ID="tblTFS" runat="server" AutoGenerateColumns="False" AllowSorting="false" HeaderStyle-CssClass="TFSTable_Header" CssClass="TFSTable">
                    <Columns>
                        <asp:TemplateColumn HeaderText="TFS" HeaderStyle-CssClass="TFSTable_Header_TFS" ItemStyle-CssClass="TFSTable_TFS" >
                             <ItemTemplate>
                                <a target="_blank" href="<%# GetUrl( (String)Eval("Project"), (Int64)Eval("TFSID")) %>"><%# Eval("TFSID") %></a>
                             </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="Title" HeaderText="Title" ReadOnly="True" HeaderStyle-CssClass="TFSTable_Header_Title" ItemStyle-CssClass="TFSTable_Title" />
                        
                    </Columns>
                </asp:DataGrid>
            </ContentTemplate></asp:UpdatePanel>
        </div>
    </fieldset>
</div>
<script language="javascript" type="text/javascript" src="./Scripts/KanBan_TFS.js?v=<%= HMKanBan.SiteMaster.DATE_STRING %>"></script>
<script language="javascript" type="text/javascript">
    function ExtendList() {
        var tbl = document.getElementById("tblTFS");
        var con = document.getElementById("conTFS");
        if (con && tbl) {
            var targetWidth = tbl.offsetWidth + 2500;
            ApoJS.Animation.SetWidth(con, con.offsetWidth, targetWidth, 35, 20, 0.5, function () {
            });
        }
    }

    function SelectQuery(id, cur){
        KanBan_TFS.SelectQuery(id, cur);
        var obj = document.getElementById("<%= hidQueryID.ClientID %>");
        if (obj) {
            obj.value = id;
            __doPostBack('<%=btnQueryChange.UniqueID %>', '');
        }
    }

    function ImportItem()
    {
    }

    function SelectButton(type, cur)
    {
        KanBan_TFS.SelectButton(type, cur);
        var obj = document.getElementById("<%= hidQueryType.ClientID %>");
        if (obj) {
            obj.value = type;
            __doPostBack('<%=btnRunQuery.UniqueID %>', '');
            ShowLoading();
        }
    }

    function ShowLoading()
    {
        var divLoad = document.getElementById("divLoading");
        var divTFSList = document.getElementById("divTFSList");
        divLoad.style.display = "";
        divTFSList.style.display = "none";
    }

    function HideLoading()
    {
        var divLoad = document.getElementById("divLoading");
        var divTFSList = document.getElementById("divTFSList");
        divLoad.style.display = "none";
        divTFSList.style.display = "";
    }

    KanBan.Init(function () { ExtendList(); });
    KanBan_TFS.CUR_ID = <%= CurQueryID %>;
</script>
</asp:Content>
