<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<meta name="description" content="Coheskat School Portal" />
	<meta name="author" content="COHESKAT" />
	<title>Coheskat | Katsina State College of Health Sciences and Technology</title>
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
	<!-- icons -->
   
     
     
	<link href="{{ asset('fonts/simple-line-icons/simple-line-icons.min.css') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('fonts/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('fonts/material-design-icons/material-icon.css') }}" rel="stylesheet" type="text/css" />
	<!--bootstrap -->
	<link href="{{ asset('plugins/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
	<!-- Material Design Lite CSS -->
	<link rel="stylesheet" href="{{ asset('plugins/material/material.min.css') }}">
	<link rel="stylesheet" href="{{ asset('css/material_style.css') }}">
	<!-- Theme Styles -->
	<link href="{{ asset('css/theme/light/theme_style.css') }}" rel="stylesheet" id="rt_style_components" type="text/css" />
	<link href="{{ asset('css/plugins.min.css') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('css/theme/light/style.css') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('css/responsive.css') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('css/theme/light/theme-color.css') }}" rel="stylesheet" type="text/css" />
	
	 
</head>
<!-- END HEAD -->

@php 
             $regno = $stdrecs->matric_no;
             $surname = strtoupper($stdrecs->surname);
              $firstname = strtoupper($stdrecs->firstname);
             $othernames = strtoupper($stdrecs->othernames);
             $photo =  $stdrecs->std_custome4;
             $course = strtoupper($stdrecs->programme_option); 
             $level = $stdrecs->level_name; 
             $state_name = $stdrecs->state_name;
             
      
 
                @endphp
         

