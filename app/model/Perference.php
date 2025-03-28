<?php
namespace app\model;

use think\Model;

class Perference extends Model{
    protected $connection = 'user';
    
    protected $table = 'perference';

    protected $autoWriteTimestamp = 'datetime';

    protected $schema = [
        'id' => 'int',
        'userid' => 'int',
        'context' => 'string',
        'type' => 'string'
    ];

    public function addPerfer($user_id, $context, $type){
        Perference::create([
            'userid' => $user_id,
            'context' => $context,
            'type' => $type
        ]);
    }

    public function showPerfer($user_id) {
        $preferences = Perference::where('userid', $user_id)
            ->whereIn('type', ['address', 'category', 'jobName'])
            ->Select()
            ->toArray();

        $perJob = [
            'perJobPla' => [],
            'perJobCag' => [],
            'perJobNam' => []
        ];
    
        if(empty($preferences)) {
            return ['re' => false, 'result' => $perJob];
        } else {
            foreach ($preferences as $preference) {
                if ($preference['type'] == 'address') {
                    $perJob['perJobPla'][] = $preference['context'];
                } else if ($preference['type'] == 'category') {
                    $perJob['perJobCag'][] = $preference['context'];
                } else if ($preference['type'] == 'jobName') {
                    $perJob['perJobNam'][] = $preference['context'];
                }
            }
            return ['re' => true, 'result' => $perJob];
        }
    }
    
    
}
?>