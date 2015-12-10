<%@ Page Title="" Language="C#" MasterPageFile="~/site-product.master" AutoEventWireup="true"
    CodeFile="product-details.aspx.cs" Inherits="product_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <asp:ListView ID="lstBreadcrum" runat="server" DataSourceID="odsBreadcrum" EnableModelValidation="True">
                <ItemTemplate>
                    <%# "<a href='" + progressTitle(Eval("ProductCategoryName")) + "-pci-" + Eval("ProductCategoryID") + ".aspx" + "'>" + Eval("ProductCategoryName") + "<span class='icon-caret-right'></span></a>"%>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsBreadcrum" runat="server" SelectMethod="ProductCategoryHierarchyToTopSelectAll"
                TypeName="TLLib.ProductCategory">
                <SelectParameters>
                    <asp:QueryStringParameter Name="CurrentProductCategoryID" QueryStringField="pci"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Label ID="lblProductTitle" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnlinkprodetails" runat="server" />
    <a class="a-link-pro-details" href="<%= hdnlinkprodetails.Value %>"></a>
    <h2 class="title desktop-992">
        <asp:Label ID="lblTitle" runat="server"></asp:Label></h2>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight"><asp:Label ID="lblTitle1" runat="server"></asp:Label><span class="iconar icon-chevron-down"></span></a></h2>
    <div class="wrapper-details">
        <div class="details-img">
            <asp:ListView ID="lstProductImage" runat="server" DataSourceID="odsProductImage"
                EnableModelValidation="True">
                <ItemTemplate>
                    <li>
                        <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/detail-img-1.jpg" %>'
                            runat="server" /></li>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="jcarouselDetails" class="connected-carousels">
                        <div id="detailsa">
                            <div class="zoom-box">
                                <a id="zoom1" href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/detail-img-1.jpg" %>'
                                    class="cloud-zoom" rel="position: 'inside', showTitle: false, adjustY:0, adjustX:0">
                                    <img class="img-responsive" src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/detail-img-1.jpg" %>'
                                        alt="" />
                                </a>
                            </div>
                        </div>
                        <div id="detailsb">
                            <div class="stage">
                                <div class="carousel carousel-stage">
                                    <ul>
                                        <li runat="server" id="itemPlaceholder"></li>
                                    </ul>
                                </div>
                                <a href="#" class="prev prev-stage"><span class="icon-chevron-left corner"></span>
                                </a><a href="#" class="next next-stage"><span class="icon-chevron-right corner"></span>
                                </a>
                            </div>
                        </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsProductImage" runat="server" SelectMethod="ProductImageSelectAll"
                TypeName="TLLib.ProductImage">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="pi" Name="ProductID" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div class="wrap-small">
                <div class="navigation">
                    <a href="#" class="prev prev-navigation navigation-btn"><span class="icon-chevron-left corner">
                    </span></a><a href="#" class="next next-navigation navigation-btn"><span class="icon-chevron-right corner">
                    </span></a>
                    <div class="carousel carousel-navigation">
                        <asp:ListView ID="lstProductImageBig" runat="server" DataSourceID="odsProductImage"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <li>
                                    <div class="small-in">
                                        <a href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/detail-img-1.jpg" %>'
                                            data-img='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/detail-img-1.jpg" %>'
                                            class='cloud-zoom-gallery small-img' title='Thumbnail 1' rel="useZoom: 'zoom1', smallImage: '<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/detail-img-1.jpg" %>' ">
                                            <img class="img-responsive" src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/detail-img-1.jpg" %>'
                                                alt="Thumbnail 1" />
                                        </a>
                                    </div>
                                </li>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <ul>
                                    <li runat="server" id="itemPlaceholder"></li>
                                </ul>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="detail-content">
        <asp:ListView ID="lstProductDetails" runat="server" DataSourceID="odsProductDetails"
            EnableModelValidation="True">
            <ItemTemplate>
                <h1 class="product-name">
                    <%# Eval("ProductName") %></h1>
                <ul class="list-info">
                    <li>Manufacturer: <strong>
                        <%# Eval("ManufacturerProduct")%></strong></li>
                    <li>Model: <strong>
                        <%# Eval("ModelProduct")%></strong></li>
                </ul>
                <div class="description">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description")%>'></asp:Label></div>
                <div class="box-share">
                    <a href="#">
                        <img src="assets/images/facebook2.jpg" alt="" /></a> <a href="#">
                            <img src="assets/images/facebook3.jpg" alt="" /></a> <a href="#" class="link-a mail">
                                Email</a> <a href="#" class="link-a print">Print</a>
                </div>
                <div class="description list-des">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Content")%>'></asp:Label>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsProductDetails" runat="server" SelectMethod="ProductSelectOne"
            TypeName="TLLib.Product">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <div class="wrapper-video">
            <h5>
                VIDEOS</h5>
            <asp:ListView ID="lstVideoProduct" runat="server" DataSourceID="odsVideoProduct"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="col-xs-4 element-item">
                        <div class="box-video">
                            <a href="javascript:void(0);" class="video-img fullbox-img group-img" data-toggle="modal"
                                data-target="#myModal" data-page='<%# progressTitle(Eval("Title")) + "-vi-" + Eval("ProductVideoID") + ".aspx" %>'>
                                <img class="hideo" alt='<%# Eval("ImagePath") %>' src='<%# !string.IsNullOrEmpty(Eval("ImagePath").ToString()) ? "~/res/product/video/thumbs/" + Eval("ImagePath") : "~/assets/images/video-img-1.jpg" %>'
                                    runat="server" /><span class="mask-icon"></span></a>
                            <h4 class="video-name group-name">
                                <a href="javascript:void(0);" data-toggle="modal" data-target="#myModal" data-page='<%# progressTitle(Eval("Title")) + "-vi-" + Eval("ProductVideoID") + ".aspx" %>'>
                                    <%# Eval("Title") %></a></h4>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="row group-tb">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsVideoProduct" runat="server" SelectMethod="ProductVideoSelectAll"
                TypeName="TLLib.ProductVideo">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
                    <asp:Parameter Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    </div>
    <div class="tabs-details">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation"><a class="corner" href="#tabs-1" aria-controls="tabs-1" role="tab"
                data-toggle="tab">Specifications</a></li>
            <li role="presentation"><a class="corner" href="#tabs-2" aria-controls="tabs-2" role="tab"
                data-toggle="tab">Accessories</a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div class="content-tab">
                <div role="tabpanel" class="tab-pane" id="tabs-1">
                    <asp:ListView ID="lstSpecifications" runat="server" DataSourceID="odsProductDetails"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Specifications") %>'></asp:Label>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                </div>
                <div role="tabpanel" class="tab-pane" id="tabs-2">
                    <asp:ListView ID="lstProductSame" runat="server" DataSourceID="odsProductSame" EnableModelValidation="True">
                        <ItemTemplate>
                            <li>
                                <div class="pro-box">
                                    <a class="pro-img" href="#">
                                        <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/pro-img-1.jpg" %>'
                                            runat="server" /></a>
                                    <div class="pro-content">
                                        <h5 class="pro-name">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                                <%# Eval("ProductName") %>
                                            </a>
                                        </h5>
                                        <div class="description">
                                            <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 80) %>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul class="list-pro">
                                <li runat="server" id="itemPlaceholder"></li>
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsProductSame" runat="server" SelectMethod="ProductOfSameSelectAll"
                        TypeName="TLLib.ProductOfSame">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ProductOfSameID" Type="String" />
                            <asp:Parameter Name="ProductID" Type="String" />
                            <asp:Parameter DefaultValue="true" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String" />
                            <asp:QueryStringParameter Name="ProductParentID" QueryStringField="pi" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <asp:ListView ID="lstDownloadCategory" runat="server" DataSourceID="odsDownloadCategory"
                EnableModelValidation="True">
                <ItemTemplate>
                    <h5>
                        <%# Eval("ProductDownloadCategoryName") %></h5>
                    <asp:HiddenField ID="hdnProductDownloadCategoryID" runat="server" Value='<%# Eval("ProductDownloadCategoryID") %>' />
                    <asp:ListView ID="lstDownload" runat="server" DataSourceID="odsDownload" EnableModelValidation="True">
                        <ItemTemplate>
                            <li><a href='<%# !string.IsNullOrEmpty(Eval("LinkDownload").ToString()) ? "~/res/product/download/" + Eval("LinkDownload") : "javascript:void(0);" %>'
                                download runat="server"><span class="icona-download">download</span><span class="name"><%# Eval("FileName") %></span></a></li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul class="list-download">
                                <li runat="server" id="itemPlaceholder"></li>
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsDownload" runat="server" SelectMethod="ProductDownloadSelectAll"
                        TypeName="TLLib.ProductDownload">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hdnProductDownloadCategoryID" Name="ProductDownloadCategoryID"
                                PropertyName="Value" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="wrap-download">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsDownloadCategory" runat="server" SelectMethod="ProductDownloadCategorySelectAll"
                TypeName="TLLib.ProductDownloadCategory">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
                    <asp:Parameter Name="ProductDownloadCategoryName" Type="String" />
                    <asp:Parameter Name="IsShowOnMenu" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <h5 class="title-order">
        Sản phẩm cùng loại</h5>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ListView ID="lstProductSameCategory" runat="server" DataSourceID="odsProductSameCategory"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="col-xs-4 element-item">
                        <div class="product-box">
                            <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                                class="product-img fullbox-img">
                                <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-imga-1.jpg" %>'
                                    runat="server" /></a>
                            <h4 class="product-name">
                                <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                                    class="text-uppercase">
                                    <%# Eval("ProductName") %></a></h4>
                            <div class="description">
                                Manufacturer:
                                <%# Eval("ManufacturerProduct")%></div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="row product-tb">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsProductSameCategory" runat="server" SelectMethod="ProductSameSelectAll"
                TypeName="TLLib.Product">
                <SelectParameters>
                    <asp:Parameter DefaultValue="100" Name="RerultCount" Type="String" />
                    <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div id="pagerp" class="pager">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="6" PagedControlID="lstProductSameCategory">
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
    <!-- Modal -->
    <div class="modal fade video-popup" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
