@extends('students/dashboard')
 
@section('contents')
			<!-- start page content -->
			<div class="page-content-wrapper">
				<div class="page-content">
					<div class="page-bar">
						<div class="page-title-breadcrumb">
							<div class=" pull-left">
								<div class="page-title">Pending Payment History</div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item"
										href="{{URL::to('/studenthome') }}">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li><a class="parent-item" href="#">Fees</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li><a class="parent-item" href="#">Pending Payment</a>&nbsp;
								</li>
							</ol>
						</div>
					</div>
					<!-- start widget -->
					 <div class="row">
						<div class="col-md-12">
							<div class="card card-box">
							 
								<div class="card-body ">
									<div class="table-scrollable">
										<table
											class="table table-striped table-bordered table-hover table-checkable order-column valign-middle"
											id="example4">
											<thead>
												<tr>
													<th class="center">S/N</th>
													<th class="center"> RRR</th>
													<th class="center"> Session </th>
													<th class="center"> Date </th>
												 	<th class="center"> Amount</th>
												<th class="center"> Payment Type </th>
													<th class="center"> Status </th>
                                                    <th class="center"> Action </th>
												
												</tr>
											</thead>
											<tbody>
												
                                                @foreach ($transdatas  as $transdata )
                                                <tr class="odd gradeX">
													<td class="center">{{$loop->iteration}}</td>
													<td class="center">{{ $transdata->trans_no  }}</td>
													<td class="center">{{ $transdata->trans_year  }}/{{ $transdata->trans_year + 1  }}</td>
													<td class="center">@php

echo date( 'd-M-Y h:i:s',strtotime($transdata->trans_date));

@endphp</td>
													<td class="center">&#8358;{{ number_format($transdata->trans_amount) }}</td>
												<td class="center">@php if ($transdata->trans_custom4 == 'fees'){
                                                    echo 'Fees'; }else{ echo 'Other Fee';} @endphp</td>
													<td class="center"><span
															class="label label-sm label-danger ">unpaid</span></td>
                                                            
                                                            <td class="center"><a href="{{URL::to('/remitaresponse/'.$transdata->trans_no) }}"><span
															class="label label-sm label-warning ">requery</span></a></td>
													
												</tr>
												 
											 @endforeach  
												 
												 
												 
												 
											</tbody>
										</table>
									</div>
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
	
		<!-- data tables -->
