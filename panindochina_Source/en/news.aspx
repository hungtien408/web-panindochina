<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-about.master" AutoEventWireup="true"
    CodeFile="news.aspx.cs" Inherits="events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Panindochina</title>
    <meta name="description" content="Panindochina" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <%--<a href="#">Panindochina<span class="icon-caret-right"></span></a><a href="#">Events<span
        class="icon-caret-right"></span></a><span>Bắt đầu hoạt động với lĩnh vực kinh doanh</span>--%>
    <asp:ListView ID="lstBreadcrum" runat="server" DataSourceID="odsBreadcrum" EnableModelValidation="True">
        <ItemTemplate>
            <%# string.IsNullOrEmpty(Request.QueryString["tri"]) ? "<span>News</span>" : Container.DataItemIndex == ((System.Data.DataView)odsBreadcrum.Select()).Count - 1 ? "<span>" + Eval("ArticleCategoryNameEn") + "</span>" : !string.IsNullOrEmpty(Eval("ArticleCategoryLink").ToString()) ? Eval("ArticleCategoryLink") : ""%>
        </ItemTemplate>
        <LayoutTemplate>
            <a href="gioi-thieu.aspx">Panindochina<span class="icon-caret-right"></span></a><span
                runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsBreadcrum" runat="server" SelectMethod="ArticleCategoryHierarchyToTopSelectAll"
        TypeName="TLLib.ArticleCategory">
        <SelectParameters>
            <asp:QueryStringParameter Name="CurrentArticleCategoryID" QueryStringField="tri"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">
        <asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">
            <asp:Label ID="lblTitle1" runat="server"></asp:Label><span class="iconar icon-chevron-down"></span></a></h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ListView ID="lstNews" runat="server" DataSourceID="odsNews" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="events-box">
                        <a href='<%# progressTitle(Eval("ArticleTitleEn")) + "-tci-" + Eval("ArticleCategoryID") + "-ti-" + Eval("ArticleID") + ".aspx" %>'
                            class="events-img">
                            <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/article/" + Eval("ImageName") : "~/assets/images/events-img-1.jpg" %>'
                                runat="server" /></a>
                        <div class="events-content">
                            <div class="date">
                                <%# string.Format("{0:dd/mm/yyyy}", Eval("CreateDate")) %></div>
                            <h4 class="events-name">
                                <a href='<%# progressTitle(Eval("ArticleTitleEn")) + "-tci-" + Eval("ArticleCategoryID") + "-ti-" + Eval("ArticleID") + ".aspx" %>'>
                                    <%# Eval("ArticleTitleEn")%></a></h4>
                            <div class="description">
                                <%# Eval("DescriptionEn")%></div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="wrapper-list">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsNews" runat="server" SelectMethod="ArticleSelectAll"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ArticleTitle" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter DefaultValue="12" Name="ArticleCategoryID" Type="String" />
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
                <asp:DataPager ID="DataPager1" runat="server" PageSize="8" PagedControlID="lstNews">
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
            <asp:Label ID="lblTitle2" runat="server"></asp:Label></a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
