<?php

namespace App\Http\Controllers;

use App\Events\BroadcastDemoEvent;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


/**
 * ^2_3^ 综合话题-广播系统
 * Class BroadcastController
 * @package App\Http\Controllers
 * @author ^2_3^王尔贝
 */
class BroadcastController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //// auth 中间件
        // app/Http/Kernel.php:66
        // 'auth' => \App\Http\Middleware\Authenticate::class,
        $this->middleware('auth');
    }

    /**
     * broadcast
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @author ^2_3^王尔贝
     */
    public function broadcast(Request $request)
    {
        //// 综合话题-广播系统(广播事件)_客户端订阅频道监听事件
        $user = Auth::user();
        return view('broadcast', ['user' => $user]);
    }
}
