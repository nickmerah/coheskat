<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Http;
use App\Models\Account;
use App\Models\Student;
use Session;

class StudentController extends Controller
{
	
	 public function __construct(Request $request)
    {
		if(!$request->session()->exists('logid'))
        {
             echo '<script type="text/javascript">
			alert("What Exactly is your Wish!");
			window.location = "/login";
		</script>';
            exit(); 
        }else{
			 
			    $this->app_year = DB::table('_current_session')->where('status', 'current')->value('cs_session');
				$this->portalstatus = DB::table('portal_status')->value('p_status');
				 $this->latereg = DB::table('portal_status')->value('lr_status');   
			 
				
				$this->stdrecs = Student::where('std_logid', $request->session()->get('logid'))
							->leftJoin('dept_options', 'students_profile.stdcourse', '=', 'dept_options.do_id')
							->leftJoin('faculties', 'students_profile.stdfaculty_id', '=', 'faculties.faculties_id')
							->leftJoin('departments', 'students_profile.stddepartment_id', '=', 'departments.departments_id')
							->leftJoin('level', 'students_profile.std_custome1', '=', 'level.level_id')
							->leftJoin('state', 'students_profile.state_of_origin', '=', 'state.state_id')
							->leftJoin('lga', 'students_profile.local_gov', '=', 'lga.lga_id')
							->leftJoin('programme', 'students_profile.stdprogramme_id', '=', 'programme.programme_id')
							->first();
				 
		}
		
		
 
         
    }
	
	public function dashboard(Request $request)
    {
	  
	     if (Account::find($request->session()->get('logid'))) {
		   //get student details
		   $stdrecs        = $this->stdrecs;
		  //check if fees paid
		  $feespaid = DB::table('transaction')
							->where('user_id', $request->session()->get('logid'))
							->where('trans_custom1', 'Paid')
							->where('trans_year', $this->app_year)
							->where('trans_custom4', 'fees')
							->sum('trans_amount');  
		//check if other fees are paid
		 $ofeespaid = DB::table('transaction')
							->where('user_id', $request->session()->get('logid'))
							->where('trans_custom1', 'Paid')
							->where('trans_year', $this->app_year)
							->where('trans_custom4', 'ofees')
							->sum('trans_amount'); 
							
		//portal closing date
		$endreg = DB::table('schoolinfo')->value('appclosing');  
		
		 return view('students/home', ['stdrecs' =>   $stdrecs, 'amtpaid' =>   $feespaid, 'ofees' =>   $ofeespaid , 'endreg' =>   $endreg ]); 
		 }else{
			 
			return redirect('/studenthome')->withErrors(['Error: Student Record not found!']);    
		 }  
	}
	
	public function biodata(Request $request)
    {
	  
	     if (Account::find($request->session()->get('logid'))) {
			  //get student details
		 $stdrecs        = $this->stdrecs;
		 
		 return view('students/biodata', ['stdrecs' =>   $stdrecs]); 
		 }else{
			 return redirect('/studenthome')->withErrors(['Error: Student Record not found!']);    
			 
		 }
 
	}
	
	
	public function payfees(Request $request)
    {
	  
	     if (Account::find($request->session()->get('logid'))) {
		 //get student details
		 $stdrecs        = $this->stdrecs;
		 $newreturn = $stdrecs->std_custome19;
		 
		 
		 if( $stdrecs->state_of_origin == 20){
			 $nationcat = 1;
		 }else{
			  $nationcat = 2;
		 }
		 
		 //if portal is closed
		 
		 
		 //if latereg is enabled
		 if ($this->latereg == 0) {
		 $latereg = "17";
		 $sign = "!=";
		 }else{
			  $latereg = "0";
			  $sign = "!=";
		 }
		// DB::enableQueryLog(); 
		 $feeschedule = DB::table('fees_amt_pass')
							->join('field_pass', 'field_pass.field_id', '=', 'fees_amt_pass.item_id')
							->where('sessionyear_id', $this->app_year)
							->where ('item_id', $sign, $latereg)
							->where('prog_id', $stdrecs->stdprogramme_id)
							->where(function ($query)  use ($newreturn) {
              				 $query->where('new_return', '=', 'general')
                    				 ->orWhere('new_return', '=', $newreturn);})
							->where(function ($query)  use ($nationcat) {
              				 $query->where('nation_catid', '=', 0)
                    				 ->orWhere('nation_catid', '=', $nationcat);})
							->get(); 
		//dd(DB::getQueryLog());   
		 return view('students/fees', ['stdrecs' =>   $stdrecs, 'feeschedules' =>   $feeschedule]); 
		 }else{
			 return redirect('/studenthome')->withErrors(['Error: Student Record not found!']);    
			 
		 }
 
	}
	
