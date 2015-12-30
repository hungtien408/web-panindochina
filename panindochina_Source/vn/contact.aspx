﻿<%@ Page Title="" Language="C#" MasterPageFile="~/vn/site.master" AutoEventWireup="true"
    CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Panindochina</title>
    <meta name="description" content="Panindochina" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="site">
        <div class="container">
            <a class="home" id="A1" href="~/vn/" runat="server">Trang chủ<span class="icon-caret-right"></span></a>
            <span>Liên hệ</span>
        </div>
    </div>
    <div class="container wrap-contact">
        <div class="row">
            <div class="col-sm-3">
                <div class="address-contact">
                    <h1 class="title">
                        Company contact</h1>
                    <p>
                        <span class="glyphicon glyphicon-map-marker"></span>71 D5 Street, Ward 25, Binh
                        Thanh District, Ho Chi Minh City</p>
                    <p>
                        <span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    <p>
                        <span class="glyphicon glyphicon-print"></span>08.35127510</p>
                    <p>
                        <span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">
                            info@panindochina.com.vn</a></p>
                </div>
            </div>
            <div class="col-sm-9">
                <div id="mapshow">
                </div>
            </div>
        </div>
        <%--<h4 class="title">Services</h4>
        <div class="row">
            <div class="col-lg-3">
                <h4 class="title-bg">Central &amp; Northern Vietnam</h4>
                <ul class="list-box">
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                </ul>
             </div>
            <div class="col-lg-6">
                <h4 class="title-bg">Southern Vietnam</h4>
                <ul class="list-box list-2">
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                </ul>
             </div>
            <div class="col-lg-3">
                <h4 class="title-bg">Oversea Export</h4>
                <ul class="list-box">
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                </ul>
             </div>
        </div>
        <h4 class="title">Sales operation contact</h4>
                <ul class="list-box list-4">
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                    <li>
                        <h6>Regional Manager</h6>
                        <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@panindochina.com.vn">nfo@panindochina.com.vn</a></p>
                        <p><span class="glyphicon glyphicon-earphone"></span>08.35127509</p>
                    </li>
                </ul>--%>
        <div  class="wrap-link">
            <asp:ListView ID="lstContact" runat="server" DataSourceID="odsContact" EnableModelValidation="True">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsContact" runat="server" SelectMethod="ArticleSelectAll"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ArticleTitle" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter DefaultValue="13" Name="ArticleCategoryID" Type="String" />
                    <asp:Parameter Name="Tag" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    <asp:Parameter Name="IsHot" Type="String" />
                    <asp:Parameter Name="IsNew" Type="String" />
                    <asp:Parameter Name="FromDate" Type="String" />
                    <asp:Parameter Name="ToDate" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="wrap-send">
            <h4 class="title">
                Send an inquiry</h4>
            <p>
                For any further request, please fill out the inquiry form, we will get back to you
                as soon as possible. Thank you!</p>
            <h4 class="title-3">
                Contact Us</h4>
            <div class="row">
                <div class="col-lg-5 col-md-5">
                    <p>
                        For we can provide you a better service, please fill all (*) fields below
                    </p>
                    <div class="send-contact">
                        <div class="info-input">
                            <label class="info-lb">
                                Subject<span class="error-lb">*</span></label>
                            <div class="info-text">
                                <asp:TextBox ID="txtFullName" CssClass="info-textbox w260" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="info-input">
                            <label class="info-lb">
                                Specific Requirements<span class="error-lb">*</span></label>
                            <div class="info-text">
                                <asp:TextBox ID="TextBox1" CssClass="info-area" runat="server" TextMode="MultiLine"
                                    Text=""></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 col-md-7">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="send-contact">
                                <div class="info-input">
                                    <label class="info-lb">
                                        Company Name<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <asp:TextBox ID="TextBox3" CssClass="info-textbox" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Address<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <asp:TextBox ID="TextBox5" CssClass="info-textbox" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Province<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <asp:DropDownList ID="DropDownList1" CssClass="selectb" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Business Type<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <asp:DropDownList ID="DropDownList2" CssClass="selectb" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="send-contact">
                                <div class="info-input">
                                    <label class="info-lb">
                                        Contact Name<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="row-in">
                                            <div class="infow">
                                                <asp:TextBox ID="TextBox10" CssClass="info-textbox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="infow">
                                                <asp:TextBox ID="TextBox2" CssClass="info-textbox" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Email<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <asp:TextBox ID="TextBox11" CssClass="info-textbox" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <div class="info-text">
                                        <div class="row-in">
                                            <div class="infow">
                                                <label class="info-lb">
                                                    Tel<span class="error-lb">*</span></label>
                                                <asp:TextBox ID="TextBox4" CssClass="info-textbox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="infow">
                                                <label class="info-lb">
                                                    Cellphone<span class="error-lb">*</span></label>
                                                <asp:TextBox ID="TextBox6" CssClass="info-textbox" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Fax<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <asp:TextBox ID="TextBox13" CssClass="info-textbox" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <div class="info-btn">
                    <asp:Button ID="btnRegister" runat="server" CssClass="text-uppercase btn-button"
                        ValidationGroup="Register" Text="submit" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>