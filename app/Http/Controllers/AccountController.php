<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Models\Account;
use App\Models\Student;

class AccountController extends Controller
{
	
	public function login(Request $request)
    {
        $data = $request->input();
		 $regno   = $data['regno'];
		  $password  = strtolower($data['passkey']);
	
		$rules =  [
            'passkey' => 'required',
			  'regno' => 'required',
			  
        ] ;
 
	$validator = Validator::make($request->all(),$rules,$messages = [
   
	'regno.required' => 'Registration Number is required !', 
	 'passkey.required' => 'Password is required !',
] ); 

if ($validator->fails()) {
			return redirect('/')
			->withInput()
			->withErrors($validator);
		}else{
			
     //$pwd = Hash::make($password);
 
	  	 $credentials = Account::select('log_id', 'log_password')
		 		->where('log_username', $regno)
                ->first();
 
	  if ( isset ($credentials) and (Hash::check($password, $credentials->log_password))) {
            $request->session()->regenerate(); 
		   $request->session()->put('logid', $credentials->log_id);
		 
 			return redirect()->intended('studenthome');
        }else{
        return back()->withInput()->withErrors([
            'Error: Invalid Registration Number/Password, Please try Again',
        ]);
		}
    } 
	}
	
	
	public function verify(Request $request)
    {
       
		  $regno   = $request->regno;  
	
		$rules =  [
            
			  'regno' => 'required',
			  
        ] ;
 
	$validator = Validator::make($request->all(),$rules,$messages = [
   
	'regno.required' => 'Registration Number is required !' 
] ); 

if ($validator->fails()) {
			return redirect('/start')
			->withInput()
			->withErrors($validator);
		}else{
 
	   	 $checkifexists = DB::table('portalaccess')->where('appno', $regno)->where('status', 0)->count(); 
 
	  if ($checkifexists > 0) {
		  
	 	$accessid = DB::table('portalaccess')->where('appno', $regno)->value('pid');
	 
            $request->session()->regenerate(); 
		    $request->session()->put('accessid', $accessid);
		 
 			return redirect()->intended('vreg');
        }else{
        return back()->withInput()->withErrors([
            'Error: Invalid/Verified Registration No, Please try Again',
        ]);
		}
    } 
	}
	
	public function viewaccess(Request $request)
    {
		
		if(!$request->session()->exists('accessid'))
        {
			return  redirect('/start')
			->withInput()
			->withErrors('Error: Unauthorized Access');
		  
        }else{
			
			$accessid =  $request->session()->get('accessid');  
			$accessdata = DB::table('portalaccess')
							->join('faculties', 'portalaccess.school', '=', 'faculties.faculties_id')
							->join('dept_options', 'portalaccess.prog', '=', 'dept_options.do_id')
							->join('state', 'portalaccess.state', '=', 'state.state_id')
							->select('*')->where('pid', $accessid)->first();
							
		 	$state_id = $accessdata->state;  
			$lga =   DB::table('lga')->where('state_id', $state_id)->get();
			 
			
			if( $accessdata->status  == 1 ) {
				return back()->withInput()->withErrors([
            'Error: Verified Registration No, Please try Again',
        ]);
			}else{
				
				
			  return view('newreg', ['accessdata' =>   $accessdata, 'lgas' =>   $lga]); 
			};
		 
		}
	}
	