<body
	class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white white-sidebar-color logo-indigo">
	<div class="page-wrapper">
		<!-- start header -->
		<div class="page-header navbar navbar-fixed-top">
			<div class="page-header-inner ">
				<!-- logo start -->
				<div class="page-logo">
					<a href="{{URL::to('/studenthome') }}">
						 
						<span class="logo-default">COHESKAT</span> </a>
				</div>
				<!-- logo end -->
				<ul class="nav navbar-nav navbar-left in">
					<li><a href="#" class="menu-toggler sidebar-toggler"><i class="icon-menu"></i></a></li>
				</ul>	<span>
							<img src="{{ asset('img/banner.jpg') }}" alt="Logo" width="750" height="60"/>
						</span>
			 
				<!-- start mobile menu -->
				<a class="menu-toggler responsive-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse">
					<span></span>
				</a>
				<!-- end mobile menu -->
				<!-- start header menu -->
				<div class="top-menu">
					<ul class="nav navbar-nav pull-right">
						<li><a class="fullscreen-btn"><i class="fa fa-arrows-alt"></i></a></li>
						
						
						
						<!-- start manage user dropdown -->
						<li class="dropdown dropdown-user">
							<a class="dropdown-toggle" data-bs-toggle="dropdown" data-hover="dropdown"
								data-close-others="true">
								
								<span class="username username-hide-on-mobile"> <b>{{$surname }}</b>, {{$firstname }} {{$othernames }} -  {{ $regno}} </span>
								<i class="fa fa-angle-down"></i>
							</a>
							<ul class="dropdown-menu dropdown-menu-default">
								<li>
									<a href="{{URL::to('/profile') }}">
										<i class="icon-user"></i> Profile </a>
								</li>
								 
								  
								<li class="divider"> </li>
								 
								<li>
									<a href="{{URL::to('/signoff') }}">
										<i class="icon-logout"></i> Log Out </a>
								</li>
							</ul>
						</li>
						
						
					</ul>
				</div>
			</div>
		</div>
		<!-- end header -->
		 
		<!-- start page container -->
		<div class="page-container">
			<!-- start sidebar menu -->
			<div class="sidebar-container">
				<div class="sidemenu-container navbar-collapse collapse fixed-menu">
					<div id="remove-scroll" class="left-sidemenu">
						<ul class="sidemenu  page-header-fixed slimscroll-style" data-keep-expanded="false"
							data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
							<li class="sidebar-toggler-wrapper hide">
								<div class="sidebar-toggler">
									<span></span>
								</div>
							</li>
							
							<li class="nav-item">
								<a href="{{URL::to('/studenthome') }}" class="nav-link nav-toggle">
									<i class="material-icons">home</i>
									<span class="title">Home</span>
									 
								</a>
								
							</li>
                            
                            <li class="nav-item">
								<a href="{{URL::to('/profile') }}" class="nav-link nav-toggle"> <i class="material-icons">person</i>
									<span class="title">Profile</span>  
								</a>
								
							</li>
                          <li class="nav-item">
								<a href="#" class="nav-link nav-toggle"> <i class="material-icons">monetization_on</i>
									<span class="title">Fees</span> <span class="arrow"></span>
								</a>
								<ul class="sub-menu">
									<li class="nav-item">
										<a href="{{URL::to('/payfees') }}" class="nav-link "> <span class="title">Registration Fee
												</span>
										</a>
									</li>
									<li class="nav-item">
										<a href="{{URL::to('/payofees') }}" class="nav-link "> <span class="title">Other Fees </span>
										</a>
									</li>
                                    
									<li class="nav-item">
										<a href="{{URL::to('/transactions') }}" class="nav-link "> <span class="title">Payment History</span>
										</a>
									</li>
                                    
                                    <li class="nav-item">
										<a href="{{URL::to('/requery') }}" class="nav-link "> <span class="title">Pending Transactions</span>
										</a>
									</li>
									 
								</ul>
							</li>  
                            
                           
                            
							<li class="nav-item">
								<a href="{{URL::to('/signoff') }}" class="nav-link nav-toggle"> <i class="material-icons">exit_to_app</i>
									<span class="title">Logout</span>
								</a>
							</li>
                           
							<hr>
							<div class="profile-usertitle">
											<div class="profile-usertitle-name">Student Info </div>
                                            <div class="profile-usertitle-job"> <div class="user-panel" align="center">
									<div class="pull-center image">
										<img src="{{ asset('storage/photo/'.$photo) }}" class="img-circle user-img-circle"
											alt="Passport" /> 
									</div>
									 
								</div> </div>
                                  <div class="profile-usertitle-job">   </div>
                                             <div class="profile-usertitle-job"> {{ $course }} </div>
											<div class="profile-usertitle-job"> {{$level }} Level </div>
                                            <div class="profile-usertitle-job"> {{ $state_name }} </div>
                                            <div class="profile-usertitle-job"> 2021/2022 Session </div>
                                            
										</div>
							
						</ul>
					</div>
				</div>
			</div>
			<!-- end sidebar menu -->
			<!-- start page content -->
			 @yield('contents')
			</div>
			<!-- end page content -->
			
		</div>
		<!-- end page container -->
		<!-- start footer -->
		<div class="page-footer">
			<div class="page-footer-inner"> <?= date('Y'); ?> &copy; Katsina State College of Health Sciences and Technology
			 
			</div>
			<div class="scroll-to-top">
				<i class="icon-arrow-up"></i>
			</div>
		</div>
		<!-- end footer -->
	</div>
	<!-- start js include path -->
	<script src="{{ asset('plugins/jquery/jquery.min.js') }}"></script>
	<script src="{{ asset('plugins/popper/popper.js') }}"></script>
	<script src="{{ asset('plugins/jquery-blockui/jquery.blockui.min.js') }}"></script>
	<script src="{{ asset('plugins/jquery-slimscroll/jquery.slimscroll.js') }}"></script>
	<!-- bootstrap -->
	<script src="{{ asset('plugins/bootstrap/js/bootstrap.min.js') }}"></script>
	<script src="{{ asset('plugins/bootstrap-switch/js/bootstrap-switch.min.js') }}"></script>
	<!-- Common js-->
	<script src="{{ asset('js/app.js') }}"></script>
	<script src="{{ asset('js/layout.js') }}"></script>
	<script src="{{ asset('js/theme-color.js') }}"></script>
	<!-- material -->
	<script src="{{ asset('plugins/material/material.min.js') }}"></script>
	<!-- chart js -->
	<script src="{{ asset('plugins/apexcharts/apexcharts.min.js') }}"></script>
	<script src="{{ asset('js/pages/chart/apex/home-data3.js') }}"></script>
	<script src="{{ asset('plugins/sparkline/jquery.sparkline.js') }}"></script>
	<script src="{{ asset('js/pages/sparkline/sparkline-data.js') }}"></script>
	<!-- end js include path -->
    
    <script src="{{ asset('plugins/counterup/jquery.waypoints.min.js') }}"></script>
	<script src="{{ asset('plugins/counterup/jquery.counterup.min.js') }}"></script>
</body>


</html>