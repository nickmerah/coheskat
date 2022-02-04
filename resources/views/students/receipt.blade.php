@extends('students/dashboard')
 
@section('contents')

@php 
             $regno = $transdatas[0]->trans_custom14 ;
             $fname = $transdatas[0]->trans_custom8;
              $email =  $transdatas[0]->trans_custom17;
              $dates =  $transdatas[0]->generated_date;
               $sess =  $transdatas[0]->trans_year;
               $fac =  $transdatas[0]->trans_custom11;
               $dept =  $transdatas[0]->trans_custom12;
               $prog =  $transdatas[0]->trans_custom10;
               $rrr =  $transdatas[0]->trans_no;
               $photo = $stdrecs->std_custome4;
              
             
             
       @endphp        
             
			<!-- start page content -->
			<div class="page-content-wrapper">
				<div class="page-content">
					<div class="page-bar">
						<div class="page-title-breadcrumb">
							<div class=" pull-left">
								<div class="page-title">  Payment Receipt</div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item"
										href="{{URL::to('/studenthome') }}">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li class="active"> Payment Receipt</li>
							</ol>
						</div>
					</div>
					<!-- start widget -->
				<div id="printableArea">	 <div class="row">
						<div class="col-md-12">
							<div class="white-box">
								 <div align="center">
			<header class="header"><img src="{{ asset('img/logo.jpg') }}" width="86" height="88"><h3> Katsina State College  <i style="font-family:'Trebuchet MS', Arial, Helvetica, sans-serif"> of </i>  Health Sciences and Technology  </h3>
			</header>
			
			
				<?php //include 'links.php';?>
				
				<article class="col-sm-11 col-md-15">
				
					
				
					<!-- START Contact page -->
				
					<div class="row">
					
						<!-- Contact form -->
												
				
                
              
			 
				<table width="100%" class="table">
    <thead>
      <tr>
        <th colspan="3">Payment Receipt - PAID</th>
      </tr>
      <tr>
        <th colspan="3">TRANSACTION DETAILS</th>
        </tr>                 
    </thead>
    <tbody style="font-size:12px">
      <tr>
        <td width="47%">FULLNAME: {{ $fname }}</td>
        <td width="27%">REGISTRATION NO: <strong>{{ $regno }}</strong></td>
        <td width="26%" rowspan="5"> <img src="{{ asset('storage/photo/'.$photo) }}" width="109" height="108" /></td>
        </tr>

      <tr>
        <td>SCHOOL: {{ $fac }}</td>
        <td>DEPARTMENT: {{ $dept }}</td>
        </tr>
      <tr>
        <td colspan="2">PROGRAMME:   {{ $prog }}</td>
        </tr>


      <tr>
        <td><strong>RRR: {{ $rrr }} </strong></td>
        <td> Session: {{ $sess }}  / {{ $sess + 1 }}</td>
        </tr>


      <tr>
        <td>Date:         {{ $dates }}</td>
        <td>Semester: First Semester</td>
        </tr>


    </tbody>
  </table>
              
            
            
          
							 
   
  <div class="table-responsive">
  <table class="table">
    <thead>
      <tr>
        <th width="11%">S/N</th>
        <th width="38%">Fee Item</th>
        <th width="51%">Amount(N)</th>
        </tr>
    </thead>
    <tbody style="font-size:12px">
     @php
    $tot_amount = 0;
    
@endphp
    @foreach ($transdatas  as $transdata )
    
    <tr>
        <td>{{$loop->iteration}}</td>
        <td>{{ $transdata->trans_name }}</td>
        <td>&#8358 {{ number_format($transdata->trans_amount) }}     @php  $tot_amount += $transdata->trans_amount; @endphp
				  </td>
        </tr> 
        @endforeach
        
         
 <tr>
        <th colspan="2" align="right">TOTAL:</th>
        <th>&#8358 {{ number_format($tot_amount) }}</th>
        </tr>
    </tbody>
  </table>
  </div>
 
				
						  
			 
						
				
         <div class="table-responsive">
  <table class="table">
   
    <tbody style="font-size:12px">
		
<tr>
  <td> 
     
    <p>BURSARY STAMP: ________________________________________</p></td>
  </tbody>
  </table>
  
  </div>        	
                    
     
            
            
            
										<!-- Contact details -->
						 
				  </div>
					
					
				</article>
				
				
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
	
		 