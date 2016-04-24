<%@ Page Title="" Language="C#" MasterPageFile="~/site-service.master" AutoEventWireup="true"
    CodeFile="service-details.aspx.cs" Inherits="events_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Panindochina</title>
    <meta name="description" content="Panindochina" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <%--<a href="services.aspx">Service<span class="icon-caret-right"></span></a><span>Bắt đầu
        hoạt động với lĩnh vực kinh doanh</span>--%>
        <asp:ListView ID="lstBreadcrum" runat="server" DataSourceID="odsBreadcrum" EnableModelValidation="True">
        <ItemTemplate>
            <%# "<a href='" + progressTitle(Eval("ServiceCategoryNameEn")) + "-sci-" + Eval("ServiceCategoryID") + ".aspx" + "'>" + Eval("ServiceCategoryNameEn") + "<span class='icon-caret-right'></span></a>"%>
        </ItemTemplate>
        <LayoutTemplate>
            <a href="services.aspx">Service<span class="icon-caret-right"></span></a><span
                runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <span>
        <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
    <asp:ObjectDataSource ID="odsBreadcrum" runat="server" SelectMethod="ServiceCategoryHierarchyToTopSelectAll"
        TypeName="TLLib.ServiceCategory">
        <SelectParameters>
            <asp:QueryStringParameter Name="CurrentServiceCategoryID" QueryStringField="sci"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnlinkserdetails" runat="server" />
    <a class="a-link-ser-details" href="<%= hdnlinkserdetails.Value %>"></a>
    <h1 class="title desktop-992">
        <asp:Label ID="lblTitle1" runat="server"></asp:Label></h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">
            <asp:Label ID="lblTitle2" runat="server"></asp:Label><span class="iconar icon-chevron-down"></span></a></h2>
    <asp:ListView ID="lstServiceDetail" runat="server" DataSourceID="odsServiceDetail"
        EnableModelValidation="True">
        <ItemTemplate>
            <h3 class="title-2"><%# Eval("ServiceTitleEn")%></h3>
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContentEn") %>'></asp:Label>
        </ItemTemplate>
        <LayoutTemplate>
            <div class="wrapper-text">
                <span runat="server" id="itemPlaceholder" />
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsServiceDetail" runat="server" 
        SelectMethod="ServiceSelectOne" TypeName="TLLib.Service">
        <SelectParameters>
            <asp:QueryStringParameter Name="ServiceID" QueryStringField="si" 
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
