<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Panindochina</title>
    <meta name="description" content="Panindochina" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="banner">
        <div class="slider-wrapper">
            <%--<div id="slider" class="nivoSlider">
                <img src="assets/images/banner-img-1.jpg" alt=""/>
                <img src="assets/images/banner-img-2.jpg" alt=""/>
                <img src="assets/images/banner-img-3.jpg" alt=""/>
                <img src="assets/images/banner-img-4.jpg" alt=""/>
            </div>--%>
            <asp:ListView ID="lstBanner" runat="server" DataSourceID="odsBanner" EnableModelValidation="True">
                <ItemTemplate>
                    <a href='<%# Eval("Website") %>'><img alt='<%# Eval("FileName") %>' src='<%# !string.IsNullOrEmpty(Eval("FileName").ToString()) ? "~/res/advertisement/" + Eval("FileName") : "~/assets/images/banner-img-1.jpg" %>'
                        runat="server" /></a>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="slider" class="nivoSlider">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsBanner" runat="server" SelectMethod="AdsBannerSelectAll"
                TypeName="TLLib.AdsBanner">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter DefaultValue="5" Name="AdsCategoryID" Type="String" />
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
    </div>
    <div class="container">
        <div class="text-center wrapper-880">
            <h4 class="text-uppercase title-1">
                products</h4>
            <div class="desription">
                <asp:ListView ID="lstTitleProduct" runat="server" DataSourceID="odsTitleProduct"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <asp:Label ID="lblTitleProduct" runat="server" Text='<%# Eval("ContentEn") %>'></asp:Label>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsTitleProduct" runat="server" SelectMethod="ArticleSelectAll"
                    TypeName="TLLib.Article">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ArticleTitle" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter DefaultValue="4" Name="ArticleCategoryID" Type="String" />
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
        <asp:ListView ID="lstProductGroup" runat="server" DataSourceID="odsProductGroup"
            EnableModelValidation="True">
            <ItemTemplate>
                <div class="colno-5 element-item">
                    <div class="producta wrap-effecth">
                        <a href='<%# progressTitle(Eval("ProductCategoryNameEn")) + "-pci-" + Eval("ProductCategoryID") + ".aspx" %>'
                            class="product-img effect-hover"><span class="hover-img fullbox-img">
                                <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/productcategory/" + Eval("ImageName") : "~/assets/images/product-a-1.jpg" %>'
                                    runat="server" /></span> <span class="hover-img fullbox-img">
                                        <img class="hideo" alt='<%# Eval("ImageNameHover") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageNameHover").ToString()) ? "~/res/productcategory/imagehover/" + Eval("ImageNameHover") : "~/assets/images/product-a-2.jpg" %>'
                                            runat="server" /></span> </a>
                        <h5 class="product-name">
                            <a href='<%# progressTitle(Eval("ProductCategoryNameEn")) + "-pci-" + Eval("ProductCategoryID") + ".aspx" %>'>
                                <%# Eval("ProductCategoryNameEn") %></a></h5>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div class="product-group">
                    <span runat="server" id="itemPlaceholder" />
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsProductGroup" runat="server" SelectMethod="ProductCategorySelectAll"
            TypeName="TLLib.ProductCategory">
            <SelectParameters>
                <asp:Parameter Name="parentID" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                <asp:Parameter Name="IsShowOnMenu" Type="String" />
                <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <div class="wrapper-tabs">
            <div class="head desktop-showhide">
                <ul id="controlTab" class="control-tabs">
                    <li><a href="#tabs-1" class="text-uppercase">Products <strong>new</strong></a></li>
                    <li><a href="#tabs-2" class="text-uppercase">Products <strong>hot</strong></a></li>
                    <li><a href="#tabs-3" class="text-uppercase">Products <strong>safe off</strong></a></li>
                </ul>
                <a href="product.aspx" class="more-all">See all <span class="icon-caret-right"></span>
                </a>
            </div>
            <div class="wrap-tabs-content">
                <h4 class="mobile-showhide tabs-title">
                    <a href="#tabs-1" class="text-uppercase">Products <strong>new</strong><span class="icon-plus-sign iconar"></span><span
                        class="icon-minus-sign iconar"></span></a></h4>
                <div id="tabs-1" class="tabs-content">
                    <div class="row">
                        <div class="jcarousel-wrapper jcarousel-protab">
                            <div class="jcarousel">
                                <asp:ListView ID="lstProductNew" runat="server" DataSourceID="odsProductNew" EnableModelValidation="True">
                                    <ItemTemplate>
                                        <li>
                                            <div class="product-box product-boxbg">
                                                <div class="icon-new">
                                                    <img class="img-responsive" src='<%# bool.Parse(Eval("IsNew").ToString()) == true ? "../assets/images/icon-new.png" : "" %>'
                                                        alt="" />
                                                </div>
                                                <a target="_blank" href='<%# progressTitle(Eval("ProductNameEn")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                                                    class="product-img fullbox-img">
                                                    <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-img-1.jpg" %>'
                                                        runat="server" /></a>
                                                <h4 class="product-name">
                                                    <a target="_blank" href='<%# progressTitle(Eval("ProductNameEn")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                                        <%# Eval("ProductNameEn") %></a></h4>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <ul>
                                            <li runat="server" id="itemPlaceholder"></li>
                                        </ul>
                                    </LayoutTemplate>
                                </asp:ListView>
                                <asp:ObjectDataSource ID="odsProductNew" runat="server" SelectMethod="ProductSelectAll"
                                    TypeName="TLLib.Product">
                                    <SelectParameters>
                                        <asp:Parameter Name="StartRowIndex" Type="String" />
                                        <asp:Parameter Name="EndRowIndex" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                        <asp:Parameter Name="ProductName" Type="String" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:Parameter Name="PriceFrom" Type="String" />
                                        <asp:Parameter Name="PriceTo" Type="String" />
                                        <asp:Parameter Name="CategoryID" Type="String" />
                                        <asp:Parameter Name="ManufacturerID" Type="String" />
                                        <asp:Parameter Name="OriginID" Type="String" />
                                        <asp:Parameter Name="Tag" Type="String" />
                                        <asp:Parameter Name="InStock" Type="String" />
                                        <asp:Parameter Name="IsHot" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="IsNew" Type="String" />
                                        <asp:Parameter Name="IsBestSeller" Type="String" />
                                        <asp:Parameter Name="IsSaleOff" Type="String" />
                                        <asp:Parameter Name="IsAutomotive" Type="String" />
                                        <asp:Parameter Name="IsSteelMills" Type="String" />
                                        <asp:Parameter Name="IsMining" Type="String" />
                                        <asp:Parameter Name="IsConstruction" Type="String" />
                                        <asp:Parameter Name="IsPetroleum" Type="String" />
                                        <asp:Parameter Name="IsShipBuilding" Type="String" />
                                        <asp:Parameter Name="IsPharmaceutical" Type="String" />
                                        <asp:Parameter Name="IsPaints" Type="String" />
                                        <asp:Parameter Name="IsCement" Type="String" />
                                        <asp:Parameter Name="IsMarineService" Type="String" />
                                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                        <asp:Parameter Name="FromDate" Type="String" />
                                        <asp:Parameter Name="ToDate" Type="String" />
                                        <asp:Parameter Name="Priority" Type="String" />
                                        <asp:Parameter Name="PriorityByProduct" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                        <asp:Parameter Name="SortByPriority" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="SortByPriorityProduct" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                            <div class="control-a">
                                <a href="#" class="prev jcarousel-prev navigation-btn corner"><span class="icon-angle-left ">
                                </span></a><a href="#" class="next jcarousel-next navigation-btn corner"><span class="icon-angle-right ">
                                </span></a>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 class="mobile-showhide tabs-title">
                    <a href="#tabs-2" class="text-uppercase">Products <strong>hot</strong><span class="icon-plus-sign iconar"></span><span
                        class="icon-minus-sign iconar"></span></a></h4>
                <div id="tabs-2" class="tabs-content">
                    <div class="row">
                        <div class="jcarousel-wrapper jcarousel-protab">
                            <div class="jcarousel">
                                <asp:ListView ID="lstProductHot" runat="server" DataSourceID="odsProductHot" EnableModelValidation="True">
                                    <ItemTemplate>
                                        <li>
                                            <div class="product-box product-boxbg">
                                                <div class="icon-new">
                                                    <img class="img-responsive" src='<%# bool.Parse(Eval("IsNew").ToString()) == true ? "assets/images/icon-new.png" : "" %>'
                                                        alt="" />
                                                </div>
                                                <a target="_blank" href='<%# progressTitle(Eval("ProductNameEn")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                                                    class="product-img fullbox-img">
                                                    <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-img-1.jpg" %>'
                                                        runat="server" /></a>
                                                <h4 class="product-name">
                                                    <a target="_blank" href='<%# progressTitle(Eval("ProductNameEn")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                                        <%# Eval("ProductNameEn") %></a></h4>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <ul>
                                            <li runat="server" id="itemPlaceholder"></li>
                                        </ul>
                                    </LayoutTemplate>
                                </asp:ListView>
                                <asp:ObjectDataSource ID="odsProductHot" runat="server" SelectMethod="ProductSelectAll"
                                    TypeName="TLLib.Product">
                                    <SelectParameters>
                                        <asp:Parameter Name="StartRowIndex" Type="String" />
                                        <asp:Parameter Name="EndRowIndex" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                        <asp:Parameter Name="ProductName" Type="String" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:Parameter Name="PriceFrom" Type="String" />
                                        <asp:Parameter Name="PriceTo" Type="String" />
                                        <asp:Parameter Name="CategoryID" Type="String" />
                                        <asp:Parameter Name="ManufacturerID" Type="String" />
                                        <asp:Parameter Name="OriginID" Type="String" />
                                        <asp:Parameter Name="Tag" Type="String" />
                                        <asp:Parameter Name="InStock" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="IsHot" Type="String" />
                                        <asp:Parameter Name="IsNew" Type="String" />
                                        <asp:Parameter Name="IsBestSeller" Type="String" />
                                        <asp:Parameter Name="IsSaleOff" Type="String" />
                                        <asp:Parameter Name="IsAutomotive" Type="String" />
                                        <asp:Parameter Name="IsSteelMills" Type="String" />
                                        <asp:Parameter Name="IsMining" Type="String" />
                                        <asp:Parameter Name="IsConstruction" Type="String" />
                                        <asp:Parameter Name="IsPetroleum" Type="String" />
                                        <asp:Parameter Name="IsShipBuilding" Type="String" />
                                        <asp:Parameter Name="IsPharmaceutical" Type="String" />
                                        <asp:Parameter Name="IsPaints" Type="String" />
                                        <asp:Parameter Name="IsCement" Type="String" />
                                        <asp:Parameter Name="IsMarineService" Type="String" />
                                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                        <asp:Parameter Name="FromDate" Type="String" />
                                        <asp:Parameter Name="ToDate" Type="String" />
                                        <asp:Parameter Name="Priority" Type="String" />
                                        <asp:Parameter Name="PriorityByProduct" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                        <asp:Parameter Name="SortByPriority" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="SortByPriorityProduct" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                            <div class="control-a">
                                <a href="#" class="prev jcarousel-prev navigation-btn corner"><span class="icon-angle-left ">
                                </span></a><a href="#" class="next jcarousel-next navigation-btn corner"><span class="icon-angle-right ">
                                </span></a>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 class="mobile-showhide tabs-title">
                    <a href="#tabs-3" class="text-uppercase">Products <strong>safe off</strong><span
                        class="icon-plus-sign iconar"></span><span class="icon-minus-sign iconar"></span></a></h4>
                <div id="tabs-3" class="tabs-content">
                    <div class="row">
                        <div class="jcarousel-wrapper jcarousel-protab">
                            <div class="jcarousel">
                                <asp:ListView ID="lstProductSale" runat="server" DataSourceID="odsProductSale" EnableModelValidation="True">
                                    <ItemTemplate>
                                        <li>
                                            <div class="product-box product-boxbg">
                                                <div class="icon-new">
                                                    <img class="img-responsive" src='<%# bool.Parse(Eval("IsNew").ToString()) == true ? "assets/images/icon-new.png" : "" %>'
                                                        alt="" />
                                                </div>
                                                <a target="_blank" href='<%# progressTitle(Eval("ProductNameEn")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                                                    class="product-img fullbox-img">
                                                    <img id="Img1" class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-img-1.jpg" %>'
                                                        runat="server" /></a>
                                                <h4 class="product-name">
                                                    <a target="_blank" href='<%# progressTitle(Eval("ProductNameEn")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                                        <%# Eval("ProductNameEn") %></a></h4>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <ul>
                                            <li runat="server" id="itemPlaceholder"></li>
                                        </ul>
                                    </LayoutTemplate>
                                </asp:ListView>
                                <asp:ObjectDataSource ID="odsProductSale" runat="server" SelectMethod="ProductSelectAll"
                                    TypeName="TLLib.Product">
                                    <SelectParameters>
                                        <asp:Parameter Name="StartRowIndex" Type="String" />
                                        <asp:Parameter Name="EndRowIndex" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                        <asp:Parameter Name="ProductName" Type="String" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:Parameter Name="PriceFrom" Type="String" />
                                        <asp:Parameter Name="PriceTo" Type="String" />
                                        <asp:Parameter Name="CategoryID" Type="String" />
                                        <asp:Parameter Name="ManufacturerID" Type="String" />
                                        <asp:Parameter Name="OriginID" Type="String" />
                                        <asp:Parameter Name="Tag" Type="String" />
                                        <asp:Parameter Name="InStock" Type="String" />
                                        <asp:Parameter Name="IsHot" Type="String" />
                                        <asp:Parameter Name="IsNew" Type="String" />
                                        <asp:Parameter Name="IsBestSeller" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="IsSaleOff" Type="String" />
                                        <asp:Parameter Name="IsAutomotive" Type="String" />
                                        <asp:Parameter Name="IsSteelMills" Type="String" />
                                        <asp:Parameter Name="IsMining" Type="String" />
                                        <asp:Parameter Name="IsConstruction" Type="String" />
                                        <asp:Parameter Name="IsPetroleum" Type="String" />
                                        <asp:Parameter Name="IsShipBuilding" Type="String" />
                                        <asp:Parameter Name="IsPharmaceutical" Type="String" />
                                        <asp:Parameter Name="IsPaints" Type="String" />
                                        <asp:Parameter Name="IsCement" Type="String" />
                                        <asp:Parameter Name="IsMarineService" Type="String" />
                                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                        <asp:Parameter Name="FromDate" Type="String" />
                                        <asp:Parameter Name="ToDate" Type="String" />
                                        <asp:Parameter Name="Priority" Type="String" />
                                        <asp:Parameter Name="PriorityByProduct" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                        <asp:Parameter Name="SortByPriority" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="SortByPriorityProduct" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                            <div class="control-a">
                                <a href="#" class="prev jcarousel-prev navigation-btn corner"><span class="icon-angle-left">
                                </span></a><a href="#" class="next jcarousel-next navigation-btn corner"><span class="icon-angle-right">
                                </span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
        <div class="product-group row service-wrap">
            <asp:ListView ID="lstServiceCategory" runat="server" DataSourceID="odsServiceCategory"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="colno-3 element-item">
                        <div class="servece-box wrap-effecth">
                            <a href='<%# progressTitle(Eval("ServiceCategoryNameEn")) + "-sci-" + Eval("ServiceCategoryID") + ".aspx" %>'
                                class="product-img effect-hover"><span class="hover-img fullbox-img">
                                    <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/servicecategory/" + Eval("ImageName") : "~/assets/images/service-img-1.jpg" %>'
                                        runat="server" /></span> <span class="hover-img fullbox-img">
                                            <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageNameHover").ToString()) ? "~/res/servicecategory/imagehover/" + Eval("ImageNameHover") : "~/assets/images/service-img-2.jpg" %>'
                                                runat="server" /></span> </a>
                            <h5 class="product-name">
                                <a href='<%# progressTitle(Eval("ServiceCategoryNameEn")) + "-sci-" + Eval("ServiceCategoryID") + ".aspx" %>'
                                    class="text-uppercase">
                                    <%# Eval("ServiceCategoryNameEn")%><span class="icon-angle-right iconar"></span></a></h5>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsServiceCategory" runat="server" SelectMethod="ServiceCategorySelectAll"
                TypeName="TLLib.ServiceCategory"></asp:ObjectDataSource>
        </div>
        <div class="parent-wrap">
            <div class="jcarousel-wrapper jcarousel-parent hi-icon-wrap hi-icon-effect-9 hi-icon-effect-9a">
                <div class="jcarousel">
                    <%--<ul>
                        <li><a class="parrent-img corner hi-icon" href="#">
                            <img class="corner" src="assets/images/pare-img-1.jpg" alt="" />
                        </a></li>
                        <li><a class="parrent-img corner hi-icon" href="#">
                            <img class="corner" src="assets/images/pare-img-2.jpg" alt="" />
                        </a></li>
                        <li><a class="parrent-img corner hi-icon" href="#">
                            <img class="corner" src="assets/images/pare-img-3.jpg" alt="" />
                        </a></li>
                        <li><a class="parrent-img corner hi-icon" href="#">
                            <img class="corner" src="assets/images/pare-img-4.jpg" alt="" />
                        </a></li>
                        <li><a class="parrent-img corner hi-icon" href="#">
                            <img class="corner" src="assets/images/pare-img-5.jpg" alt="" />
                        </a></li>
                        <li><a class="parrent-img corner hi-icon" href="#">
                            <img class="corner" src="assets/images/pare-img-6.jpg" alt="" />
                        </a></li>
                        <li><a class="parrent-img corner hi-icon" href="#">
                            <img class="corner" src="assets/images/pare-img-2.jpg" alt="" />
                        </a></li>
                    </ul>--%>
                    <asp:ListView ID="lstPartent" runat="server" DataSourceID="odsPartent" EnableModelValidation="True">
                        <ItemTemplate>
                            <li><a class="parrent-img corner hi-icon" href='<%# string.IsNullOrEmpty(Eval("ManufacturerID").ToString()) ? "javascript:void(0);" : progressTitle(Eval("ManufacturerName")) + "-pmi-" + Eval("ManufacturerID") + ".aspx" %>'>
                                <img class="corner" alt='<%# Eval("PartnerImage") %>' src='<%# !string.IsNullOrEmpty(Eval("PartnerImage").ToString()) ? "~/res/partner/" + Eval("PartnerImage") : "~/assets/images/pare-img-1.jpg" %>'
                                    runat="server" />
                            </a></li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul>
                                <span runat="server" id="itemPlaceholder" />
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsPartent" runat="server" SelectMethod="PartnerSelectAll1"
                        TypeName="TLLib.Partner">
                        <SelectParameters>
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="PartnerName" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="LinkWebsite" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter Name="ManufacturerID" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <a href="#" class="prev jcarousel-prev navigation-btn"><span>&lsaquo;</span></a>
                <a href="#" class="next jcarousel-next navigation-btn"><span>&rsaquo;</span></a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
