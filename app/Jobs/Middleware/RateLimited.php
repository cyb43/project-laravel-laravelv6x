<?php

namespace App\Jobs\Middleware;

use Illuminate\Support\Facades\Redis;


/**
 * 任务速率限制
 * Class RateLimited
 * @package App\Jobs\Middleware
 * @author ^2_3^王尔贝
 */
class RateLimited
{
    /**
     * 处理队列中的任务.
     *
     * @param  mixed  $job
     * @param  callable  $next
     * @return mixed
     */
    public function handle($job, $next)
    {
        Redis::throttle('DemoJob_Redis_Throttle_key')
            ->block(0)->allow(1)->every(5)
            ->then(function () use ($job, $next) {
                // 锁定…

                $next($job);
            }, function () use ($job) {
                // 无法获取锁…

                $job->release(5);
            });
    }
}
