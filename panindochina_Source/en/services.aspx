<%@ Page Title="" Language="C#" MasterPageFile="~/en/site.master" AutoEventWireup="true"
    CodeFile="services.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Panindochina</title>
    <meta name="description" content="Panindochina" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="site">
        <div class="container">
            <a id="A1" href="~/en/" runat="server">Home<span class="icon-caret-right"></span></a>
            <span>Service</span>
        </div>
    </div>
    <div class="container wrap-service">
        <div class="text-center wrapper-880">
            <h4 class="text-uppercase title-1">
                Our Services</h4>
            <div class="desription">
                <asp:ListView ID="lstTitleService" runat="server" DataSourceID="odsTitleService"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <asp:Label ID="lblTitleProduct" runat="server" Text='<%# Eval("ContentEn") %>'></asp:Label>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsTitleService" runat="server" SelectMethod="ArticleSelectAll"
                    TypeName="TLLib.Article">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ArticleTitle" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter DefaultValue="5" Name="ArticleCategoryID" Type="String" />
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
            </div>
        </div>
        <div class="wrap-parent">
            <%--<a href="#">
                <img src="assets/images/pa-img-1.jpg" alt="" /></a> <a href="#">
                    <img src="assets/images/pa-img-2.jpg" alt="" /></a> <a href="#">
                        <img src="assets/images/pa-img-3.jpg" alt="" /></a> <a href="#">
                            <img src="assets/images/pa-img-4.jpg" alt="" /></a>--%>
            <asp:ListView ID="lstLogoServices" runat="server" DataSourceID="odsLogoServices"
                EnableModelValidation="True">
                <ItemTemplate>
                    <img alt='<%# Eval("FileName") %>' src='<%# !string.IsNullOrEmpty(Eval("FileName").ToString()) ? "~/res/advertisement/" + Eval("FileName") : "~/assets/images/pa-img-1.jpg" %>'
                        runat="server" />
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsLogoServices" runat="server" SelectMethod="AdsBannerSelectAll"
                TypeName="TLLib.AdsBanner">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter DefaultValue="7" Name="AdsCategoryID" Type="String" />
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
        <div class="product-group row service-wrap">
            <asp:ListView ID="lstServiceCategory" runat="server" DataSourceID="odsServiceCategory"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="colno-3 element-item">
                        <div class="servece-box wrap-effecth">
                            <a href='<%# progressTitle(Eval("ServiceCategoryNameEn")) + "-sci-" + Eval("ServiceCategoryID") + ".aspx" %>' class="product-img effect-hover"><span class="hover-img fullbox-img">
                                <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/servicecategory/" + Eval("ImageName") : "~/assets/images/service-img-1a.jpg" %>' runat="server" /></span> <span class="hover-img fullbox-img">
                                    <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageNameHover").ToString()) ? "~/res/servicecategory/imagehover/" + Eval("ImageNameHover") : "~/assets/images/service-img-1.jpg" %>' runat="server" /></span>
                            </a>
                            <h5 class="product-name">
                                <a href='<%# progressTitle(Eval("ServiceCategoryNameEn")) + "-sci-" + Eval("ServiceCategoryID") + ".aspx" %>' class="text-uppercase"><%# Eval("ServiceCategoryNameEn")%><span class="icon-angle-right iconar"></span></a></h5>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsServiceCategory" runat="server" 
                SelectMethod="ServiceCategorySelectAll" TypeName="TLLib.ServiceCategory"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
