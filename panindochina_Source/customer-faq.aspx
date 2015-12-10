<%@ Page Title="" Language="C#" MasterPageFile="~/site-customer.master" AutoEventWireup="true"
    CodeFile="customer-faq.aspx.cs" Inherits="customer_being" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>FAQs</title>
    <meta name="description" content="FAQs" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="customer-catalogue.aspx">Customer Support<span class="icon-caret-right"></span></a><span>FAQs</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">
        FAQs</h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">FAQs<span class="iconar icon-chevron-down"></span></a></h2>
    <asp:ListView ID="lstFaq" runat="server" DataSourceID="odsFaq" EnableModelValidation="True">
        <ItemTemplate>
            <li><a href='<%# progressTitle(Eval("DownloadCategoryName")) + "-dci-" + Eval("ParentID") + "-dri-" + Eval("DownloadCategoryID") + ".aspx" %>'><%# Eval("DownloadCategoryName") %></a></li>
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
            <asp:Parameter DefaultValue="14" Name="parentID" Type="Int32" />
            <asp:Parameter DefaultValue="2" Name="increaseLevelCount" Type="Int32" />
            <asp:Parameter Name="IsShowOnMenu" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <h2 class="title-link mobile-992">
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>FAQs</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
