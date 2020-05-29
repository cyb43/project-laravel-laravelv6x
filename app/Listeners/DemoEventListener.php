<?php

namespace App\Listeners;

use App\Events\DemoEvent;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Log;


/**
 * ^2_3^ 示例事件监听器(队列)
 * Class DemoEventListener
 * @package App\Listeners
 * @author ^2_3^王尔贝
 */
// 示例事件监听器
// class DemoEventListener
//
// 示例事件监听器队列
class DemoEventListener implements ShouldQueue
{

    // InteractsWithQueue 提供任务的 delete() 和 release() 方法。
    use InteractsWithQueue;

    /**
     * 任务连接名称。
     *
     * // 队列处理器
     * php artisan queue:work --queue=queue-event-listeners --tries=3
     *
     * @var string|null
     */
    //public $connection = 'database';

    /**
     * 任务发送到的队列的名称.
     *
     * @var string|null
     */
    public $queue = 'queue-event-listeners';

    /**
     * 处理任务的延迟时间.
     *
     * @var int
     */
    public $delay = 60;

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * 确定监听器是否应加入队列
     *
     * @param  \App\Events\OrderPlaced  $event
     * @return bool
     */
    public function shouldQueue(DemoEvent $event)
    {
        $user = $event->user->toArray();
        return !empty( $user ) && $user['id'] >= 0;
    }

    /**
     * Handle the event.
     *
     * @param  DemoEvent  $event
     * @return void
     */
    public function handle(DemoEvent $event)
    {
        Log::info("^2_3^ 示例事件监听器(app/Listeners/DemoEventListener.php)");

        $user = $event->user;
        Log::info( json_encode( $user->toArray() ).PHP_EOL );
    }
}
