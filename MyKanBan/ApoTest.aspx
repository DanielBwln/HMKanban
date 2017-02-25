<%@ Page Title="" Language="C#" MasterPageFile="~/Anony.Master" AutoEventWireup="true" CodeBehind="ApoTest.aspx.cs" Inherits="MyKanBan.ApoTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    KanBan: <asp:DropDownList ID="ddlKanBan" runat="server" OnSelectedIndexChanged="ddlKanBan_Change" DataTextField="Name" DataValueField="ID"></asp:DropDownList><br/>
    Cycle : <asp:DropDownList ID="ddlCycle" runat="server" OnSelectedIndexChanged="ddlCycle_Change" DataTextField="Name" DataValueField="ID"></asp:DropDownList><br/>
    Cycle Period : <asp:DropDownList ID="ddlPeriod" runat="server" DataTextField="Name" DataValueField="ID"></asp:DropDownList><br/>
    <asp:Button ID="btnPeriod" runat="server" Text="Generate" OnClick="btnPeriod_Click" /><asp:Button ID="btnAllPeriod" runat="server" Text="Generate All Period" OnClick="btnAllPeriod_Click" />
    <asp:Button ID="btnGenerate" runat="server" Text="Create Fake Change Log" OnClick="btnCreateFakeLog_Click" />
</asp:Content>
