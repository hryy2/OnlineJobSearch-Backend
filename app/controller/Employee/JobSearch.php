<?php

namespace app\controller\Employee;

use app\BaseController;
use app\model\Job as JobModel;
use app\model\User as UserModel;
use app\model\Perference as PerferModel;
use think\facade\Request;

class JobSearch extends BaseController{
    
    public function Search(){
        if(request()->isAjax()){
            $token = Request::param(['token']);
            $token = $token['token'];
            $Search = Request::except(['token']);
            $Job = new JobModel;
            $User = new UserModel;
            if($User -> Verification($token)){
                $user_id = $User -> findID($token);
                $Joblist = $Job -> jobSearch($user_id, $Search);
            }else{
                $Joblist = $Job -> jobSea($Search);
            }
            if($Joblist == NULL){
                return json(['code' => 101, 'message' => 'No results fit the requirements', 'joblist' => $Joblist]);
            }else{
                return json(['code' => 102, 'joblist' => $Joblist]);
            }
        }else{
            return json(['code' => 1000, 'message' => 'An error occurred. Please try again later.']);
        }    
    }
    
    public function JobDetail(){
        $Job_id = Request::param();
        $Job = new JobModel;
        return $Job->getJob($Job_id);
    }

    public function recomJob(){
        $token = Request::param();
        $token = $token['token'];
        $User = new UserModel;
        $Job = new JobModel;
        if($User -> Verification($token)){
            $user_id = $User -> findID($token);
            $perfer = new PerferModel;
            $PERFER = $perfer -> showPerfer($user_id);
            $JobPer = $Job -> JobPerfer($PERFER);
            return json($JobPer);
        }else{
            return json($Job -> AllJob());
        }
    }
}

