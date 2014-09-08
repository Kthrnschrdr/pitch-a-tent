$(document).ready(function(){
  var $tabs = $("#tabbed_interface").find("li");
  
  $("#tab_content").find("div.inactive").hide();
  
  $tabs.on("click", function(){  
    $("#tab_content").find("div").hide();
    $tabs.removeClass("active")
    
    $(this).addClass("active");
    
    var content = $(this).data("content");
    $("#" + content).show();
    });
});