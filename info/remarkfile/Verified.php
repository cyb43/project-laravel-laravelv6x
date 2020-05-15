<?php

//namespace Illuminate\Auth\Events;

use Illuminate\Queue\SerializesModels;

/**
 * ^2_3^ 验证事件(20200515)
 * Class Verified
 * @package Illuminate\Auth\Events
 */
class Verified
{
    use SerializesModels;

    /**
     * The verified user.
     *
     * @var \Illuminate\Contracts\Auth\MustVerifyEmail
     */
    public $user;

    /**
     * Create a new event instance.
     *
     * @param  \Illuminate\Contracts\Auth\MustVerifyEmail  $user
     * @return void
     */
    public function __construct($user)
    {
        $this->user = $user;
    }
}
