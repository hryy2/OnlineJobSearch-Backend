<?php
namespace app\validate;

use think\Validate;

class User extends Validate{

    protected $connection = 'user';
    
    protected $table = 'applicant';

    protected $rule = [
        'username' => 'require|max:25|alphaNum',
        'password' => ['require','regex' => '/^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*?]).*$/'],
    ];

    protected $message = [
        'username.require' => ['code' => 1001, 'message' => 'The user name cannot be empty.'],
        'username.max' => ['code' => 1002, 'message' => 'The user name cannot exceed 25 characters.'],
        'username.alphaNum' => ['code' => 1005, 'message' => 'The user name must contain letters or numbers'],
        'password.require' => ['code' => 1003, 'message' => 'The password cannot be empty.'],
        'password.regex' => ['code' => 1004, 'message' => 'The password must contain at least six characters, 
        including at least one uppercase letter, one lowercase letter, one number, and one special character(!@#$%^&*?).'],
    ]; 

    protected $scene = [
        'Login',
    ]; 

    public function sceneLogin(){
        return $this -> remove('name', 'max:25|alphaNum')
                     -> remove('password', 'regex');
    }
    
}
?>