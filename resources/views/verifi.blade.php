<!DOCTYPE html>
<html>
 
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<meta name="description" content="Responsive Admin Template" />
	<meta name="author" content="{{ env('APP_NAME') }}" />
	<title>{{ env('APP_NAME') }} | Katsina State College of Health Sciences and Technology </title>
	<!-- google font -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet"
		type="text/css" />
	<!-- icons -->
	<link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="{{ asset('plugins/iconic/css/material-design-iconic-font.min.css') }}">
	<!-- bootstrap -->
	<link href="{{ asset('plugins/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
	<!-- style -->
	<link rel="stylesheet" href="{{ asset('css/pages/extra_pages.css') }}">
	<!-- favicon -->
	 
</head>

<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="post"   action="{{ route('doverify') }}"   autocomplete="off" >
                @csrf 
					<span class="login100-form-logo">
						<img alt="" src="{{ asset('img/logo2.png') }}">
					</span>
                    
                    <br>
					<span class="login100-form-title p-b-34 p-t-3">
						{{ env('APP_NAME') }} <br> Student Portal
					</span>
                    <span class="login100-form-title p-b-34 p-t-15">
						Registration No. Verification<hr>
					</span>
                                     @if ($errors->any())
    <div class="alert alert-warning" style="font-size:12px">
        <ul>
        
            @foreach ($errors->all() as $error)
                {{ $error }}  <br>
            @endforeach
            
        </ul>
    </div>
@endif
					<div class="wrap-input100 validate-input" data-validate="Enter username">
						<input class="input100" type="text" name="regno" placeholder="Registration/Application Number" autocomplete="off"  required>
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					 
					 
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">
							Verify
						</button>
					</div>
					<div class="text-center p-t-30">
						<a class="txt1" href="{{URL::to('/') }}">
							Home
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- start js include path -->
	<script src="{{ asset('plugins/jquery/jquery.min.js') }}"></script>
	<!-- bootstrap -->
	<script src="{{ asset('plugins/bootstrap/js/bootstrap.min.js') }}"></script>
	<script src="{{ asset('js/pages/extra-pages/pages.js') }}"></script>
	<!-- end js include path -->
</body>

 
</html>