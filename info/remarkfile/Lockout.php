<?php

//namespace Illuminate\Auth\Events;

use Illuminate\Http\Request;


/**
 * ^2_3^ 登出事件(20200514)
 * Class Lockout
 * @package Illuminate\Auth\Events
 */
class Lockout
{
    /**
     * The throttled request.
     *
     * @var \Illuminate\Http\Request
     */
    public $request;

    /**
     * Create a new event instance.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return void
     */
    public function __construct(Request $request)
    {
        $this->request = $request;
    }
}
