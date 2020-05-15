<?php

//namespace Illuminate\Foundation\Auth;

use Illuminate\Http\Request;


/**
 * ^2_3^ 确认密码(20200515)
 * Trait ConfirmsPasswords
 * @package Illuminate\Foundation\Auth
 */
trait ConfirmsPasswords
{
    // 重定向用户
    use RedirectsUsers;

    /**
     * ^2_3^ 显示确认表单
     * Display the password confirmation view.
     *
     * @return \Illuminate\Http\Response
     */
    public function showConfirmForm()
    {
        return view('auth.passwords.confirm');
    }

    /**
     * ^2_3^ Confirm the given user's password.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    public function confirm(Request $request)
    {
        $request->validate($this->rules(), $this->validationErrorMessages());

        $this->resetPasswordConfirmationTimeout($request);

        return redirect()->intended($this->redirectPath());
    }

    /**
     * ^2_3^ Reset the password confirmation timeout.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return void
     */
    protected function resetPasswordConfirmationTimeout(Request $request)
    {
        $request->session()->put('auth.password_confirmed_at', time());
    }

    /**
     * ^2_3^ Get the password confirmation validation rules.
     *
     * @return array
     */
    protected function rules()
    {
        return [
            'password' => 'required|password',
        ];
    }

    /**
     * ^2_3^ Get the password confirmation validation error messages.
     *
     * @return array
     */
    protected function validationErrorMessages()
    {
        return [];
    }
}
