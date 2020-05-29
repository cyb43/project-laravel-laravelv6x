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
use Illuminate\Support\Facades\Log;


/**
 * 事件广播
 * Class broadcastForEvent
 *
 * php artisan make:event BroadcastForEvent
 *
 * @package App\Events
 * @author ^2_3^王尔贝
 */
class BroadcastForEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * @var User
     * @author ^2_3^王尔贝
     */
    public $user;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct( User $user )
    {
        $this->user = $user;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        //// Channel 的实例 代表任何用户可以订阅的公共频道，PrivateChannels 和 PresenceChannels 实列代表需要频道授权( https://learnku.com/docs/laravel/6.x/broadcasting/5159#authorizing-channels )的私有频道。
        return new Channel('channel');
    }
}
