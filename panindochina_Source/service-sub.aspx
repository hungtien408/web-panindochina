<%@ Page Title="" Language="C#" MasterPageFile="~/site-service.master" AutoEventWireup="true"
    CodeFile="service-sub.aspx.cs" Inherits="service_sub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Panindochina</title>
    <meta name="description" content="Panindochina" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="services.aspx">Service<span class="icon-caret-right"></span></a><span><asp:Label
        ID="lblTitle" runat="server"></asp:Label></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnlinkser" runat="server" />
    <a class="a-link-ser" href="<%= hdnlinkser.Value %>"></a>
    <h1 class="title desktop-992">
        <asp:Label ID="lblTitle1" runat="server"></asp:Label></h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">
            <asp:Label ID="lblTitle2" runat="server"></asp:Label><span class="iconar icon-chevron-down"></span></a></h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ListView ID="lstService" runat="server" DataSourceID="odsService" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="events-box">
                        <a href='<%# progressTitle(Eval("ServiceTitleEn")) + "-sci-" + Eval("ServiceCategoryID") + "-si-" + Eval("ServiceID") + ".aspx" %>'
                            class="events-img">
                            <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/service/" + Eval("ImageName") : "~/assets/images/service-imga-1.jpg" %>'
                                runat="server" /></a>
                        <div class="events-content">
                            <h4 class="events-name">
                                <a class="text-uppercase" href='<%# progressTitle(Eval("ServiceTitleEn")) + "-sci-" + Eval("ServiceCategoryID") + "-si-" + Eval("ServiceID") + ".aspx" %>'>
                                    <%# Eval("ServiceTitleEn") %></a></h4>
                            <div class="description">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("DescriptionEn") %>'></asp:Label>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="wrapper-list wrap-boxline">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsService" runat="server" SelectMethod="ServiceSelectAll"
                TypeName="TLLib.Service">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ServiceTitle" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:QueryStringParameter Name="ServiceCategoryID" QueryStringField="sci" Type="String" />
                    <asp:Parameter Name="Tag" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    <asp:Parameter Name="IsHot" Type="String" />
                    <asp:Parameter Name="IsNew" Type="String" />
                    <asp:Parameter Name="FromDate" Type="String" />
                    <asp:Parameter Name="ToDate" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div id="pagerp" class="pager">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="4" PagedControlID="lstService">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowNextPageButton="false"
                            ShowPreviousPageButton="false" ButtonCssClass="first" RenderDisabledButtonsAsLabels="true" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowNextPageButton="false"
                            ShowPreviousPageButton="true" ButtonCssClass="prev" RenderDisabledButtonsAsLabels="true" />
                        <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="numer-paging" CurrentPageLabelCssClass="current" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false" ButtonCssClass="next"
                            ShowNextPageButton="true" ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ButtonCssClass="last"
                            ShowNextPageButton="false" ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true" />
                    </Fields>
                </asp:DataPager>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <h2 class="title-link mobile-992">
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>
            <asp:Label ID="lblTitle3" runat="server"></asp:Label></a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
