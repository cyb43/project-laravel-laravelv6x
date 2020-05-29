<?php

namespace App\Events;

use App\User;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

/**
 * ^2_3^ 广播事件
 * https://learnku.com/docs/laravel/6.x/broadcasting/5159
 * Class BroadcastEvent
 * @package App\Events
 */
class BroadcastDemoEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * 用户
     * @var User
     * @author ^2_3^王尔贝
     */
    public $user;

    /**
     * 要放置事件的队列的名称。
     * php artisan queue:work --queue=broadcast
     * @var string
     */
    //public $broadcastQueue = 'broadcast';

    /**
     * 广播事件名称
     *
     * 如果你通过 broadcastAs 方法自定义广播名称，你应该确保使用了一个前导的 . 字符，注册了你的监听器。
     * 这将指示 Echo 不要将应用程序的命名空间添加到事件中。
     *
     * @return string
     */
//    public function broadcastAs()
//    {
//        return 'broadcast.broadcastDemoEvent';
//    }

    /**
     * 获取广播数据
     *
     * @return array
     */
//    public function broadcastWith()
//    {
//        return ['id' => $this->user->id];
//    }

    /**
     * 确定事件是否要被广播
     *
     * @return bool
     */
    public function broadcastWhen()
    {
        return true;
    }

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(User $user)
    {
        $this->user = $user;
    }

    /**
     * 广播频道
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        // Channel 的实例 代表任何用户可以订阅的公共频道，PrivateChannels 和 PresenceChannels 实列代表需要频道授权( https://learnku.com/docs/laravel/6.x/broadcasting/5159#authorizing-channels )的私有频道。

        return new Channel('channel');
    }
}
