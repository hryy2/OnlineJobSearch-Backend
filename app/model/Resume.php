<?php
namespace app\model;

use think\Model;
use TCPDF;

class Resume extends Model{
    protected $connection = 'user';
    
    protected $table = 'resume';

    protected $schema = [
        'id' => 'int',
        'name' => 'string',
        'email' => 'string',
        'phone' => 'string',
        'school' => 'string',
        'academic' => 'string',
        'major' => 'string',
        'dateEduSta' => 'string',
        'dateEduEnd' => 'string',
        'company' => 'string',
        'position' => 'string',
        'dateWorSta' => 'string',
        'dateWorEnd' => 'string',
        'evaluation' => 'string',
        'experience' => 'string',
        'userid' => 'int'
    ];

    public function AddUserid($user_id){
        if(Resume::where('userid', $user_id)->findOrEmpty()->isEmpty()){
            Resume::create(['userid' => $user_id]);
        }
    }

    public function AddResume($user_id, $Resume){
        Resume::where('userid', $user_id)->update($Resume);
    }



    public function ResContext($user_id){
        return Resume::where('userid', $user_id) -> find();
    }

     public function pdf($user_id){
        $context = Resume::where('userid', $user_id) -> find();
        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);;
        $pdf->AddPage();
        $pdf->setCreator(PDF_CREATOR);
        $pdf->SetTitle('Resume');
        $pdf->SetFont('times', '', 20);
        $pdf->Cell(0, 15, 'RESUME', 0, 1, 'C');
        $pdf->SetFillColor(200, 200, 200);
        $pdf->SetFont('times', '', 14);
        $pdf->Cell(0, 10, '----- PERSONAL INFORMATIOAN -----', 0, 1, 'C', 1);
        $pdf->MultiCell(70, 15, 'Name: '.$context['name'], 1, 'L', 0, 0);
        $pdf->MultiCell(120, 15, 'Phone: '.$context['phone'], 1,'L', 0, 1);
        $pdf->MultiCell(190, 15, 'E-mail: '.$context['email'], 1, 'L', 0, 1);
        $pdf->Cell(0, 10, '----- EDUCATION EXPERIENCE -----', 0, 1, 'C', 1);
        $pdf->MultiCell(80, 15, 'School: '.$context['school'], 1, 'L', 0, 0);
        $pdf->MultiCell(110, 15, 'Major: '.$context['major'], 1, 'L', 0, 1);
        $pdf->MultiCell(90, 15, 'Qualification: '.$context['academic'], 1, 'L', 0, 0);
        $pdf->MultiCell(100, 15, 'Date: From '.$context['dateEduSta'].' to '. $context['dateEduEnd'], 1, 'L', 0, 1);
        $pdf->Cell(0, 10, '----- WORK EXPERIENCE -----', 0, 1, 'C', 1);
        $pdf->MultiCell(80, 15, 'Company: '.$context['company'], 1, 'L', 0, 0);
        $pdf->MultiCell(110, 15, 'Position: '.$context['position'], 1, 'L', 0, 1);
        $pdf->MultiCell(190, 15, 'Working Time: From '.$context['dateWorSta'].' to '. $context['dateWorEnd'], 1, 'L', 0, 1);
        $pdf->MultiCell(190, 25, 'Individual Contribution: '.$context['evaluation'], 1, 'L', 0, 1);
        $pdf->Cell(0, 10, '-----SELF-EVALUATION-----', 0, 1, 'C', 1);
        $pdf->MultiCell(190, 35, $context['experience'], 1, 'L', 0, 1);

        $timestamp = time();
        $file_path = public_path('storage/pdf/' .$timestamp."-". $context['name'] . '.pdf');
        $pdf->Output($file_path, 'F');
        return  $timestamp. "-". $context['name'] . '.pdf';
    }
}
?>