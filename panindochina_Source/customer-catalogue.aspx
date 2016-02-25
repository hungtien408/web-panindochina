<%@ Page Title="" Language="C#" MasterPageFile="~/site-customer.master" AutoEventWireup="true"
    CodeFile="customer-catalogue.aspx.cs" Inherits="customer_catalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Catalogue / Brochure</title>
    <meta name="description" content="Catalogue / Brochure" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="customer-catalogue.aspx">Customer Support<span class="icon-caret-right"></span></a><span>Catalogue
        / Brochure</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">
        Catalogue / Brochure</h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">Catalogue / Brochure<span class="iconar icon-chevron-down"></span></a></h2>
    <asp:ListView ID="lstDownloadCategory" runat="server" DataSourceID="odsDowloadCategoryAll"
        EnableModelValidation="True">
        <ItemTemplate>
            <div class="col-sm-4 col-xs-6 element-item">
                <div class="maga-box ">
                    <a href='<%# progressTitle(Eval("DownloadCategoryNameEn")) + "-mg-" + Eval("DownloadCategoryID") + ".aspx" %>'
                        class="maga-img">
                        <img class="corner" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/downloadcategory/" + Eval("ImageName") : "~/assets/images/magazeni-img-1.jpg" %>'
                            runat="server" /></a>
                    <h3 class="maga-name">
                        <a href='<%# progressTitle(Eval("DownloadCategoryNameEn")) + "-mg-" + Eval("DownloadCategoryID") + ".aspx" %>'>
                            <%# Eval("DownloadCategoryNameEn")%></a></h3>
                </div>
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <div id="isotopelist" class="tb-magazine">
                <span runat="server" id="itemPlaceholder" />
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsDowloadCategoryAll" runat="server" SelectMethod="DownloadCategorySelectAll"
        TypeName="TLLib.DownloadCategory">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="parentID" Type="Int32" />
            <asp:Parameter DefaultValue="2" Name="increaseLevelCount" Type="Int32" />
            <asp:Parameter Name="IsShowOnMenu" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <h2 class="title-link mobile-992">
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>Catalogue
            / Brochure</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
