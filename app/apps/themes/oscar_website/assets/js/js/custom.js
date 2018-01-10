$(document).ready(function(){
  // service read more
    $('.readMoreLink').on('click', function(){
      $(this).parent().toggle();
      $(this).parent().siblings('.readLess').toggle();
    });

    $('.readLessLink').on('click', function(){
      $(this).parent().toggle();
      $(this).parent().siblings('.readMore').toggle();
    });

  // slider words

  $("#js-rotating-home").Morphext({
    // The [in] animation type. Refer to Animate.css for a list of available animations.
    animation: "fadeIn",
    // An array of phrases to rotate are created based on this separator. Change it if you wish to separate the phrases differently (e.g. So Simple | Very Doge | Much Wow | Such Cool).
    separator: ",",
    // The delay between the changing of each phrase in milliseconds.
    speed: 2000,
    complete: function () {
        // Called after the entrance animation is executed.
    }
  });

  $("#js-rotating-customer").Morphext({
    // The [in] animation type. Refer to Animate.css for a list of available animations.
    animation: "fadeIn",
    // An array of phrases to rotate are created based on this separator. Change it if you wish to separate the phrases differently (e.g. So Simple | Very Doge | Much Wow | Such Cool).
    separator: ",",
    // The delay between the changing of each phrase in milliseconds.
    speed: 2000,
    complete: function () {
        // Called after the entrance animation is executed.
    }
  });

  $("#js-rotating-about").Morphext({
    // The [in] animation type. Refer to Animate.css for a list of available animations.
    animation: "fadeInUp",
    // An array of phrases to rotate are created based on this separator. Change it if you wish to separate the phrases differently (e.g. So Simple | Very Doge | Much Wow | Such Cool).
    separator: ",",
    // The delay between the changing of each phrase in milliseconds.
    speed: 2000,
    complete: function () {
        // Called after the entrance animation is executed.
    }
  });
  /*
    Circle Slider
  */
  if ($.isFunction($.fn.flipshow)) {
    var circleContainer = $('#fcSlideshow');

    if (circleContainer.get(0)) {
      circleContainer.flipshow();

      setTimeout(function circleFlip() {
        circleContainer.data().flipshow._navigate(circleContainer.find('div.fc-right span:first'), 'right');
        setTimeout(circleFlip, 3000);
      }, 3000);
    }
  }

  /*
  Move Cloud
  */
  if ($('.cloud').get(0)) {
    var moveCloud = function() {
      $('.cloud').animate({
        'top': '+=20px'
      }, 3000, 'linear', function() {
        $('.cloud').animate({
          'top': '-=20px'
        }, 3000, 'linear', function() {
          moveCloud();
        });
      });
    };

    moveCloud();
  }

  $('#mytooltip').on('click',function(){$(this).tooltip('destroy');});

    (function(theme, $) {

      theme = theme || {};

      var instanceName = '__progressBar';

      var PluginProgressBar = function($el, opts) {
        return this.initialize($el, opts);
      };

      PluginProgressBar.defaults = {
        accX: 0,
        accY: -50,
        delay: 1
      };

      PluginProgressBar.prototype = {
        initialize: function($el, opts) {
          if ($el.data(instanceName)) {
            return this;
          }

          this.$el = $el;

          this
            .setData()
            .setOptions(opts)
            .build();

          return this;
        },

        setData: function() {
          this.$el.data(instanceName, this);

          return this;
        },

        setOptions: function(opts) {
          this.options = $.extend(true, {}, PluginProgressBar.defaults, opts, {
            wrapper: this.$el
          });

          return this;
        },

        build: function() {
          if (!($.isFunction($.fn.appear))) {
            return this;
          }

          var self = this,
            $el = this.options.wrapper,
            delay = 1;

          $el.appear(function() {

            delay = ($el.attr('data-appear-animation-delay') ? $el.attr('data-appear-animation-delay') : self.options.delay);

            $el.addClass($el.attr('data-appear-animation'));

            setTimeout(function() {

              $el.animate({
                width: $el.attr('data-appear-progress-animation')
              }, 1500, 'easeOutQuad', function() {
                $el.find('.progress-bar-tooltip').animate({
                  opacity: 1
                }, 500, 'easeOutQuad');
              });

            }, delay);

          }, {
            accX: self.options.accX,
            accY: self.options.accY
          });

          return this;
        }
      };

    // expose to scope
    $.extend(theme, {
      PluginProgressBar: PluginProgressBar
    });

      // jquery plugin
    $.fn.themePluginProgressBar = function(opts) {
      return this.map(function() {
        var $this = $(this);

        if ($this.data(instanceName)) {
          return $this.data(instanceName);
        } else {
          return new PluginProgressBar($this, opts);
        }

      });
    }
  }).apply(this, [window.theme, jQuery]);

  // mail

  $form = $('#contactForm');
  return $form.submit(function() {
    var formData, email, message, name, subject;
    name = $('input#name').val();
    subject = $('input#subject').val();
    email = $('input#email').val();
    console.log('email: ', email);
    message = $('textarea#message').val();
    if(name != "" || subject != "" || email != "" || message != ""){
      $('#sendMessage').attr('disabled','disabled');
      $('#sendMessage').val('Sending...')
    }

    formData = {
      name: name,
      email: email,
      subject: subject,
      message: message
    };

    $.ajax({
      type: 'POST',
      dataType: 'json',
      url: $form.attr('action'),
      data: formData,
      success: function() {
        $form[0].reset();
        $('#sendMessage').removeAttr('disabled');
        $('#sendMessage').val('Send Message')
        console.log('success')
        alert('Your message has been sent successfully. Thank you.');
        return false;
      },
      error: function() {
        $('#sendMessage').removeAttr('disabled');
        $('#sendMessage').val('Send Message')
        alert('Your message has not been sent. Please try again later!');
        return false;
      }
    });
    return false;
  });


});



