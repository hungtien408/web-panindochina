<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-about.master" AutoEventWireup="true"
    CodeFile="events-details.aspx.cs" Inherits="events_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Panindochina</title>
    <meta name="description" content="Panindochina" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <asp:ListView ID="lstBreadcrum" runat="server" DataSourceID="odsBreadcrum" EnableModelValidation="True">
        <ItemTemplate>
            <%# !string.IsNullOrEmpty(Eval("ArticleCategoryLink").ToString()) ? "<a href='" + Eval("ArticleCategoryLink") + "'>" + Eval("ArticleCategoryNameEn") + "<span class='icon-caret-right'></span></a>" : ""%>
        </ItemTemplate>
        <LayoutTemplate>
            <a href="gioi-thieu.aspx">Panindochina<span class="icon-caret-right"></span></a><span
                runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <span>
        <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
    <asp:ObjectDataSource ID="odsBreadcrum" runat="server" SelectMethod="ArticleCategoryHierarchyToTopSelectAll"
        TypeName="TLLib.ArticleCategory">
        <SelectParameters>
            <asp:QueryStringParameter Name="CurrentArticleCategoryID" QueryStringField="tci"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">
        <asp:Label ID="lblTitle1" runat="server"></asp:Label></h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">
            <asp:Label ID="lblTitle2" runat="server"></asp:Label><span class="iconar icon-chevron-down"></span></a></h2>
    <asp:ListView ID="lstEventDetails" runat="server" DataSourceID="odsEventDetails"
        EnableModelValidation="True">
        <ItemTemplate>
            <div class="wrapper-text">
                <div class="date">
                    <%# string.Format("{0:dd/mm/yyyy}", Eval("CreateDate")) %></div>
                <h3 class="title-2">
                    <%# Eval("ArticleTitleEn")%></h3>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContentEn") %>'></asp:Label>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsEventDetails" runat="server" 
        SelectMethod="ArticleSelectOne" TypeName="TLLib.Article">
        <SelectParameters>
            <asp:QueryStringParameter Name="ArticleID" QueryStringField="ti" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <h2 class="title-link mobile-992">
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>
            <asp:Label ID="lblTitle3" runat="server"></asp:Label></a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
