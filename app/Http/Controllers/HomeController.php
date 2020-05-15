<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;


/**
 * ^2_3^ home控制器
 * Class HomeController
 * @package App\Http\Controllers
 */
class HomeController extends Controller
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
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }
}
