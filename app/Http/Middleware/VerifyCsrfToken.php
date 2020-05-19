<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;


/**
 * ^2_3^ 跨站请求伪造
 * Class VerifyCsrfToken
 * @package App\Http\Middleware
 */
class VerifyCsrfToken extends Middleware
{
    /**
     * Indicates whether the XSRF-TOKEN cookie should be set on the response.
     *
     * @var bool
     */
    protected $addHttpCookie = true;

    /**
     * CSRF 白名单
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        // ^2_3^ 密码授权访问令牌
        '/authpassword/token',
        //
        // ^2_3^ 密码授权访问令牌刷新
        '/authpassword/refreshtoken',
    ];
}
