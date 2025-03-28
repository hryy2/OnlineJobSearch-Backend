<?php

namespace app\controller\Both;

use app\BaseController;
use app\model\User as UserModel;
use app\model\Apply as ApplyModel;
use app\model\Job as JobModel;
use app\model\Resume as ResumeModel;
use app\model\Company as CompanyModel;
use app\model\Profile as ProfileModel;
use think\facade\Request;

class JobApply extends BaseController{

    public function Apply(){
        $token = Request::header('Authorization');
        $User = new UserModel;
        if($User -> Verification($token)){
            $user_id = $User -> findID($token);
            $job_id = Request::post(['jobid']);
            $profileid = Request::post(['profileid']);
            $Apply = new ApplyModel;
            if($Apply -> Apply($user_id, $job_id, $profileid)){
                return json(['code' => 10, 'message' => 'Application approved.']);
            }else{
                return json(['code' => 12, 'message' => 'You have already delivered the job.']);
            }
        }else{
            return json(['code' => 11, 'message' => 'Please log in first.']);
        }
    }

    public function EmpeeApply(){   //Employee application tracking
        $token = Request::param();
        $token = $token['token'];
        $User = new UserModel;
        $user_id = $User -> findID($token);
        $Apply = new ApplyModel;
        $appJobs = $Apply -> showApp($user_id);
        $result = [];
        foreach($appJobs as $appData){
            $company = new CompanyModel;
            $job = new JobModel;
            $jobdetail = $job -> getJob(['id' => $appData['jobid']]);
            //return $jobdetail;
            $result[] = ['job' => $jobdetail, 
                        'company' => $company -> getCompany($jobdetail['userid']), 
                        'status' => $Apply -> applied($user_id, $appData['jobid'])
                        ];
        }
        return json($result);
    }

    public function EmperApply(){
        $job_id = Request::param();
        $job_id = $job_id["jobid"];
        $Apply = new ApplyModel;
        $JobsAppID = $Apply -> showApply($job_id);
        $result = [];
        foreach($JobsAppID as $appData){
            $resume = new ResumeModel;
            $Profile = new ProfileModel;
            $result[] = ['resume' => $resume -> ResContext($appData['userid']), 
                         'status' => $Apply -> applied($appData['userid'], $job_id),
                         'pdfURL' => $Profile -> Profile($appData['profileid']),
                        ];
        }
        return json($result);
    }

    public function ChangeStatus(){
        $apply_id = Request::except(['status']);
        $status = Request::post(['status']);
        $Apply = new ApplyModel;
        $Apply -> changeStatus($apply_id, $status);
        return json(['code' => 10, 'message' => 'Status change success.']);
    }
}