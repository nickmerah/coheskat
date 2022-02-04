@extends('students/dashboard')
 
@section('contents')
			<!-- start page content -->
			<div class="page-content-wrapper">
				<div class="page-content">
					<div class="page-bar">
						<div class="page-title-breadcrumb">
							<div class=" pull-left">
								<div class="page-title">Other Fee(s)</div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item"
										href="{{URL::to('/studenthome') }}">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li class="active">Other Fee(s) Payment</li>
							</ol>
						</div>
					</div>
					<!-- start widget -->
					 <div class="row">
						<div class="col-sm-12">
							<div class="card-box">
								<div class="card-head">
									<header>Pay other Fee(s)</header>
								</div>
								<div class="card-body ">
									<table
										class="mdl-data-table ml-table-striped ml-table-bordered mdl-js-data-table mdl-data-table is-upgraded">
										<thead>
                                        
                                       
											<tr>
												<th class="mdl-data-table__cell--non-numeric">Fee Name</th>
												<th class="mdl-data-table__cell--non-numeric">Amount</th>
                                                <th class="mdl-data-table__cell--non-numeric">Action</th>
												 
												 
											</tr>
                                            
                                           
										</thead>
										<tbody>
                                         @foreach ($ofees  as $ofee )
											<tr>
												<td class="mdl-data-table__cell--non-numeric">{{ $ofee->ofield_name }}</td>
												<td class="mdl-data-table__cell--non-numeric">&#8358;{{ number_format($ofee->of_amount) }}
												</td>
                                                <td class="mdl-data-table__cell--non-numeric"><button type="button"
												class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-circle btn-success" onclick="window.location.href='{{URL::to('/payofeenow/'.$ofee->of_id) }}'">Pay</button>
												</td>
												 
												 
											</tr>
											  @endforeach 
											 
											 
											 
											 
										</tbody>
									</table>
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
	
		 