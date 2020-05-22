<?php

namespace App\Http\Controllers;

use App\Jobs\DemoJob;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;

/**
 * ^2_3^ 文档学习
 * Class DocController
 * @package App\Http\Controllers
 * @author ^2_3^王尔贝
 */
class DocController extends Controller
{

    /**
     * doc
     * @param Request $request
     * @return string
     * @author ^2_3^王尔贝
     */
    public function doc(Request $request)
    {
        return 'DocController';
    }

    /**
     * 测试mysql连接
     * @param Request $request
     * @return mixed
     * @author ^2_3^王尔贝
     */
    public function mysqlConnection(Request $request)
    {
        $user = User::find(1);
        return $user;
    }

    /**
     * 测试redis连接
     * @param Request $request
     * @return string
     * @author ^2_3^王尔贝
     */
    public function redisConnection( Request $request )
    {
        Redis::set('name', 'C.T.C');
        $name = Redis::get('name');

        return "Hello {$name} ^2_3^";
    }

    /**
     * 分发任务
     * @param Request $request
     * @return string
     * @author ^2_3^王尔贝
     */
    public function JobDispatch(Request $request)
    {
        $user = User::find(1);
        for ($i = 0; $i < 2; $i++) {
            DemoJob::dispatch( $user );
        }

        return '^2_3^分发任务'.PHP_EOL.'DemoJob::dispatch( $user );'.json_encode( $user->toArray() );
    }
}
