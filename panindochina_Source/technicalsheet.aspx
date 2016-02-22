<%@ Page Title="" Language="C#" MasterPageFile="~/site-customer.master" AutoEventWireup="true"
    CodeFile="technicalsheet.aspx.cs" Inherits="customer_catalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Technical Sheet</title>
    <meta name="description" content="Catalogue / Brochure" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="customer-catalogue.aspx">Customer Support<span class="icon-caret-right"></span></a><span>Technical Sheet</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">
        Technical Sheet</h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">Technical Sheet<span class="iconar icon-chevron-down"></span></a></h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="form-select">
                <label class="lb-form">
                    Select Brand</label>
                <div class="select-box">
                    <asp:DropDownList ID="dropListBrand" CssClass="selectb" runat="server" DataSourceID="odsListBrand"
                        DataTextField="DownloadCategoryNameEn" DataValueField="DownloadCategoryID" AutoPostBack="True"
                        AppendDataBoundItems="true" OnSelectedIndexChanged="dropListBrand_SelectedIndexChanged">
                        <asp:ListItem Value="">-- Select Brand</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="odsListBrand" runat="server" SelectMethod="DownloadCategorySelectAll"
                        TypeName="TLLib.DownloadCategory">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="15" Name="parentID" Type="Int32" />
                            <asp:Parameter DefaultValue="2" Name="increaseLevelCount" Type="Int32" />
                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <asp:ListView ID="lstDownloadCategory" runat="server" EnableModelValidation="True">
                <ItemTemplate>
                    <h4 class="title-2">
                        <%# Eval("DownloadCategoryNameEn")%></h4>
                    <asp:HiddenField ID="hdnDownloadCategoryID" runat="server" Value='<%# Eval("DownloadCategoryID") %>' />
                    <asp:ListView ID="lstDownload" runat="server" DataSourceID="odsDownload" EnableModelValidation="True">
                        <ItemTemplate>
                            <%--<li>
                                <%# !string.IsNullOrEmpty(Eval("FilePath").ToString()) ? "<a class='download-link corner' download href='" + "res/download/" + Eval("FilePath") + "'><span>Download</span></a>" : ""%>
                                <%# Eval("DownloadNameEn")%></li>--%>
                            <li>
                                <a class='download-link corner' target="_blank" href='<%# progressTitle(Eval("FilePath")) + "-vd-" + Eval("DownloadID") + ".aspx" %>'><span>View</span></a>
                                <%# !string.IsNullOrEmpty(Eval("FilePath").ToString()) ? "<a class='download-link corner' download href='" + "res/download/" + Eval("FilePath") + "'><span>Download</span></a>" : ""%>
                                <%# Eval("DownloadNameEn")%></li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul class="download-list">
                                <li runat="server" id="itemPlaceholder"></li>
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsDownload" runat="server" SelectMethod="DownloadSelectAll"
                        TypeName="TLLib.Download">
                        <SelectParameters>
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="DownloadName" Type="String" />
                            <asp:ControlParameter ControlID="hdnDownloadCategoryID" DefaultValue="" Name="DownloadCategoryID"
                                PropertyName="Value" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsDowloadCategoryAll" runat="server" SelectMethod="DownloadCategorySelectAll"
                TypeName="TLLib.DownloadCategory">
                <SelectParameters>
                    <asp:Parameter DefaultValue="15" Name="parentID" Type="Int32" />
                    <asp:Parameter DefaultValue="2" Name="increaseLevelCount" Type="Int32" />
                    <asp:Parameter Name="IsShowOnMenu" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsDowloadCategory" runat="server" SelectMethod="DownloadCategorySelectOne"
                TypeName="TLLib.DownloadCategory">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dropListBrand" Name="DownloadCategoryID" PropertyName="SelectedValue"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <h2 class="title-link mobile-992">
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>Technical Sheet</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
