<?php

//namespace Illuminate\Foundation\Auth;


/**
 * ^2_3^ 重定向用户(20200514)
 * Trait RedirectsUsers
 * @package Illuminate\Foundation\Auth
 */
trait RedirectsUsers
{
    /**
     * 重定向
     * Get the post register / login redirect path.
     *
     * @return string
     */
    public function redirectPath()
    {
        //// 是否存在redirectTo()方法
        if (method_exists($this, 'redirectTo')) {
            return $this->redirectTo();
        }

        // 是否存在redirectTo属性
        return property_exists($this, 'redirectTo') ? $this->redirectTo : '/home';
    }
}
