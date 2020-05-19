<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use GuzzleHttp;

/**
 * OAuth授权码授权令牌
 * https://learnku.com/docs/laravel/6.x/passport/5152
 * Class OAuthCodeController
 * @package App\Http\Controllers
 * @author ^2_3^王尔贝
 */
class OAuthCodeController extends Controller
{

    /**
     * 授权码授权请求(允许/拒绝)
     * http://project-laravel-laravelv6x.test/authcode/authorize
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     * @author ^2_3^王尔贝
     */
    public function authCodeAuthorize(Request $request)
    {
        // 生成授权请求随机字串
        $state = Str::random(40);

        // 保存随机字串以后验证
        $request->session()->put('state', $state);

        // 请求字串
        $query = http_build_query([
            'client_id' => 3, //授权客户端ID(oauth_clients->id);
            'redirect_uri' => 'http://project-laravel-laravelv6x.test/authcode/callback', //授权回调地址;
            'response_type' => 'code',  //授权码返回;
            'scope' => '',
            'state' => $state,  //授权随机字串;
        ]);

        //// 授权请求(同意/拒绝)
        return redirect('http://project-laravel-laravelv6x.test/oauth/authorize?'.$query);
    }

    /**
     * 授权码回调(授权码换访问令牌)
     * http://project-laravel-laravelv6x.test/authcode/callback
     * @param Request $request
     * @return mixed
     * @author ^2_3^王尔贝
     */
    public function authCodeCallback(Request $request)
    {
        //// 授权码回调
        //dump( $request->all() );
        /// 允许
        //code 授权码
        //state 授权请求随机字串
        /// 拒绝
        //"error" => "access_denied"
        //"state" => "(授权请求随机字串)"

        $codeArr = $request->all();

        //// 将授权码转换为访问令牌
        $state = $request->session()->pull('state');
        //
        // throw_unless() 在给定的布尔表达式结果为 false 时，throw_unless 函数抛出给定的异常。
        throw_unless(
            strlen($state) > 0 && $state === $request->state,
            \InvalidArgumentException::class
        );
        //
        //// 安装GuzzleHttp：composer require guzzlehttp/guzzle；
        // sudo vim /etc/host 添加 "127.0.0.1 project-laravel-laravelv6x.test"；
        $http = new GuzzleHttp\Client;
        $response = $http->post('http://project-laravel-laravelv6x.test/oauth/token', [
            'form_params' => [
                'grant_type' => 'authorization_code',
                'client_id' => 3,
                'client_secret' => 'ehTwZ4IHrKaRQdiUGFncH76eRaRS7I4Bn1WWUnJb',
                'redirect_uri' => 'http://project-laravel-laravelv6x.test/authcode/callback',
                'code' => $request->code,
            ],
        ]);
        $tokenArr = json_decode((string) $response->getBody(), true);

        return ['codeArr' => $codeArr, 'tokenArr' => $tokenArr];
        // 输出字串
        /*
        {
            "token_type":"Bearer",
            "expires_in":1296000, //15天;
            // 访问令牌字串
            "access_token":"",
            // 刷新令牌字串
            "refresh_token":""
        }
        */
    }

