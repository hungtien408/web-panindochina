<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="services.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Panindochina</title>
    <meta name="description" content="Panindochina" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="site">
        <div class="container">
            <a id="A1" href="~/" runat="server">Home<span class="icon-caret-right"></span></a>
            <span>Service</span>
        </div>
    </div>
    <div class="container wrap-service">
        <div class="text-center wrapper-880">
            <h4 class="text-uppercase title-1">Our Services</h4>
            <div class="desription">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod. Tation ullamcorper suscipit lobortis nisldolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim</div>
        </div>
        <div class="wrap-parent">
            <a href="#"><img src="assets/images/pa-img-1.jpg" alt=""/></a>
            <a href="#"><img src="assets/images/pa-img-2.jpg" alt=""/></a>
            <a href="#"><img src="assets/images/pa-img-3.jpg" alt=""/></a>
            <a href="#"><img src="assets/images/pa-img-4.jpg" alt=""/></a>
        </div>
        <div class="product-group row service-wrap">
            <div class="colno-3 element-item">
                <div class="servece-box wrap-effecth">
                    <a href="service-sub.aspx" class="product-img effect-hover">
                        <span class="hover-img fullbox-img"><img class="hideo" src="assets/images/service-img-1a.jpg" alt=""/></span>
                        <span class="hover-img fullbox-img"><img class="hideo" src="assets/images/service-img-1.jpg" alt=""/></span>
                    </a>
                    <h5 class="product-name"><a href="service-sub.aspx" class="text-uppercase">rental service<span class="icon-angle-right iconar"></span></a></h5>
                </div>
            </div>
            <div class="colno-3 element-item">
                <div class="servece-box wrap-effecth">
                    <a href="service-sub.aspx" class="product-img effect-hover">
                        <span class="hover-img fullbox-img"><img class="hideo" src="assets/images/service-img-2a.jpg" alt=""/></span>
                        <span class="hover-img fullbox-img"><img class="hideo" src="assets/images/service-img-2.jpg" alt=""/></span>
                    </a>
                    <h5 class="product-name"><a href="service-sub.aspx" class="text-uppercase">inspection and repairing Services<span class="icon-angle-right iconar"></span></a></h5>
                </div>
            </div>
            <div class="colno-3 element-item">
                <div class="servece-box wrap-effecth">
                    <a href="service-sub.aspx" class="product-img effect-hover">
                        <span class="hover-img fullbox-img"><img class="hideo" src="assets/images/service-img-3a.jpg" alt=""/></span>
                        <span class="hover-img fullbox-img"><img class="hideo" src="assets/images/service-img-3.jpg" alt=""/></span>
                    </a>
                    <h5 class="product-name"><a href="service-sub.aspx" class="text-uppercase">product training &amp; consultant<span class="icon-angle-right iconar"></span></a></h5>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" Runat="Server">
</asp:Content>

