@extends('students/dashboard')
 
@section('contents')

@php 
             $regno = $stdrecs->matric_no;
             $surname = strtoupper($stdrecs->surname);
              $firstname = strtoupper($stdrecs->firstname);
             $othernames = strtoupper($stdrecs->othernames);
             $course = strtoupper($stdrecs->programme_option); 
             $level = $stdrecs->level_name; 
             $state_name = $stdrecs->state_name;
             
       @endphp        
             
			<!-- start page content -->
			<div class="page-content-wrapper">
				<div class="page-content">
					<div class="page-bar">
						<div class="page-title-breadcrumb">
							<div class=" pull-left">
								<div class="page-title">Fee Payment</div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item"
										href="{{URL::to('/studenthome') }}">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li class="active">Fee Payment</li>
							</ol>
						</div>
					</div>
					<!-- start widget -->
					 <div class="row">
						<div class="col-md-12">
							<div class="white-box">
								<h3><b>Payment e-Invoice</b> <span class="pull-right">#@php

echo rand(1111111,9999999);

@endphp</span></h3>
								<hr>
                                <form class="form-signin" method="post"   action="{{ route('paynow') }}">
                                @csrf 
								<div class="row">
									<div class="col-md-12">
										<div class="pull-left">
											<address>
												<img src="{{ asset('img/logo.jpg') }}" alt="logo"
													class="logo-default" />
												<p class="text-muted m-l-5">
													COHESKAT, <br>  
													Katsina-Daura Road,  <br> 824101, Daura
												</p>
											</address>
										</div>
										<div class="pull-right text-right">
											<address>
												<p class="addr-font-h3">To,</p>
												<p class="font-bold addr-font-h4"><b>{{$surname }}</b>  {{$firstname }} {{$othernames }}</p> <p>
													<b>Registration No :</b> {{ $regno }}
												</p>
                                                
                                               <p>
													<b>Level :</b> {{ $level }}
												</p>
                                                
                                                <p>
													<b>State :</b> {{ $state_name }}
												</p>
												 
												<p class="m-t-30">
													<b>Invoice Date :</b> <i class="fa fa-calendar"></i> @php

echo date('d-M-Y h:i:s');

@endphp
												</p>
												<p>
													<b>Course :</b> {{ $course }}
												</p>
											</address>
										</div>
									</div>
									<div class="col-md-12">
										<div class="table-responsive m-t-40">
											<table class="table table-hover">
												<thead>
													<tr>
														<th class="text-center">#</th>
														<th class="text-right">Fee Name</th>
														<th class="text-right">Amount</th>
													</tr>
												</thead>
												<tbody>
                                                @php
    $tot = 0;
    $pfee = 453;
@endphp
                                                @foreach ($feeschedules  as $feeschedule )
													<tr>
														<td class="text-center">{{$loop->iteration}}</td>
														<td class="text-right">{{ $feeschedule->field_name }}</td>
														<td class="text-right">&#8358;{{ number_format($feeschedule->amount) }}
                                                      @php  $tot += $feeschedule->amount; @endphp
                                                        
                                                        </td>
													</tr>
													@endforeach   
												</tbody>
											</table>
										</div>
									</div>
									<div class="col-md-12">
										<div class="pull-right m-t-30 text-right">
											<p>Sub - Total amount: &#8358;{{number_format($tot)}}</p>
											<p>Proessing Fee : &#8358;{{$pfee}} </p>
											 
											<hr>
											<h3><b>Total :</b> &#8358;{{ number_format($tot + $pfee)}}</h3>
										</div>
										<div class="clearfix"></div>
										<hr>
										<div class="text-right">
											<button class="btn btn-danger" type="submit"> Proceed to payment </button>
											
										</div>
									</div>
								</div></form>
							</div>
						</div>
					</div>
					<!-- end widget -->
                    
                    
                    
					<!-- chart start -->
					
				
					</div>
					
				</div>
		
			<!-- end page content -->
			
	@endsection	
	
		 