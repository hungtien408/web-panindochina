<%@ Page Title="" Language="C#" MasterPageFile="~/site-customer.master" AutoEventWireup="true" CodeFile="customer-catalogue.aspx.cs" Inherits="customer_catalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Panindochina</title>
    <meta name="description" content="Panindochina" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" Runat="Server">
    <a href="#">Customer Support<span class="icon-caret-right"></span></a><span>Catalogue / Brochure</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <h1 class="title desktop-992">Catalogue / Brochure</h1>
   <h2 class="title-menu mobile-992"><a class="panel-right" href="#mobileRight">Catalogue / Brochure<span class="iconar icon-chevron-down"></span></a></h2>
    <div class="form-select">
        <label class="lb-form">Select Brand</label>
        <div class="select-box">
            <asp:DropDownList ID="DropDownList1" CssClass="selectb" runat="server"></asp:DropDownList>
        </div>
    </div>
    <h4 class="title-2">Scott Safety</h4>
    <ul class="download-list">
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
    </ul>
    <h4 class="title-2">Protector</h4>
    <ul class="download-list">
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
    </ul>
    <h4 class="title-2">Ion Science</h4>
    <ul class="download-list">
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
    </ul>
    <h4 class="title-2">Microgard</h4>
    <ul class="download-list">
        <li><a class="download-link corner" href="#"><span>Download</span></a> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do magna aliqua. Ut enim ad minim veniam,</li>
    </ul>
   <h2 class="title-link mobile-992"><a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>Catalogue / Brochure</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" Runat="Server">
</asp:Content>

