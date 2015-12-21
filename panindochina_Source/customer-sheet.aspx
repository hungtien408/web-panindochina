<%@ Page Title="" Language="C#" MasterPageFile="~/site-customer.master" AutoEventWireup="true"
    CodeFile="customer-sheet.aspx.cs" Inherits="customer_being" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Technical Sheet</title>
    <meta name="description" content="Technical Sheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="customer-catalogue.aspx">Customer Support<span class="icon-caret-right"></span></a><span>Technical
        Sheet</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">Technical Sheet</h1>
   <h2 class="title-menu mobile-992"><a class="panel-right" href="#mobileRight">Technical Sheet<span class="iconar icon-chevron-down"></span></a></h2>
    <div class="customer-text">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
        <div class="form-alogin">
            <div class="row">
                <div class="col-sm-4 col-xs-6">
                    <div class="form-input">
                        <label class="form-lb">User Name:</label>
                        <div class="input-text">
                            <asp:TextBox ID="txtUserName" CssClass="text-box" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-xs-6">
                    <div class="form-input">
                        <label class="form-lb">Password:</label>
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
                        <asp:Button ID="btnLogin" CssClass="text-uppercase btn-button" runat="server" 
                            Text="login" onclick="btnLogin_Click" />
                        <%--<asp:CheckBox ID="chkRemember" CssClass="check-box" runat="server" Text="Remmember me" />--%>
                        <a href="register-form.aspx" class="link-b">sign up ?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <h2 class="title-link mobile-992"><a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>Technical Sheet</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
