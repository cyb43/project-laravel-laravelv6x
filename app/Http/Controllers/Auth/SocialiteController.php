<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;


/**
 * Socialite社会化登录
 * Class SocialiteController
 * @package App\Http\Controllers
 * @author ^2_3^王尔贝
 */
class SocialiteController extends Controller
{

    /**
     * gitHub重定向
     * Redirect the user to the GitHub authentication page.
     *
     * @return \Symfony\Component\HttpFoundation\RedirectResponse | \Illuminate\Http\Response
     * @author ^2_3^王尔贝
     */
    public function gitHubRedirectToProvider()
    {
        return Socialite::driver('github')->redirect();
    }

    /**
     * gitHub回调处理
     * Obtain the user information from GitHub.
     *
     * @return \Illuminate\Http\Response
     * @author ^2_3^王尔贝
     */
    public function gitHubHandleProviderCallback()
    {
        $user = Socialite::driver('github')->user();

        // $user->token;
        dump( $user );
    }
}
