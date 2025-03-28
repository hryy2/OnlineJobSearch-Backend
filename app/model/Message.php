<?php
namespace app\model;

use think\Model;

class Message extends Model{
    protected $connection = 'user';
    
    protected $table = 'message';

    protected $autoWriteTimestamp = true;

    protected $createTime = 'send_time';

    protected $schema = [
        'id' => 'int',
        'sender_id' => 'int',
        'receiver_id' => 'int',
        'ifLook' => 'int',
        'message_content' => 'string',
        'send_time' => 'int',
    ];

    public function addMessage($message){   //add new message
        $message['ifLook'] = false;
        Message::create($message);
    }

    public function showMessage($sender_id, $receiver_id){  //show all messages
        $senderMessages = Message::where('sender_id', $sender_id)
                        ->where('receiver_id', $receiver_id)
                        ->Select()
                        ->toArray();

        $receiverMessages = Message::where('sender_id', $receiver_id)
                        ->where('receiver_id', $sender_id)
                        ->Select()
                        ->toArray();

        $mergedMessages = array_merge($senderMessages, $receiverMessages);

        usort($mergedMessages, function($a, $b) {
            return $a['id'] - $b['id'];
        });
       
        return $mergedMessages;
    }

    // public function ifMessage($sender_id, $receiver_id){
    //     if(Message::where('sender_id', $receiver_id)->where('receiver_id', $sender_id)->where('ifLook', false)->findOrEmpty()->isEmpty()){
    //         return true;
    //     }else{
    //         return false;
    //     }
    // }

    // public function changeIfLook($sender_id, $receiver_id, $time){
    //     Message::where('sender_id', $receiver_id)->where('receiver_id', $sender_id)->update(['ifLook' => true]);
    // }
}
?>