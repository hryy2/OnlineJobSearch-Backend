<?php
namespace app\model;

use think\Model;

class User extends Model{
    protected $connection = 'user';
    
    protected $table = 'applicant';

    protected $schema = [
        'id' => 'int',
        'username' => 'string',
        'password' => 'string',
        'role' => 'string',
        'token' => 'string'
    ];

    public function register($data){
        if(User::where('username', $data['username'])->findOrEmpty()->isEmpty()){
            User::create($data);
            return true;
        }else{
            return false;
        }
    }

    public function login($data){
        if(User::where('username', $data['username'])->value('password') == $data['password']){
            return true;
        }else{
            return false;
        }
    }

    public function getUserID($data){
        return User::where('username', $data['username'])->value('id');
    }

    public function Verification($token){
        if($token == "NO_TOKEN"){
            return false;
        } else {
            $user = User::where('token', $token);
            if($user === NULL){ // 如果未找到匹配的用户
                return false;
            }else {
                return true;
            }
        }
    }

    public function getRole($data){
        return User::where('username', $data['username'])->value('role');
    }

    public function updataVer($user_id, $token){
        User::where('id', $user_id)->update(['token' => $token]);
    }

    public function findID($token){
        return User::where('token', $token)->value('id');
    }
}
?>