    /**
     * 刷新令牌
     * http://project-laravel-laravelv6x.test/authcode/refreshtoken
     * @param Request $request
     * @return mixed
     * @author ^2_3^王尔贝
     */
    public function authCodeRefreshToken(Request $request)
    {
        $refreshToken = "def5020007a9279d48d1a029b093008fefbd7151e112e71cba8a6e7cf49e0484261b4fba04e513a9ea252f49687d87c244aee6ee776198c9b72ae1bf100b2c3f2436c18b1b214c4f82a66d569b50b48c0e9b0233c5dfe91aa411b3070bd2ab7f2749ce266347ccc099be8e57203ad3f1046e6b98addbcc51b3b5876da5aefaa8484a3eaf899cd62878790a8052c9b47730db85c67b0f48a50e04c814c1c3f7e9c6949eaf5f4ebeacc8df14a151c01f2b4b1bb9b72921af0e021bc1c14801f9479a921ca9780613120eb49e2b356af9144d1b31680618a20a0601b43495a8fde9b49534b03b80c86acdc712ed8ba4b2793531a9b2b7e2fd1a77b77b83745f84b78fffe04413f87ffe2f06de914af2974982d8a1719fc0883a3cf82203d32c426bf5d6ddb5f7a59a0530994b10825a80ffabc23f7155da57a88b07f3c90f8f29c440c768567f95cc33f8b0eed6d36ba86057615d81f39e2ca77c51cb3552994758c7";

        $http = new GuzzleHttp\Client;
        $response = $http->post('http://project-laravel-laravelv6x.test/oauth/token', [
            'form_params' => [
                'grant_type' => 'refresh_token',
                'refresh_token' => $refreshToken,
                'client_id' => 3,
                'client_secret' => 'ehTwZ4IHrKaRQdiUGFncH76eRaRS7I4Bn1WWUnJb',
                'scope' => '',
            ],
        ]);
        return json_decode((string) $response->getBody(), true);
        //
        // 输出
        /*
        {
            "token_type":"Bearer",
            "expires_in":1296000,
            "access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjU4OGY3ZTA0NDk3MTdhMDVjYjYyODhkNjM5OGQ4ZGIxMDhjZTQzMDU2OTEyZjQxNzVlYjdmMDY1MWE3NWY3OTQ5NDk0NzkwNzk3MDBiODEiLCJpYXQiOjE1ODk3OTc2NzUsIm5iZiI6MTU4OTc5NzY3NSwiZXhwIjoxNTkxMDkzNjc1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ROWOocYrLTbGJcEbh8MnFPCMecYFSP9ajQ2El22XRiNAQr38MtkhjB2KDMJhPx7sQ3QNKQWuiNQFGLr1hOdXM2RmiAuKMKfyWtGyp46OlbV0dOtzMKLBSoFabI8-cck5TypBTOAdnfoPw80RKYTOIUmjVSkVAqr-PePPD5QM-A5GIYnf49mAvn9K889yiqxIPUiSJsR7ipL8ZpSz3lbWuoYXWic4dPC6uloADcX7EZkbp30Bi3qcks0E5gYVTOXDyc83lfpu538bB0jewl6sOrLU8G1Vq6szjMV16IBorbc4jhmMn7cj9qQ25GLHh26cE_kJSeHFr5ayJSb5Blr8bdXv2MSlfC5VYaf1f2_xr4JatuR8_e0sGbFqwgM6j0d8u3TWWJaLM2H_uQP-b9wLuokeoD70naH5mNCt8eGb10uw4bqR3J7JsxfS0FWRUAvO4jC2rnKcXdpS8MUk0n4kbnQAET1fqhG9d2KNlRZFUyt6RLT-x0FZ64RXrX_irnyRzmQMINUn38_TAF0t0CwOQgus4rDHcxTBlQmO-7mtl-lFxlw3k4AjySPQ3iDY6gNuUWf_uk7L2Qv4oDirJa8UCFsn4EXNdmF2SKBPG0QX09Mp99anfBgZUAboydwMo30FYVk4mCfTC0ew4Mh7rAcPo9X4mZvM40gPIutasApy7mU",
            "refresh_token":"def502003c1e1ffc5ec6584e882ad84e403f0a5b9a3d4ff1e475cd70d0eeec27ef78c29d66de4a05a95bbffd6f8ec6cee24ae0a4ed9c66afe72ac7b2367f1320cc103cfbce2c42759c753910e23e8038389b80add5aa0079afdffde953f272422f63b17fe3ac80e68740ea6f6885c24a1369f7395c524ea3bf42fd1e3ba1bc89e137df2b896a0946bf57d74c263d8a99a08800183c8653592746dfe99f0b87d8bf37e8c8e0b368ddb0d42f33f7c960bc253c7e6aaef7ce237db1df545e87c3c413c5adc28aab3ce918a74d53ee2486fc643c76d57d068605327b42e3b6aad96cdd5d2a06f38eab6714e031f05e71e7d7378ea71ef3d372e44bfcbc6c4866befd67664ad67b4872d3c667569b82a00f2f67b08a1944488cc3382ca1499b55594aeed32f6bf9bb473fdcf4ba979d54468af4211d182b98ccc06f52a6b666fcb8ada02b15c641dda8e0c6aaa3dd48b899fcb2307efbc842e5b66a27296a6202639d01"
        }
        */
    }

}
