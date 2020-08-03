<?php

/**
 * ^2_3^ websocket服务
 * websocket服务端 基于swoole实现的服务端(使用 php xxx.php 运行服务器，查看监听 netstat -an | grep 9501)；
 * websocket客户端 基于JavaScript实现的客户端；使用命令行telnet命令作为客户端连接服务端(telnet 127.0.0.1 9501)；
 *
 * //// 监听进程操作
 * /// 监听对应端口号的进程
 * lsof -n -P| grep "9501" | grep LISTEN
 * //
 * /// 对应端口号有关的进程
 * lsof -i tcp:9501
 * //
 * /// kill进程
 * kill -9 <进程号>
 */

///1/ 创建对象：创建Server对象，监听 127.0.0.1:9501端口
$serv = new Swoole\Server("127.0.0.1", 9501);

///2/ 事件监听
/// 监听连接进入事件
$serv->on('Connect', function ($serv, $fd) {
    echo "Client: Connect(客户端标识{$fd}).\n";
});
/// 监听数据接收事件
$serv->on('Receive', function ($serv, $fd, $from_id, $data) {
    $serv->send($fd, "Server: (客户端标识{$fd})".$data);
});
/// 监听连接关闭事件
$serv->on('Close', function ($serv, $fd) {
    echo "Client: Close(客户端标识{$fd}).\n";
});

///3/ 启动服务器
$serv->start();