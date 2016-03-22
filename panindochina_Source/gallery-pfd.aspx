<%@ Page Title="" Language="C#" MasterPageFile="~/site-gallery.master" AutoEventWireup="true" CodeFile="gallery-pfd.aspx.cs" Inherits="gallery_pfd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>PDF</title>
    <meta name="description" content="PDF" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" Runat="Server">
    <a href="gallery.aspx">Library<span class="icon-caret-right"></span></a><span>PDF</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="title desktop-992">
        PDF</h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">PDF<span class="iconar icon-chevron-down"></span></a></h2>
    <asp:ListView ID="lstFaq" runat="server" DataSourceID="odsFaq" EnableModelValidation="True">
        <ItemTemplate>
            <li><a href='<%# progressTitle(Eval("DownloadCategoryNameEn")) + "-dpi-" + Eval("ParentID") + "-dri-" + Eval("DownloadCategoryID") + ".aspx" %>'><%# Eval("DownloadCategoryNameEn")%></a></li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul class="list-faq">
                <li runat="server" id="itemPlaceholder"></li>
            </ul>
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsFaq" runat="server" 
        SelectMethod="DownloadCategorySelectAll" TypeName="TLLib.DownloadCategory">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="parentID" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
            <asp:Parameter Name="IsShowOnMenu" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" DefaultValue="" />
            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <h2 class="title-link mobile-992">
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>PDF</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" Runat="Server">
</asp:Content>

