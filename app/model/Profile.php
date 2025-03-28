<?php
namespace app\model;

use think\Model;

class Profile extends Model{
    protected $connection = 'user';
    
    protected $table = 'profile';

    protected $autoWriteTimestamp = true;

    protected $schema = [
        'id' => 'int',
        'userid' => 'int',
        'pdfLink' => 'string',
        'pdfname' => 'string',
        'create_time' => 'int',
        'update_time' => 'int'
    ];

    public function addProfile($user_id, $pdfname, $pdfLink){
        $profile = Profile::create(['userid' => $user_id, 'pdfname' => $pdfname, 'pdfLink' => $pdfLink]);
        return $profile['id'];
    }

    public function showProfile($user_id){
        return Profile::where('userid', $user_id)->Select()->toArray();
    }

    public function Profile($id){
        return Profile::where('id', $id) -> find();
    }

    public function delProfile($id){
        $filePath = Profile::where($id)->value('pdfLink');
        $parsedUrl = parse_url($filePath);
        $localPath = str_replace('/ThinkPHP6/public/', '', $parsedUrl['path']);
        if (unlink($localPath)) {
            Profile::where($id) -> delete();
            return true;
        }else{
            return false;
        }
    }

}
?>