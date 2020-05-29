{{-- ^2_3^ project-laravel-laravelv6x.test/broadcast/view --}}
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        {{-- ///1/ csrf-token --}}
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>Laravel6.x-综合话题-广播系统(广播事件)</title>

        {{-- ///2/ socket.io客户端 + LaravelEcho实例 --}}
        <script src="//{{ Request::getHost() }}:6001/socket.io/socket.io.js"></script>
        <script src="/js/app.js"></script>

        <script>
            //console.log(Echo);

            /////1/ 公共频道
            /// PrivateChannel("App.User") 会发布"private-App.User"到redis，最终发布频道会加上redis前缀(project_laravel_laravelv6x_database_)。
            //  PrivateChannel("App.User") 发布事件到频道 project_laravel_laravelv6x_database_private-App.User。
            /// private("App.User") 表明要订阅"private-App.User"。
            /// 显然客户端订阅的频道名称 和 事件发布到redis的频道名称 因为redis存在前缀而订阅不到，可通过在laravel-echo-server.json中配置'"keyPrefix": "project_laravel_laravelv6x_database_"'，跟框架一样的前缀就不用手动指定。
            //// (如果没有在laravel-echo-server.json中配置redis前缀，则需要手动指定)使用Redis广播器：Reids前缀"project_laravel_laravelv6x_database_"，订阅频道监听事件。
            Echo.channel('channel')
                .listen('BroadcastForEvent', (e) => {
                    console.log('channel => BroadcastForEvent');

                    console.log(e.user);
                })
                .listen('BroadcastDemoEvent', (e) => {
                    console.log('channel => BroadcastDemoEvent');

                    console.log(e.user);
                });
            //
            //// 使用postman广播事件：频道没有前缀，事件亦是不用事件命名空间，直接使用"."前缀指定直接使用事件名称。
            // post http://project-laravel-laravelv6x.test:6001/apps/2e1c375ba1d849ab/events?auth_key=8a7b8de478387febf0b09987585f995b
            // body-raw
//            {
//                "channel": "channel",
//                "name": "BroadcastForEvent",
//                "data": {
//                    "key": "value"
//                },
//                "socket_id": "eJ8HHSNATn0MOFcoAAAD"
//            }
            Echo.channel('channel')
                .listen('.BroadcastForEvent', (e) => {
                console.log('Postman_BroadcastForEvent');

//                $info = e.user == undefined ? '(没有user信息)' : e.user;
//                console.log($info);
            });
            //
            //
            /////2/ 私有频道
            @if ($user)
                //// 订阅私有频道
                /// PrivateChannel("App.User") 会发布"private-App.User"到redis，最终发布频道会加上redis前缀(project_laravel_laravelv6x_database_)。
                //  PrivateChannel("App.User") 发布事件到频道 project_laravel_laravelv6x_database_private-App.User。
                /// private("App.User") 表明要订阅"private-App.User"；
                /// 显然客户端订阅的频道名称 和 事件发布到redis的频道名称 因为redis存在前缀而订阅不到，可通过在laravel-echo-server.json中配置'"keyPrefix": "project_laravel_laravelv6x_database_"'，跟框架一样的前缀就不用手动指定。
                Echo.private("App.User")
                    .listen('BroadcastForPrivateEvent', (e) => {
                        console.log('^2_3^ BroadcastForPrivateEvent');

                        console.log(e.user);
                    });
                //
                //// 订阅私有频道，针对登录用户
                Echo.private("App.User."+{{ $user['id']  }})
                    .listen('BroadcastForPrivateUserEvent', (e) => {
                        console.log('^2_3^ BroadcastForPrivateUserEvent');

                        console.log(e.user);
                    });
                //
                //// 加入 Presence 频道
                Echo.join('presence-channel-room')
                    .here((users) => {
                        // 将接收包含当前订阅该频道的所有其他用户的用户信息的数组。
                        console.log('Presence频道，目前有'+users.length+'用户在线；');
                    })
                    .joining((user) => {
                        console.log('Presence频道，有新成员'+user.name+'加入；');
                    })
                    .leaving((user) => {
                        console.log('Presence频道，'+user.name+'离开；');
                    })
                    .listen('BroadcastForPresenceEvent', (e) => {
                        console.log('监听BroadcastForPresenceEvent事件；');

                        var user = e.user;
                        var userid = user['id'];
                        var username = user['name'];
                        var ta_broadcast_presence_user_str = $('#ta_broadcast_presence_user').text();
                        ta_broadcast_presence_user_str += "\n用户"+username+"["+userid+"]抖动了一下！";

                        $('#ta_broadcast_presence_user').html(ta_broadcast_presence_user_str);
                    });
            @endif

        </script>

    </head>

    <body>
        <h4>Laravel6.x-综合话题-广播系统</h4>
        <p>https://learnku.com/docs/laravel/6.x/broadcasting/5159</p>

        <p>广播事件</p>
        <p>广播公共频道事件 <a id="a_broadcast_public" href="javascript:void(0);">BroadcastForEvent</a></p>

        {{-- 已经登录，才能订阅私有频道监听事件 --}}
        @auth
            <p>广播私有频道事件 <a id="a_broadcast_private" href="javascript:void(0);">BroadcastForPrivateEvent</a></p>

            <p>广播私有频道事件(针对用户) <a id="a_broadcast_private_user" href="javascript:void(0);">BroadcastForPrivateUserEvent</a></p>

            <p>广播Presence频道事件 <a id="a_broadcast_presence_user" href="javascript:void(0);">BroadcastForPresenceEvent</a></p>
            <div>
                <textarea id="ta_broadcast_presence_user" style="width: 100%; height: 230px;">(Presence频道聊天空间互动)</textarea>
            </div>
        @else
            <p>广播私有频道事件 (请先<a href="{{ route('login') }}" target="_blank">登录</a>，才能订阅私有频道)</p>
        @endauth

    </body>

</html>
<script type="text/javascript">
    $(function(){
        //// 广播共有频道事件
        $('#a_broadcast_public').click(function (event) {
            console.log('a_broadcast_public');

            get( "{{ url('/broadcast/event') }}" );
        });

        //// 广播私有频道事件
        $('#a_broadcast_private').click(function (event) {
            console.log('a_broadcast_private');

            get( "{{ url('/broadcast/private') }}" );
        });

        //// 广播私有频道事件(针对用户)
        $('#a_broadcast_private_user').click(function (event) {
            console.log('a_broadcast_private_user');

            get( "{{ url('/broadcast/private-user') }}" );
        });
        
        //// 广播presence频道事件
        $('#a_broadcast_presence_user').click(function (event) {
            console.log('a_broadcast_presence_user');

            get( "{{ url('/broadcast/presence') }}" );
        });
    });

    //// get请求
    function get($url) {
        $.get($url, function (data, status) {
            console.log(data, status);
        });
    }
</script>