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
//// 查看路由注册
// php artisan route:list
//
//// 首页路由
Route::get('/', function () {
    return view('welcome');
});
//
Route::get('/wr', function () {
    return '^2_3^ 2workroom3工作室';
});
//
//// EloquentORM-API资源
Route::get('/user', function () {
    // api资源
    return new \App\Http\Resources\User( \App\User::find(1) );
});
Route::get('/users', function () {
    // api资源集合
    return new \App\Http\Resources\Users( \App\User::all() );
});
//
//// EloquentORM-模型关联
Route::get('/post', function () {
//    for ($i=1; $i<=10; $i++)
//    {
//        $post = new \App\Models\DemoPost();
//        $post->title = "文章标题({$i})";
//        $post->save();
//    }

    $posts = \App\Models\DemoPost::get();
    foreach ( $posts as $post )
    {
        //// 时间
        //dump( $post->created_at->format('Y-m-d H:i:s') );
        //dump( $post->toArray()['created_at'] );

        ////// 数据填充
        //// 文章内容
//        $content = new \App\Models\DemoPostsContent();
//        $content->post_id = $post->id;
//        $content->content = "内容({$post->id})";
//        $content->save();
        //
        //// 文章评论
//        $comment = new \App\Models\DemoPostComment();
//        $comment->fill(['post_id' => $post->id, 'comment_txt' => "文章({$post->id})评论1"]);
//        $comment->save();
        //
        //// 文章标签
//        $tag = new \App\Models\DemoPostTag();
//        $tag->tag_name = "标签({$post->id})";
//        $tag->save();
        //
        //// 文章标签关联
//        DB::table("demo_post_tags_pivot")->insert(
//            [
//                ['post_id' => $post->id, 'tag_id' => 1, 'created_at' => time(), 'updated_at' => time()],
//                ['post_id' => $post->id, 'tag_id' => 2, 'created_at' => time(), 'updated_at' => time()]
//            ]
//        );
//        \App\Models\DemoPostTagsPivot::create(
//            ['post_id' => $post->id, 'tag_id' => 3]
//        );

        ////// 模型关联
        $data = [];
        $data["title"] = $post->title;
        //
        //// 一对一
        $content = $post->demoPostsContent;
        $data["content"] = $content->content;
        //
        //// 一对多
        $comments = $post->demoPostComments;
        $data['comments'] = [];
        foreach ($comments as $comment) {
            //// 一对多_反向关联
            $comment_post = $comment->demoPost;
            $tmpArray['post_title'] = $comment_post->title;

            $tmpArray['post_comment'] = $comment->comment_txt;
            $data['comments'][] = $tmpArray;
        }
        //
        //// 多对多
        $tags = $post->demoPostTags; //文章标签;
        foreach ($tags as $tag) {
            $tagTmp = [];
            $tagTmp['tag_name'] = $tag->tag_name;

            //// 多对多_反向关联
            $tagPosts = $tag->demoPosts; //标签文章;
            $tpTmp = [];
            foreach ($tagPosts as $tagPost) {
                $tpTmp[] = $tagPost->title;
            }
            $tagTmp['tag_post'] = $tpTmp;

            $data['tags'][] = $tagTmp;
        }

        dump( $data );
    }

    return 'post操作';
});
//
//// 综合话题-消息通知
Route::get('/notification', function() {
    $user = \App\User::find(1);
    \Illuminate\Support\Facades\Notification::send($user, new \App\Notifications\DemoNotification($user));

    return '消息通知：为用户(id->1)发送消息通知(邮件/数据库)';
});
//
//// 综合话题-邮件发送
Route::get('/email-send', function () {
    try {
        $user = \App\User::find(1);
        Mail::to($user)->send(new \App\Mail\DemoMail($user));
        return '邮件发送成功！^2_3^';
    }catch (Exception $e) {
        return $e;
    }
});
//
//// 综合话题-广播系统
//1/ 监听频道
Route::get('/broadcast/view', 'BroadcastController@broadcast');
//2/ [公共频道]广播事件
Route::get('/broadcast/event', function () {
    $user = \App\User::find(1);
    broadcast(new \App\Events\BroadcastForEvent($user));
    broadcast(new \App\Events\BroadcastDemoEvent($user));
    return 'broadcast_BroadcastForEvent|BroadcastDemoEvent';
});
//3/ [私有频道]广播事件
Route::get('/broadcast/private', function () {
    $user = \Illuminate\Support\Facades\Auth::user();

    $str = "没有登录，故而不能广播私有频道事件。";
    if( !empty( $user ) ) {
        broadcast( new \App\Events\BroadcastForPrivateEvent( $user ) );
        $str = "广播私有频道事件(broadcast( new \App\Events\BroadcastForPrivateEvent( {$user} ) );)；";
    }
    return $str;
});
//4/ [私有频道]广播事件，用户频道
Route::get('/broadcast/private-user', function () {
    $users = \App\User::all();
    $num = $users->count();

    $users->each(function ($user, $key) {
        broadcast( new \App\Events\BroadcastForPrivateUserEvent( $user ));
    });

    return "完成{$num}用户私有频道事件广播";
});
//5/ [Presence频道]广播事件，聊天空间
Route::get('/broadcast/presence', function () {
    $user = \Illuminate\Support\Facades\Auth::user();

    broadcast( new \App\Events\BroadcastForPresenceEvent($user) );

    return 'broadcast( new \App\Events\BroadcastForPresenceEvent($user) );';
});
//
//// [web]OAuth授权码授权令牌
//1/ 授权码授权请求
// http://project-laravel-laravelv6x.test/authcode/authorize
Route::get('/authcode/authorize', 'OAuthCodeController@authCodeAuthorize');
//2/ 授权码回调(授权码换访问令牌)
Route::get('/authcode/callback', 'OAuthCodeController@authCodeCallback');
//3/ 授权码刷新令牌
Route::get('/authcode/refreshtoken', 'OAuthCodeController@authCodeRefreshToken');
//4/ 传递访问令牌(访问api路由)
//$response = $client->request('GET', '/api/user', [
//    'headers' => [
//        'Accept' => 'application/json',
//        'Authorization' => 'Bearer '.$accessToken,
//    ],
//]);
//
//// ^2_3^ [web路由]OAuth密码授权令牌
//1/ 获取密码授权令牌
Route::get('/authpassword/token', 'OAuthPasswordController@passwordToken');
// from
// headers Content-Type application/x-www-form-urlencoded
// body form-data username:1021625889@qq.com password:1357924680
Route::post('/authpassword/token', 'OAuthPasswordController@passwordToken');
//2/ 密码授权刷新令牌
Route::get('/authpassword/refreshtoken', 'OAuthPasswordController@refreshToken');
Route::post('/authpassword/refreshtoken', 'OAuthPasswordController@refreshToken');
//3/ 传递访问令牌(访问api路由)
//$response = $client->request('GET', '/api/user', [
//    'headers' => [
//        'Accept' => 'application/json',
//        'Authorization' => 'Bearer '.$accessToken,
//    ],
//]);
//
//// Doc
Route::get('/doc', 'DocController@doc');
//
//// MySQL连接测试
Route::get('/doc/mysql-conn', 'DocController@mysqlConnection');
//
//// Redis连接测试
Route::get('/doc/redis-conn', 'DocController@redisConnection');
//
//// 分发任务
Route::get('/doc/job', 'DocController@JobDispatch');
//
//// 分发事件(事件监听器队列)
Route::get('/doc/event', 'DocController@EventDispatch');
//
//// ^2_3^认证路由
/// vendor/laravel/framework/src/Illuminate/Routing/Router.php:1144
//public function auth(array $options = [])
//{
//    //// Authentication Routes(认证路由)...
//      // 登录表单
//    $this->get('login', 'Auth\LoginController@showLoginForm')->name('login');
//      // 登录处理
//    $this->post('login', 'Auth\LoginController@login');
//      // 登出处理
//    $this->post('logout', 'Auth\LoginController@logout')->name('logout');
//
//    //// Registration Routes(注册路由)...
//    if ($options['register'] ?? true) {
//          // 注册表单
//        $this->get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');
//          // 注册处理
//        $this->post('register', 'Auth\RegisterController@register');
//    }
//
//    // Password Reset Routes(密码重置路由)...
//    if ($options['reset'] ?? true) {
//        $this->resetPassword();
//    }
//
//    // Password Confirmation Routes(确认密码路由，处理已失效的情况)...
//    if ($options['confirm'] ??
//        class_exists($this->prependGroupNamespace('Auth\ConfirmPasswordController'))) {
//        $this->confirmPassword();
//    }
//
//    // Email Verification Routes(邮件验证路由)...
//    if ($options['verify'] ?? false) {
//        $this->emailVerification();
//    }
//}
/// vendor/laravel/framework/src/Illuminate/Routing/Router.php:1185
//public function resetPassword()
//{
//      // 密码重置表单
//    $this->get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
//      // 发送链接邮件
//    $this->post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
//      // 重置密码链接
//    $this->get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
//      // 重置密码处理
//    $this->post('password/reset', 'Auth\ResetPasswordController@reset')->name('password.update');
//}
/// vendor/laravel/framework/src/Illuminate/Routing/Router.php:1198
//public function confirmPassword()
//{
//      // 确认密码表单(失效需要确认)
//    $this->get('password/confirm', 'Auth\ConfirmPasswordController@showConfirmForm')->name('password.confirm');
//      // 确认密码处理
//    $this->post('password/confirm', 'Auth\ConfirmPasswordController@confirm');
//}
/// vendor/laravel/framework/src/Illuminate/Routing/Router.php:1209
//public function emailVerification()
//{
        // 验证邮箱表单
//    $this->get('email/verify', 'Auth\VerificationController@show')->name('verification.notice');
//      // 验证邮箱标志
//    $this->get('email/verify/{id}/{hash}', 'Auth\VerificationController@verify')->name('verification.verify');
//      // 验证邮箱重发
//    $this->post('email/resend', 'Auth\VerificationController@resend')->name('verification.resend');
//}
Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');
//
//// Email验证
Auth::routes(['verify' => true]);
//
//// 回退路由
//Route::fallback(function () {
//    return '提示：没有其他路由可匹配传入的请求时，才执行的路由。回退路由应始终是你应用程序注册的最后一个路由。';
//});