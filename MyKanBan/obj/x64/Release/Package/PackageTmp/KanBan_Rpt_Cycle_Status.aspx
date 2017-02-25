<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KanBan_Rpt_Cycle_Status.aspx.cs" Inherits="MyKanBan.KanBan_Rpt_Cycle_Status" EnableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
    .CycleContainer
    {
        color:#1ba1e2;
        font-size:18px;
    }
    .CycleSearch
    {
        padding-top:10px;
        text-align:left;
    }
    .CycleSearchCell
    {
        padding:5px 50px 5px 0px;
    }
    .CycleChart
    {
        text-align:left;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="kanbanTitle">
    <div class="kanbanTitle_label">
        <h1 id="kanban_Title_<%= KanBanObj.ID.ToString() %>">
            <%= KanBanObj.Name %> - Cycle Status
        </h1>
    </div>
</div>
<div class="clear"></div>
<div class="kanbanContainer">
    <div class="innerContainer" id="conRpt" style="width:auto;">
        <div class="CycleContainer">
            <div class="CycleSearch">
                <asp:UpdatePanel ID="upCycle" runat="server" UpdateMode="Conditional" ViewStateMode="Enabled">
                    <ContentTemplate>
                        <div class="CycleSearchCell">
                            Cycle:&nbsp; 
                            <asp:DropDownList ID="ddlStart" runat="server" AutoPostBack="true" DataTextField="Name" DataValueField="ID" OnSelectedIndexChanged="DDLSelect_Change"></asp:DropDownList>
                            &nbsp;-&nbsp;
                            <asp:DropDownList ID="ddlEnd" runat="server" AutoPostBack="true" DataTextField="Name" DataValueField="ID" OnSelectedIndexChanged="DDLSelect_Change"></asp:DropDownList>
                        </div>
                        <div class="CycleSearchCell">
                            Remain: <asp:CheckBox ID="chkInventory" runat="server" AutoPostBack="true" Checked="true" OnCheckedChanged="CHKSelect_Change" />&nbsp;&nbsp;
                            Create: <asp:CheckBox ID="chkIn" runat="server" AutoPostBack="true" Checked="true" OnCheckedChanged="CHKSelect_Change" />&nbsp;&nbsp;
                            Remove: <asp:CheckBox ID="chkOut" runat="server" AutoPostBack="true" Checked="true" OnCheckedChanged="CHKSelect_Change" />
                        </div>
                        <asp:HiddenField ID="hidConfig" runat="server" />
                        <asp:HiddenField ID="hidData" runat="server" />
                        <asp:HiddenField ID="hidConfigCu" runat="server" />
                        <asp:HiddenField ID="hidDataCu" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="clear"></div>
            <div class="CycleChart">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			        id="rptCycle_o" name="rptCycle_o" width="820" height="320"
			        codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
			        <param name="movie" value="./Resource/ApoChart.swf" />
			        <param name="quality" value="high" />
			        <param name="wmode" value="transparent" />
			        <param name="bgcolor" value="#ffffff" />
			        <param name="allowScriptAccess" value="sameDomain" />
			        <embed src="./Resource/ApoChart.swf" quality="high" 
				        width="820" height="320" id="rptCycle_e" name="rptCycle_e" align="middle"
				        play="true"
				        loop="false"
                        wmode="transparent" 
                        bgcolor="#ffffff"
				        quality="high"
				        allowScriptAccess="sameDomain"
				        type="application/x-shockwave-flash"
				        pluginspage="http://www.adobe.com/go/getflashplayer">
			        </embed>
	            </object>
            </div>
            <div class="clear"></div>
            <div class="CycleChart">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			        id="rptCu_o" name="rptCu_o" width="820" height="320"
			        codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
			        <param name="movie" value="./Resource/ApoChart.swf" />
			        <param name="quality" value="high" />
			        <param name="wmode" value="transparent" />
			        <param name="bgcolor" value="#ffffff" />
			        <param name="allowScriptAccess" value="sameDomain" />
			        <embed src="./Resource/ApoChart.swf" quality="high" 
				        width="820" height="320" id="rptCu_e" name="rptCu_e" align="middle"
				        play="true"
				        loop="false"
                        wmode="transparent" 
                        bgcolor="#ffffff"
				        quality="high"
				        allowScriptAccess="sameDomain"
				        type="application/x-shockwave-flash"
				        pluginspage="http://www.adobe.com/go/getflashplayer">
			        </embed>
	            </object>
            </div>
        </div>
    </div>
</div>
<script language="javascript" type="text/javascript">
    function RefreshChart() {
        var strID = "rptCycle_e";
        if (ApoJS.Base.GetOS() == ApoJS.Base.OS.IE)
        {
            strID = "rptCycle_o";
        }
        var objChart = document.getElementById(strID);
        var hidConfig = document.getElementById("<%= hidConfig.ClientID %>");
        if ((typeof objChart != 'undefined')
            && (typeof objChart.initChart != 'undefined')
            && (typeof hidConfig != 'undefined')) {
            objChart.initChart(hidConfig.value);
        } else {
            setTimeout(function () { RefreshChart(); }, 200);
        }
    }

    function RefreshChartData() {
        var strID = "rptCycle_e";
        if (ApoJS.Base.GetOS() == ApoJS.Base.OS.IE) {
            strID = "rptCycle_o";
        }
        var objChart = document.getElementById(strID);
        var hidData = document.getElementById("<%= hidData.ClientID %>");
        if ((typeof objChart != 'undefined')
            && (typeof objChart.refreshData != 'undefined')
            && (typeof hidData != 'undefined')) {
            objChart.refreshData(hidData.value);
        } else {
            setTimeout(function () { RefreshChartData(); }, 200);
        }
    }

    function RefreshChartCu() {
        var strID = "rptCu_e";
        if (ApoJS.Base.GetOS() == ApoJS.Base.OS.IE) {
            strID = "rptCu_o";
        }
        var objChart = document.getElementById(strID);
        var hidConfig = document.getElementById("<%= hidConfigCu.ClientID %>");
        if ((typeof objChart != 'undefined')
            && (typeof objChart.initChart != 'undefined')
            && (typeof hidConfig != 'undefined')) {
            objChart.initChart(hidConfig.value);
        } else {
            setTimeout(function () { RefreshChartCu(); }, 200);
        }
    }

    function RefreshChartDataCu() {
        var strID = "rptCu_e";
        if (ApoJS.Base.GetOS() == ApoJS.Base.OS.IE) {
            strID = "rptCu_o";
        }
        var objChart = document.getElementById(strID);
        var hidData = document.getElementById("<%= hidDataCu.ClientID %>");
        if ((typeof objChart != 'undefined')
            && (typeof objChart.refreshData != 'undefined')
            && (typeof hidData != 'undefined')) {
            objChart.refreshData(hidData.value);
        } else {
            setTimeout(function () { RefreshChartDataCu(); }, 200);
        }
    }

    window.onload = function () {
        KanBan.Init(function () { });
    }

    function cycle_callback(obj) {
        
    }

    function cycle_cu_callback(obj) {
        
    }
</script>
</asp:Content>
