<?php

namespace App\Http\Controllers;

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
}
