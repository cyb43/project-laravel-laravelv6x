<?php

namespace App\Listeners;
use App\Events\DemoEvent;
use Illuminate\Support\Facades\Log;


/**
 * ^2_3^ 事件订阅者
 * Class EventSubscriber
 * @package App\Listeners
 * @author ^2_3^王尔贝
 */
class EventSubscriber
{
    /**
     * 事件处理器
     * @param DemoEvent $event
     * @author ^2_3^王尔贝
     */
    public function handleDemoEvent(DemoEvent $event)
    {
        Log::info('^2_3^事件订阅者(EventSubscriber)监听处理App\Events\DemoEvent事件；');
    }

    /**
     * 为订阅者注册监听器.
     *
     * @param  \Illuminate\Events\Dispatcher  $events
     */
    public function subscribe($events)
    {
        $events->listen(
            'App\Events\DemoEvent',
            'App\Listeners\EventSubscriber@handleDemoEvent'
        );
    }
}