	public function payfeenow(Request $request)
    {
	  if (Account::find($request->session()->get('logid'))) {
		 //get student details
		 $stdrecs        = $this->stdrecs;
		 $newreturn = $stdrecs->std_custome19;
 
		 if( $stdrecs->state_of_origin == 20){
			 $nationcat = 1;
		 }else{
			  $nationcat = 2;
		 }
		 
		 //if latereg is enabled
		 if ($this->latereg == 0) {
		 $latereg = "17";
		 $sign = "!=";
		 }else{
			  $latereg = "0";
			  $sign = "!=";
		 }
		
		 $feeschedule = DB::table('fees_amt_pass')
							->join('field_pass', 'field_pass.field_id', '=', 'fees_amt_pass.item_id')
							->where('sessionyear_id', $this->app_year)
							->where ('item_id', $sign, $latereg)
							->where('prog_id', $stdrecs->stdprogramme_id)
							->where(function ($query)  use ($newreturn) {
              				 $query->where('new_return', '=', 'general')
                    				 ->orWhere('new_return', '=', $newreturn);})
							->where(function ($query)  use ($nationcat) {
              				 $query->where('nation_catid', '=', 0)
                    		         ->orWhere('nation_catid', '=', $nationcat);})
							->get(); 
							$totalAmount = 0;
							$fname ="$stdrecs->surname $stdrecs->firstname $stdrecs->othernames";
					//echo  config("constants.MERCHANTID"); exit;	
					foreach ($feeschedule as $ftot) {
						$totalAmount += $ftot->amount;
					}
					 $processingfee = 453;
				     $total = $totalAmount + $processingfee;
					 
					if ($total > 20000){
						$servicetypeID = config("constants.SERVICETYPEID_ecollection");
					}else{
						$servicetypeID = config("constants.SERVICETYPEID_processing");
					}
					$merchantId = config("constants.MERCHANTID");
					$timesammp=DATE("dmyHis");		
					$orderID = $timesammp;
					$payerName = $fname;
					$payerEmail =  $stdrecs->student_email;
					$payerPhone =  $stdrecs->student_mobiletel;
					$responseurl = config("constants.PATH") . "/remitaresponse";
					$hash_string = config("constants.MERCHANTID") . $servicetypeID . $orderID . $total . config("constants.APIKEY");;
					$hash = hash('sha512', $hash_string);
					$itemtimestamp = $timesammp;
					//The JSON data.


					$itemid1="itemid1";
					$itemid2="itemid2";
 
					$beneficiaryName="KATSINA STATE COLLEGE OF HEALTH SCIENCES";
					$beneficiaryName2="Atarah Consulting and Mentoring";
 

					$beneficiaryAccount="2014556661";
					$beneficiaryAccount2="0061171696";
 

					$bankCode="011";
					$bankCode2="232";
 

				
 
				$beneficiaryAmount = $totalAmount;
				$beneficiaryAmount2 =  $processingfee;

				$deductFeeFrom=0;
				$deductFeeFrom2=1;

//The JSON data.
				header('Content-type: application/json');

 				$content = '{"serviceTypeId":"'.$servicetypeID
							.'"'.",".'"amount":"'.$total
							.'","orderId":"'.$orderID
							.'"'.',"payerName":"'. $payerName
							.'"'.',"payerEmail":"'.$payerEmail
							.'"'.",".'"payerPhone":"'.$payerPhone
							.'","lineItems":[
							{"lineItemsId":"'.$itemid1.'","beneficiaryName":"'.$beneficiaryName.'","beneficiaryAccount":"'.				$beneficiaryAccount.'","bankCode":"'.$bankCode.'","beneficiaryAmount":"'.$beneficiaryAmount.'","deductFeeFrom":"'.$deductFeeFrom.				'"},
							{"lineItemsId":"'.$itemid2.'","beneficiaryName":"'.$beneficiaryName2.'","beneficiaryAccount":"'.$beneficiaryAccount2.'","bankCode":"'.$bankCode2.'","beneficiaryAmount":"'.$beneficiaryAmount2.'","deductFeeFrom":"'.$deductFeeFrom2.'"}
]}';	  

 

 $curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => config("constants.GATEWAYURL"),
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_SSL_VERIFYPEER => false,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => $content,
  CURLOPT_HTTPHEADER => array(
    "Authorization: remitaConsumerKey=$merchantId,remitaConsumerToken=$hash",
    "Content-Type: application/json",
    "cache-control: no-cache"
  ),
));

