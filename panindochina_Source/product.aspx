<%@ Page Title="" Language="C#" MasterPageFile="~/site-product.master" AutoEventWireup="true"
    CodeFile="product.aspx.cs" Inherits="product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <asp:Label ID="lblTitle3" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnlinkpro" runat="server" />
    <a class="a-link-pro" href="<%= hdnlinkpro.Value %>"></a>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="head desktop-992">
                <h1 class="title">
                    <asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
                <label class="pager-lb">
                    sản phẩm/trang</label>
                <div class="select-box">
                    <asp:DropDownList ID="DropDownList1" CssClass="selectb" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                        AutoPostBack="True">
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <label class="pager-lb">
                    Hiển thị</label>
            </div>
            <h2 class="title-menu mobile-992">
                <a class="panel-right" href="#mobileRight">
                    <asp:Label ID="lblTitle1" runat="server"></asp:Label><span class="iconar icon-chevron-down"></span></a></h2>
            <asp:ListView ID="lstProducts" runat="server" DataSourceID="odsProducts" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="col-xs-4 element-item">
                        <div class="product-box">
                            <a target="_blank" href='<%# progressTitle(Eval("ProductNameEn")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                                class="product-img fullbox-img">
                                <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-imga-1.jpg" %>'
                                    runat="server" /></a>
                            <h4 class="product-name">
                                <a target="_blank" href='<%# progressTitle(Eval("ProductNameEn")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                                    class="text-uppercase">
                                    <%# Eval("ProductNameEn") %></a></h4>
                            <div class="description">
                                Manufacturer: <%# Eval("ManufacturerProduct")%></div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="row product-tb">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsProducts" runat="server" SelectMethod="ProductSelectAll"
                TypeName="TLLib.Product">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="PriceFrom" Type="String" />
                    <asp:Parameter Name="PriceTo" Type="String" />
                    <asp:QueryStringParameter Name="CategoryID" QueryStringField="pci" Type="String" />
                    <asp:Parameter Name="ManufacturerID" Type="String" />
                    <asp:Parameter Name="OriginID" Type="String" />
                    <asp:Parameter Name="Tag" Type="String" />
                    <asp:Parameter Name="InStock" Type="String" />
                    <asp:Parameter Name="IsHot" Type="String" />
                    <asp:Parameter Name="IsNew" Type="String" />
                    <asp:Parameter Name="IsBestSeller" Type="String" />
                    <asp:Parameter Name="IsSaleOff" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    <asp:Parameter Name="FromDate" Type="String" />
                    <asp:Parameter Name="ToDate" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div id="pagerp" class="pager">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="12" PagedControlID="lstProducts">
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
            <h2 class="title-link mobile-992">
                <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>
                    <asp:Label ID="lblTitle2" runat="server"></asp:Label></a></h2>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
