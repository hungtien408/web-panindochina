<%@ Page Title="" Language="C#" MasterPageFile="~/site-gallery.master" AutoEventWireup="true"
    CodeFile="gallery-pfd.aspx.cs" Inherits="gallery_pfd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>PDF</title>
    <meta name="description" content="PDF" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="gallery.aspx">Library<span class="icon-caret-right"></span></a><span>PDF</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">
        PDF</h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">PDF<span class="iconar icon-chevron-down"></span></a></h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ListView ID="lstPDF" runat="server" DataSourceID="odsPDF" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="col-lg-3 col-xs-4 element-item">
                        <div class="box-pdf">
                            <a target="_blank" href='<%# !string.IsNullOrEmpty(Eval("FilePath").ToString()) ? "res/download/" + Eval("FilePath") : "javascript:void(0);" %>'
                                class="pdf-img"><span class="fullbox-img group-img">
                                    <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/download/thumbs/" + Eval("ImageName") : "~/assets/images/pdf-img-1.jpg" %>'
                                        runat="server" /></span></a>
                            <h4 class="pdf-name group-name">
                                <a target="_blank" href='<%# !string.IsNullOrEmpty(Eval("FilePath").ToString()) ? "res/download/" + Eval("FilePath") : "javascript:void(0);" %>'>
                                    <%# Eval("DownloadName")%></a></h4>
                            <div class="download">
                                <a href='<%# !string.IsNullOrEmpty(Eval("FilePath").ToString()) ? "~/res/download/" + Eval("FilePath") : "javascript:void(0);" %>'
                                    class="corner" download runat="server"><span>Download</span></a></div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="wrapper-pdf">
                        <div class="row group-tb">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsPDF" runat="server" SelectMethod="DownloadSelectAll"
                TypeName="TLLib.Download">
                <SelectParameters>
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="DownloadName" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="DownloadCategoryID" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div id="pagerp" class="pager">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="8" PagedControlID="lstPDF">
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
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>PDF</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
