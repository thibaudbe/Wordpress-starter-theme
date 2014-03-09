$(document).ready ->
  
  # Hash change
  $(window).hashchange ->
    
    arg = window.location.hash.substring(3)
    link = "http://localhost:8888/Wordpress/" + arg #remplacer l'URL racine du site !!
    
    # Ajax request
    $.ajax
      url: link
      processData: true
      dataType: "html"
      success: (data) ->
        
        # callback
        content = $(data).find("#ajaxContent")
        title = $(data).filter("title").text()
        document.title = title

        $("#ajaxContent").fadeOut "200", ->
          $(this).html(content.html()).fadeIn "200"
          

  # Hash onload detect
  $(window).trigger "hashchange"  unless window.location.hash.substring(3) is ""
