<%@ Page Title="" Language="C#" MasterPageFile="~/site-customer.master" AutoEventWireup="true" CodeFile="customer-faq.aspx.cs" Inherits="customer_being" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Panindochina</title>
    <meta name="description" content="Panindochina" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" Runat="Server">
    <a href="#">Customer Support<span class="icon-caret-right"></span></a><span>FAQs</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="title desktop-992">FAQs</h1>
   <h2 class="title-menu mobile-992"><a class="panel-right" href="#mobileRight">FAQs<span class="iconar icon-chevron-down"></span></a></h2>
    <ul class="list-faq">
        <li><a href="customer-faqs.aspx">General Question</a></li>
        <li><a href="customer-faqs.aspx">PID Question</a></li>
        <li><a href="customer-faqs.aspx">GasCheck Question</a></li>
        <li><a href="customer-faqs.aspx">SF6 Question</a></li>
        <li><a href="customer-faqs.aspx">Mini PID Question</a></li>
        <li><a href="customer-faqs.aspx">Hydrosteel Question</a></li>
        <li><a href="customer-faqs.aspx">MVI Question</a></li>
    </ul>
   <h2 class="title-link mobile-992"><a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>FAQs</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" Runat="Server">
</asp:Content>

