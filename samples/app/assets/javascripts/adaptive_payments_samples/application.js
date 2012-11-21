//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

jQuery(function($){
  if( $('#response').length == 1 ){
    $('html, body').animate({ scrollTop: ( $('#response').offset().top - 60 ) });
  }
  $("a[rel=popover]").popover();
  $(".tooltip").tooltip();
  $("a[rel=tooltip]").tooltip();
});
