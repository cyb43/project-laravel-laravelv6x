<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes ^2_3^
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
//
//// [web路由]OAuth密码授权令牌
//1/ 获取密码授权令牌
Route::get('/authpassword/token', 'OAuthPasswordController@passwordToken');
// from
// headers Content-Type application/json
// body form-data username:1021625889@qq.com password:1357924680
Route::post('/authpassword/token', 'OAuthPasswordController@passwordToken');
//2/ 密码授权刷新令牌
Route::get('/authpassword/refreshtoken', 'OAuthPasswordController@refreshToken');
Route::post('/authpassword/refreshtoken', 'OAuthPasswordController@refreshToken');
//
//// 使用api看守器(传递api令牌)访问
//$response = $client->request('GET', '/api/user', [
//    'headers' => [
//        'Accept' => 'application/json',
//        'Authorization' => 'Bearer '.$accessToken,
//    ],
//]);
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
