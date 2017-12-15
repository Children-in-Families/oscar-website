$(document).ready(function(){
  if (window.location.pathname.split('/')[1] == 'about-us') {
    $('a[href="/about"]').addClass('current-link');
  }

  if (window.location.pathname.split('/')[1] == 'blog-post') {
    $('a[href="/blog"]').addClass('current-link');
  }
});