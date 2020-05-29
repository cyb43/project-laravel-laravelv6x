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
 * [私有频道]广播事件
 * Class BroadcastForPrivateEvent
 * @package App\Events
 * @author ^2_3^王尔贝
 */
class BroadcastForPrivateEvent implements ShouldBroadcast
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
     * BroadcastForPrivateEvent constructor.
     * @param User $user
     */
    public function __construct(User $user)
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
        //// Channel 的实例 代表任何用户可以订阅的公共频道，PrivateChannels 和 PresenceChannels 实列代表需要频道授权
        /// ( https://learnku.com/docs/laravel/6.x/broadcasting/5159#authorizing-channels )的私有频道。

        /// PrivateChannel("App.User") 会发布"private-App.User"到redis，最终发布频道会加上redis前缀(project_laravel_laravelv6x_database_)。
        // PrivateChannel("App.User") 发布事件到频道 project_laravel_laravelv6x_database_private-App.User。
        return new PrivateChannel("App.User");
    }
}
