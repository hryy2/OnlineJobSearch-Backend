<?php
namespace app\model;

use think\Model;
use app\model\Perference as PerferModel;

class Job extends Model{
    protected $connection = 'user';
    
    protected $table = 'job';

    protected $schema = [
        'id' => 'int',
        'jobName' => 'string',
        'address' => 'string',
        'category' => 'string',
        'jobtype' => 'string',
        'paytype' => 'string',
        'maxmoney' => 'double',
        'minmoney' => 'double',
        'description' => 'string',
        'summary' => 'string',
        'userid' => 'int'
    ];

    public function jobSearch($user_id, $Search){
        $map = [];
        $perfer = new PerferModel;
        if($Search["address"] <> ''){
            $map[] = ['address', '=', $Search["address"]];
            $perfer -> addPerfer($user_id, $Search["address"], 'address');
        }
        if($Search["category"] <> ''){
            $map[] = ['category', '=', $Search["category"]];
            $perfer -> addPerfer($user_id, $Search["category"], 'category');
        }
        if($Search["jobName"] <> ''){
            $map[] = ['jobName', 'like', '%' . $Search["jobName"] . '%'];
            $perfer -> addPerfer($user_id, $Search["jobName"], 'jobName');
        }
        $Joblist = Job::where($map)->Select()->toArray();
        return $Joblist;
    }

    public function jobSea($Search){
        $map = [];
        if($Search["address"] <> ''){
            $map[] = ['address', '=', $Search["address"]];
        }
        if($Search["category"] <> ''){
            $map[] = ['category', '=', $Search["category"]];
        }
        if($Search["jobName"] <> ''){
            $map[] = ['jobName', 'like', '%' . $Search["jobName"] . '%'];
        }
        $Joblist = Job::where($map)->Select()->toArray();
        return $Joblist;
    }

    public function JobAdd($user_id, $Job){
        $newJob = job::create(['userid' => $user_id]);
        $newJobId = $newJob->id;
        Job::where('id', $newJobId)->update($Job);
    }

    public function JobPerfer($PerJob) {
        if($PerJob['re'] == true) {
            $perJob = $PerJob['result'];
            $query = Job::where('id', '>', 0);
            if (!empty($perJob['perJobPla'])) {
                $query->whereIn('address', $perJob['perJobPla'], 'or');
            }
            if (!empty($perJob['perJobCag'])) {
                $query->whereIn('category', $perJob['perJobCag'], 'or');
            }
            if (!empty($perJob['perJobNam'])) {
                foreach ($perJob['perJobNam'] as $jobName) {
                    $query->where('jobName', 'like', '%' . $jobName . '%', 'or');
                }
            }
            $perjob = $query->Select()->toArray();
            return $perjob;
        } else {
            return Job::where('id', '>', 0)->select()->toArray();
        }
    }
    
    public function getJob($Job_id){
        return Job::where($Job_id) -> find();
    }

    public function AllJob(){
        return Job::where('id', '>', 0) -> Select() -> toArray();
    }

    public function showJobs($user_id){
        return Job::where('userid', $user_id) -> Select() -> toArray();
    }
}
?>