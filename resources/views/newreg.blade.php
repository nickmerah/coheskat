@extends('fpheader')
 
@section('contents')
                    
             
   
           @php
            $regno = $accessdata->appno;
             $fullname = strtoupper($accessdata->fullname);
             $state = $accessdata->state;
             $gsm = $accessdata->gsm;
             $faculties_name = $accessdata->faculties_name;
             $programme_option = $accessdata->programme_option;
             $level = $accessdata->level;
              $stdtype   = $accessdata->stdtype;
             $state_name = $accessdata->state_name;
              $list = explode(" ", $fullname);
              $surname = $list[0];
              $firstname = $list[1];
              if (count($list) > 2) {
               $othernames = $list[2];
              }else{
               $othernames = "";
              }
             
 
                @endphp
         
 
       
                    
						<div class="col-xl-8 col-lg-6">
							<div class="card comp-card">
								<div class="card-body">
									
									<div class="card-body no-padding height-9">
										<div class="row">
											<div class="profile-userpic"></div>
										</div>
										<div class="profile-usertitle">
											<div class="page-title">Biodata Update</div>
											<div class="profile-usertitle-job"> Complete all fields </div>
										</div>
                                        
                                                         @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
        
            @foreach ($errors->all() as $error)
                {{ $error }}  <br>
            @endforeach
            
        </ul>
    </div>
