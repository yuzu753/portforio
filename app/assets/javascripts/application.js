// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize
//= require_tree .


  // Or with jQuery

$('.chips').chips();

$('.visual .line').children().addBack().contents().each(function(){
  if (this.nodeType == 3) {
    var $this = $(this);
    $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
  }
});
$('.visual .letter').each(function () {
  var letters = $(this).closest('.txt').find('.letter');
  var index = $(letters).index(this);
  var time = index * 0.03; // ずらす間隔
  $(this).css('animation-delay', time + 's');
});
$(function(){
  /* separate text */
  $('.visual .line').children().addBack().contents().each(function(){
    if (this.nodeType == 3) {
      var $this = $(this);
      $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
    }
  });

  /* animation delay */
  $('.visual .letter').each(function () {
    var letters = $(this).closest('.txt').find('.letter');
    var index = $(letters).index(this);
    var time = index * 0.03;
    $(this).css('animation-delay', time + 's');
  });
});
$(window).on('load', function(){
  $('.visual').addClass('is-visible');
});