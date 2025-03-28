<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Route;


Route::get('think', function () {
    return 'hello,ThinkPHP6!';
});

Route::post('Register', 'Both.Start/Register')->allowCrossDomain();//注册

Route::post('Login', 'Both.Start/Login')->allowCrossDomain();//登录

Route::get('Search', 'Employee.JobSearch/Search')->allowCrossDomain();//工作搜索

Route::post('Resume', 'Employee.AddResume/Resume')->allowCrossDomain();//提交简历

Route::get('ResCon', 'Employee.AddResume/ResCon')->allowCrossDomain();//显示简历填写过的内容

Route::post('JobAdd', 'Employer.AddJob/Job')->allowCrossDomain();//添加工作

Route::get('RecomJob', 'Employee.JobSearch/recomJob')->allowCrossDomain();//工作推荐

//Route::get('ResCre/:user_id', 'Employee.AddResume/Create')->allowCrossDomain();//生成PDF

Route::get('GetJobDe', 'Employee.JobSearch/JobDetail')->allowCrossDomain();//显示工作的详细信息

Route::get('showJobs', 'Employer.AddJob/showJobs')->allowCrossDomain();//展示发布的所有工作

Route::post('Apply', 'Both.JobApply/Apply')->allowCrossDomain();//工作申请

Route::get('EmperApply', 'Both.JobApply/EmperApply')->allowCrossDomain();//工作展示求职者简历

Route::post('AddCompany', 'Employer.AddJob/addCompany')->allowCrossDomain();//添加公司信息

Route::get('EmpeeApply', 'Both.JobApply/EmpeeApply')->allowCrossDomain();//投递的所有工作

Route::post('ChangeStatus', 'Both.JobApply/ChangeStatus')->allowCrossDomain();//求职状态改变

Route::post('AddMessage', 'Both.Chat/addMessage')->allowCrossDomain();//发消息

Route::get('ShowMessage', 'Both.Chat/showMessage')->allowCrossDomain();//展示所有消息

Route::get('ShowProfile', 'Employee.AddResume/showProfile')->allowCrossDomain();//生成PDF

Route::get('DelProfile', 'Employee.AddResume/delProfile')->allowCrossDomain();//删除简历

Route::post('UploadResume', 'Employee.AddResume/uploadResume')->allowCrossDomain();

Route::get('ShowCompany', 'Employer.AddJob/showCompany')->allowCrossDomain();

?>