@endif                    <form class="form-signin" method="post"   action="{{ route('createacct') }}"   autocomplete="off" enctype="multipart/form-data">
      
       @csrf 

										<div class="row">
						<div class="col-sm-12">
							<div class="card-box">
								
								<div class="card-body row">
									<div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input type="text" class="mdl-textfield__input" id="txtFirstName" value="{{ $regno }}" readonly="readonly">
											<label class="mdl-textfield__label">REGISTRATION NUMBER </label>
										</div>
									</div>
									
									
									
									
									
									<div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input type="text" class="mdl-textfield__input" id="txtParentName" value="{{ $surname }}" readonly="readonly">
											<label class="mdl-textfield__label">SURNAME</label>
										</div>
									</div>
									
                           <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input type="text" class="mdl-textfield__input" id="txtParentName" value="{{ $firstname }}" readonly="readonly">
											<label class="mdl-textfield__label">FIRSTNAME</label>
										</div>
									</div>
                                    <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input name="othernames" type="text" class="mdl-textfield__input" id="txtParentName" value="{{ $othernames }} " >
											<label class="mdl-textfield__label">OTHERNAMES</label>
										</div>
									</div>
                                <div class="col-lg-12">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input type="text" class="mdl-textfield__input" id="txtParentName" value="{{ $faculties_name }}" readonly="readonly">
											<label class="mdl-textfield__label">SCHOOL</label>
										</div>
									</div>
                                    <div class="col-lg-12">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input type="text" class="mdl-textfield__input" id="txtParentName" value="{{ $programme_option }}" readonly="readonly">
											<label class="mdl-textfield__label">COURSE OF STUDY</label>
									  </div>
									</div>
                                    
                                     <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input name="gsm" type="text" class="mdl-textfield__input" id="text5" value="{{ $gsm }}"
												pattern="-?[0-9]*(\.[0-9]+)?">
											<label class="mdl-textfield__label" for="text5">GSM NUMBER</label>
											<span class="mdl-textfield__error">Number required!</span>
									   </div>
									</div>
                                    
                                     <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
								<input name="email" type="email" class="mdl-textfield__input" id="txtemail"  >
											<label class="mdl-textfield__label">EMAIL</label>
											<span class="mdl-textfield__error">Enter Valid Email Address!</span>			
         
									   </div>
									</div>
                                    
                                    
                                    
                                   
                                    
                                <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input name="pwd" type="password" class="mdl-textfield__input" id="txtParentName" required>
											<label class="mdl-textfield__label">PASSWORD </label>
										</div>
									</div>
                                    <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input name="cpwd" type="password" class="mdl-textfield__input" id="txtParentName" required>
											<label class="mdl-textfield__label">CONFIRM PASSWORD</label>
										</div>
									</div>
                                   
                                    
                              <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input name="dob" type="text" class="mdl-textfield__input" id="date" required>
											<label class="mdl-textfield__label">DATE OF BIRTH</label>
										</div>
									</div>
                                    <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
											<input name="gender" type="text" class="mdl-textfield__input" id="gender" tabIndex="-1"  required
												readonly>
											<label for="gender" class="pull-right margin-0">
												<i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
										  </label>
											<label for="gender" class="mdl-textfield__label">GENDER</label>
											<ul data-mdl-for="gender"
												class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
												<li class="mdl-menu__item" data-val="Male">Male</li>
												<li class="mdl-menu__item" data-val="Female">Female</li>
											</ul>
										</div>
									</div>
                                    <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
											<input name="mstatus" type="text" class="mdl-textfield__input" id="mstatus" tabIndex="-1"   required
												readonly>
											<label for="mstatus" class="pull-right margin-0">
												<i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
										  </label>
											<label for="mstatus" class="mdl-textfield__label">MARITAL STATUS</label>
											<ul data-mdl-for="mstatus"
												class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
												<li class="mdl-menu__item" data-val="S">Single</li>
												<li class="mdl-menu__item" data-val="M">Married</li>
											</ul>
										</div>
									</div>
                                    <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input name="village" type="text" class="mdl-textfield__input" id="txtParentName" required>
											<label class="mdl-textfield__label">HOME TOWN (VILLAGE)</label>
										</div>
									</div>
                                    <div class="col-lg-12">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
												<textarea name="caddress" rows="2" class="mdl-textfield__input" id="text7"></textarea required>
											<label class="mdl-textfield__label">CONTACT ADDRESS</label>
										</div>
									</div>
                                 <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input class="mdl-textfield__input" type="text" id="txtParentName" value="{{ $state_name }} " readonly="readonly">
											<label class="mdl-textfield__label">STATE OF ORIGIN</label>
										</div>
									</div>
                                    <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
											<input name="lga" type="text" class="mdl-textfield__input" id="lga" value="" required
												readonly>
											<label for="lga" class="pull-right margin-0">
												<i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
										  </label>
											<label for="lga" class="mdl-textfield__label">LGA</label>
											<ul data-mdl-for="lga"
												class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
                                                @foreach ($lgas as $lga)
												<li class="mdl-menu__item" data-val="{{ $lga->lga_id }}">{{$lga->lga_name }}</li>
												 
                                                @endforeach
											</ul>
										</div>
									</div>
                                    <div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input name="nok" type="text" class="mdl-textfield__input" id="txtParentName" required>
											<label class="mdl-textfield__label">NEXT OF KIN NAME</label>
										</div>
									</div><div class="col-lg-6">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input name="nokgsm" type="text" class="mdl-textfield__input" id="text5"
												pattern="-?[0-9]*(\.[0-9]+)?"  >
									    <label class="mdl-textfield__label" for="text5">NEXT OF KIN GSM NUMBER</label>
											<span class="mdl-textfield__error">Number required!</span>
										</div>
									</div>
                                    <div class="col-lg-12">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
												<textarea name="nokaddress" rows="2" class="mdl-textfield__input" id="text7"></textarea required>
											<label class="mdl-textfield__label">NEXT OF KIN ADDRESS</label>
									  </div>
									</div>
                                    
                                    <div class="col-lg-12">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<label>PASSPORT</label>		<input name="image" type="file" class="mdl-textfield__input" id="txtParentName" required>
											
										</div>
									</div>
                                     
                                     
                                     
                                     <div class="col-lg-12">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input name="captchaResult" type="text" class="mdl-textfield__input" id="text5"
												pattern="-?[0-9]*(\.[0-9]+)?" >
									    <label class="mdl-textfield__label" for="text5">SOLVE THE MATHS:   @php $min_number = 1;
	$max_number = 25;

	$random_number1 = mt_rand($min_number, $max_number);
	$random_number2 = mt_rand($min_number, $max_number);
			echo $random_number1 . ' + ' . $random_number2 . ' = ';
		@endphp</label>
											<span class="mdl-textfield__error">Number required!</span>
										</div>
									</div>
                                    
    
        
        </label><input name="firstNumber" type="hidden" value="{{ $random_number1 }}" />
		<input name="secondNumber" type="hidden" value="{{ $random_number2 }}" />                               
                                    
									<div class="col-lg-12 p-t-20 text-center">
									<button type="submit"
											class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-success">Update Biodata</button>
										
									</div>
								</div>
							</div>
						</div>
					</div>
                    
 </form>
								
                                <div align="center">	<div><a href="{{URL::to('/') }}" id="addRow"
																		class="btn btn-pink">
																		 <i class="fa fa-home"></i> Back to Home
																	</a>
                                                                    <a href="{{URL::to('/fpass') }}" id="addRow"
																		class="btn btn-info">
																		Forgot Password <i class="fa fa-lock"></i>
																	</a>  <a href="{{URL::to('/regins') }}" id="addRow"
																		class="btn btn-warning">
																		Registration Instructions<i class="fa fa-download"></i>
																	</a></div></div>
									</div>
								</div>
							</div>
						</div>
						 
@endsection					 
							