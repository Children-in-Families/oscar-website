$(document).ready(function(){
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

});



