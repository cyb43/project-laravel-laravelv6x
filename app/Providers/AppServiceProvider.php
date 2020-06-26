<?php

namespace App\Providers;

use Illuminate\Support\Facades\Redis;
use Illuminate\Support\ServiceProvider;

/**
 * ^2_3^ 服务提供者
 * Class AppServiceProvider
 * @package App\Providers
 */
class AppServiceProvider extends ServiceProvider
{
    /**
     * 注册服务
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //// telescope应用调试工具_仅本地开发
        if( $this->app->isLocal() ) {
            $this->app->register(TelescopeServiceProvider::class);
        }

    }

    /**
     * 引导服务
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //// ^2_3^ 启用 Redis 事件，必须启用 Redis 事件才能使 Telescope应用调试工具的 Redis 监听器正常运行。
        // Redis 监听器记录您的应用程序执行的所有 Redis 命令。如果您使用 Redis 进行缓存，Redis 监听器也会记录缓存命令。
        Redis::enableEvents();
    }
}
