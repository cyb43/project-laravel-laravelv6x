<?php

namespace App\Providers;

use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;


/**
 * ^2_3^ 事件服务提供器
 * Class EventServiceProvider
 * @package App\Providers
 */
class EventServiceProvider extends ServiceProvider
{
    /**
     * ^2_3^ 事件监听
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],

        ////// 访问令牌事件处理
        ///1/ 添加事件监听属性
        //// 访问令牌生成事件
        'Laravel\Passport\Events\AccessTokenCreated' => [
            'App\Listeners\RevokeOldTokens',
        ],
        //// 访问令牌刷新事件
        'Laravel\Passport\Events\RefreshTokenCreated' => [
            'App\Listeners\PruneOldRefreshTokens',
        ],
        ///2/ 生成监听类
        //php artisan event:generate

    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }
}
