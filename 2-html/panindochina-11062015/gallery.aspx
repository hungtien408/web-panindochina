<%@ Page Title="" Language="C#" MasterPageFile="~/site-gallery.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Panindochina</title>
    <meta name="description" content="Panindochina" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" Runat="Server">
    <a href="#">Library<span class="icon-caret-right"></span></a><span>Hình ảnh</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="title desktop-992">Hình ảnh</h1>
   <h2 class="title-menu mobile-992"><a class="panel-right" href="#mobileRight">Hình ảnh<span class="iconar icon-chevron-down"></span></a></h2>
    <div class="wrapper-gallery">
        <div class="row group-tb">
            <div class="col-xs-4 element-item">
                <div class="box-gallery">
                    <div class="gallery-img"><a href="javascript:void(0);" class="fullbox-img group-img" data-toggle="modal" data-target="#myModal" data-page="ga-gallery.aspx"><img class="hideo" src="assets/images/gallery-i-1.jpg" alt=""/></a></div>
                    <h4 class="gallery-name group-name"><a href="javascript:void(0);" data-toggle="modal" data-target="#myModal" data-page="ga-gallery.aspx">Hội thảo chuyên đề các thiết bị an toàn 2011</a></h4>
                </div>
            </div>
            <div class="col-xs-4 element-item">
                <div class="box-gallery">
                    <div class="gallery-img"><a href="javascript:void(0);" class="fullbox-img group-img" data-toggle="modal" data-target="#myModal" data-page="ga-gallery.aspx"><img class="hideo" src="assets/images/gallery-i-1.jpg" alt=""/></a></div>
                    <h4 class="gallery-name group-name"><a href="javascript:void(0);" data-toggle="modal" data-target="#myModal" data-page="ga-gallery.aspx">Hội thảo chuyên đề các thiết bị an toàn 2011</a></h4>
                </div>
            </div>
            <div class="col-xs-4 element-item">
                <div class="box-gallery">
                    <div class="gallery-img"><a href="javascript:void(0);" class="fullbox-img group-img" data-toggle="modal" data-target="#myModal" data-page="ga-gallery.aspx"><img class="hideo" src="assets/images/gallery-i-1.jpg" alt=""/></a></div>
                    <h4 class="gallery-name group-name"><a href="javascript:void(0);" data-toggle="modal" data-target="#myModal" data-page="ga-gallery.aspx">Hội thảo chuyên đề các thiết bị an toàn 2011</a></h4>
                </div>
            </div>
            <div class="col-xs-4 element-item">
                <div class="box-gallery">
                    <div class="gallery-img"><a href="javascript:void(0);" class="fullbox-img group-img" data-toggle="modal" data-target="#myModal" data-page="ga-gallery.aspx"><img class="hideo" src="assets/images/gallery-i-1.jpg" alt=""/></a></div>
                    <h4 class="gallery-name group-name"><a href="javascript:void(0);" data-toggle="modal" data-target="#myModal" data-page="ga-gallery.aspx">Hội thảo chuyên đề các thiết bị an toàn 2011</a></h4>
                </div>
            </div>
        </div>
    </div>
        <div id="pagerp" class="pager">
            <a class="first" href="#">first</a>
            <a class="prev" href="#">prev</a>
            <a class="current" href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a class="next" href="#">next</a>
            <a class="last" href="#">last</a>
        </div>
   <h2 class="title-link mobile-992"><a class="panel-right" href="#mobileRight"><span class="icon-chevron-left"></span>Hình ảnh</a></h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" Runat="Server">
    <!-- Modal -->
    <div class="modal fade gallery-popup" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <div class="modal-body">
                </div>
        </div>
      </div>
    </div>
</asp:Content>

