<%@ Page Title="" Language="C#" MasterPageFile="~/vn/site-gallery.master" AutoEventWireup="true"
    CodeFile="gallery-video.aspx.cs" Inherits="gallery_video" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Video</title>
    <meta name="description" content="Video" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="gallery.aspx">Thư Viện<span class="icon-caret-right"></span></a><span>Video</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">
        Video</h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">Video<span class="iconar icon-chevron-down"></span></a></h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="wrapper-video">
                <asp:ListView ID="lstVideo" runat="server" DataSourceID="odsVideo" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="col-xs-4 element-item">
                            <div class="box-video">
                                <a href="javascript:void(0);" class="video-img fullbox-img group-img" data-toggle="modal"
                                    data-target="#myModal" data-page='<%# progressTitle(Eval("Title")) + "-vi-" + Eval("VideoID") + ".aspx" %>'>
                                    <img class="hideo" alt='<%# Eval("ImagePath") %>' src='<%# !string.IsNullOrEmpty(Eval("ImagePath").ToString()) ? "~/res/video/thumbs/" + Eval("ImagePath") : "~/assets/images/video-img-1.jpg" %>'
                                        runat="server" /><span class="mask-icon"></span></a>
                                <h4 class="video-name group-name">
                                    <a href="javascript:void(0);" data-toggle="modal" data-target="#myModal" data-page='<%# progressTitle(Eval("Title")) + "-vi-" + Eval("VideoID") + ".aspx" %>'>
                                        <%# Eval("Title")%></a></h4>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div class="row group-tb">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsVideo" runat="server" SelectMethod="VideoSelectAll"
                    TypeName="TLLib.Video">
                    <SelectParameters>
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="VideoCategoryID" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <div id="pagerp" class="pager">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="6" PagedControlID="lstVideo">
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
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>Video</a></h2>
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
