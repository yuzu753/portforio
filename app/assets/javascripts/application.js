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
//= require turbolinks
//= require_tree .


  // Or with jQuery

  $(document).ready(function(){
    $('.materialboxed').materialbox();
  });


  $('.chips').material_chip();
  $('.chips-initial').material_chip({
    data: [{
      tag: 'Apple',
    }, {
      tag: 'Microsoft',
    }, {
      tag: 'Google',
    }],
  });
  $('.chips-placeholder').material_chip({
    placeholder: 'Enter a tag',
    secondaryPlaceholder: '+Tag',
  });

  var chip = {
    tag: 'chip content',
    image: '', //optional
    id: 1, //optional
  };

  $('.chips').on('chip.add', function(e, chip){
    // you have the added chip here
  });

  $('.chips').on('chip.delete', function(e, chip){
    // you have the deleted chip here
  });

  $('.chips').on('chip.select', function(e, chip){
    // you have the selected chip here
  });

 $('.chips-initial').material_chip('data');

 $(function() {
  $('.chips-initial').material_chip({
    readOnly: true,
    data: myData
  });
  var x = 1;
  $(".myBTN").on("click",function(e){
  var text = $(this).text()+x;
  x++;
  var e = jQuery.Event("keydown");
	e.which = 13; // # Some key code value
  $(".chips-initial input").val(text);
	$(".chips-initial input").trigger(e);
  });

  $('.chips-placeholder').material_chip({
    placeholder: 'Enter a tag',
    secondaryPlaceholder: '+Tag',
  });

  $('.chips').material_chip();
});
