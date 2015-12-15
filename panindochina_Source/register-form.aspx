<%@ Page Title="" Language="C#" MasterPageFile="~/site-customer.master" AutoEventWireup="true" CodeFile="register-form.aspx.cs" Inherits="register_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" Runat="Server">
    <a href="#">Customer Support<span class="icon-caret-right"></span></a><span>Being Panindochina’s Retailer</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <h1 class="title desktop-992">Being Registration Rorm</h1>
   <h2 class="title-menu mobile-992"><a class="panel-right" href="#mobileRight">Registration Rorm<span class="iconar icon-chevron-down"></span></a></h2>
    <h4 class="text-uppercase titbg">part 1: GENERAL INFORMATION</h4>
    <div class="register-form">
        <div class="form-input">
            <div class="row">
                    <div class="col-lg-7 form-first">
                         <label class="form-lb">Full Name</label>
                        <div class="input-text">
                            <asp:TextBox ID="TextBox1" CssClass="text-box corner" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="input-in">
                            <label class="form-lb">Gender</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox2" CssClass="text-box corner" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                    <div class="col-lg-12 form-first">
                        <label class="form-lb">Company Name</label>
                        <div class="input-in">
                            <asp:TextBox ID="TextBox4" CssClass="text-box corner" runat="server"></asp:TextBox>
                        </div>
                    </div>
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                    <div class="col-lg-12 form-first">
                        <label class="form-lb">Company Address</label>
                        <div class="input-in">
                            <asp:TextBox ID="TextBox6" CssClass="text-box corner" runat="server"></asp:TextBox>
                        </div>
                    </div>
            </div>
        </div>
        <div class="form-input">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="form-btn">
                            <label class="form-lb">City/ Province</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox7" CssClass="text-box corner" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="input-in">
                        <label class="form-lb">Country</label>
                        <div class="input-text">
                            <asp:TextBox ID="TextBox8" CssClass="text-box corner" runat="server"></asp:TextBox>
                        </div>
                            </div>
                    </div>
                </div>
        </div>
        <div class="form-input">
            <div class="row">
                    <div class="col-lg-7 form-first">
                            <label class="form-lb">Company Telephone</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox9" CssClass="text-box corner" runat="server"></asp:TextBox>
                            </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="input-in">
                            <label class="form-lb">Cell phone</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox10" CssClass="text-box corner" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                    <div class="col-lg-7 form-first">
                            <label class="form-lb">Email Address</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox3" CssClass="text-box corner" runat="server"></asp:TextBox>
                            </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="node">(This is your User - ID)</div>
                    </div>
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                    <div class="col-lg-7 form-first">
                            <label class="form-lb">Confirm Email</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox11" CssClass="text-box corner" runat="server"></asp:TextBox>
                            </div>
                    </div>
            </div>
        </div>
    </div>
    <h4 class="text-uppercase titbg">part 2: USER REFERENCE		</h4>
    <div class="register-form">
        <div class="form-input">
            <div class="row">
                    <div class="col-lg-7 form-first">
                         <label class="form-lb w200">YOUR COMPANY DESCRIBES</label>
                    </div>
            </div>
        </div>
        <div class="form-input">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="form-btn">
                            <label class="form-lb">End - User</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox15" CssClass="text-box corner" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="input-in">
                        <label class="form-lb">Trading</label>
                        <div class="input-text">
                            <asp:TextBox ID="TextBox16" CssClass="text-box corner" runat="server"></asp:TextBox>
                        </div>
                            </div>
                    </div>
                </div>
        </div>
        <div class="form-input">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="form-btn">
                            <label class="form-lb">Service</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox5" CssClass="text-box corner" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="input-in">
                        <label class="form-lb">Trainer</label>
                        <div class="input-text">
                            <asp:TextBox ID="TextBox12" CssClass="text-box corner" runat="server"></asp:TextBox>
                        </div>
                            </div>
                    </div>
                </div>
        </div>
        <div class="form-input">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="form-btn">
                            <label class="form-lb">Safety Org</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox13" CssClass="text-box corner" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="input-in">
                        <label class="form-lb">Other</label>
                        <div class="input-text">
                            <asp:TextBox ID="TextBox14" CssClass="text-box corner" runat="server"></asp:TextBox>
                        </div>
                            </div>
                    </div>
                </div>
        </div>
        <div class="form-input">
            <div class="row">
                    <div class="col-lg-6 form-first">
                            <label class="form-lb w200">YOUR COMPANY INDUSTRY</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox17" CssClass="text-box corner" runat="server"></asp:TextBox>
                            </div>
                    </div>
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                    <div class="col-lg-12 form-first">
                            <label class="form-lb">Email Address</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox19" CssClass="text-area corner" runat="server"></asp:TextBox>
                            </div>
                    </div>
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                    <div class="col-lg-5 form-first">
                            <label class="form-lb">SECURITY CODE</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox20" CssClass="text-box corner" runat="server"></asp:TextBox>
                            </div>
                    </div>
            </div>
        </div>
    </div>
    <h4 class="text-uppercase titbg">part 2: USER REFERENCE		</h4>
    <div class="register-form">
        <div class="form-input">
            <div class="row">
                    <div class="col-lg-5 form-first">
                            <label class="form-lb">TERMS &amp; CONDITIONS</label>
                            <div class="input-text">
                                <asp:TextBox ID="TextBox28" CssClass="text-box corner" runat="server"></asp:TextBox>
                            </div>
                    </div>
            </div>
        </div>
        <div class="form-input">
            <div class="node-2">
                    As Panindochina's privacy Policy. Information will be sent only to the provided email address. Email and phone information are not sold to any third party for marketing purpose.							
            </div>
        </div>
        <div class="form-input">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-btn button-w">
                            <asp:Button ID="Button1" CssClass="text-uppercase corner btn-button" runat="server" Text="Submit" />
                            <asp:Button ID="Button2" CssClass="text-uppercase corner btn-button" runat="server" Text="cancel" />
                        </div>
                    </div>
                </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" Runat="Server">
</asp:Content>

