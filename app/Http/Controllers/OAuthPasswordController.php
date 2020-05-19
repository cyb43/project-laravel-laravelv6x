<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp;
use Illuminate\Support\Facades\Validator;

/**
 * OAuth密码授权令牌
 * https://learnku.com/docs/laravel/6.x/passport/5152
 * Class OAuthPasswordController
 * @package App\Http\Controllers
 * @author ^2_3^王尔贝
 */
class OAuthPasswordController extends Controller
{

    /**
     * (web路由/api路由)获取密码授权令牌
     * http://project-laravel-laravelv6x.test/authpassword/token
     * @param Request $request
     * @return mixed
     * @author ^2_3^王尔贝
     */
    public function passwordToken(Request $request)
    {
        //// 账号信息
        if( $request->isMethod('post') ) {
            //// 数据验证
//        $request->validate([
//            'username' => 'required',
//            'password' => 'required'
//        ]);
            //
            $validator = Validator::make($request->all(), [
                'username' => 'required|min:6',
                'password' => 'required|min:6'
            ]);
            if( $validator->fails() ) {
                return $validator->errors();
                //return '错误提示：账号错误！';
            }

            $username = $request->post('username');
            $password = $request->post('password');
        }else {
            $username = '1142733640@qq.com';
            $password = '1234567890';
        }


        $http = new GuzzleHttp\Client;
        $response = $http->post('http://project-laravel-laravelv6x.test/oauth/token', [
            'form_params' => [
                'grant_type' => 'password',
                'client_id' => 4,
                'client_secret' => 'SUP5JgP0oHS4BBR7HEgDJH4IBpIxJTox417nMpJh',
                'username' => $username,
                'password' => $password,
                'scope' => '',
            ],
        ]);
        return json_decode((string) $response->getBody(), true);
        //
        // 输出
        /*
        {
            "token_type":"Bearer",
            "expires_in":1296000, //15天;
            "access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI0IiwianRpIjoiZWQ2Nzc4YmE1OWUyNWIzYjNlNjA1NmQ3NTI0MmI3YzM3ZjA1NGU5Mzk4YWExNDM2NmQ0YTVjMjE2ZjdhYmE0OGJkYzg1YmI0NGY5MjE0MmIiLCJpYXQiOjE1ODk4MTk2MTUsIm5iZiI6MTU4OTgxOTYxNSwiZXhwIjoxNTkxMTE1NjE1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.FEau0y3i_93jVzXcUT0FIh5gCF8LL9vU51vPWDn8rVazCRRlUT0zpXzZeKML3rKkddcAJSl4Ge9xT9Q0Q16v_Q_QM-_eCBunajPPSz6DyJY8cPNohL7SdTGdeyesrh02IAVtYwDb15BjGRc2rIh2d5_JEu8B6sVBfVwGceo4ZGbOdweJPa8VW1M-zDdB-KxiISgk89WYHDGSBGHvFj4o1zyy4Tsl-6J5AUh0TKDl_TUBViBZLmfRSDl07IDCBoeWDKWooQCTHIIHbjh3lIdXrIfiRnhSjCvBgOTyTGgW2DffRYCAqNQ1CUFv7GcCcJlYxtx6fIH77POU4rBuoWW68Wu1y4Lb_5ACBOrdLRxlGKhDF1BotGf-K3sPB_RRYL2CuRmIiEgi0CoNiElhX2iheepM1i19eb7Tt6a7e-4PPhlolgMBKpP_qKqsJEOSVig81rf261AQ3k3AQUrYPMbXbgdMXUld-Ua9o9mm_AqMeIxmH0-ke8ZsYheTeiJY9eIqkw5stieDVIwKkI9-1TjrlQOp1ecKJfBBL9ojw_HBSdqjvQ8tWWvx88_U8bqGVeuqrEpUwvQuHv_oIcSO-rJTx6B5yMwuwj2WXbo_GYxIsFBfpa2vzx0fFFoDKIzbJirqIAkAkS4rEoBy1RbFICf1vMxr7HnNQBTXeS86_apzgS8",
            "refresh_token":"def50200f182d0c905afca1dafc2652b12368cd442c84ba805f4580ca125909cd72992bbe81fd35e92dd728ef5b2e4223148fed812b3e16ff9388ec08779a49e758bcb857105a8a7cda211284d28849241fa8661a271bc440fe78d09bd30d85ae2dc4485021bb8fb514c31876bfb4830fbfff5e6444ab0635dbb872808714fb16b9cf73202634aea21c62d514ca151708f6a90ebc62bfeece00459d194cb1eacc39a960c7a6f1f1243664186bcebd6a471df84f849676811e271cf58e029bb048b5826afd2add055c56de0c724891e08b2f9137c2f4b979125026e2bb5840b8b8d313a8f4269e1e7b3d409eacbd1551dc3f18001955d05ddb8fe5ce954811d7f85e5c543efee21ca309ca14d5eca903097211bdf4d58c6a97c6d90b8e7d26d9a8231f5c951720c9ef392031e959fc208be0422884f99a710f99592472b6eb93f8004d72003d3c712d5b01f8952006189e9c454405bd15712ed464ff4b2807e5df4"
        }
        */
    }

