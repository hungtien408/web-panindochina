<%@ Page Title="" Language="C#" MasterPageFile="~/vn/site-customer.master" AutoEventWireup="true" CodeFile="customer-being.aspx.cs" Inherits="customer_being" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Being Panindochina’s Retailer</title>
    <meta name="description" content="Being Panindochina’s Retailer" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" Runat="Server">
    <a href="customer-catalogue.aspx">Customer Support<span class="icon-caret-right"></span></a><span>Being Panindochina’s Retailer</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="title desktop-992">Being Panindochina’s Retailer</h1>
   <h2 class="title-menu mobile-992"><a class="panel-right" href="#mobileRight">Being Panindochina’s Retailer<span class="iconar icon-chevron-down"></span></a></h2>
    <%--<div class="customer-text">
        Quý khách vui lòng tải File này về	<a class="download-link corner" href="#"><span>Being Panindochina’s Retailer</span></a>  và điền đầy đủ thông tin, sau đó gửi về cho chúng tôi tại: <a href="http://info@panindochina.com.vn">info@panindochina.com.vn</a> . Xin cám ơn sự quan tâm của quý khách đối với dịch vụ của chúng tôi.
    </div>--%>
    <asp:ListView ID="lstBegin" runat="server" DataSourceID="odsBegin" EnableModelValidation="True">
        <ItemTemplate>
            <a class="download-link corner" runat="server" href='<%# !string.IsNullOrEmpty(Eval("FilePath").ToString()) ? "~/res/download/" + Eval("FilePath") : "javascript:void(0);" %>' download><span><%# Eval("DownloadName") %></span></a> / 
        </ItemTemplate>
        <LayoutTemplate>
            <div class="customer-text">
                Quý khách vui lòng tải File này về <span runat="server" id="itemPlaceholder" />và
                điền đầy đủ thông tin, sau đó gửi về cho chúng tôi tại: <a href="http://info@panindochina.com.vn">
                    info@panindochina.com.vn</a> . Xin cám ơn sự quan tâm của quý khách đối với
                dịch vụ của chúng tôi.
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsBegin" runat="server" 
        SelectMethod="DownloadSelectAll" TypeName="TLLib.Download">
        <SelectParameters>
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="DownloadName" Type="String" />
            <asp:Parameter DefaultValue="17" Name="DownloadCategoryID" Type="String" />
            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
   <h2 class="title-link mobile-992"><a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>Being Panindochina’s Retailer</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" Runat="Server">
</asp:Content>

