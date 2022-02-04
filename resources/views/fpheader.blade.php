<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<meta name="description" content="Coheskat School Portal" />
	<meta name="author" content="{{ env('APP_NAME') }}" />
	<title>{{ env('APP_NAME') }} | Katsina State College of Health Sciences and Technology</title>
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
    	<!-- Date Time item CSS -->
	<link rel="stylesheet" href="{{ asset('plugins/flatpicker/css/flatpickr.min.css') }}" />
    
    
	<link href="{{ asset('css/theme/light/theme-color.css') }}" rel="stylesheet" type="text/css" />
	<!-- favicon -->
	 
</head>
<!-- END HEAD -->

<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white white-sidebar-color logo-indigo">
	<div class="page-wrapper">
		<!-- start header -->
		<div class="page-header navbar">
			<div class="page-header-inner" align="center">
				
					<span>
							
                           <picture>
  <source srcset="{{ asset('img/coheskat.jpg') }}" media="(max-width: 400px)">
  <source srcset="{{ asset('img/coheskat_banner.png') }}">
  <img src="{{ asset('img/coheskat_banner.png') }}" alt="Coheskat">
</picture>

  
						</span>
			 
				<!-- start mobile menu -->
				 
				
				
		  </div>
		</div>
		<!-- end header -->
		 
		<!-- start page container -->
		<div class="page-container" style="padding: 15px 15px 0px 15px">
			<!-- start sidebar menu -->
			
			<!-- end sidebar menu -->
			<!-- start page content -->
			<div class="page-content-wrapper">
				<div align = "center" class = "example5"> <marquee style="font-size:18px; font-weight:bold;"> {{ $maq }} </marquee></div>
					<!-- start widget -->
					<div class="row">
                    
                     
                    
						  @yield('contents')
						 
					 
							 <div class="col-sm-4">
									<div class="card card-topline-red">
										<div class="card-head">
											<header>NOTICES:</header>
											<div class="tools">
												<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
												<a class="t-collapse btn-color fa fa-chevron-down"
													href="javascript:;"></a> 
											 
											</div>
										</div>
										<div class="card-body ">1. Fee Payment for All Students commences.</div>
                                        <div class="card-body ">2. Payment can be paid Online or in Bank Branches nationwide.</div>
                                      <div class="card-body ">3. Please retry failed transactions after  24 hours.</div>
    <div class="card-body ">4.  The Portal is Open to Fee payment  for  2021/2022 Session.  </div>
                                                                             
									</div><strong><p id="demo" style="text-align:center; font-weight:bold; font-size: 16px;color:red"> </p> </strong>
                                    
                                    <strong><p style="text-align:center; font-weight:bold; font-size: 16px;color:blue">Registration Counter:  900</p> </strong>
								</div>      
						</div>	
				
                    
					</div>
					
				</div>
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
 
	<script src="{{ asset('js/pages/material-select/getmdl-select.js') }}"></script>
	<script src="{{ asset('plugins/flatpicker/js/flatpicker.min.js') }}"></script>
	<script src="{{ asset('js/pages/date-time/date-time.init.js') }}"></script>
    
    
	<!-- chart js -->
	<script src="{{ asset('plugins/apexcharts/apexcharts.min.js') }}"></script>
	<script src="{{ asset('js/pages/chart/apex/home-data3.js') }}"></script>
	<script src="{{ asset('plugins/sparkline/jquery.sparkline.js') }}"></script>
	<script src="{{ asset('js/pages/sparkline/sparkline-data.js') }}"></script>
    
    <script>
// Set the date we're counting down to
var countDownDate = new Date("{{ $endregdate }}").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();
    
  // Find the distance between now and the count down date
  var distance = countDownDate - now;
    
  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
  // Output the result in an element with id="demo"
  document.getElementById("demo").innerHTML = "Registration Closes in: " + days + "Days " + hours + "Hrs "
  + minutes + "Mins " + seconds + "Secs";
    
  // If the count down is over, write some text 
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "Registration is CLOSED";
  }
}, 1000);
</script>
	<!-- end js include path -->
</body>


</html>