$(document).scroll(function(){
    if($(this).scrollTop() > a)
    {   
       $('.nav').css({"background":"red"});
    } else {
       $('.nav').css({"background":"transparent"});
    }
});