$json_response = curl_exec($curl);
$err = curl_error($curl);
curl_close($curl);
$jsonData = substr($json_response, 7, -1);
$response = json_decode($jsonData, true);

if (empty($response)) {
		return redirect('/studenthome')->withErrors(['Error Generating RRR!']); 
}else{
	$statuscode = $response['statuscode'];
}



$statusMsg = $response['status'];
if($statuscode=='025'){
$rrr = trim($response['RRR']);
}else{
	return redirect('/studenthome')->withErrors(['Error Generating RRR!']);    
	
}
							
							$fdate = date('Y-m-d h:i:s');
		                    $tdate = date('Y-m-d');
	      //add multiple
		  foreach ($feeschedule as $fschedule) {
		  $savetrans[]  = [
   				 'user_id' => $request->session()->get('logid'),
				 'trans_name' => $fschedule->field_name,
    			'trans_no' => $rrr,
    			'user_department' => $stdrecs->stddepartment_id,
    			'user_faculty' => $stdrecs->stdfaculty_id,
				'trans_amount' => $fschedule->amount,
				'generated_date' => $fdate,
				'trans_date' => $fdate,
				't_date' => $tdate,
				'trans_semester' => 'First Semester',
				'trans_year' => $this->app_year,
				'trans_custom1' => 'Pending',   
				'trans_custom3' => $stdrecs->std_custome1, 
				'trans_custom4' => 'fees',
				'trans_custom7' => $stdrecs->stdprogramme_id, 
				'trans_custom8' => $fname, 	 
				'trans_custom10' => $stdrecs->programme_option, 
				'trans_custom11' => $stdrecs->faculties_name, 
				'trans_custom12' => $stdrecs->departments_name, 			 
				'trans_custom14' => $stdrecs->matric_no, 
				'trans_custom15' => 'Remita', 
				'trans_custom17' => $stdrecs->student_email,  
				'trans_custom19' => $fschedule->item_id, 
				'trans_custom20' => $rrr 
					];
						   
		  }
		  
		   DB::table('transaction')->insert($savetrans);
		   return redirect()->route('paymentslip', ['rrr' => $rrr]);
		  
		 }else{
			 return redirect('/studenthome')->withErrors(['Error: Student Record not found!']);  
			  
		 }
	    
 
	}
	
	public function paymentslip(Request $request, $rrr)
    {
		
		if (!empty($rrr)) {
			
	    $stdrecs        = $this->stdrecs;
		$transdatas = DB::table('transaction')
					->where('trans_no', $rrr)
					->where('trans_custom1', 'Pending')
					->select('user_id', 'trans_custom14','trans_year','trans_amount', 'trans_no','trans_custom8', 'trans_name', 'trans_custom17', 'generated_date' )->get();  
		
		if($transdatas->isEmpty()) {
			 return redirect('/studenthome')->withErrors(['Error: Invalid RRR!']);  
			 
		}else{
			return view('students/payslip', ['stdrecs' =>   $stdrecs, 'transdatas' =>   $transdatas]); 
		}
		
		}else{
			return redirect('/studenthome');
		}
	}
	
	public function remitaresponse(Request $request, $rrr)

    {	
			 $orderId = $rrr;
			  
				  $mert =  config("constants.MERCHANTID");
				  $api_key =  config("constants.APIKEY");
				  $concatString = $orderId . $api_key . $mert;
		          $hash = hash('sha512', $concatString);
		          $url 	= config("constants.CHECKSTATUSURL") . '/' . $mert  . '/' . $orderId . '/' . $hash . '/' . 'status.reg';
				  $ch = curl_init();
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				curl_setopt($ch, CURLOPT_URL,$url);
				$result=curl_exec($ch);
				curl_close($ch);
				$response = json_decode($result, true);
				$response_code = $response['status'];
				$response_message = $response['message'];
				if($response_code == '01' || $response_code == '00') { 
				 $drrr = $response['RRR'];
				 $orderId = $response['orderId'];
				 $ttime = $response['transactiontime'];
				 $payment_date = date('Y-m-d H:i:s');
				$pt_date  = date("Y-m-d", strtotime($payment_date));
				 
				$affected = DB::table('transaction')
             				 ->where('trans_no', $drrr)
							 ->where('trans_custom1', 'Pending')
             				 ->update(['trans_custom1' => 'Paid', 'trans_date' => $payment_date, 't_date'  => $pt_date]);
	 
 
				return redirect()->route('paymentreceipt', ['rrr' => $drrr]);

				
				
			}else{
		 return redirect('/studenthome')->withErrors(['"'.$response_message.'"']);  
		 
 
		} 
	 
	 
    } 
	
	
	public function payreceipt(Request $request, $rrr)
    {
		
		if (!empty($rrr)) {
			
	    $stdrecs        = $this->stdrecs;
		$transdatas = DB::table('transaction')
					->where('trans_no', $rrr)
					->where('trans_custom1', 'Paid')
					->select('user_id', 'trans_custom14','trans_year','trans_amount', 'trans_no','trans_custom8', 'trans_name', 'trans_custom17', 'generated_date', 'trans_custom11', 'trans_custom12', 'trans_custom10' )->get();  
			if ($transdatas->isEmpty()){
			return redirect('/studenthome')->withErrors('error',"Invalid RRR");
		}else{
			      return view('students/receipt', ['stdrecs' =>   $stdrecs, 'transdatas' =>   $transdatas]);
		}		
			 
			 return redirect('/studenthome')->withErrors(['Error: RRR not Found!']); 
       
		}else{
		}
	}
	
	public function payhistory(Request $request)
    {
		
	    $stdrecs        = $this->stdrecs;
		DB::statement("SET SQL_MODE=''");
		$transdatas = DB::table('transaction')
					->where('user_id', $request->session()->get('logid'))
					->where('trans_custom1', 'Paid')
					->groupBy('trans_no')
					->select('trans_year',   'trans_no', 'trans_custom4', 'trans_date', DB::raw("SUM(trans_amount) as trans_amount") )->get();  
					 
			if ($transdatas->isEmpty()){
			return redirect('/studenthome')->withErrors(['Error: No Transaction(s) Found']); 
		}else{
			      return view('students/payhistory', ['stdrecs' =>   $stdrecs, 'transdatas' =>   $transdatas]);
		}		
			 
              
	}
	
	
	public function pendinghistory(Request $request)
    {
		
	    $stdrecs        = $this->stdrecs;
		DB::statement("SET SQL_MODE=''");
		$transdatas = DB::table('transaction')
					->where('trans_custom1', 'Pending')
					->where('user_id', $request->session()->get('logid'))
					->groupBy('trans_no')
					->select('trans_year','trans_custom4' , DB::raw("SUM(trans_amount) as trans_amount"), 'trans_no',  'trans_date' )->get();  
			 
			if ($transdatas->isEmpty()){
			return redirect('/studenthome')->withErrors(['Error: No Transaction(s) Found']);  
		}else{
			      return view('students/pendinghistory', ['stdrecs' =>   $stdrecs, 'transdatas' =>   $transdatas]);
		}		
			 
              
	}
	
	
	public function payofee(Request $request)
    {
	  
	     if (Account::find($request->session()->get('logid'))) {
		 //get student details
		 $stdrecs        = $this->stdrecs;
		 $progid = $stdrecs->stdprogramme_id;
		  $ofees = DB::table('ofield')
						    ->where('of_status', 1)
							->where(function ($query)  use ($progid) {
              				 $query->where('of_prog', '=', 0)
                    				 ->orWhere('of_prog', '=', $progid);})
							->get(); 
		  
		 
		 return view('students/ofee', ['stdrecs' =>   $stdrecs, 'ofees' =>   $ofees]); 
		 }else{
			 
			  return redirect('/studenthome')->withErrors(['Error: Student Record not found!']); 
			 
		 }
 
	}
	
