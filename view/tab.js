$(function()
{
	console.log("tabs js is opend");
////////////////////////// active clicked tabs ///////////////////
	$('#controlTabs a').on('click',function (e)
	{
	  e.preventDefault();
	  $("li.active").removeClass('active');
	  $(this).parent().addClass('active')
	  var id = $(this).attr('name');
	  $(".tab-pane.active").removeClass('active');
	  $('#'+id).addClass('active');
	  
	})//end of show tabs
	
});//end of on load function