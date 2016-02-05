<?php
if(isset($_POST['submit']))
{
	if($_POST['submit']=='ok')
	{
		echo "deliverd";
	}
	else
	{
		echo "Error: on button POST";
	}
}
else
{
	echo "Error: on connention with POST";
}
?>