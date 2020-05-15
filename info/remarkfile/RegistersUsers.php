<?php

//namespace Illuminate\Foundation\Auth;

use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


/**
 * ^2_3^ 注册用户Trait(20200514)
 * Trait RegistersUsers
 * @package Illuminate\Foundation\Auth
 */
trait RegistersUsers
{
    // 重定向用户
    use RedirectsUsers;

    /**
     * ^2_3^ 注册表单
     * Show the application registration form.
     *
     * @return \Illuminate\Http\Response
     */
    public function showRegistrationForm()
    {
        return view('auth.register');
    }

    /**
     * ^2_3^ 注册处理
     * Handle a registration request for the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        // 表单验证
        $this->validator($request->all())->validate();

        // 触发注册事件
        event(new Registered($user = $this->create($request->all())));

        //// 用户登录
        $this->guard()->login($user);

        // 完成注册动作
        return $this->registered($request, $user)
                        ?: redirect($this->redirectPath());
    }

    /**
     * ^2_3^
     * Get the guard to be used during registration.
     *
     * @return \Illuminate\Contracts\Auth\StatefulGuard
     */
    protected function guard()
    {
        return Auth::guard();
    }

    /**
     * ^2_3^ 用户注册后续动作
     * The user has been registered.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  mixed  $user
     * @return mixed
     */
    protected function registered(Request $request, $user)
    {
        //
    }
}
