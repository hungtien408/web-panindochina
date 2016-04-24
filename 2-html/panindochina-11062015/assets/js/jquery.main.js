function pageLoad() {
}
(function ($) {
    $(window).load(function () {
    });
    $(function () {
        mypageload();
        myfunload();
    });
})(jQuery);
//function===============================================================================================
/*=============================fun=========================================*/
function myfunload() {
    $(".panel-left").mobilepanel();
    tabrpoduct();
    if ($('#slider').size() == 1) {
        var $banner = $('#slider').imagesLoaded(function () {
            $banner.nivoSlider({
                pauseOnHover: false,
                directionNav: true,
                controlNav: false
            });
        });
    }
    if ($('#sliderBanner').size() == 1) {
        var countab = $('#sliderBanner .slide').size();
        if (countab > 1) {
            var slidera = $('#sliderBanner').bxSlider({
                mode: 'fade',
                auto: true,
                pager: true,
                controls: false
            });
            $(".slider-sub .bx-pager").click(function () {
                slidera.startAuto();
            });
        } else {
            $('#sliderBanner').bxSlider({
                mode: 'fade',
                auto: false,
                pager: false,
                controls: false
            });
        }
    }
    $(".fullbox-img").bgsizebox({
        fimg: true,
        imgcss: "hideo",
        attrname: "data-src"
    });
    if ($(".jcarousel-pro").size() > 0) {
        $(".jcarousel-pro").jcarouselbox({
            autos: false,
            pausehover: false,
            pager: false, //pager num
            wipont: [{ widthpoint: "1023", numcount: "5" }, { widthpoint: "768", numcount: "4" }, { widthpoint: "600", numcount: "3" }, { widthpoint: "360", numcount: "2" }],
            timespees: 3000,
            wrapsroll: true
        }).textHeight({
            activetit: true,
            listcss: [{ cssname: ".product-name" }],
            wpointb: true,
            widthpont: 359,
            desbool: false,
            listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
            max: true
        });
    }
    $(".jcarousel-parent").jcarouselbox({
        autos: true,
        pausehover: true,
        pager: false, //pager num
        wipont: [{ widthpoint: "970", numcount: "6" }, { widthpoint: "768", numcount: "5" }, { widthpoint: "480", numcount: "4" }, { widthpoint: "300", numcount: "3" }, { widthpoint: "240", numcount: "2" }],
        timespees: 3000,
        wrapsroll: true
    });
    $('#accordion .panel-heading a[data-toggle="collapse"]').on('click', function () {
        $('#accordion .panel-heading a[data-toggle="collapse"]').removeClass('current');
        $(this).addClass('current');
        $(this).toggleClass("open");
        $('#accordion .panel-heading a[data-toggle="collapse"]').each(function () {
            if (!$(this).hasClass("current")) {
                $(this).removeClass('open');
            }
        });
    });
    $(".effect-hover .hover-img:first-child").addClass("first");
    $(".wrap-effecth").hover(function () {
        $(this).find(".hover-img.first").stop(true, false).animate({ "opacity": 0 }, 500);
    }, function () {
        $(this).find(".hover-img.first").stop(false, true).animate({ "opacity": 1 }, 500);
    });
    $(".menu-level").menulevel();
    $("#customerm li:has('ul li') > a:first").append('<span class="iconr iconadown icon-caret-down"></span>');
    $("#customerm .current ul").show();
    if ($('#mapshow').size() == 1) {
        mymap();
    }
    if ($("#productw").size() == 1) {
        pagerresize();
    }
}
/*=========================================================================*/
function mypageload() {
    $(".selectb").uniform();
    $(".panel-right").mobilepanel({ panelLeft: false });
    $('#mainContent').imagesLoaded(function () {
        myListTb();
    });
}
/*========================================================================*/
function myListTb() {
    if ($('#isotopelist').size() == 1) {
        $('#isotopelist').isotope({
            itemSelector: '.element-item',
            layoutMode: 'fitRows'
        });
    }
    if ($('.group-tb').size() > 0) {
        $('.group-tb').textHeight({
            activetit: true,
            listcss: [{ cssname: ".group-img" }, { cssname: ".group-name" }],
            wpointb: false,
            widthpont: 420,
            desbool: false,
            listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
            max: true
        }).isotope({
            itemSelector: '.element-item',
            layoutMode: 'fitRows'
        });
    }
    $(".service-wrap").textHeight({
        activetit: true,
        listcss: [{ cssname: ".product-img" }, { cssname: ".product-name" }],
        wpointb: false,
        widthpont: 420,
        desbool: true,
        listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
        max: true
    });
    $(".product-group").isotope({
        itemSelector: '.element-item',
        layoutMode: 'fitRows'
    });
    $('#footer .footer-group').isotope({
        itemSelector: '.element-item',
        layoutMode: 'fitRows'
    });
    if ($('.product-tb').size() > 0) {
        $('.product-tb').textHeight({
            activetit: true,
            listcss: [{ cssname: ".product-img" }, { cssname: ".product-name" }],
            wpointb: false,
            widthpont: 479,
            desbool: true,
            listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
            max: true
        }).isotope({
            itemSelector: '.element-item',
            layoutMode: 'fitRows'
        });
    }
    $(".box-video a").click(function (e) {
        e.preventDefault();
        var pagev = $(this).attr("data-page") + " #videoDetails";
        $("#myModal .modal-body").load(pagev, function (responseTxt, statusTxt, xhr) {
            if (statusTxt == "success") {
                var videoscr = $("#jwplayer").attr("data-video");
                var videoimg = $("#jwplayer").attr("data-img");
                jwplayer('jwplayer').setup({
                    file: videoscr,
                    flashplayer: "assets/js/jwplayer.flash.swf",
                    image: videoimg,
                    width: '100%',
                    aspectratio: '16:9'
                });
                jwplayer('jwplayer').play();
            }
            if (statusTxt == "error") {
                alert("Error: " + xhr.status + ": " + xhr.statusText);
            }
        });
    });
    $(".box-gallery a").click(function (e) {
        e.preventDefault();
        var pagev = $(this).attr("data-page") + " #jcarouselGallery";
        $("#myModal .modal-body").load(pagev, function (responseTxt, statusTxt, xhr) {
            if (statusTxt == "success") {
                $("#jcarouselGallery").jcarouselzoom({
                    autos: false,
                    pausehover: false,
                    pager: false, //pager num
                    timespees: 3000,
                    thumswrap: false, // thums sroll
                    shownum: 6, // show number thums
                    usezoom: false
                });
            }
            if (statusTxt == "error") {
                alert("Error: " + xhr.status + ": " + xhr.statusText);
            }
        });
        $('#myModal').on('show.bs.modal', function (event) {
            var modal = $(this);
            modal.addClass("show");
        });
        $('#myModal').on('hidden.bs.modal', function (event) {
            var modal = $(this);
            modal.show().removeClass("show");
        });
    });
}
function tabrpoduct() {
    $("#controlTab a").click(function () {
        $("#controlTab a").removeClass("current");
        $(this).addClass("current");
        var idtabs = $(this).attr("href");
        $(".wrapper-tabs .tabs-content").removeClass("current").stop(true, true).animate({ "opacity": 0 }, 500);
        $(idtabs).addClass("current").stop(true, true).animate({ "opacity": 1 }, 500);
        $(".tabs-title a").removeClass("current");
        $(".tabs-title a[href='" + idtabs + "']").addClass("current");
        return false;
    });
    $(".tabs-title a").click(function () {
        $(".tabs-title a").removeClass("current");
        $(this).addClass("current");
        var idtabs = $(this).attr("href");
        $(".wrapper-tabs .tabs-content").removeClass("current").stop(true, true).animate({ "opacity": 0 }, 500);
        $(idtabs).addClass("current").stop(true, true).animate({ "opacity": 1 }, 500);
        $("#controlTab a").removeClass("current");
        $("#controlTab a[href='" + idtabs + "']").addClass("current");
        var idindex = $(this).parent(".tabs-title").index();
        var dthis = $(this).parent(".tabs-title").parent();
        var offset = dthis.offset();
        var ht = $(this).parent(".tabs-title").height();
        if (idindex == 0) {
            idindex = 1;
        }
        var topw = offset.top + ht * (idindex - 1) - ht;
        $("html, body").stop(true, true).animate({ scrollTop: topw }, 500);
        return false;
    });
    $("#controlTab li:first a").addClass("current");
    $(".tabs-title:first a").addClass("current");
    $(".wrapper-tabs .tabs-content:first").addClass("current").stop(true, true).animate({ "opacity": 1 }, 500);
}
/*===============================*/
function myfunsroll() {
    menusroll();
    mysroll();
    $("#sroltop a").click(function () {
        $("html, body").stop(true, true).animate({ scrollTop: 0 }, 500);
        return false;
    });
}
function mysroll() {
    mysrol($(window).scrollTop());
    $(window).scroll(function () {
        mysrol($(this).scrollTop());
    });
}
function mysrol(topsroll) {
    //var topsroll = $(window).scrollTop();
    if (topsroll > 100) {
        $("#sroltop").stop(true, true).animate({ "opacity": 0.8 }, 500);
    } else {
        $("#sroltop").stop(true, true).animate({ "opacity": 0 }, 500);
    }
}
function menusroll() {
    var htop = $("#header").height();
    srollmenu(htop);
    $(window).scroll(function () {
        srollmenu(htop);
    });
}
function srollmenu(htop) {
    if ($(window).scrollTop() > htop) {
        $("#header").addClass("header-sroll");
    } else {
        $("#header").removeClass("header-sroll");
    }
}
//pager mobile
function pagerresize() {
    pagermobile();
    $(window).resize(function () {
        pagermobile();
    });
}
function pagermobile() {
    var myClear;
    if ($(window).width() > 750) {
        $("#pagerp").removeClass("pagersroll pageractive");
    } else {
        $("#pagerp").addClass("pageractive");
        clearTimeout(myClear);
        var mainh = $("#productw");
        var offset = mainh.offset();
        var hheader = offset.top;
        var hfooter = (hheader + mainh.outerHeight()) - $(window).innerHeight();
        var srollmain = $(window).scrollTop();
        //                alert(hheader + " - " + srollmain);
        mycon(srollmain, hheader, hfooter);
        myClear = setTimeout(function () {
            $(window).scroll(function () {
                var offsets = mainh.offset();
                var hheaders = offsets.top;
                var hfooters = (hheaders + mainh.outerHeight()) - $(window).innerHeight();
                var srollmains = $(this).scrollTop();
                mycon(srollmains, hheaders, hfooters);
            });
        }, 500);
    }
}
function mycon(srollmain, hheader, hfooter) {
    if (srollmain > hheader && srollmain < hfooter) {
        if ($("#pagerp").hasClass("pageractive")) {
            $("#pagerp").addClass("pagersroll");
        }
    } else {
        $("#pagerp").removeClass("pagersroll");
    }
}
//==================
function mymap() {
    mympp();
    var timeout;
    $(window).resize(function () {
        clearTimeout(timeout);
        setTimeout(function () {
            mympp();
        }, 500);
    });
}
function mympp() {
    $('#mapwrap').remove();
    if ($(window).width() > 768) {
        $('#mapshow').append('<div id="mapwrap"><iframe id="iframe" src="map.aspx" frameborder="0" height="100%" width="100%"></iframe></div>');
    }
}