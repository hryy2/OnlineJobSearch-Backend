<?php
namespace app\model;

use think\Model;

class Apply extends Model{
    protected $connection = 'user';
    
    protected $table = 'apply';

    protected $autoWriteTimestamp = true;

    protected $schema = [
        'id' => 'int',
        'userid' => 'int',
        'jobid' => 'int',
        'status' => 'string',
        'profileid' => 'int',
        'create_time' => 'int',
        'update_time' => 'int'
    ];

    public function Apply($user_id, $job_id, $profileid){
        if(Apply::where($job_id)-> where('userid', $user_id)->findOrEmpty()->isEmpty()){
            Apply::create(['userid' => $user_id, 'jobid' => $job_id['jobid'], 'status' => 'Delivered', 'profileid' => $profileid['profileid']]);
            return true;
        }else{
            return false;
        }
    }

    public function showApply($job_id){
        return Apply::where("jobid", $job_id) -> Select() ->toArray();
    }

    public function showApp($user_id){  //obtain an employee all applications
        return Apply::where('userid', $user_id) -> Select() ->toArray();
    }

    public function changeStatus($apply_id, $status){
        Apply::where($apply_id) -> update($status);
    }
    
    public function applied($user_id, $job_id){
        return Apply::where("jobid",$job_id)
                    -> where('userid', $user_id) 
                    -> find();
    }

}
?> 