public function payofeenow(Request $request, $id)
    {
	  if (Account::find($request->session()->get('logid'))) {
		 //get student details
		 $stdrecs        = $this->stdrecs;
			
		 $ofees = DB::table('ofield')
						    ->where('of_status', 1)
							->where('of_id', $id)
							->get(); 
							$fname ="$stdrecs->surname $stdrecs->firstname $stdrecs->othernames";
					
		 	         $totalAmount = 	$ofees[0]->of_amount;	
					 $processingfee = 453;
				     $total = $totalAmount + $processingfee;
					 
					if ($total > 20000){
						$servicetypeID = config("constants.SERVICETYPEID_ecollection");
					}else{
						$servicetypeID = config("constants.SERVICETYPEID_processing");
					}
					$merchantId = config("constants.MERCHANTID");
					$timesammp=DATE("dmyHis");		
					$orderID = $timesammp;
					$payerName = $fname;
					$payerEmail =  $stdrecs->student_email;
					$payerPhone =  $stdrecs->student_mobiletel;
					$responseurl = config("constants.PATH") . "/remitaresponse";
					$hash_string = config("constants.MERCHANTID") . $servicetypeID . $orderID . $total . config("constants.APIKEY");;
					$hash = hash('sha512', $hash_string);
					$itemtimestamp = $timesammp;
				
					$itemid1="itemid1";
					$itemid2="itemid2";
 
					$beneficiaryName="KATSINA STATE COLLEGE OF HEALTH SCIENCES";
					$beneficiaryName2="Atarah Consulting and Mentoring";
 
					$beneficiaryAccount="2014556661";
					$beneficiaryAccount2="0061171696";

					$bankCode="011";
					$bankCode2="232";

				$beneficiaryAmount = $totalAmount;
				$beneficiaryAmount2 =  $processingfee;

				$deductFeeFrom=0;
				$deductFeeFrom2=1;

//The JSON data.
				header('Content-type: application/json');

 				$content = '{"serviceTypeId":"'.$servicetypeID
							.'"'.",".'"amount":"'.$total
							.'","orderId":"'.$orderID
							.'"'.',"payerName":"'. $payerName
							.'"'.',"payerEmail":"'.$payerEmail
							.'"'.",".'"payerPhone":"'.$payerPhone
							.'","lineItems":[
							{"lineItemsId":"'.$itemid1.'","beneficiaryName":"'.$beneficiaryName.'","beneficiaryAccount":"'.				$beneficiaryAccount.'","bankCode":"'.$bankCode.'","beneficiaryAmount":"'.$beneficiaryAmount.'","deductFeeFrom":"'.$deductFeeFrom.				'"},
							{"lineItemsId":"'.$itemid2.'","beneficiaryName":"'.$beneficiaryName2.'","beneficiaryAccount":"'.$beneficiaryAccount2.'","bankCode":"'.$bankCode2.'","beneficiaryAmount":"'.$beneficiaryAmount2.'","deductFeeFrom":"'.$deductFeeFrom2.'"}
]}';	  

 

 $curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => config("constants.GATEWAYURL"),
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_SSL_VERIFYPEER => false,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => $content,
  CURLOPT_HTTPHEADER => array(
    "Authorization: remitaConsumerKey=$merchantId,remitaConsumerToken=$hash",
    "Content-Type: application/json",
    "cache-control: no-cache"
  ),
));

