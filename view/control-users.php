<?php include "../control/control-users.php";?>
<?php include "head.php";?>
<div class="container">
	<div class="form-control col-md-12">
		<div id="controlTabs" >
		  <ul class="nav nav-tabs" role="tablist">
		    <li class="active">
		   		<a href="#tabs-1" name="tabs-1">
		   			New Users <?php newStudentCount();?>
		   		</a>
		    </li>
		    <li><a href="#tabs-2" name="tabs-2">tab 2</a></li>
		    <li><a href="#tabs-3" name="tabs-3">tab 3</a></li>
		    <li><a href="#tabs-4" name="tabs-4">tab 4</a></li>
		    <li><a href="#tabs-5" name="tabs-5">tab 5</a></li>
		    <li><a href="#tabs-6" name="tabs-6">tab 6</a></li>
		  </ul><!-- Tab panes -->
		<!-- Tab panes -->
		<div class="tab-content tabBody">
			<div class="tab-pane active" id="tabs-1"><?php drewnewStudent();?></div>
			<div class="tab-pane" id="tabs-2">tab 2</div>
			<div class="tab-pane" id="tabs-3">tab 3</div>
			<div class="tab-pane" id="tabs-4">tab 4</div>
			<div class="tab-pane" id="tabs-5">tab 5</div>
			<div class="tab-pane" id="tabs-6">tab 6</div>
		</div> <!-- end of tab content -->
	</div><!-- end of form container -->
</div><!-- end of container -->
<?php include "foot.php";?>