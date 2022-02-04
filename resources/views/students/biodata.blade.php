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
             $stdtype =  strtoupper($stdrecs->std_custome19);
              $email =   $stdrecs->student_email;
                $gender =   $stdrecs->gender;
                  $dob =   date('d-M-Y', strtotime($stdrecs->birthdate));
                    $hometown =   $stdrecs->home_town;
                      $mstatus =   $stdrecs->marital_status;
                        $lga =   $stdrecs->lga_name;
                          $nationality =   $stdrecs->nationality;
                            $caddress =   $stdrecs->contact_address;
                              $nok =   $stdrecs->next_of_kin;
                              $nokaddress =   $stdrecs->nok_address;
                              $nokphone =   $stdrecs->nok_tel;
                              $gsm = $stdrecs->student_mobiletel;
                              $prog = $stdrecs->programme_name;
      
 
                @endphp
			<!-- start page content -->
			<div class="page-content-wrapper">
				<div class="page-content">
					<div class="page-bar">
						<div class="page-title-breadcrumb">
							<div class=" pull-left">
								<div class="page-title">Student Profile</div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item"
										href="{{URL::to('/studenthome') }}">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li class="active">My Profile</li>
							</ol>
						</div>
					</div>
					<!-- start widget -->
					<div class="row">
                    
                    
                    
						<div class="col-xl-12 col-lg-6">
							<div class="card comp-card">
								<div class="card-body">
									
									<div class="card-body no-padding height-9">
										<div class="row">
											<div class="profile-userpic">
												<img src="{{ asset('storage/photo/'.$photo) }}" class="img-responsive" alt=""> </div>
										</div>
										<div class="profile-usertitle">
											<div class="profile-usertitle-name"><b>{{$surname }}</b>  {{$firstname }} {{$othernames }} </div>
											<div class="profile-usertitle-job"> {{ $regno }} </div>
										</div>
										<ul class="list-group list-group-unbordered">
											<li class="list-group-item">
												<b>School</b> <a class="pull-right">{{ $school }}</a>
											</li>
											<li class="list-group-item">
												<b>Department</b> <a class="pull-right">{{ $dept }}</a>
											</li>
											<li class="list-group-item">
												<b>Course of Study</b> <a class="pull-right">{{ $course }}</a>
											</li>
                                            <li class="list-group-item">
												<b>Programme</b> <a class="pull-right">{{ $prog }}</a>
											</li>
                                            <li class="list-group-item">
												<b>Student Type</b> <a class="pull-right">{{ $stdtype }}</a>
											</li>
                                            <li class="list-group-item">
												<b>Email</b> <a class="pull-right">{{ $email }}</a>
											</li>
                                            <li class="list-group-item">
												<b>Gender</b> <a class="pull-right">{{ $gender }}</a>
											</li>
                                            <li class="list-group-item">
												<b>Date of Birth</b> <a class="pull-right">{{ $dob }}</a>
											</li>
                                              <li class="list-group-item">
												<b>Level</b> <a class="pull-right">{{ $level }}</a>
											</li>
                                            
                                              <li class="list-group-item">
												<b>Phone Number</b> <a class="pull-right">{{ $gsm }}</a>
											</li>
                                            <li class="list-group-item">
												<b>Home Town</b> <a class="pull-right">{{ $hometown }}</a>
											</li>
                                            <li class="list-group-item">
												<b>Marital Status</b> <a class="pull-right">{{ $mstatus }}</a>
											</li><li class="list-group-item">
												<b>State of Origin</b> <a class="pull-right">{{ $state_name }}</a>
											</li>
                                            <li class="list-group-item">
												<b>Local Government Area</b> <a class="pull-right">{{ $lga }}</a>
											</li><li class="list-group-item">
												<b>Nationality</b> <a class="pull-right">{{ $nationality }}</a>
											</li><li class="list-group-item">
												<b>Contact Address</b> <a class="pull-right">{{ $caddress }}</a>
											</li><li class="list-group-item">
												<b>Next of Kin Name</b> <a class="pull-right">{{ $nok }}</a>
											</li>
                                            <li class="list-group-item">
												<b>Next of Kin Address</b> <a class="pull-right">{{ $nokaddress }} </a>
											</li>
                                             <li class="list-group-item">
												<b>Next of Kin Phone</b> <a class="pull-right">{{ $nokphone }}</a>
											</li>
                                           
                                          
                                           
										</ul>
									 
									</div>
								</div>
                                
                                
							</div> <div class="row">
													<div class="offset-md-5 col-md-7">
														<button type="submit"
															class="btn btn-info m-r-20">Print Profile</button>
													 
													</div>
												</div>
						</div>
						 
						
						
					</div>
					<!-- end widget -->
                    
                    
                    
					<!-- chart start -->
					
				
					</div>
					
				</div>
		
			<!-- end page content -->
			
	@endsection	
	
		 