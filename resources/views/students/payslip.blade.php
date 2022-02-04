@extends('students/dashboard')
 
@section('contents')

@php 
             $regno = $transdatas[0]->trans_custom14 ;
             $fname = $transdatas[0]->trans_custom8;
              $email =  $transdatas[0]->trans_custom17;
              $dates =  $transdatas[0]->generated_date;
               $rrr =  $transdatas[0]->trans_no;
              
             
             
       @endphp        
             
			<!-- start page content -->
			<div class="page-content-wrapper">
				<div class="page-content">
					<div class="page-bar">
						<div class="page-title-breadcrumb">
							<div class=" pull-left">
								<div class="page-title">Fee Payment Slip</div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item"
										href="{{URL::to('/studenthome') }}">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li class="active">Fee Payment Slip</li>
							</ol>
						</div>
					</div>
					<!-- start widget -->
				<div id="printableArea">	 <div class="row">
						<div class="col-md-12">
							<div class="white-box">
								<h3><b>Fee Payment e-Invoice</b> <span class="pull-right">RRR:  {{ $rrr }}</span></h3>
								<hr>
                                
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
												<p class="font-bold addr-font-h4"><b>{{$fname }}</b> </p> <p>
													<b>Registration No :</b> {{ $regno }}
												</p>
                                                
                                               <p>
													<b>Email :</b> {{ $email }}
												</p>
                                                
                                                
												 
												<p class="m-t-30">
													<b>Invoice Date :</b> <i class="fa fa-calendar"></i> @php

echo date( 'd-M-Y h:i:s',strtotime($dates));

@endphp
												</p>
												 
											</address>
										</div>
									</div>
									<div class="col-md-12">
										<div class="table-responsive m-t-40">
											<table cellpadding="0" cellspacing="0" class="mdl-data-table">
												<thead>
													<tr>
														<th class="text-center">#</th>
														<th class="text-left">Fee Name</th>
														<th class="text-right">Amount</th>
													</tr>
												</thead>
												<tbody>
                                                @php
    $tot = 0;
    $pfee = 453;
@endphp
                                                @foreach ($transdatas  as $transdata )
													<tr>
														<td class="text-center">{{$loop->iteration}}</td>
														<td class="text-right">{{ $transdata->trans_name  }}</td>
														<td class="text-right">&#8358;{{ number_format($transdata->trans_amount) }}
                                                      @php  $tot += $transdata->trans_amount; @endphp
                                                        
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
											 
											<h4><b>Total :</b> &#8358;{{ number_format($tot + $pfee)}}</h4>
										</div></div>
									 
										 
										
									</div>
								</div> 
							</div>
						</div>
					</div><div class="text-right">
											 
                                            
                                             <img src="{{ asset('img/remita.png') }}" alt="remita" class="center" />  <BR>     @php    $mertid= "5415881626";
     $apikey = "L7XVRGVM";
			 
			 $new_hash_string = $mertid . $rrr . $apikey;
             $new_hash = hash('sha512', $new_hash_string);
             $responseurl =     url("/remitaresponse/{$rrr}");  
			  echo '<form action="https://login.remita.net/remita/ecomm/finalize.reg" method="POST">
			  <input id="merchantId" name="merchantId" value="'.$mertid.'" type="hidden"/>
<input id="rrr" name="rrr" value="'.$rrr.'" type="hidden"/>
<input id="responseurl" name="responseurl" value="'.$responseurl.'" type="hidden"/>
<input id="hash" name="hash" value="'.$new_hash.'" type="hidden"/>
<input id="paymenttype" name="paymenttype" value="Interswitch" type="hidden"/>
 

 <button type="submit" class="btn btn-block btn-success btn-animated" name="btn-login" value="Please Click Here" />
 
   PAY NOW with your ATM Card using REMITA   
		  </button>
 
</form>';


		 	 @endphp  
                                       <br />     
                                            
											<button onClick="printDiv('printableArea')"
												class="btn btn-default btn-outline" type="button"> <span><i
														class="fa fa-print"></i> Print Payment Slip</span> </button>
                                                        <script type="application/javascript">
	function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}
</script>
										</div>
					<!-- end widget -->
                    
                    
                    
					<!-- chart start -->
					
				
					</div>
					
				</div>
		
			<!-- end page content -->
			
	@endsection	
	
		 