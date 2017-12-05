$(document).ready(function(){
  if (window.location.pathname.split('/')[1] == 'about-us') {
    $('a[href="/about"]').addClass('current-link');
  }
});