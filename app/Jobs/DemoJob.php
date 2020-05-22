<?php

namespace App\Jobs;

use App\Jobs\Middleware\RateLimited;
use App\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;


/**
 * 任务示例类
 * Class demoJob
 * @package App\Jobs
 * @author ^2_3^王尔贝
 */
class DemoJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * 如果模型缺失即删除任务。
     *
     * @var bool
     */
    public $deleteWhenMissingModels = true;

    /**
     * 用户模型
     * @var User
     * @author ^2_3^王尔贝
     */
    private $user;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(User $user)
    {
        $this->user = $user;
    }

    /**
     * ^2_3^ 得到任务应该经过的中间人。
     *
     * @return array
     */
//    public function middleware()
//    {
//        return [new RateLimited()];
//    }

    /**
     * Execute the job.
     * @param string $devName
     * @author ^2_3^王尔贝
     */
    public function handle()
    {
        //// 用户信息
        $userStr = json_encode( $this->user->toArray() );

        sleep(3);
        Log::info("app/Jobs/DemoJob.php 经过3秒后的执行！{$userStr}");
    }

    /**
     * 任务失败的处理过程
     * @param \Exception $exception
     * @author ^2_3^王尔贝
     */
    public function failed(\Exception $exception)
    {
        // 给用户发送任务失败的通知，等等……
    }

}
