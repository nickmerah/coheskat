@extends('fpheader')
 
@section('contents')
                    
                     
                    
						<div class="col-xl-8 col-lg-6">
							<div class="card comp-card">
								<div class="card-body">
									
									<div class="card-body no-padding height-9">
										<div class="row">
											<div class="profile-userpic"></div>
										</div>
										<div class="profile-usertitle">
											<div class="page-title">Student Login</div>
											<div class="profile-usertitle-job"> Enter your Registration Number and Password to continue </div>
            
    
     
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
                                 <form class="form-signin" method="post" id="login-form" action="{{ route('dologin') }}"   autocomplete="off">
      
       @csrf        
										<div class="row">
						<div class="col-sm-12">
							<div class="card-box">
								
								<div class="card-body row">
									<div class="col-lg-6 p-t-20">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input name="regno" type="text" class="mdl-textfield__input" id="txtFirstName" autocomplete="off"  required >
											<label class="mdl-textfield__label">Registration Number</label>
										</div>
									</div>
									
									
									
									
									
									<div class="col-lg-6 p-t-20">
										<div
											class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
											<input name="passkey" type="password" class="mdl-textfield__input" id="txtParentName" required>
											<label class="mdl-textfield__label">Password</label>
										</div>
									</div>
									
                                    
									<div class="col-lg-12 p-t-20 text-center">
									<button type="submit"
											class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Login</button>
										
									</div>
								</div>
							</div>
						</div>
					</div>
                    
</form>
								
                                <div align="center">	<div><a href="{{URL::to('/fpass') }}" id="addRow"
																		class="btn btn-info">
																		Forgot Password <i class="fa fa-lock"></i>
																	</a> <a href="{{URL::to('/start') }}" id="addRow"
																		class="btn btn-success">
																		New Registation? Begin Here <i class="fa fa-user-o"></i>
																	</a> <a href="{{URL::to('/regins') }}" id="addRow"
																		class="btn btn-warning">
																		Registration Instructions<i class="fa fa-download"></i>
																	</a></div></div>
									</div>
								</div>
							</div>
						</div>
						 
@endsection					 
							