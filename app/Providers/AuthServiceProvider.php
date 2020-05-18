<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;


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

        //
    }
}
