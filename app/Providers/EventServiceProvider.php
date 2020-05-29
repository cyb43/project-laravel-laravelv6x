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
     * 需要注册的订阅者类。
     * @var array
     */
    protected $subscribe = [
        //'App\Listeners\EventSubscriber',
    ];

    /**
     * ^2_3^ 事件监听
     * The event listener mappings for the application.
     *
     * 提示：可以使用"php artisan event:generate"命令生成下边没有被创建的事件以及事件监听器；
     *
     * @var array
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],

        //// 自定义事件/监听器
        'App\Events\DemoEvent' => [
            'App\Listeners\DemoEventListener',
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
     * 确定是否应自动发现事件和侦听器。
     * @return bool
     * @author ^2_3^王尔贝
     */
    public function shouldDiscoverEvents()
    {
        return false;
    }

    /**
     * 获取应该用于发现事件的监听器目录
     * @return array
     * @author ^2_3^王尔贝
     */
    protected function discoverEventsWithin()
    {
        return [
            $this->app->path('Listeners'),
        ];
    }

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
