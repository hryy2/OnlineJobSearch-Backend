<?php
namespace app\model;

use think\Model;

class Company extends Model{
    protected $connection = 'user';
    
    protected $table = 'company';

    protected $schema = [
        'id' => 'int',
        'company_name' => 'string',
        'address' => 'string',
        'contact_person' => 'string',
        'phone' => 'string',
        'email' => 'string',
        'userid' => 'int'
    ];

    public function AddUserid($user_id){
        if(Company::where('userid', $user_id)->findOrEmpty()->isEmpty()){
            Company::create(['userid' => $user_id]);
        }
    }

    public function AddCompany($user_id, $Company){
        Company::where('userid', $user_id) -> update($Company);
    }

    public function getCompany($user_id){
        return Company::where('userid', $user_id) -> find();
    }
}
?>