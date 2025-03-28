<?php

namespace app\controller\Employee;

use app\BaseController;
use app\model\Resume as ResumeModel;
use app\model\User as UserModel;
use app\model\Profile as ProfileModel;
use think\facade\Request;
use think\facade\Filesystem;

class AddResume extends BaseController{

    public function Resume(){
        $token = Request::header('Authorization');
        $Resume = Request::except(['resFile']);
        $User = new UserModel;
        $user_id = $User -> findID($token);
        $Res = new ResumeModel;
        $Res -> AddResume($user_id, $Resume);
        $Profile = new ProfileModel;
        $pdfname = $Res -> pdf($user_id);
        $baseUrl = 'http://localhost:81/ThinkPHP6/public/storage/pdf/';
        $pdfLink = $baseUrl.$pdfname;
        $Profile -> addProfile($user_id, $pdfname, $pdfLink);
        return json(['code' => 100, 'message' => 'Resume saves successfully.', 'pdfURL' => $pdfLink]); 
    }

    public function uploadResume(){
        $token = Request::header('Authorization');
        $User = new UserModel;
        $user_id = $User -> findID($token);
        $file = Request::file('File');
        $Filename = Filesystem::disk('public')->putFile('pdf', $file);
        $baseUrl = 'http://localhost:81/ThinkPHP6/public/storage/';
        $pdfLink = $baseUrl.$Filename;
        $Profile = new ProfileModel;
        return $Profile -> addProfile($user_id, basename($Filename), $pdfLink);
    }

    public function showProfile(){
        $token = Request::param();
        $token = $token['token'];
        $User = new UserModel;
        $user_id = $User -> findID($token);
        $Profile = new ProfileModel;
        return $Profile -> showProfile($user_id);
    }

    public function delProfile(){
        $id = Request::param();
        $Profile = new ProfileModel;
        if($Profile -> delProfile($id)){
            return json(['code' => 100, 'message' => 'Successfully deleted.']);
        }else{
            return json(['code' => 101, 'message' => 'Deletion failure.']);
        }
    }

    public function ResCon(){
        $token = Request::param();
        $token = $token['token'];
        $User = new UserModel;
        $user_id = $User -> findID($token);
        $Res = new ResumeModel;
        return $Res -> ResContext($user_id);
    }
}
?>