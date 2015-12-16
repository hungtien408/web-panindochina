<%@ Page Title="" Language="C#" MasterPageFile="~/site-customer.master" AutoEventWireup="true"
    CodeFile="register-form.aspx.cs" Inherits="register_form" %>

<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2012.3.1016.35, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="#">Customer Support<span class="icon-caret-right"></span></a><span>Being Panindochina’s
        Retailer</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title desktop-992">
        Being Registration Rorm</h1>
    <h2 class="title-menu mobile-992">
        <a class="panel-right" href="#mobileRight">Registration Rorm<span class="iconar icon-chevron-down"></span></a></h2>
    <h4 class="text-uppercase titbg">
        part 1: GENERAL INFORMATION</h4>
    <div class="register-form">
        <div class="form-input">
            <div class="row">
                <div class="col-lg-7 form-first">
                    <label class="form-lb">
                        Full Name</label>
                    <div class="input-text">
                        <asp:TextBox ID="txtFullName" CssClass="text-box corner" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFullName"
                            ErrorMessage="Information required !" ValidationGroup="RegisterForm"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="input-in">
                        <label class="form-lb">
                            Gender</label>
                        <div class="input-text">
                            <asp:RadioButtonList ID="radioGender" runat="server" RepeatDirection="Horizontal"
                                ValidationGroup="RegisterForm">
                                <asp:ListItem Text="Male" Value="True" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="False"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                <div class="col-lg-12 form-first">
                    <label class="form-lb">
                        Company Name</label>
                    <div class="input-in">
                        <asp:TextBox ID="txtCompanyName" CssClass="text-box corner" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCompanyName"
                            ErrorMessage="Information required !" ValidationGroup="RegisterForm"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                <div class="col-lg-12 form-first">
                    <label class="form-lb">
                        Company Address</label>
                    <div class="input-in">
                        <asp:TextBox ID="txtCompanyAddress" CssClass="text-box corner" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCompanyAddress"
                            ErrorMessage="Information required !" ValidationGroup="RegisterForm"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-input">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="form-btn">
                                <label class="form-lb">
                                    City/ Province</label>
                                <div class="input-text">
                                    <asp:DropDownList ID="listProvince" runat="server" DataSourceID="odsProvince" DataTextField="ProvinceName"
                                        DataValueField="ProvinceID" ValidationGroup="RegisterForm" AutoPostBack="True">
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
                        </div>
                        <div class="col-lg-5">
                            <div class="input-in">
                                <label class="form-lb">
                                    Country</label>
                                <div class="input-text">
                                    <asp:DropDownList ID="listDistrict" runat="server" DataSourceID="odsDistrict" DataTextField="DistrictName"
                                        DataValueField="DistrictID" ValidationGroup="RegisterForm">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="odsDistrict" runat="server" SelectMethod="DistrictSelectAll"
                                        TypeName="TLLib.District">
                                        <SelectParameters>
                                            <asp:Parameter Name="DistrictName" Type="String" />
                                            <asp:ControlParameter ControlID="listProvince" Name="ProvinceIDs" PropertyName="SelectedValue"
                                                Type="String" />
                                            <asp:Parameter Name="IsAvailable" Type="String" />
                                            <asp:Parameter Name="Priority" Type="String" />
                                            <asp:Parameter Name="SortByPriority" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="form-input">
            <div class="row">
                <div class="col-lg-7 form-first">
                    <label class="form-lb">
                        Company Telephone</label>
                    <div class="input-text">
                        <asp:TextBox ID="txtCompanyPhone" CssClass="text-box corner" runat="server" ValidationGroup="RegisterForm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCompanyPhone"
                            ErrorMessage="Information required !"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="input-in">
                        <label class="form-lb">
                            Cell phone</label>
                        <div class="input-text">
                            <asp:TextBox ID="txtCellPhone" CssClass="text-box corner" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCellPhone"
                                ErrorMessage="Information required !" ValidationGroup="RegisterForm"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-input">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-lg-7 form-first">
                            <label class="form-lb">
                                Email Address</label>
                            <div class="input-text">
                                <asp:TextBox ID="txtEmail" CssClass="text-box corner" runat="server" OnTextChanged="txtEmail_TextChanged"
                                    AutoPostBack="True"></asp:TextBox>
                                <asp:Label ID="lblCheckEmail" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="Information required !" ValidationGroup="RegisterForm"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidator1" ValidationGroup="RegisterForm" runat="server"
                                    ControlToValidate="txtEmail" Display="Dynamic"></asp:CustomValidator>
                                <asp:RegularExpressionValidator ValidationGroup="RegisterForm" ID="RegularExpressionValidator3"
                                    runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Format email wrong."
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="node">
                                (This is your User - ID)</div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="form-input">
            <div class="row">
                <div class="col-lg-7 form-first">
                    <label class="form-lb">
                        Confirm Email</label>
                    <div class="input-text">
                        <asp:TextBox ID="txtConfirmEmail" CssClass="text-box corner" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtEmail"
                            ControlToValidate="txtConfirmEmail" ErrorMessage="Confirm email wrong !" ValidationGroup="RegisterForm"></asp:CompareValidator>
                        <asp:RegularExpressionValidator ValidationGroup="RegisterForm" ID="RegularExpressionValidator2"
                            runat="server" ControlToValidate="txtConfirmEmail" Display="Dynamic" ErrorMessage="Format email wrong."
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <h4 class="text-uppercase titbg">
        part 2: USER REFERENCE
    </h4>
    <div class="register-form">
        <div class="form-input">
            <div class="row">
                <div class="col-lg-7 form-first">
                    <label class="form-lb w200">
                        YOUR COMPANY DESCRIBES</label>
                </div>
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                <div class="col-lg-7">
                    <div class="form-btn">
                        <label class="form-lb">
                            End - User</label>
                        <div class="input-text">
                            <asp:DropDownList ID="listEndUser" runat="server" DataSourceID="odsEndUser" DataTextField="ArticleTitle"
                                DataValueField="ArticleID" ValidationGroup="RegisterForm">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="odsEndUser" runat="server" SelectMethod="ArticleSelectAll"
                                TypeName="TLLib.Article">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter Name="Keyword" Type="String" />
                                    <asp:Parameter Name="ArticleTitle" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter DefaultValue="20" Name="ArticleCategoryID" Type="String" />
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
                <div class="col-lg-5">
                    <div class="input-in">
                        <label class="form-lb">
                            Trading</label>
                        <div class="input-text">
                            <asp:DropDownList ID="listTrading" runat="server" DataSourceID="odsTrading" DataTextField="ArticleTitle"
                                DataValueField="ArticleID" ValidationGroup="RegisterForm">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="odsTrading" runat="server" SelectMethod="ArticleSelectAll"
                                TypeName="TLLib.Article">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter Name="Keyword" Type="String" />
                                    <asp:Parameter Name="ArticleTitle" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter DefaultValue="21" Name="ArticleCategoryID" Type="String" />
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
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                <div class="col-lg-7">
                    <div class="form-btn">
                        <label class="form-lb">
                            Service</label>
                        <div class="input-text">
                            <asp:DropDownList ID="listService" runat="server" DataSourceID="odsService" DataTextField="ArticleTitle"
                                DataValueField="ArticleID" ValidationGroup="RegisterForm">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="odsService" runat="server" SelectMethod="ArticleSelectAll"
                                TypeName="TLLib.Article">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter Name="Keyword" Type="String" />
                                    <asp:Parameter Name="ArticleTitle" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter DefaultValue="22" Name="ArticleCategoryID" Type="String" />
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
                <div class="col-lg-5">
                    <div class="input-in">
                        <label class="form-lb">
                            Trainer</label>
                        <div class="input-text">
                            <asp:DropDownList ID="listTrainer" runat="server" DataSourceID="odsTrainer" DataTextField="ArticleTitle"
                                DataValueField="ArticleID" ValidationGroup="RegisterForm">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="odsTrainer" runat="server" SelectMethod="ArticleSelectAll"
                                TypeName="TLLib.Article">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter Name="Keyword" Type="String" />
                                    <asp:Parameter Name="ArticleTitle" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter DefaultValue="23" Name="ArticleCategoryID" Type="String" />
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
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                <div class="col-lg-7">
                    <div class="form-btn">
                        <label class="form-lb">
                            Safety Org</label>
                        <div class="input-text">
                            <asp:DropDownList ID="listSafetyOrg" runat="server" DataSourceID="odsSafetyOrg" DataTextField="ArticleTitle"
                                DataValueField="ArticleID" ValidationGroup="RegisterForm">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="odsSafetyOrg" runat="server" SelectMethod="ArticleSelectAll"
                                TypeName="TLLib.Article">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter Name="Keyword" Type="String" />
                                    <asp:Parameter Name="ArticleTitle" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter DefaultValue="24" Name="ArticleCategoryID" Type="String" />
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
                <div class="col-lg-5">
                    <div class="input-in">
                        <label class="form-lb">
                            Other</label>
                        <div class="input-text">
                            <asp:TextBox ID="txtOther" CssClass="text-box corner" runat="server" ValidationGroup="RegisterForm"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                <div class="col-lg-6 form-first">
                    <label class="form-lb w200">
                        YOUR COMPANY INDUSTRY</label>
                    <div class="input-text">
                        <asp:DropDownList ID="listCompanyIndustry" runat="server" DataSourceID="odsCompanyIndustry"
                            DataTextField="ArticleTitle" DataValueField="ArticleID" ValidationGroup="RegisterForm">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="odsCompanyIndustry" runat="server" SelectMethod="ArticleSelectAll"
                            TypeName="TLLib.Article">
                            <SelectParameters>
                                <asp:Parameter Name="StartRowIndex" Type="String" />
                                <asp:Parameter Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ArticleTitle" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter DefaultValue="25" Name="ArticleCategoryID" Type="String" />
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
        </div>
        <div class="form-input">
            <div class="row">
                <div class="col-lg-12 form-first">
                    <label class="form-lb">
                        Email Address</label>
                    <div class="input-text">
                        <asp:TextBox ID="txtEmail2" CssClass="text-area corner" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail2"
                            ErrorMessage="Information required !" ValidationGroup="RegisterForm"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="RegisterForm" ID="RegularExpressionValidator1"
                            runat="server" ControlToValidate="txtEmail2" Display="Dynamic" ErrorMessage="Format email wrong."
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                <div class="col-lg-5 form-first">
                    <label class="form-lb">
                        SECURITY CODE</label>
                    <div class="input-text">
                        <asp:TextBox ID="txtSecurityCode" CssClass="text-box corner" runat="server" ValidationGroup="RegisterForm"></asp:TextBox>
                        <asp:RadCaptcha ID="RadCaptcha1" ValidatedTextBoxID="txtSecurityCode" ValidationGroup="RegisterForm"
                            runat="server" Display="Dynamic" ErrorMessage="Mã xác nhận: không chính xác."
                            CaptchaLinkButtonText="Refesh" CssClass="capcha" EnableRefreshImage="True">
                            <CaptchaImage RenderImageOnly="True" Width="125" Height="35" BackgroundNoise="High"
                                BackgroundColor="White" TextColor="Black" FontFamily="Tohoma" TextLength="5" />
                        </asp:RadCaptcha>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <h4 class="text-uppercase titbg">
        part 2: USER REFERENCE
    </h4>
    <div class="register-form">
        <div class="form-input">
            <div class="row">
                <div class="col-lg-5 form-first">
                    <label class="form-lb">
                        TERMS &amp; CONDITIONS</label>
                    <div class="input-text">
                        <asp:TextBox ID="txtTermsConditions" CssClass="text-box corner" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtTermsConditions"
                            ErrorMessage="Information required !" ValidationGroup="RegisterForm"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-input">
            <div class="node-2">
                As Panindochina's privacy Policy. Information will be sent only to the provided
                email address. Email and phone information are not sold to any third party for marketing
                purpose.
            </div>
        </div>
        <div class="form-input">
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-btn button-w">
                        <asp:Button ID="btnSubmit" CssClass="text-uppercase corner btn-button" runat="server"
                            Text="Submit" ValidationGroup="RegisterForm" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="text-uppercase corner btn-button" runat="server"
                            Text="cancel" ValidationGroup="RegisterForm" />
                        <asp:Label ID="lblMessage" runat="server" ForeColor="red"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
