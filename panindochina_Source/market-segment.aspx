<%@ Page Title="" Language="C#" MasterPageFile="~/site-market.master" AutoEventWireup="true"
    CodeFile="market-segment.aspx.cs" Inherits="market_segment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Panindochina</title>
    <meta name="description" content="Panindochina" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="gioi-thieu.aspx">Panindochina<span class="icon-caret-right"></span></a><span><asp:Label ID="lblTitle3" runat="server"></asp:Label></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnlinkms" runat="server" />
    <a class="a-link-ms" href="<%= hdnlinkms.Value %>"></a>
    <h1 class="title desktop-992">
        <asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">
            <asp:Label ID="lblTitle1" runat="server"></asp:Label><span class="iconar icon-chevron-down"></span></a></h2>
    <div class="slider-sub">
        <asp:ListView ID="lstBannerMarketSegment" runat="server" DataSourceID="odsBannerMarketSegment" EnableModelValidation="True">
            <ItemTemplate>
                <div class="slide">
                    <img alt='<%# Eval("FileName") %>' src='<%# !string.IsNullOrEmpty(Eval("FileName").ToString()) ? "~/res/advertisement/" + Eval("FileName") : "~/assets/images/slider-img-1.jpg" %>'
                        runat="server" /></div>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="sliderBanner">
                    <span runat="server" id="itemPlaceholder" />
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsBannerMarketSegment" runat="server" SelectMethod="AdsBannerSelectAll"
            TypeName="TLLib.AdsBanner">
            <SelectParameters>
                <asp:Parameter Name="StartRowIndex" Type="String" />
                <asp:Parameter Name="EndRowIndex" Type="String" />
                <asp:Parameter DefaultValue="8" Name="AdsCategoryID" Type="String" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="Website" Type="String" />
                <asp:Parameter Name="FromDate" Type="String" />
                <asp:Parameter Name="ToDate" Type="String" />
                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <div class="wrapper-text">
        <asp:ListView ID="lstMarketSegment" runat="server" DataSourceID="odsMarketSegment" EnableModelValidation="True">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContentEn") %>'></asp:Label>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsMarketSegment" runat="server" SelectMethod="ArticleSelectOne"
            TypeName="TLLib.Article">
            <SelectParameters>
                <asp:QueryStringParameter Name="ArticleID" 
                    QueryStringField="mi" Type="String"/>
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <h2 class="title-link mobile-992">
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span><asp:Label ID="lblTitle2" runat="server"></asp:Label></a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
