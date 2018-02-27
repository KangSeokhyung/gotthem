$(".input-group-btn .dropdown-menu li a").click(function()
    {
	var selText = $(this).text();
    
    var selHTML = $(this).html();
    
    var selSearch = $(this).data("searchtype");
    
    var selPlace = $(this).data("placeholder");
         
    $(this).parents('.input-group-btn').find('.dropdown-toggle').html(selHTML+'<span class="caret"></span>');
   
    $("#displayText").text(selText);
    
    $("#displayHTML").html(selHTML);
    
    $("#displayData").text(selSearch);
    
    $("#displayPlace").text(selPlace);
    
    $("#search-input").attr("placeholder", selPlace);
    
});