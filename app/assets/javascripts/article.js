$(document).ready(function(){
  var interval = 500;
  var timer;
  $('.article-editor').on('keypress', function(){

    if (timer !== undefined) {
      clearTimeout(timer);
    }

    timer = setTimeout(function(){
      $.ajax({
        url: '/articles/preview',
        method: 'post',
        data: {
          article: $('textarea').val()
        }
      }).done(function(data){
        $('.preview').html(data)
      })
    }, interval);
  })
})
