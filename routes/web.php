<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AccountController;
use App\Http\Controllers\StudentController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 
});*/

Route::get('/', function () {
	  $endreg = DB::table('schoolinfo')->value('appclosing');  
	  $marq = DB::table('schoolinfo')->value('maq');
    return view('login', ['endregdate' => $endreg, 'maq' => $marq]);
});

Route::post('/dologin', [AccountController::class, 'login'])->name('dologin')->middleware('XssSanitization');

Route::get('/start', function () {
    return view('verifi');
});

Route::post('/doverify', [AccountController::class, 'verify'])->name('doverify')->middleware('XssSanitization');

Route::get('/vreg',[AccountController::class, 'viewaccess'])->name('viewaccess');

Route::post('/createacct',[AccountController::class, 'store'])->name('createacct');

Route::get('/fpass', function () {
    return view('forgotpass');
});


 
Route::get('/studenthome',[StudentController::class, 'dashboard'])->name('dashboard');
 
Route::get('/profile',[StudentController::class, 'biodata'])->name('biodata');

Route::get('/payfees',[StudentController::class, 'payfees'])->name('payfees');
 
Route::post('/paynow',[StudentController::class, 'payfeenow'])->name('paynow');

Route::get('paymentslip/{rrr}', [StudentController::class, 'paymentslip'])->name('paymentslip');

Route::get('remitaresponse/{rrr}', [StudentController::class, 'remitaresponse'])->name('remitaresponse');

Route::get('paymentreceipt/{rrr}', [StudentController::class, 'payreceipt'])->name('paymentreceipt');

Route::get('/transactions',[StudentController::class, 'payhistory'])->name('payhistory');

Route::get('/requery',[StudentController::class, 'pendinghistory'])->name('pendinghistory');

Route::get('/payofees',[StudentController::class, 'payofee'])->name('payofee');

Route::get('payofeenow/{id}', [StudentController::class, 'payofeenow'])->name('payofeenow');

 
Route::get('/signoff',[StudentController::class, 'logout'])->name('logout');