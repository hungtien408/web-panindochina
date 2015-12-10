<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ga-gallery.aspx.cs" Inherits="ga_gallery" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <%--<link href="../assets/styles/jcarousel.connected-carousels.css" rel="stylesheet" />
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/jquery.touchSwipe.min.js"></script>
    <script src="../assets/js/jquery.jcarousel.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#jcarouselGallery").jcarouselre({
                autos: true,
                pausehover: false,
                pager: true, //pager num
                timespees: 3000,
                thumswrap: false, // thums sroll
                shownum: 6, // show number thums
                widththum: 150, // width li thums
                thumsbutton: 0 //padding thums
            });
        });
    </script>--%>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="jcarouselGallery" class="connected-carousels">
        <div class="stage">
            <div class="carousel carousel-stage">
                <asp:ListView ID="lstGallery" runat="server" DataSourceID="odsGallery" EnableModelValidation="True">
                    <ItemTemplate>
                        <li>
                            <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/photoalbum/" + Eval("ImageName") : "~/assets/images/img1.jpg" %>'
                                runat="server" /></li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul>
                            <li runat="server" id="itemPlaceholder"></li>
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsGallery" runat="server" SelectMethod="PhotoAlbumSelectAll"
                    TypeName="TLLib.PhotoAlbum">
                    <SelectParameters>
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Descripttion" Type="String" />
                        <asp:QueryStringParameter Name="PhotoAlbumCategoryID" QueryStringField="gi" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <a href="#" class="prev prev-stage"><span>&lsaquo;</span></a> <a href="#" class="next next-stage">
                <span>&rsaquo;</span></a>
        </div>
        <div class="navigation">
            <a href="#" class="prev prev-navigation navigation-btn">&lsaquo;</a> <a href="#"
                class="next next-navigation navigation-btn">&rsaquo;</a>
            <div class="carousel carousel-navigation">
                <asp:ListView ID="lstGallerySmall" runat="server" DataSourceID="odsGallerySmall"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <li>
                            <div class="box-small">
                                <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/photoalbum/" + Eval("ImageName") : "~/assets/images/img1_thumb.jpg" %>'
                                    runat="server" /></div>
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul>
                            <li runat="server" id="itemPlaceholder"></li>
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsGallerySmall" runat="server" SelectMethod="PhotoAlbumSelectAll"
                    TypeName="TLLib.PhotoAlbum">
                    <SelectParameters>
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Descripttion" Type="String" />
                        <asp:QueryStringParameter Name="PhotoAlbumCategoryID" QueryStringField="gi" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
