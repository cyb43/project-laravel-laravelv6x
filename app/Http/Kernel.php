<?php

namespace App\Http;

use Illuminate\Foundation\Http\Kernel as HttpKernel;

/**
 * ^2_3^ HTTP 内核
 * Class Kernel
 * @package App\Http
 */
class Kernel extends HttpKernel
{
    /**
     * The application's global HTTP middleware stack.
     *
     * These middleware are run during every request to your application.
     *
     * @var array
     */
    protected $middleware = [
        \App\Http\Middleware\TrustProxies::class,
        \App\Http\Middleware\CheckForMaintenanceMode::class,
        \Illuminate\Foundation\Http\Middleware\ValidatePostSize::class,
        // 清空字段两边空格
        \App\Http\Middleware\TrimStrings::class,
        // 转换空串为null
        \Illuminate\Foundation\Http\Middleware\ConvertEmptyStringsToNull::class,
    ];

    /**
     * The application's route middleware groups.
     *
     * @var array
     */
    protected $middlewareGroups = [
        'web' => [
            // Cookies加密
            \App\Http\Middleware\EncryptCookies::class,
            \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
            \Illuminate\Session\Middleware\StartSession::class,
            // ^2_3^ 唯一设备中间件，让其它设备上的 Session 失效。
            // \Illuminate\Session\Middleware\AuthenticateSession::class,
            // 表单验证错误信息绑定视图($errors变量)
            \Illuminate\View\Middleware\ShareErrorsFromSession::class,
            //
            // 跨站请求伪造：自动验证请求里的令牌是否与存储在会话中令牌匹配。
            \App\Http\Middleware\VerifyCsrfToken::class,
            //
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
        ],

        'api' => [
            'throttle:60,1',
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
        ],
    ];

    /**
     * The application's route middleware.
     *
     * These middleware may be assigned to groups or used individually.
     *
     * @var array
     */
    protected $routeMiddleware = [
        // ^2_3^ 认证中间件
        'auth' => \App\Http\Middleware\Authenticate::class,
        // ^2_3^ HTTP基础认证，将中间件附加到路由后，在浏览器中访问此路由时将自动提示您输入凭据。
        'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
        'bindings' => \Illuminate\Routing\Middleware\SubstituteBindings::class,
        'cache.headers' => \Illuminate\Http\Middleware\SetCacheHeaders::class,
        // ^2_3^ 用户授权(网关Gate/策略policy)中间件
        'can' => \Illuminate\Auth\Middleware\Authorize::class,
        // ^2_3^ 游客身份验证中间件：如已登录，直接跳转home；
        'guest' => \App\Http\Middleware\RedirectIfAuthenticated::class,
        // ^2_3^ 密码确认中间件，在访问敏感路由时，需要密码确认；
        'password.confirm' => \Illuminate\Auth\Middleware\RequirePassword::class,
        // 验证URL签名：防止Url被串改；
        'signed' => \Illuminate\Routing\Middleware\ValidateSignature::class,
        // ^2_3^ 节流控制
        'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class,
        // ^2_3^ 邮箱是否认证
        'verified' => \Illuminate\Auth\Middleware\EnsureEmailIsVerified::class,
    ];

    /**
     * The priority-sorted list of middleware.
     * 中间件的优先级排序列表。将会强制非全局中间件始终保持给定的顺序。
     *
     * This forces non-global middleware to always be in the given order.
     *
     * @var array
     */
    protected $middlewarePriority = [
        \Illuminate\Session\Middleware\StartSession::class,
        // 表单验证错误信息绑定视图($errors变量)
        \Illuminate\View\Middleware\ShareErrorsFromSession::class,
        \App\Http\Middleware\Authenticate::class,
        \Illuminate\Routing\Middleware\ThrottleRequests::class,
        \Illuminate\Session\Middleware\AuthenticateSession::class,
        \Illuminate\Routing\Middleware\SubstituteBindings::class,
        \Illuminate\Auth\Middleware\Authorize::class,
    ];
}
