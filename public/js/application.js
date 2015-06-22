$(document).ready(function() {

  $('.add_item').on("click", function(event){
      event.preventDefault();

      var form = $("."+$(this).attr('data-row'))
      var path = "/categories/"+$(this).attr('data-row')+"/items"

      request = $.ajax({
        url: path,
        type: "POST",
        data: form.serialize()

      });


      request.done(function(response){
        console.log(response);
        $('tbody.item-list').append(response);
      })

      request.fail(function(response){
        console.log(response);
        console.log('You fucked up...');
      })
  })

  $('.search-btn').on("click", function(event){
      event.preventDefault();

      var form = $(this)
      var path = $(this).parent().attr('action');

      request = $.ajax({
        url: path,
        type: "POST",
        data: form.serialize()
      })

      request.done(function(response){
        $('.category').html(response);
      })

      request.fail(function(response){
        console.log(response);
      })
  })

});



  // $('.signin').on("click", function(event){
  //     event.preventDefault();
  //     // debugger
  //     var path = $(this).children().attr("href");
  //     var form = $(this)

  //     request = $.ajax({
  //       url: path,
  //       type: "GET",
  //       data: form.serialize()
  //     })

  //     request.done(function(response){
  //       $('#homepage').html(response);
  //     })

  //     request.fail(function(response){
  //       console.log(response);
  //       console.log('something went wrong!')
  //     })
  // });

  // $('#homepage').on("click", ".login-btn", function(event){
  //     event.preventDefault();

  //     var path = $(this).parent().attr('action');
  //     var form = $(this).parent();

  //     request = $.ajax({
  //       url: path,
  //       type: "POST",
  //       data: form.serialize()
  //     })

  //     request.done(function(response){
  //       $('#homepage').html(response);
  //     })

  //     request.fail(function(response){
  //       console.log(response);
  //       console.log('something went wrong!');
  //     })
  // });


