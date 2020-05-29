<?php

use Illuminate\Support\Facades\Log;

/*
|--------------------------------------------------------------------------
| Broadcast Channels ^2_3^ 广播事件频道
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
| channel 方法接受两个参数：频道的名称和返回 true 或 false 来指示用户是否有权在频道上进行侦听的回调。
| 所有授权回调都将当前经过身份验证的用户作为其第一个参数，并将任何其他通配符参数作为其后续参数。
| 在这个例子中，我们用 {orderId} 占位符来通配表示频道名称 "ID" 的部分。
*/
//// 定义授权回调
// 定义实际执行频道授权的逻辑。
//
//// 私有频道，需要用户登录系统通过身份验证，才会进入私有频道授权处理；
// laravel-echo-server认证错误：broadcasting/auth 403错误，可能就是监听的私有频道名称错误，可能就是redis前缀引起的，可通过laravel-echo-server广播事件时输出信息确定；
// 显然客户端订阅的频道名称 和 事件发布到redis的频道名称 因为redis存在前缀而订阅不到，可通过在laravel-echo-server.json中配置'"keyPrefix": "project_laravel_laravelv6x_database_"'，跟框架一样的前缀就不用手动指定。
Broadcast::channel('App.User', function ($user) {
    //Log::info('私有频道(App.User)授权'.json_encode( $user->toArray() ));
    return true;
});
//
//// 私有频道，针对用户频道；
Broadcast::channel('App.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});
//
//// Presence 频道
// 如果用户有权加入该频道，则不会返回 true，返回有关用户的数据数组。
// 如果用户未被授权加入 Presence 频道，则应返回 false 或 null。
Broadcast::channel('presence-channel-room', function ($user) {
    return ['id' => $user->id, 'name' => $user->name];
});