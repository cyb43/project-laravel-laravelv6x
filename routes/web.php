<?php

/*
|--------------------------------------------------------------------------
| ^2_3^ Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//// 首页路由
Route::get('/', function () {
    return view('welcome');
});

//// Redis连接测试
Route::get('/redis-conn', 'DocController@redisConnection');


//// 回退路由
//Route::fallback(function () {
//    return '提示：没有其他路由可匹配传入的请求时，才执行的路由。回退路由应始终是你应用程序注册的最后一个路由。';
//});






















