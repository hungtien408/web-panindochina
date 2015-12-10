<%@ Page Title="" Language="C#" MasterPageFile="~/site-gallery.master" AutoEventWireup="true"
    CodeFile="ga-pdf-details.aspx.cs" Inherits="ga_pdf_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="gallery.aspx">Library<span class="icon-caret-right"></span></a><a href="gallery-pfd.aspx">PDF<span
        class="icon-caret-right"></span></a><span><asp:Label ID="lblTitle" runat="server"></asp:Label></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">
        PDF</h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">PDF<span class="iconar icon-chevron-down"></span></a></h2>
    <asp:ListView ID="lstPDFDetails" runat="server" DataSourceID="odsPDFDetails" EnableModelValidation="True">
        <ItemTemplate>
            <h3 class="title-2">
                <%# Eval("DownloadName")%></h3>
            <div id="pdfwrap">
                <%--<img src="assets/images/pdf-a.jpg" alt="" />--%>
                <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/download/thumbs/" + Eval("ImageName") : "~/assets/images/pdf-a.jpg" %>'
                                        runat="server" />
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div class="wrapper-text">
                <span runat="server" id="itemPlaceholder" />
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsPDFDetails" runat="server" 
        SelectMethod="DownloadSelectOne" TypeName="TLLib.Download">
        <SelectParameters>
            <asp:QueryStringParameter Name="DownloadID" QueryStringField="fi" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <h2 class="title-link mobile-992">
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>PDF</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
