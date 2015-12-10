<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-gallery.master" AutoEventWireup="true"
    CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Gallery</title>
    <meta name="description" content="Gallery" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="gallery.aspx">Library<span class="icon-caret-right"></span></a><span>Gallery</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">
        Hình ảnh</h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">Gallery<span class="iconar icon-chevron-down"></span></a></h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ListView ID="lstGalleryCategory" runat="server" DataSourceID="odsGalleryCategory" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="col-xs-4 element-item">
                        <div class="box-gallery">
                            <div class="gallery-img">
                                <a href="javascript:void(0);" class="fullbox-img group-img" data-toggle="modal" data-target="#myModal"
                                    data-page='<%# progressTitle(Eval("PhotoAlbumCategoryNameEn")) + "-gi-" + Eval("PhotoAlbumCategoryID") + ".aspx" %>'>
                                    <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/photoalbumcategory/" + Eval("ImageName") : "~/assets/images/gallery-i-1.jpg" %>'
                                        runat="server" /></a></div>
                            <h4 class="gallery-name group-name">
                                <a href="javascript:void(0);" data-toggle="modal" data-target="#myModal" data-page='<%# progressTitle(Eval("PhotoAlbumCategoryNameEn")) + "-gi-" + Eval("PhotoAlbumCategoryID") + ".aspx" %>'>
                                    <%# Eval("PhotoAlbumCategoryNameEn")%></a></h4>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="wrapper-gallery">
                        <div class="row group-tb">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsGalleryCategory" runat="server" SelectMethod="PhotoAlbumCategorySelectAll"
                TypeName="TLLib.PhotoAlbumCategory">
                <SelectParameters>
                    <asp:Parameter Name="PhotoAlbumCategoryName" Type="String" />
                    <asp:Parameter Name="IsShowOnMenu" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div id="pagerp" class="pager">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="6" PagedControlID="lstGalleryCategory">
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
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>Gallery</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
    <!-- Modal -->
    <div class="modal fade gallery-popup" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
