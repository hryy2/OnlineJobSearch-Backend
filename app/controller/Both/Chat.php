<?php

namespace app\controller\Both;

use app\BaseController;
use app\model\Message as MessageModel;
use think\facade\Request;

class Chat extends BaseController{

    public function addMessage(){   //add new message
        $message = Request::post();
        $mes = new MessageModel;
        $mes -> addMessage($message);
    }

    public function showMessage(){  //show all messages
        $sender_id = Request::param(['sender_id']);
        $receiver_id = Request::param(['receiver_id']);
        $message = new MessageModel;
        return $message -> showMessage($sender_id['sender_id'], $receiver_id['receiver_id']);
    }

    // public function changeIfLook(){
    //     $sender_id = Request::post(['sender_id']);
    //     $receiver_id = Request::post(['receiver_id']);
    //     $time = Request::post(['time']);
    //     $message = new MessageModel;
    //     $message -> changeIfLook($sender_id['sender_id'], $receiver_id['receiver_id'], $time);
    //     return $time;
    // }

    // public function ifMessage(){
    //     $sender_id = Request::param(['sender_id']);
    //     $receiver_id = Request::param(['receiver_id']);
    //     $message = new MessageModel;
    //     return $message -> ifMessage($sender_id['sender_id'], $receiver_id['receiver_id']);
    // }
}
?>