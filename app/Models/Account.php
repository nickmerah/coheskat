<?php

namespace App\Models;
 
use Illuminate\Database\Eloquent\Model;

class Account extends Model
{
 
	protected $table = 'login';
    public $timestamps = false;
	protected $primaryKey = 'log_id';
    protected $fillable = [
        'log_surname', 'log_firstname',   'log_username', 'log_email', 'log_password', 'log_programmeid',  'log_gsm' 
    ];
	
	
}  
