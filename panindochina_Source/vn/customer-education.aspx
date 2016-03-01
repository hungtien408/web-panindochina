<%@ Page Title="" Language="C#" MasterPageFile="~/vn/site-customer.master" AutoEventWireup="true"
    CodeFile="customer-education.aspx.cs" Inherits="customer_being" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Tài Liệu Kĩ Thuật</title>
    <meta name="description" content="Technical Education" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="customer-catalogue.aspx">Hỗ Trợ Khách Hàng<span class="icon-caret-right"></span></a><span>Tài Liệu Kĩ Thuật</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">
        Tài Liệu Kĩ Thuật</h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">Tài Liệu Kĩ Thuật<span class="iconar icon-chevron-down"></span></a></h2>
    <div class="customer-text">
        Vui làm nhập tên đăng nhập và mặt khẩu để truy cập tài liệu.
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnLogin">
            <div class="form-alogin">
                <div class="row">
                    <div class="col-sm-4 col-xs-6">
                        <div class="form-input">
                            <label class="form-lb">
                                User Name:</label>
                            <div class="input-text">
                                <asp:TextBox ID="txtUserName" CssClass="text-box" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-xs-6">
                        <div class="form-input">
                            <label class="form-lb">
                                Password:</label>
                            <div class="input-text">
                                <asp:TextBox ID="txtPassword" CssClass="text-box" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <%--<div class="col-sm-4">
                    <a href="#" class="link-b mt31">forget password ?</a>
                </div>--%>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-input">
                            <asp:Button ID="btnLogin" CssClass="text-uppercase btn-button" runat="server" Text="login"
                                OnClick="btnLogin_Click" />
                            <%--<asp:CheckBox ID="chkRemember" CssClass="check-box" runat="server" Text="Remmember me" />--%>
                            <a href="register-form.aspx" class="link-b">sign up ?</a>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
    <h2 class="title-link mobile-992">
        <a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>Tài Liệu Kĩ Thuật</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
