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
//// [web]OAuth授权码授权令牌
//1/ 授权码授权请求
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
//// Redis连接测试
Route::get('/redis-conn', 'DocController@redisConnection');
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