$json_response = curl_exec($curl);
$err = curl_error($curl);
curl_close($curl);
$jsonData = substr($json_response, 7, -1);
$response = json_decode($jsonData, true);
if (empty($response)) {
		return redirect('/studenthome')->withErrors(['Error Generating RRR!']); 
}else{
	$statuscode = $response['statuscode'];
}

 
$statusMsg = $response['status'];
if($statuscode=='025'){
$rrr = trim($response['RRR']);
}else{
	
	  return redirect('/studenthome')->withErrors(['Error Generating RRR']); 
	 
}
							
							$fdate = date('Y-m-d h:i:s');
		                    $tdate = date('Y-m-d');
	      //add multiple
		  foreach ($ofees as $fschedule) {
		  $savetrans[]  = [
   				 'user_id' => $request->session()->get('logid'),
				 'trans_name' => $fschedule->ofield_name,
    			'trans_no' => $rrr,
    			'user_department' => $stdrecs->stddepartment_id,
    			'user_faculty' => $stdrecs->stdfaculty_id,
				'trans_amount' => $fschedule->of_amount,
				'generated_date' => $fdate,
				'trans_date' => $fdate,
				't_date' => $tdate,
				'trans_semester' => 'First Semester',
				'trans_year' => $this->app_year,
				'trans_custom1' => 'Pending',   
				'trans_custom3' => $stdrecs->std_custome1, 
				'trans_custom4' => 'ofees',
				'trans_custom7' => $stdrecs->stdprogramme_id, 
				'trans_custom8' => $fname, 	 
				'trans_custom10' => $stdrecs->programme_option, 
				'trans_custom11' => $stdrecs->faculties_name, 
				'trans_custom12' => $stdrecs->departments_name, 			 
				'trans_custom14' => $stdrecs->matric_no, 
				'trans_custom15' => 'Remita', 
				'trans_custom17' => $stdrecs->student_email,  
				'trans_custom19' => $fschedule->of_id, 
				'trans_custom20' => $rrr 
					];
						   
		  }
		  
		   DB::table('transaction')->insert($savetrans);
		   return redirect()->route('paymentslip', ['rrr' => $rrr]);
		  
		 }else{
			 return redirect('/studenthome')->withErrors(['Error: Student Record not found!']); 
			 
		 }
	    
 
	}	
	
	public function logout(Request $request)
    {
	  
	     $request->session()->forget('logid');
		 Session::flush();
		 return redirect('/')->withErrors(['Your logout was successfully']);
 
	}
     
}
