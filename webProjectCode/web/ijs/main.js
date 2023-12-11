jQuery(document).ready(function ($) {
/* ---------------------------------------------
                    Slider
----------------------------------------------*/ 
$(".bt-main-slider").slick({
                autoplay: true,
                autoplaySpeed: 7000,
                arrows: false,
                prevArrow: '<button type="button" class="slick-prev"></button>',
                nextArrow: '<button type="button" class="slick-next"></button>',
                dots: true,
                fade: true,
                cssEase: 'linear',
});
/* ---------------------------------------------
                    Testimonails
----------------------------------------------*/ 
var testimonialSlide = $('.bt-testimonial');
      for (i = 0; i < testimonialSlide.length; i++) {
      var $testimonial = $(testimonialSlide[i]);
  $testimonial.slick({
        dots: $testimonial.attr("data-dots") == "true",
        infinite: $testimonial.attr("data-loop") == "true",
        arrows: $testimonial.attr("data-arrows") == "true",
        swipe: $testimonial.attr("data-swipe") == "true",
        autoplay: true,
    autoplaySpeed: 7000,
    pauseOnHover: true,
    adaptiveHeight: true,
    prevArrow:'<div class="jl-arrow-left"><i class="ti-angle-left"></i></div>',
    nextArrow:'<div class="jl-arrow-right"><i class="ti-angle-right"></i></div>',
    slidesToScroll: 1,
    responsive: [
          {
            breakpoint: 0,
            settings: {
              slidesToShow: parseInt($testimonial.attr('data-items')) || 1,
            }
          },
          {
            breakpoint: 479,
            settings: {
              slidesToShow: parseInt($testimonial.attr('data-xs-items')) || 1,
            }
          },
          {
            breakpoint: 767,
            settings: {
              slidesToShow: parseInt($testimonial.attr('data-sm-items')) || 1,
            }
          },
          {
            breakpoint: 991,
            settings: {
              slidesToShow: parseInt($testimonial.attr('data-md-items')) || 1,
            }
          },
          {
            breakpoint: 1199,
            settings: {
              slidesToShow: parseInt($testimonial.attr('data-lg-items')) || 1,
            }
          },
          {
            breakpoint: 1799,
            settings: {
              slidesToShow: parseInt($testimonial.attr('data-xl-items')) || 1,
            }
          },
        ]
  });
    }

/* ---------------------------------------------
                    Scroll action
----------------------------------------------*/     

 var bt_stick;
    if ($(".header-middle").hasClass('bt_stick')) {
        var bt_stick = $(".header-middle").offset().top;
    }
    $(window).scroll(function() {
        var jlscroll = $(window).scrollTop();
        if (jlscroll > bt_stick) {
            $(".header-middle.bt_stick").addClass("bt_sticky");
            var nav_height = $(".header-middle.bt_stick").outerHeight();
            $(".bt_blank_nav").css({
                "height": nav_height
            });
        } else {
            $(".header-middle.bt_stick").removeClass("bt_sticky");
            $(".bt_blank_nav").css({
                "height": 0
            });
        }
    });
    
/* ---------------------------------------------
                    Counter
----------------------------------------------*/ 
        var timers = $(".timer");
        if ($.fn.countTo) {
            timers.each(function () {
                $(this).data("animated", 0);
                animateTimer(this);
            });
        }

        function animateTimer(timer) {
            if ($(timer).data("animated") == 0) {
                if ($.fn.visible && $(timer).visible()) {
                    $(timer).data("animated", 1);
                    $(timer).countTo();
                }
            }
        }
/* ---------------------------------------------
                    Count Down
----------------------------------------------*/ 

        var jl_count = $('.clock');
      for (i = 0; i < jl_count.length; i++) {
      var $countDown = $(jl_count[i]);

      $countDown.countdown($countDown.attr('data-date'), function(event) {
               var $this = $(this).html(event.strftime(''
                 + '<span class="c-grid"> <span class="c-value">%D</span> <span class="c-title">days</span> </span> '
                 + '<span class="c-grid"> <span class="c-value">%H</span> <span class="c-title">hours</span> </span> '
                 + '<span class="c-grid"> <span class="c-value">%M</span> <span class="c-title">minutes</span> </span> '
                 + '<span class="c-grid"> <span class="c-value">%S</span> <span class="c-title">seconds</span> </span> '));
             });
}

/* ---------------------------------------------
                    Accodion
----------------------------------------------*/ 
        var allPanels = $(".accordion > dd").hide();
        allPanels.first().slideDown("easeOutExpo");
        $(".accordion").each(function () {
            $(this).find("dt > a").first().addClass("active").parent().next().css({display: "block"});
        });

        $(".accordion > dt > a").click(function () {

            var current = $(this).parent().next("dd");
            $(this).parents(".accordion").find("dt > a").removeClass("active");
            $(this).addClass("active");
            $(this).parents(".accordion").find("dd").slideUp("easeInExpo");
            $(this).parent().next().slideDown("easeOutExpo");

            return false;

        });

/* ---------------------------------------------
                    Toggle
----------------------------------------------*/ 
        var allToggles = $(".toggle > dd").hide();
        $(".toggle > dt > a").click(function () {

            if ($(this).hasClass("active")) {

                $(this).parent().next().slideUp("easeOutExpo");
                $(this).removeClass("active");

            }
            else {
                var current = $(this).parent().next("dd");
                $(this).addClass("active");
                $(this).parent().next().slideDown("easeOutExpo");
            }

            return false;
        });
/* ---------------------------------------------
                    Progress Bar
----------------------------------------------*/ 
        var progressBar = $(".progress-bar");
        progressBar.each(function (indx) {
            $(this).data("animated", 0);
            if ($.fn.visible) {
                animateProgressbar(this);
            }
        });
        

        function animateProgressbar(pb) {
            if ($(pb).data("animated") == 0) {
                if ($(pb).visible()) {
                    $(pb).css("width", $(pb).attr("aria-valuenow") + "%");
                    $(pb).data("animated", 1);
                }
            }
        }


  //Submenu Dropdown Toggle   
  if($('.main-header li.dropdown ul').length){
    $('.main-header li.dropdown').append('<div class="dropdown-btn"><span class="fa fa-angle-down"></span></div>');
    
    //Dropdown Button
    $('.main-header li.dropdown .dropdown-btn').on('click', function() {
      $(this).prev('ul').toggleClass('m_manu');
    });
    
    //Disable dropdown parent link
    $('.main-header .navigation li.dropdown > a').on('click', function(e) {
      e.preventDefault();
    });
  }

/* ---------------------------------------------
                    Scroll to Top
----------------------------------------------*/ 
     
        function scrollTopClick() {
      //alert("working");
          if ($(window).scrollTop() > 200) {
            $('.scroll-totop').fadeIn();
          } else {
            $('.scroll-totop').fadeOut();
          }
        }

        //bottom to top scroll click to go
        $('.scroll-totop').on('click', function() {
          $('html, body').animate({scrollTop : 0},1500);
          return false;
        }); 


        

/* ---------------------------------------------
                    Scroll
----------------------------------------------*/ 
jQuery(window).on('scroll', function(){
    (function ($) {
    scrollTopClick(); 
    timers.each(function () {
                animateTimer(this);
            }); 
    if ($.fn.visible) {
                progressBar.each(function () {
                    animateProgressbar(this);
                })
            }
            
    })(jQuery);
  });
new WOW().init();

/* ---------------------------------------------
                    Loader
----------------------------------------------*/ 
  $(window).on('load', function() {
    var preloader = $("#preloader");
    preloader.delay(300).fadeOut(); 
  });


    // Play Video
    $('#clickplay').on('click', function(event) {
        var vi = $("#videoinput").val();
        $("#vidframe").attr('src', vi);
        event.preventDefault();
    });

  
  });