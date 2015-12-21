<%@ Page Title="" Language="C#" MasterPageFile="~/vn/site-customer.master" AutoEventWireup="true"
    CodeFile="customer-faqs.aspx.cs" Inherits="customer_being" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Panindochina</title>
    <meta name="description" content="Panindochina" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="customer-catalogue.aspx">Customer Support<span class="icon-caret-right"></span></a><a
        href="customer-faq.aspx">FAQs<span class="icon-caret-right"></span></a><span><asp:Label
            ID="lblTitle" runat="server"></asp:Label></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">
        <asp:Label ID="lblTitle1" runat="server"></asp:Label></h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">
            <asp:Label ID="lblTitle2" runat="server"></asp:Label><span class="iconar icon-chevron-down"></span></a></h2>
    <asp:ListView ID="lstFaqs" runat="server" DataSourceID="odsFaqs" EnableModelValidation="True">
        <ItemTemplate>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading-1">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                            href='<%# "#question-" + Eval("DownloadID") %>' aria-expanded="false" aria-controls='<%# "question-" + Eval("DownloadID") %>'>
                            <%# Eval("DownloadName") %><span class="iconr icona-down icon-chevron-sign-down"></span>
                            <span class="iconr icona-up icon-chevron-sign-up"></span></a>
                    </h4>
                </div>
                <div id='<%# "question-" + Eval("DownloadID") %>' class="panel-collapse collapse"
                    role="tabpanel" aria-labelledby="heading-1">
                    <div class="panel-body">
                        <strong>Answer:</strong> 
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Answer") %>'></asp:Label>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div class="panel-group wrap-question" id="accordion" role="tablist" aria-multiselectable="true">
                <span runat="server" id="itemPlaceholder" />
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsFaqs" runat="server" 
        SelectMethod="DownloadSelectAll" TypeName="TLLib.Download">
        <SelectParameters>
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="DownloadName" Type="String" />
            <asp:QueryStringParameter Name="DownloadCategoryID" QueryStringField="dri" 
                Type="String" />
            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <h2 class="title-link mobile-992">
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>
            <asp:Label ID="lblTitle3" runat="server"></asp:Label></a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