	public function store(Request $request)
    {
		
		if(!$request->session()->exists('accessid'))
        {
			return  redirect('/start')
			->withInput()
			->withErrors('Error: Unauthorized Access');
		  
        }else{
			
		 $rules =  [
            'email' => 'required|string|email|max:250',
			'pwd' => 'required|min:4',
            'cpwd' => 'required|min:4',
			'dob' => 'required',
            'gender' => 'required',
			 'mstatus' => 'required',
			 'village' => 'required',
			 'caddress' => 'required',
			 'lga' => 'required',
			 'nokaddress' => 'required',
			 'nokgsm' => 'required',
			 'nok' => 'required',
			  'captchaResult' => 'required',
			  'image' => 'required|image|mimes:jpg|max:2048',
        ] ;
    
	$validator = Validator::make($request->all(),$rules,$messages = [
    'email.required' => 'Email is required !',
	'email.min' => 'Email Should not be more than 150 characters!',
	'pwd.required' => 'Password is required!',
	'pwd.min' => 'Password Should not be less than 4 characters!',
	'dob.required' => 'Date of Birth  is required!',
	'gender.required' => 'Gender is required!',
	'mstatus.required' => 'Marital Status is required!',
	'village.required' => 'Hometown/Village is required!',
	'caddress.required' => 'Contact Address is required!',
	'lga.required' => 'Local Government is required !',
	'nokaddress.required' => 'Next of Kin Address is required!',
	'nokgsm.required' => 'Next of Kin GSM Number is required!',
	'nok.required' => 'Next of Kin is required!',	
	'captchaResult.required' => 'You need to Solve the Maths!',
	 'image.required' => 'Passport is required!',
	  'image.image' => 'Passport should be an image!',
	   'image.mimes' => 'Only .jpg file format for Passport is allowed!',
	   'image.max' => 'Maximum size for Passport is 2MB!',
] );
		
		if ($validator->fails()) {
			return redirect('/vreg')
			->withInput()
			->withErrors($validator);
		}else{
			 $firstNumber   = $request->firstNumber;
			 $secondNumber  = $request->secondNumber;
             $captchaResult	 = $request->captchaResult;  
		     $checkTotal = $firstNumber + $secondNumber;
			 
			 
			if ($captchaResult <> $checkTotal) {
				 return redirect('/vreg')
			     ->withInput()
			     ->withErrors(['You need to Solve the Maths Correctly!']);
			}else{
				//continue and retrieve access data 
			 	$accessid =  $request->session()->get('accessid');   
				
				$accessdata = DB::table('portalaccess')
							  ->select('*')
							  ->where('pid', $accessid)
							  ->where('status', 0)
							  ->first();
							
		 	     $regno = $accessdata->appno; 
				
				
				//check if parameters are duplicated

      
	     $numstd = DB::table('login')->where('log_username', $regno)->count();
	     $numlog = DB::table('students_profile')->where('matric_no', $regno)->count();
	 
			
			if ($numstd == 1) {
		 return redirect('/vreg')
			     ->withInput()
			     ->withErrors(['Registration Number Has Already  Registered']); exit;
	 }
	 
	 if ($numlog == 1) {
		 return redirect('/vreg')
			     ->withInput()
			     ->withErrors(['Registration Number Has Already  Registered']); exit;
	 }
	 
			 try{  
			 
			 $list = explode(" ", $accessdata->fullname);
              $surname = $list[0];
              $firstname = $list[1];
              if (count($list) > 2) {
               $othernames = $list[2];
              }else{
               $othernames = $request->othernames;
              }
			  
			
				 $newacct = new Account;
                 $newacct->log_surname  = $surname;
				 $newacct->log_firstname  = $firstname;
				 $newacct->log_othernames  = $othernames;
				 $newacct->log_email  = $request->email;
				 $newacct->log_username   = $accessdata->appno;
				  $newacct->log_programmeid  = $accessdata->prog;
				 $newacct->log_gsm  = $accessdata->gsm;
				  $newacct->log_password  = Hash::make($request->pwd);
				  $newacct->datereg  = date('Y-m-d h:i:s');
                 $newacct->save();
				  $id = $newacct->log_id; //insert id
				 
				$dob = date('Y-m-d', strtotime($request->dob));
				 $photo = $id.date('ymdhis').".jpg";
				$newstd = new Student;
                 $newstd->std_logid    = $id;
				 $newstd->matric_no   = $accessdata->appno;
				  $newstd->surname  = $surname;
				 $newstd->firstname  = $firstname;
				 $newstd->othernames  = $request->othernames;
				 $newstd->gender   = $request->gender;
				  $newstd->marital_status  = $request->mstatus;
				 $newstd->birthdate  = $dob;
				 $newstd->home_town  = $request->village;
			 	 $newstd->local_gov   = DB::table('lga')->where('lga_name', $request->lga)->value('lga_id');  
				  $newstd->state_of_origin  = $accessdata->state;
				 $newstd->contact_address  = $request->caddress;
				 $newstd->student_email  = $request->email;
				 $newstd->student_mobiletel   = $accessdata->gsm;
				  $newstd->next_of_kin  = $request->nok;
				 $newstd->nok_address  = $request->nokaddress;
				 $newstd->nok_tel  = $request->nokgsm;
				 $newstd->nationality = 'Nigeria';
				  $newstd->stdcourse   = $accessdata->prog;
				 $newstd->stdfaculty_id  = $accessdata->school;
				 $newstd->std_custome1   = $accessdata->level;
				 $newstd->std_custome2  = date('Y');
				  $newstd->std_custome3  = ' ';
				 $newstd->std_custome4  = $photo;
				  $newstd->std_custome13   = date('d-M-Y');
				 $newstd->std_custome15  = 1;
				 $newstd->std_custome19   = $accessdata->stdtype;
				 $newstd->accessdetails_no   = $accessdata->appno;
				 $newstd->stdprogramme_id  = DB::table('dept_options')->where('do_id', $accessdata->prog)->value('prog_id');
				  $newstd->stddepartment_id  = DB::table('dept_options')->where('do_id', $accessdata->prog)->value('dept_id');
				   $path = $request->file('image')->storeAs('public/photo', $photo); 
				   $newstd->save();
				
				//update portal access
				$affected = DB::table('portalaccess')
             				 	->where('pid', $accessid)
             				 	->update([
    							'status' => 1]);

		 //send mail
		 
	/**	 $dmail = strtolower($request->email);
		 $passkey = rtrim(ltrim($request->pwd));
		 $today = date("j/m/Y, H:m");
				
				$details = [  
						'title'=>'Your Account Info from COHESKAT Student Portal',
						'body'=>"Mail sent on $today",
						'info'=>"Your Account Info for COHESKAT Student Portal is as follows:",
						'email'=>$dmail,
						'passkey'=>$passkey,
						'appno'=>$accessdata->appno
						];
 			 
              Mail::to($dmail)->send(new MailNotifier($details));*///
			  
			$request->session()->forget(['accessid']);  
			  
 			echo '<script type="text/javascript">
			alert("Your Account has Been Successfully Created\nYour Account Info is as follows:\n Registration No: '.$accessdata->appno.'\nPassword: '.$request->pwd.'\nPlease note these down and do not share your password with anyone\nA copy of this information will be sent to your email address at '.$request->email.'\nIf you cannot find the email in your Inbox, do check your Spam");
			window.location = "/";
		</script>';
				
				
			}
			catch(Exception $e){
				return redirect('/start')->withInput()
			     ->withErrors(['Error Creating Account']);
			}
}
		}
		 
		}
	}
	

     
}
