<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Panindochina</title>
    <meta name="description" content="Panindochina" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="site">
        <div class="container">
            <a class="home" id="A1" href="~/" runat="server">Home<span class="icon-caret-right"></span></a>
            <span>Contact Us</span>
        </div>
    </div>
    <div class="container wrap-contact">
        <div class="row">
            <div class="col-sm-3">
                <div class="address-contact">
                    <h1 class="title">
                        Company contact</h1>
                    <p>
                        <span class="glyphicon glyphicon-map-marker"></span>326/6A Ung Van Khiem Street, Ward 25, Binh
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
        <h4 class="title">
            Services</h4>
        <div class="wrap-link">
            <div class="row">
                <div class="col-lg-3">
                    <h4 class="title-bg">
                        Central &amp; Northern Vietnam</h4>
                    <asp:ListView ID="lstContact1" runat="server" DataSourceID="odsContact1" EnableModelValidation="True">
                        <ItemTemplate>
                            <li>
                                <h6>
                                    <%# Eval("ArticleTitleEn") %></h6>
                                <p>
                                    <span class="glyphicon glyphicon-envelope"></span><a href='<%# "mailto:" + Eval("MetaTittle") %>'>
                                        <%# Eval("MetaTittle") %></a></p>
                                <p>
                                    <span class="glyphicon glyphicon-earphone"></span>
                                    <%# Eval("MetaDescription") %></p>
                            </li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul class="list-box">
                                <li runat="server" id="itemPlaceholder"></li>
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsContact1" runat="server" SelectMethod="ArticleSelectAll"
                        TypeName="TLLib.Article">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ArticleTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="27" Name="ArticleCategoryID" Type="String" />
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
                <div class="col-lg-6">
                    <h4 class="title-bg">
                        Southern Vietnam</h4>
                    <asp:ListView ID="lstContact2" runat="server" DataSourceID="odsContact2" EnableModelValidation="True">
                        <ItemTemplate>
                            <li>
                                <h6>
                                    <%# Eval("ArticleTitleEn") %></h6>
                                <p>
                                    <span class="glyphicon glyphicon-envelope"></span><a href='<%# "mailto:" + Eval("MetaTittle") %>'>
                                        <%# Eval("MetaTittle") %></a></p>
                                <p>
                                    <span class="glyphicon glyphicon-earphone"></span>
                                    <%# Eval("MetaDescription") %></p>
                            </li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul class="list-box list-2">
                                <li runat="server" id="itemPlaceholder"></li>
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsContact2" runat="server" SelectMethod="ArticleSelectAll"
                        TypeName="TLLib.Article">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ArticleTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="28" Name="ArticleCategoryID" Type="String" />
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
                <div class="col-lg-3">
                    <h4 class="title-bg">
                        Export Business</h4>
                    <asp:ListView ID="lstContact3" runat="server" DataSourceID="odsContact3" EnableModelValidation="True">
                        <ItemTemplate>
                            <li>
                                <h6>
                                    <%# Eval("ArticleTitleEn") %></h6>
                                <p>
                                    <span class="glyphicon glyphicon-envelope"></span><a href='<%# "mailto:" + Eval("MetaTittle") %>'>
                                        <%# Eval("MetaTittle") %></a></p>
                                <p>
                                    <span class="glyphicon glyphicon-earphone"></span>
                                    <%# Eval("MetaDescription") %></p>
                            </li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul class="list-box">
                                <li runat="server" id="itemPlaceholder"></li>
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsContact3" runat="server" SelectMethod="ArticleSelectAll"
                        TypeName="TLLib.Article">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ArticleTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="29" Name="ArticleCategoryID" Type="String" />
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
            </div>
        </div>
        <h4 class="title">
            Technical Service</h4>
        <asp:ListView ID="lstContact4" runat="server" DataSourceID="odsContact4" EnableModelValidation="True">
            <ItemTemplate>
                <li>
                    <h6>
                        <%# Eval("ArticleTitleEn") %></h6>
                    <p>
                        <span class="glyphicon glyphicon-envelope"></span><a href='<%# "mailto:" + Eval("MetaTittle") %>'>
                            <%# Eval("MetaTittle") %></a></p>
                    <p>
                        <span class="glyphicon glyphicon-earphone"></span>
                        <%# Eval("MetaDescription") %></p>
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <ul class="list-box list-4">
                    <li runat="server" id="itemPlaceholder"></li>
                </ul>
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsContact4" runat="server" SelectMethod="ArticleSelectAll"
            TypeName="TLLib.Article">
            <SelectParameters>
                <asp:Parameter Name="StartRowIndex" Type="String" />
                <asp:Parameter Name="EndRowIndex" Type="String" />
                <asp:Parameter Name="Keyword" Type="String" />
                <asp:Parameter Name="ArticleTitle" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter DefaultValue="30" Name="ArticleCategoryID" Type="String" />
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
        <%--<div  class="wrap-link">
            <asp:ListView ID="lstContact" runat="server" DataSourceID="odsContact" EnableModelValidation="True">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContentEn") %>'></asp:Label>
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
        </div>--%>
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
                                <asp:TextBox ID="txtSubject" CssClass="info-textbox w260" runat="server" ValidationGroup="Register"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                    Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtSubject" ErrorMessage="Information required!"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="info-input">
                            <label class="info-lb">
                                Specific Requirements<span class="error-lb">*</span></label>
                            <div class="info-text">
                                <asp:TextBox ID="txtRequirements" CssClass="info-area" runat="server" TextMode="MultiLine"
                                    Text="" ValidationGroup="Register"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                    Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtRequirements"
                                    ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
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
                                        <asp:TextBox ID="txtCompany" CssClass="info-textbox" runat="server" ValidationGroup="Register"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                            Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtCompany" ErrorMessage="Information required!"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Address<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <asp:TextBox ID="txtAddress" CssClass="info-textbox" runat="server" ValidationGroup="Register"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                            Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtAddress" ErrorMessage="Information required!"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Province<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <asp:DropDownList ID="dropProvince" CssClass="selectb" runat="server" ValidationGroup="Register"
                                            DataSourceID="odsProvince" DataTextField="ProvinceName" DataValueField="ProvinceID">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="odsProvince" runat="server" SelectMethod="ProvinceSelectAll"
                                            TypeName="TLLib.Province">
                                            <SelectParameters>
                                                <asp:Parameter Name="ProvinceID" Type="String" />
                                                <asp:Parameter Name="ProvinceName" Type="String" />
                                                <asp:Parameter Name="ShortName" Type="String" />
                                                <asp:Parameter Name="CountryID" Type="String" />
                                                <asp:Parameter Name="Priority" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Business Type<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <asp:DropDownList ID="dropBusiness" CssClass="selectb" runat="server" ValidationGroup="Register">
                                            <asp:ListItem>Manufactory</asp:ListItem>
                                            <asp:ListItem>Trading company</asp:ListItem>
                                            <asp:ListItem>Others</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="send-contact">
                                <div class="info-input">
                                    <div class="info-text">
                                        <div class="row-in">
                                            <div class="infow">
                                                <label class="info-lb">
                                                    First Name<span class="error-lb">*</span></label>
                                                <asp:TextBox ID="txtFirstName" CssClass="info-textbox" runat="server" ValidationGroup="Register"></asp:TextBox>
                                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator5" runat="server"
                                                    Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtFirstName"
                                                    ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="infow">
                                                <label class="info-lb">
                                                    Last Name<span class="error-lb">*</span></label>
                                                <asp:TextBox ID="txtLastName" CssClass="info-textbox" runat="server" ValidationGroup="Register"></asp:TextBox>
                                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator10" runat="server"
                                                    Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtLastName"
                                                    ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Email<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <asp:TextBox ID="txtEmail" CssClass="info-textbox" runat="server" ValidationGroup="Register"></asp:TextBox>
                                        <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                            runat="server" ValidationGroup="Register" ControlToValidate="txtEmail" ErrorMessage="Email error!"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator6" runat="server"
                                            Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtEmail" ErrorMessage="Information required!"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <div class="info-text">
                                        <div class="row-in">
                                            <div class="infow">
                                                <label class="info-lb">
                                                    Tel</label>
                                                <asp:TextBox ID="txtTel" CssClass="info-textbox" runat="server" ValidationGroup="Register"></asp:TextBox>
                                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator7" runat="server"
                                                    Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtTel" ErrorMessage="Information required!"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="infow">
                                                <label class="info-lb">
                                                    Cellphone</label>
                                                <asp:TextBox ID="txtCellPhone" CssClass="info-textbox" runat="server" ValidationGroup="Register"></asp:TextBox>
                                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator8" runat="server"
                                                    Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtCellPhone"
                                                    ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Fax</label>
                                    <div class="info-text">
                                        <asp:TextBox ID="txtFax" CssClass="info-textbox" runat="server" ValidationGroup="Register"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator9" runat="server"
                                            Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtFax" ErrorMessage="Information required!"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
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
                    ValidationGroup="Register" Text="submit" OnClick="btnRegister_Click" />
                <asp:Label runat="server" ID="lblMessage" ForeColor="red"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
