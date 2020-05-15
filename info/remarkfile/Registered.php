<?php

//namespace Illuminate\Auth\Events;

use Illuminate\Queue\SerializesModels;


/**
 * ^2_3^ 注册事件(20200514)
 * Class Registered
 * @package Illuminate\Auth\Events
 */
class Registered
{
    use SerializesModels;

    /**
     * The authenticated user.
     *
     * @var \Illuminate\Contracts\Auth\Authenticatable
     */
    public $user;

    /**
     * Create a new event instance.
     *
     * @param  \Illuminate\Contracts\Auth\Authenticatable  $user
     * @return void
     */
    public function __construct($user)
    {
        $this->user = $user;
    }
}
