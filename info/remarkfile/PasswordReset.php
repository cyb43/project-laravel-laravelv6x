<?php

//namespace Illuminate\Auth\Events;

use Illuminate\Queue\SerializesModels;

/**
 * ^2_3^ 密码重置(20200515)
 * Class PasswordReset
 * @package Illuminate\Auth\Events
 */
class PasswordReset
{
    use SerializesModels;

    /**
     * The user.
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
