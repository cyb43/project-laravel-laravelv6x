<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Laravel\Passport\Passport;


/**
 * ^2_3^ 认证服务提供器
 * Class AuthServiceProvider
 * @package App\Providers
 */
class AuthServiceProvider extends ServiceProvider
{
    /**
     * 授权策略和模型映射
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication(认证) / authorization(授权) services.
     *
     * @return void
     */
    public function boot()
    {
        //// ^2_3^ 注册授权策略
        $this->registerPolicies();

        // ^2_3^ 注册Passport路由
        Passport::routes();

        //// ^2_3^ 自定义 Passport 密钥加载路径
        /// 已使用 config/passport.php 的 private_key/public_key 设置密钥，故而不再设置加载路径。
        //Passport::loadKeysFrom('/secret-keys/oauth');
        //Passport::loadKeysFrom('/storage');

        // ^2_3^ 设置令牌有效期
        Passport::tokensExpireIn(now()->addDays(15));
        Passport::refreshTokensExpireIn(now()->addDays(30));
        Passport::personalAccessTokensExpireIn(now()->addMonths(6));
    }
}
