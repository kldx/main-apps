$(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-top').fadeIn();
        } else {
            $('.back-top').fadeOut();
        }
    });

    // scroll body to 0px on click
    $('.back-top').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 1600);
        return false;
    });
});

var ready;
ready = function() {

  $(document).ready(function() {
    $(".js-autoselect").click(function(){$(this).select()})
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);
