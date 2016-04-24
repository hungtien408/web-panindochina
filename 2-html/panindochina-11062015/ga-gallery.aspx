<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ga-gallery.aspx.cs" Inherits="ga_gallery" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <link href="assets/styles/jcarousel.connected-carousels.css" rel="stylesheet" />
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery.touchSwipe.min.js"></script>
    <script src="assets/js/jquery.jcarousel.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#jcarouselGallery").jcarouselre({
                autos: true,
                pausehover: false,
                pager: true, //pager num
                timespees: 3000,
                thumswrap: false, // thums sroll
                shownum: 6, // show number thums
                widththum: 150, // width li thums
                thumsbutton: 0 //padding thums
            });
        });
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="jcarouselGallery" class="connected-carousels">
                <div class="stage">
                    <div class="carousel carousel-stage">
                        <ul>
                            <li><img src="assets/images/img1.jpg" alt=""></li>
                            <li><img src="assets/images/img2.jpg" alt=""></li>
                            <li><img src="assets/images/img3.jpg" alt=""></li>
                            <li><img src="assets/images/img4.jpg" alt=""></li>
                            <li><img src="assets/images/img5.jpg" alt=""></li>
                            <li><img src="assets/images/img6.jpg" alt=""></li>
                            <li><img src="assets/images/img1.jpg" alt=""></li>
                            <li><img src="assets/images/img2.jpg" alt=""></li>
                            <li><img src="assets/images/img3.jpg" alt=""></li>
                        </ul>
                    </div>
                    <a href="#" class="prev prev-stage"><span>&lsaquo;</span></a>
                    <a href="#" class="next next-stage"><span>&rsaquo;</span></a>
                </div>

                <div class="navigation">
                    <a href="#" class="prev prev-navigation navigation-btn">&lsaquo;</a>
                    <a href="#" class="next next-navigation navigation-btn">&rsaquo;</a>
                    <div class="carousel carousel-navigation">
                        <ul>
                            <li><div class="box-small"><img src="assets/images/img1_thumb.jpg"  alt=""></div></li>
                            <li><div class="box-small"><img src="assets/images/img2_thumb.jpg"  alt=""></div></li>
                            <li><div class="box-small"><img src="assets/images/img3_thumb.jpg"  alt=""></div></li>
                            <li><div class="box-small"><img src="assets/images/img4_thumb.jpg"  alt=""></div></li>
                            <li><div class="box-small"><img src="assets/images/img5_thumb.jpg"  alt=""></div></li>
                            <li><div class="box-small"><img src="assets/images/img6_thumb.jpg"  alt=""></div></li>
                            <li><div class="box-small"><img src="assets/images/img1_thumb.jpg"  alt=""></div></li>
                            <li><div class="box-small"><img src="assets/images/img2_thumb.jpg"  alt=""></div></li>
                            <li><div class="box-small"><img src="assets/images/img3_thumb.jpg"  alt=""></div></li>
                        </ul>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>
