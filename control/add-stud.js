$(function(){
	console.log('here');
	$("#mailErr").addClass('hidden');
	$('#mail').on('blur', function(event) {
		var mail = $(this).val();
		console.log(mail);
		$.ajax({
			url: '../control/student-server.php?method=mail_exist&mail='+mail,
			type: 'GET',
			dataType: 'html',
			success: function(response)
			{
				data = JSON.parse(response);
				if(data.result=='true')
				{
					$("#mailErr").removeClass('hidden');
					$("#mailErr").html("valid mail");
				}
				else
				{
					$("#mailErr").removeClass('hidden');
					$("#mailErr").html("this mail is used befor");
					$('#mail').focus();
					$('#mail').select();
				}
				
			},
			error : function(response)
			{
				console.log('error on ajax');
			}
		});
		

	});// end of mail blur

	$('#submit').on('click', function(event) {
		event.preventDefault();
		var student = {}
		student.name = $("#name").val();
		student.password = $("#password").val();
		student.mail = $("#mail").val();
		student.pic = $("#image").val();
		console.log("data = "+student);
		$.ajax({
			url: '../control/student-server.php?method=insert_student',
			type: 'POST',
			dataType: 'html',
			data:student,
			success: function(response)
			{
				data = JSON.parse(response);
				console.log(response);
				/*if(response.result=='false')
				{
					$("#mailErr").removeClass('hidden');
					$("#mailErr").html("valid mail");
				}
				else
				{
					$("#mailErr").removeClass('hidden');
					$("#mailErr").html("this mail is used befor");
					$('#mail').focus();
					$('#mail').select();
				}*/
				
			},
			error : function(response)
			{
				console.log('error on ajax');
				console.log(response);
			}
		});//end oof ajax
		

	});//end of click submit
});//end of onload