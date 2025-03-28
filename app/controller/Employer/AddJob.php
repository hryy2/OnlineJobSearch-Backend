<?php

namespace app\controller\Employer;

use app\BaseController;
use app\model\Job as JobModel;
use app\model\User as UserModel;
use app\model\Company as CompanyModel;
use think\facade\Request;

class AddJob extends BaseController{

    public function Job(){
            $token = Request::header('Authorization');
            $Job = Request::post();
            $User = new UserModel;
            $user_id = $User -> findID($token);
            $JOBADD = new JobModel;
            $JOBADD -> JobAdd($user_id, $Job);
            return json(['code' => 100, 'message' => 'Job adds successfully.']);
     
    }

    public function showJobs(){
        $token = Request::param(['token']);
        $token = $token['token'];
        $User = new UserModel;
        $user_id = $User -> findID($token);
        $Job = new JobModel;
        $jobs = $Job -> showJobs($user_id);
        return json($jobs);
    }
    
    public function addCompany(){
        $token = Request::header('Authorization');
        $Company = Request::post();
        $User = new UserModel;
        $user_id = $User -> findID($token);
        $com = new CompanyModel;
        $com -> addCompany($user_id, $Company);
        return json(['code' => 100, 'message' => 'Company information saves successfully.']); 
    }

    public function showCompany(){
        $token = Request::param(['token']);
        $token = $token['token'];
        $User = new UserModel;
        $user_id = $User -> findID($token);
        $com = new CompanyModel;
        return $com -> getCompany($user_id);
    }

}