    /**
     * 刷新令牌
     * http://project-laravel-laravelv6x.test/authpassword/refreshtoken
     * @param Request $request
     * @return mixed
     * @author ^2_3^王尔贝
     */
    public function refreshToken(Request $request)
    {
        $refreshToken = "def5020030004e2a413cfb868f049e3b0bf4f258b3aad3324ae13aed04e0bb10c39739ccb81ffc3df2146c747e9dc7987cd84e27c103d8edaf203102fb23dd73dc6ea8fd9d12d3a9df2c4acfb7005a5530094bc33969b5c780a6d9098bb7e0f61d2c3fa985b5fbc90d12de48dd79aee87be56d235bc0952834058ad6ee40a780cd7a388527c059f3da8c37710b6a15e2488cc65b8eb872b37a2699a62918426b9c74d466923dffa4e41b01d2ca5919c8f525f8f1d704243978d1f4fc78f7ed05dfd3f286b6b708cc0cc8702cff3f1d484a02c7d79a2ab9e6f8878b7d75538f685abb73d21b74daf86d7cd23e46d14378b58eeecd2314f9a678d908b2f81827ed7ccad5177f75c1db08f84c5257d91924516064a64ec0c12b19c998beb8ccd8e6e5802125513cde44624e9032d2deb919b9371e448dfb409a974021a2ae906797b5f64354fbc9a1df305b4dd05d23a152a76eff979cd9c429318ebfb359eac3fbc7";

        $http = new GuzzleHttp\Client;
        $response = $http->post('http://project-laravel-laravelv6x.test/oauth/token', [
            'form_params' => [
                'grant_type' => 'refresh_token',
                'refresh_token' => $refreshToken,
                'client_id' => 4,
                'client_secret' => 'SUP5JgP0oHS4BBR7HEgDJH4IBpIxJTox417nMpJh',
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
            "access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI0IiwianRpIjoiOWI5ZTQ5OWQ5ODVlNzU4MjI3ZjNlYmMxMGI5NmJmZmM1NjBjZGEzYzIwNjdhMGM5MzM4NjkyZmRkMTg3M2U3NjRkZDQzNjAwYzllMzU5NDkiLCJpYXQiOjE1ODk4MjAzMjAsIm5iZiI6MTU4OTgyMDMyMCwiZXhwIjoxNTkxMTE2MzIwLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.Oq_yVLPDPGsTYatxbAsLFsVwSsdY6V2pZtLVh6slGLGxrgDwwCzbVIKDtuZc1dYsx-uKy-orgmkVXHpN65sCMBM9bnRz_oEZ-A01cYumaJqO4dLuigw9xNSOXYccpd1_nlZ3ajwXnRVhuOTjaCn3Xldcek8lGjjSPduEKz7SBaJUPTgJT_JW36VIzpKS_ePwO6As7Ft9QmoKHdL8oPiZ62fGNIIg2TkU9RpVcXuwIByp2nrNLhmBYw5K0jR55_QL-Bi1QKii9bb7xSFTciexlf4sWWbhxH1cFHFpGv-mkLBTM8emKGxB7MVFgxFz1uyzfJrU9X_YrBDDHCZEzpDuUt_cgvmYUzpQ6KWIvlM5Skx4UmWqP1Yt6eNcNfzCRucHoA9MqEQNQykCFwy2YAssUqA7GcJf0N8wj05vvaBmzoJTQ2YO3Xt2Q43cHf1NyC9RXgaZw5HfB3XE_bYDZTWb-kvXz56CmHSMDiwnuDVlxy9NKml7Hyx9MeOiEc1Cc68uI_QJvzsFYCr_g-kQGt623V_lpPbjZqWVekwmuAqKEePi8C28-ZjwSno84pMXj0y8ntpq1qyQGd1M2_YK3w7-h1xGyvIIAT4xlxPXz72DbyLGw52sW-Ca5p4w-NCafr9vSnfJykmV-NTYz77daYVjliRenrFRnDeOP0DlsIU93vM",
            "refresh_token":"def50200432280f6f4eb2cbe92bdc84ec9e7285d68f66146cc3e6effbdb25eab3412e3b0ca63c5db21c8d74b7a8df23ff7ecf2ab31c70649d22dcd499d57e34df394130ac95e1e2ace0839d652bd483a5f5a93907fa4b2d1fd7bbcffbecf83aff0fcbfbdbbb145265efd3e021bc95a90c3c6e9349f415bc96613178e2742d4b9709848903a00a451f10f376bef456a2b366cd0d049befb3999088ce83ba214fde0363b8c8010c00c66a6579acb20a1227bf589a5706368a94fa46d33f236b5ed53856b7b31a1c283365924993fb6d94af64f64353e98bb28293c3f26e57c0d7db23db56f23d3c47a9bc280a2f5767afabafd4006ebbf170d811345c4940a6f423fa3c2871c56a5921bdd7845bb11c1f11fb9514258e301340e163b25627af701cae6a7cdea51c1930c92813bd5de1adff36fdf7e56fc213963b531c63a099b10319b145a3183930c4d0cd87f96d1410a38ff53b40eb5455a368b61e832d0d2142b"
        }
        */
    }

}
