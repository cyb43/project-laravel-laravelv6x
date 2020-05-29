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
 * 私有频道，针对用户
 * Class BroadcastForPrivateUserEvent
 * @package App\Events
 * @author ^2_3^王尔贝
 */
class BroadcastForPrivateUserEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $user;

    /**
     * Create a new event instance.
     *
     * BroadcastForPrivateUserEvent constructor.
     * @param User $user
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
        $id = $this->user->id;
        return new PrivateChannel("App.User.{$id}");
    }
}
