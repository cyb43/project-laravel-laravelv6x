<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\ConfirmsPasswords;


/**
 * ^2_3^ 确认密码控制器(在访问敏感路由时需要确认密码(可用password.confirm中间件))
 *
 * 当用户成功完成密码确认后，将会被重定向到原先要访问的路由。
 * 默认情况下密码确认之后的 3 小时内再访问敏感页面是无需重复确认的。
 * 你可以通过 auth.password_timeout 配置项来修改这个有效时间。
 *
 * Class ConfirmPasswordController
 * @package App\Http\Controllers\Auth
 */
class ConfirmPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Confirm Password Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password confirmations and
    | uses a simple trait to include the behavior. You're free to explore
    | this trait and override any functions that require customization.
    |
    */
    // 确认密码
    use ConfirmsPasswords;

    /**
     * Where to redirect users when the intended url fails.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
}
