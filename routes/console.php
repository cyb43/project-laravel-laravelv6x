<?php

use Illuminate\Foundation\Inspiring;

/*
|--------------------------------------------------------------------------
| Console Routes
| ^2_3^ 控制台路由
| 虽然这个文件没有定义 HTTP 路由，但是它将基于控制台的入口点（路由）定义到了应用中。在这个
| 文件，你可以使用 Artisan::command 方法定义所有的闭包路由。 command 方法接受两个参
| 数: 命令名称( https://learnku.com/docs/laravel/6.x/artisan/5158#defining-input-expectations )
| 和一个接受命令参数及选项的闭包。
|--------------------------------------------------------------------------
|
| This file is where you may define all of your Closure based console
| commands. Each Closure is bound to a command instance allowing a
| simple approach(处理) to interacting with each command's IO methods.
|
*/
// 定义inspire命令
Artisan::command('inspire', function () {
    // 输出语句
    $this->comment(Inspiring::quote());
})->describe('Display an inspiring(令人鼓舞的) quote(语录)');
