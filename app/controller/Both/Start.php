<?php

namespace app\controller\Both;

use app\BaseController;
use app\model\User as UserModel;
use app\model\Resume as ResumeModel;
use app\validate\User as UserValidate;
use think\exception\ValidateException;
use think\facade\Request;

class Start extends BaseController{

    public function Register(){
        $token = Request::header('Authorization');
        if(request()->isAjax()){
            $data = Request::post();
            try {
                validate(UserValidate::class) -> check($data);
                $User = new UserModel;
                if($User -> register($data)){
                    $token = md5(uniqid(rand(), true));
                    $User_id = $User -> getUserID($data);
                    $User -> updataVer($User_id, $token);
                    if($data['role'] == 'Employee'){
                        $Res = new ResumeModel;
                        $Res -> AddUserid($User_id);
                    }
                    return json(['code' => 1010, 'message' => 'Register and login successfully.', 'token' => $token, 'username' => $data['username'], 'role' => $data['role']]);
                }else{
                    return json(['code' => 1006, 'message' => 'The user name already exists.']);
                }
            } catch (ValidateException $e) {
                return $e->getError();
            }
        }else{
            return json(['code' => 1000, 'message' => 'An error occurred. Please try again later.']);
        }
    }

    public function Login(){
        if(request()->isAjax()){
            $data = Request::post();
            try {
                validate(UserValidate::class) -> scene('login') -> check($data);
                $User = new UserModel();
                if($User -> login($data)){
                    $token = md5(uniqid(rand(), true));
                    $User -> updataVer($User -> getUserID($data), $token);
                    $role = $User -> getRole($data);
                    return json(['code' => 1010, 'message' => 'Login successfully.', 'token' => $token, 'username' => $data['username'], 'role' => $role]);
                }else{
                    return json(['code' => 1007, 'message' => 'The account or password is incorrect.']);
                }
            } catch (ValidateException $e) {
                return $e->getError();
            }
        }else{
            return json(['code' => 1000, 'message' => 'An error occurred. Please try again later.']);
        }
    }

}