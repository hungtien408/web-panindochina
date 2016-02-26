<%@ Page Language="C#" AutoEventWireup="true" CodeFile="magazine-details.aspx.cs"
    Inherits="magazine_details" %>

<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head runat="server">
    <meta name="viewport" content="width = 1050, user-scalable = no" />
    <link href="../assets/styles/basic.css" rel="stylesheet" type="text/css" />
    <script src="../assets/js/jquery.js" type="text/javascript"></script>
    <script src="../assets/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="../assets/js/modernizr.2.5.3.min.js" type="text/javascript"></script>
    <script src="../assets/js/hash.js" type="text/javascript"></script>
    <title>Catalogue / Brochure</title>
</head>
<body>
    <form id="form1" runat="server">
    <a href="customer-catalogue.aspx" class="back-page">close</a>
    <div id="magazineBook">
        <div id="canvas">
            <div class="zoom-icon zoom-icon-in">
            </div>
            <div class="magazine-viewport">
                <div class="container">
                    <div class="magazine">
                        <%--<div style="background-image:url(pages/1.jpg)"></div>
			<div style="background-image:url(pages/2.jpg)"></div>
			<div style="background-image:url(pages/3.jpg)"></div>
			<div style="background-image:url(pages/4.jpg)"></div>
			<div style="background-image:url(pages/5.jpg)"></div>
			<div style="background-image:url(pages/6.jpg)"></div>
			<div style="background-image:url(pages/7.jpg)"></div>
			<div style="background-image:url(pages/8.jpg)"></div>
			<div style="background-image:url(pages/9.jpg)"></div>
			<div style="background-image:url(pages/10.jpg)"></div>
			<div style="background-image:url(pages/11.jpg)"></div>
			<div style="background-image:url(pages/12.jpg)"></div>--%>
                        <asp:ListView ID="lstDownloadImage" runat="server" DataSourceID="odsDownloadImage"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "<div style='background-image:url(../res/download/album/" + Eval("ImageName") + ")'></div>" : ""%>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                            </EmptyDataTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsDownloadImage" runat="server" SelectMethod="DownloadImageSelectAll"
                            TypeName="TLLib.DownloadImage">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="mg" Name="DownloadID" 
                                    Type="String" />
                                <asp:Parameter Name="IsAvailable" Type="String" DefaultValue="True" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <!-- Next button -->
                        <div ignore="1" class="next-button">
                        </div>
                        <!-- Previous button -->
                        <div ignore="1" class="previous-button">
                        </div>
                    </div>
                </div>
                <div class="bottom">
                    <div id="slider-bar" class="turnjs-slider">
                        <div id="slider">
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">

                function loadApp() {

                    $('#canvas').fadeIn(1000);

                    var flipbook = $('.magazine');

                    // Check if the CSS was already loaded

                    if (flipbook.width() == 0 || flipbook.height() == 0) {
                        setTimeout(loadApp, 10);
                        return;
                    }

                    // Create the flipbook

                    flipbook.turn({
                        // Width

                        width: 1200,

                        // Height

                        height: 760,

                        // Elevation

                        elevation: 50,

                        // Enable gradients

                        gradients: true,

                        // Auto center this flipbook

                        autoCenter: true

                    });

                    // Zoom.js

                    $('.magazine-viewport').zoom({
                        flipbook: $('.magazine'),

                        max: function () {

                            return largeMagazineWidth() / $('.magazine').width();

                        },

                        when: {
                            swipeLeft: function () {

                                $(this).zoom('flipbook').turn('next');

                            },

                            swipeRight: function () {

                                $(this).zoom('flipbook').turn('previous');

                            },

                            resize: function (event, scale, page, pageElement) {

                                if (scale == 1)
                                    loadSmallPage(page, pageElement);
                                else
                                    loadLargePage(page, pageElement);

                            },

                            zoomIn: function () {

                                $('#slider-bar').hide();
                                $('.made').hide();
                                $('.magazine').removeClass('animated').addClass('zoom-in');
                                $('.zoom-icon').removeClass('zoom-icon-in').addClass('zoom-icon-out');

                                if (!window.escTip && !$.isTouch) {
                                    escTip = true;

                                    $('<div />', { 'class': 'exit-message' }).
						html('<div>Press ESC to exit</div>').
							appendTo($('body')).
							delay(2000).
							animate({ opacity: 0 }, 500, function () {
							    $(this).remove();
							});
                                }
                            },

                            zoomOut: function () {

                                $('#slider-bar').fadeIn();
                                $('.exit-message').hide();
                                $('.made').fadeIn();
                                $('.zoom-icon').removeClass('zoom-icon-out').addClass('zoom-icon-in');

                                setTimeout(function () {
                                    $('.magazine').addClass('animated').removeClass('zoom-in');
                                    resizeViewport();
                                }, 0);

                            }
                        }
                    });

                    // Zoom event

                    if ($.isTouch)
                        $('.magazine-viewport').bind('zoom.doubleTap', zoomTo);
                    else
                        $('.magazine-viewport').bind('zoom.tap', zoomTo);


                    // Using arrow keys to turn the page

                    $(document).keydown(function (e) {

                        var previous = 37, next = 39, esc = 27;

                        switch (e.keyCode) {
                            case previous:

                                // left arrow
                                $('.magazine').turn('previous');
                                e.preventDefault();

                                break;
                            case next:

                                //right arrow
                                $('.magazine').turn('next');
                                e.preventDefault();

                                break;
                            case esc:

                                $('.magazine-viewport').zoom('zoomOut');
                                e.preventDefault();

                                break;
                        }
                    });

                    // URIs - Format #/page/1 

                    Hash.on('^page\/([0-9]*)$', {
                        yep: function (path, parts) {
                            var page = parts[1];

                            if (page !== undefined) {
                                if ($('.magazine').turn('is'))
                                    $('.magazine').turn('page', page);
                            }

                        },
                        nop: function (path) {

                            if ($('.magazine').turn('is'))
                                $('.magazine').turn('page', 1);
                        }
                    });


                    $(window).resize(function () {
                        resizeViewport();
                    }).bind('orientationchange', function () {
                        resizeViewport();
                    });

                    // Regions

                    if ($.isTouch) {
                        $('.magazine').bind('touchstart', regionClick);
                    } else {
                        $('.magazine').click(regionClick);
                    }

                    // Events for the next button

                    $('.next-button').bind($.mouseEvents.over, function () {

                        $(this).addClass('next-button-hover');

                    }).bind($.mouseEvents.out, function () {

                        $(this).removeClass('next-button-hover');

                    }).bind($.mouseEvents.down, function () {

                        $(this).addClass('next-button-down');

                    }).bind($.mouseEvents.up, function () {

                        $(this).removeClass('next-button-down');

                    }).click(function () {

                        $('.magazine').turn('next');

                    });

                    // Events for the next button

                    $('.previous-button').bind($.mouseEvents.over, function () {

                        $(this).addClass('previous-button-hover');

                    }).bind($.mouseEvents.out, function () {

                        $(this).removeClass('previous-button-hover');

                    }).bind($.mouseEvents.down, function () {

                        $(this).addClass('previous-button-down');

                    }).bind($.mouseEvents.up, function () {

                        $(this).removeClass('previous-button-down');

                    }).click(function () {

                        $('.magazine').turn('previous');

                    });


                    // Slider

                    $("#slider").slider({
                        min: 1,
                        max: numberOfViews(flipbook),

                        start: function (event, ui) {

                            if (!window._thumbPreview) {
                                _thumbPreview = $('<div />', { 'class': 'thumbnail' }).html('<div></div>');
                                setPreview(ui.value);
                                //                    _thumbPreview.appendTo($(ui.handle));
                            } else
                                setPreview(ui.value);

                            moveBar(false);

                        },

                        slide: function (event, ui) {

                            setPreview(ui.value);

                        },

                        stop: function () {

                            if (window._thumbPreview)
                                _thumbPreview.removeClass('show');

                            $('.magazine').turn('page', Math.max(1, $(this).slider('value') * 2 - 2));

                        }
                    });

                    resizeViewport();

                    $('.magazine').addClass('animated');

                }

                // Zoom icon

                $('.zoom-icon').bind('mouseover', function () {

                    if ($(this).hasClass('zoom-icon-in'))
                        $(this).addClass('zoom-icon-in-hover');

                    if ($(this).hasClass('zoom-icon-out'))
                        $(this).addClass('zoom-icon-out-hover');

                }).bind('mouseout', function () {

                    if ($(this).hasClass('zoom-icon-in'))
                        $(this).removeClass('zoom-icon-in-hover');

                    if ($(this).hasClass('zoom-icon-out'))
                        $(this).removeClass('zoom-icon-out-hover');

                }).bind('click', function () {

                    if ($(this).hasClass('zoom-icon-in'))
                        $('.magazine-viewport').zoom('zoomIn');
                    else if ($(this).hasClass('zoom-icon-out'))
                        $('.magazine-viewport').zoom('zoomOut');

                });

                $('#canvas').hide();


                // Load the HTML4 version if there's not CSS transform

                yepnope({
                    test: Modernizr.csstransforms,
                    yep: ['../assets/js/turn.min.js'],
                    nope: ['../assets/js/turn.html4.min.js', '../assets/styles/jquery.ui.html4.css'],
                    both: ['../assets/js/zoom.min.js', '../assets/styles/jquery.ui.css', '../assets/js/magazine.js', '../assets/styles/magazine.css'],
                    complete: loadApp
                });

</script>
        </div>
    </div>
    </form>
</body>
</html>
