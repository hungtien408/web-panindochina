(function ($) {
    $.fn.extend({

        jcarouselre: function (options) {

            // Đặt các giá trị mặc định
            var defaults = {
                autos: true,
                pausehover: true,
                pager: true, //pager num
                timespees: 3000,
                thumswrap: false, // thums sroll
                shownum: 5, // show number thums
                widththum: 50, // width li thums
                thumsbutton: 50 //padding thums
            };

            var options = $.extend(defaults, options);
            var connector = function (itemNavigation, carouselStage) {
                return carouselStage.jcarousel('items').eq(itemNavigation.index());
            };
            return this.each(function () {
                // Đặt tên biến cho element (ul)
                var obj = $(this);
                var opts = options;
                var jcarousel = $(this).find('.carousel-stage');
                var jcarouselthums = $(this).find('.carousel-navigation');
                jcarousel.on('jcarousel:reload jcarousel:create', function () {
                    var carousel = $(this), width = carousel.innerWidth();
                    carousel.jcarousel('items').css('width', Math.ceil(width) + 'px');
                });
                jcarouselthums.on('jcarousel:reload jcarousel:create', function () {
                    $(this).width("auto");
                    var carouselthums = $(this),
                    widththums = opts.widththum,
                    width = carouselthums.innerWidth() - opts.thumsbutton,
                    widthw = 0;
                    var numli = $(this).find("li").size();
                    if (numli > opts.shownum) {
                        //                    widthw = opts.shownum * opts.widththum;
                        if ((opts.shownum * opts.widththum) > width) {
                            var countnum = parseInt(width / opts.widththum);
                            if (countnum > 0) {
                                widthw = Math.ceil(countnum * opts.widththum);
                            } else {
                                widthw = Math.ceil(width);
                                widththums = width;
                            }
                        } else {
                            widthw = opts.shownum * opts.widththum;
                        }
                        $(this).parents(".navigation").find(".navigation-btn").removeClass('inactive-none');
                        carouselthums.jcarousel('items').css('width', Math.ceil(widththums) + 'px');
                    } else {

                        if ((numli * opts.widththum) > width) {
                            var countnum = parseInt(width / opts.widththum);
                            if (countnum > 0) {
                                widthw = Math.ceil(countnum * opts.widththum);
                            } else {
                                widthw = Math.ceil(width);
                                widththums = width;
                            }
                            $(this).parents(".navigation").find(".navigation-btn").removeClass('inactive-none');
                        } else {
                            var countnum = parseInt(width / opts.widththum);
                            if (countnum < numli) {
                                $(this).parents(".navigation").find(".navigation-btn").removeClass('inactive-none');
                            } else {
                                $(this).parents(".navigation").find(".navigation-btn").addClass('inactive-none');
                            }
                            widthw = numli * opts.widththum;
                        }
                        carouselthums.jcarousel('items').css('width', Math.ceil(widththums) + 'px');
                    }
                    $(this).width(widthw);
                });
                // Thêm sự kiện
                var carouselStage = obj.find('.carousel-stage').jcarousel({
                    wrap: 'circular'
                });
                if (opts.autos) {
                    carouselStage.jcarouselAutoscroll({
                        interval: opts.timespees,
                        autostart: opts.autos
                    });
                    if (opts.pausehover) {
                        carouselStage.hover(function () {
                            $(this).jcarouselAutoscroll('stop');
                        }, function () {
                            $(this).jcarouselAutoscroll('start');
                        });
                    }
                }
                if (opts.thumswrap) {
                    var carouselNavigation = obj.find('.carousel-navigation').jcarousel({
                        wrap: 'circular'
                    });
                } else {
                    var carouselNavigation = obj.find('.carousel-navigation').jcarousel();
                }
                // We loop through the items of the navigation carousel and set it up
                // as a control for an item from the stage carousel.
                carouselNavigation.jcarousel('items').each(function () {
                    var item = $(this);

                    // This is where we actually connect to items.
                    var target = connector(item, carouselStage);

                    item.on('jcarouselcontrol:active', function () {
                        carouselNavigation.jcarousel('scrollIntoView', this);
                        item.addClass('active');
                    })
                        .on('jcarouselcontrol:inactive', function () {
                            item.removeClass('active');
                        })
                        .jcarouselControl({
                            target: target,
                            carousel: carouselStage
                        });
                });

                // Setup controls for the stage carousel
                obj.find('.prev-stage').on('jcarouselcontrol:inactive', function () {
                    $(this).addClass('inactive');
                })
                    .on('jcarouselcontrol:active', function () {
                        $(this).removeClass('inactive');
                    })
                    .jcarouselControl({
                        target: '-=1'
                    });

                obj.find('.next-stage')
                    .on('jcarouselcontrol:inactive', function () {
                        $(this).addClass('inactive');
                    })
                    .on('jcarouselcontrol:active', function () {
                        $(this).removeClass('inactive');
                    })
                    .jcarouselControl({
                        target: '+=1'
                    });

                // Setup controls for the navigation carousel
                obj.find('.prev-navigation')
                    .on('jcarouselcontrol:inactive', function () {
                        $(this).addClass('inactive');
                    })
                    .on('jcarouselcontrol:active', function () {
                        $(this).removeClass('inactive');
                    })
                    .jcarouselControl({
                        target: '-=1'
                    });

                obj.find('.next-navigation')
                    .on('jcarouselcontrol:inactive', function () {
                        $(this).addClass('inactive');
                    })
                    .on('jcarouselcontrol:active', function () {
                        $(this).removeClass('inactive');
                    })
                    .jcarouselControl({
                        target: '+=1'
                    });
                // pager
                if (opts.pager) {
                    obj.find('.carousel-stage').append('<div class="jcarousel-pagination"></div>');
                    obj.find('.jcarousel-pagination')
                    .on('jcarouselpagination:active', 'a', function () {
                        $(this).addClass('active');
                    })
                    .on('jcarouselpagination:inactive', 'a', function () {
                        $(this).removeClass('active');
                    })
                    .jcarouselPagination();
                }
            });
        }
    });
})(jQuery);