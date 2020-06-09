<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Redis;


/**
 * Redis发布/订阅模式_订阅artisan命令进程
 * Class RedisSubscribe
 * @package App\Console\Commands
 * @author ^2_3^王尔贝
 *
 *
    //// Redis发布/订阅模式_发布信息
    Route::get('publish', function () {
        Redis::publish('test-channel', json_encode(['foo' => 'bar']));
    });
 *
 */
class RedisSubscribe extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'redis:subscribe';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Subscribe to a Redis channel';

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        Redis::subscribe(['test-channel'], function ($message) {
            echo $message;
        });
    }
}
