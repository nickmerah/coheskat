<?php

namespace App\Models;
 
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
 
	protected $table = 'students_profile';
    public $timestamps = false;
	protected $primaryKey = 'std_id';
    protected $fillable = [
      'std_logid',  'matric_no', 'surname',   'firstname', 'student_email', 'student_mobiletel', 'stdprogramme_id',  'std_custome1' 
    ];
	
	
}  
