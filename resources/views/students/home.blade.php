@extends('students/dashboard')
 
@section('contents')

@php 
             $regno = $stdrecs->matric_no;
             $surname = strtoupper($stdrecs->surname);
              $firstname = strtoupper($stdrecs->firstname);
             $othernames = strtoupper($stdrecs->othernames);
             $photo =  $stdrecs->std_custome4;
             $course = strtoupper($stdrecs->programme_option); 
             $level = $stdrecs->level_name; 
             $state_name = $stdrecs->state_name;
             $school = $stdrecs->faculties_name;
             $dept = $stdrecs->departments_name;
             
      
 
                @endphp
         

			<!-- start page content -->
			<div class="page-content-wrapper">
				<div class="page-content">
					<div class="page-bar">
						<div class="page-title-breadcrumb">
							<div class=" pull-left">
								<div class="page-title">Welcome! <b>{{$surname }}</b>, {{$firstname }} {{$othernames }}  </div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item"
										href="{{URL::to('/studenthome') }}">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li class="active">Dashboard</li>
							</ol>
						</div>
					</div>
					<!-- start widget -->
					<div class="row">
                    
                    
                    
						<div class="col-xl-8 col-lg-6">
							<div class="card comp-card">
								<div class="card-body">
									
									<div class="card-body no-padding height-9">
										<div class="row">
											<div class="profile-userpic">
												<img src="{{ asset('storage/photo/'.$photo) }}" class="img-responsive" alt=""> </div>
										</div>
										<div class="profile-usertitle">
											<div class="profile-usertitle-name"><b>{{$surname }}</b>  {{$firstname }} {{$othernames }}   </div>
											<div class="profile-usertitle-job"> {{ $regno }} </div>
										</div>
										<ul class="list-group list-group-unbordered">
											<li class="list-group-item">
												<b>School</b> <a class="pull-right">{{$school }}</a>
											</li>
											<li class="list-group-item">
												<b>Department</b> <a class="pull-right">{{$dept }}</a>
											</li>
											<li class="list-group-item">
												<b>Course of Study</b> <a class="pull-right">{{ $course }}</a>
											</li>
                                            <li class="list-group-item">
												<b>Level</b> <a class="pull-right">{{$level }}</a>
											</li>
                                             <li class="list-group-item">
												<b>State of Origin </b> <a class="pull-right">{{ $state_name }}</a>
											</li>
										</ul>
									 
									</div>
								</div>
							</div>
						</div>
						 
					<div class="col-lg-4 col-md-12 col-sm-12 col-12">
							<div class="card  card-box">
								<div class="card-head">
									<header>Notifications</header>
									 
								</div>
								<div class="card-body no-padding height-9">
									<div class="row">
										<div class="noti-information notification-menu">
											<div class="notification-list mail-list not-list small-slimscroll-style">
												 <a href="javascript:;" class="single-mail"> <span
														class="icon bg-primary"> <i class="fa fa-user-o"></i>
													</span> <span class="text-purple">Profile Updated</span>  
													 
												</a>
												
                                                @php if ($amtpaid) { @endphp
                                                
                                                <a href="javascript:;" class="single-mail"> <span
														class="icon bg-success"> <i class="fa fa-check-square-o"></i>
													</span> Paid Fees
													 
												</a>
                                               @php }else{ @endphp
                                               
                                               <a href="javascript:;" class="single-mail"> <span
														class="icon bg-danger"> <i class="fa fa-times"></i>
													</span> <strong>Payment not Made</strong>
													 
												</a>
											
                                            @php }
                                            
                                            if ($ofees) {
                                            
                                             @endphp
                                            	
												<a href="javascript:;" class="single-mail"> <span
														class="icon bg-pink"> <i class="fa fa-home"></i>
													</span> <strong>Paid Other Fee(s)</strong>
													 
												</a>
												 
												  @php }  @endphp
												 
												<a href="javascript:;" class="single-mail"> <span
														class="icon bg-warning"> <i class="fa fa-bell"></i>
													</span> <strong><p id="demo" style="text-align:center; font-weight:bold; font-size: 18px;color:blue"> </p> </strong>
													 
												</a>  
                                                
                                                @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
        
            @foreach ($errors->all() as $error)
                {{ $error }}  <br>
            @endforeach
            
        </ul>
    </div>
@endif 
											</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>	
						
					</div>
					<!-- end widget -->
                    
                    <div class="state-overview">
						<div class="row">
							<div class="col-lg-6 col-sm-6">
								<div class="overview-panel purple">
									<div class="symbol">
										<i class="fa fa-money usr-clr"></i>
									</div>
									<div class="value white">
										<p class="sbold addr-font-h1" data-counter="counterup" data-value="{{ $amtpaid }}">0</p>
                                        <span>&#8358;</span>
										<p>Fees</p>
									</div>
								</div>
							</div>
							 
							 
							<div class="col-lg-6 col-sm-6">
								<div class="overview-panel blue-bgcolor">
									<div class="symbol">
										<i class="fa fa-usd"></i>
									</div>
									<div class="value white">
										<p class="sbold addr-font-h1" data-counter="counterup" data-value="{{ $ofees }}">0</p>
										<span>&#8358;</span>
										<p>Other Fees</p>
									</div>
								</div>
							</div>
						</div>
					</div>
                    
					<!-- chart start -->
					
				
					</div>
					
				</div>
		
			<!-- end page content -->
			

	
		<script>
// Set the date we're counting down to
var countDownDate = new Date("{{ $endreg }}").getTime();

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
  document.getElementById("demo").innerHTML = "Registration ends in: " + days + "Days " + hours + "Hrs "
  + minutes + "Mins " + seconds + "Secs";
    
  // If the count down is over, write some text 
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "Registration is CLOSED";
  }
}, 1000);
</script>	

@endsection	