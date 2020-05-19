<?php


/**
 * ^2_3^ 身份验证配置文件
 */
return [

    /*
    |--------------------------------------------------------------------------
    | Authentication(认证) Defaults
    |--------------------------------------------------------------------------
    |
    | This option controls the default authentication "guard(守卫)" and password
    | reset options for your application. You may change these defaults
    | as required, but they're a perfect(完美的) start for most applications.
    |
    */

    'defaults' => [
        'guard' => 'web',
        'passwords' => 'users',
    ],

    /*
    |--------------------------------------------------------------------------
    | Authentication Guards(认证守卫)
    |--------------------------------------------------------------------------
    |
    | Next, you may define every authentication guard for your application.
    | Of course, a great default configuration has been defined for you
    | here which uses session storage and the Eloquent user provider.
    |
    | All authentication drivers have a user provider. This defines how the
    | users are actually retrieved(检索) out of your database or other storage
    | mechanisms(机制) used by this application to persist your user's data.
    |
    | Supported: "session", "token"
    |
    */

    'guards' => [
        'web' => [
            'driver' => 'session',
            'provider' => 'users',
        ],

        //// api看守器
        /// API认证(令牌)
        /// https://learnku.com/docs/laravel/6.x/api-authentication/5429
        // 负责检查传入请求上的 API 令牌，并验证它是否匹配数据库中用户分配的令牌。
//        'api' => [
//            'driver' => 'token',
//            'provider' => 'users',
//            // 使用 SHA-256 哈希算法来散列你的 API 令牌，你可以将 api 配置的 hash 选项设置为 true。
//            'hash' => false,
//        ],

        //// api看守器
        /// Passport OAuth 认证 (授权码授权令牌/密码授权令牌)
        /// https://learnku.com/docs/laravel/6.x/passport/5152
        'api' => [
            'driver' => 'passport',
            'provider' => 'users',
        ],

    ],

    /*
    |--------------------------------------------------------------------------
    | User Providers(用户提供者)
    |--------------------------------------------------------------------------
    |
    | All authentication drivers have a user provider. This defines how the
    | users are actually retrieved out of your database or other storage
    | mechanisms used by this application to persist your user's data.
    |
    | If you have multiple user tables or models you may configure multiple
    | sources which represent(代表) each model / table. These sources may then
    | be assigned to any extra authentication guards you have defined.
    |
    | Supported: "database", "eloquent"
    |
    */

    'providers' => [
        'users' => [
            'driver' => 'eloquent',
            'model' => App\User::class,
        ],

        // 'users' => [
        //     'driver' => 'database',
        //     'table' => 'users',
        // ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Resetting Passwords (重置密码)
    |--------------------------------------------------------------------------
    |
    | You may specify(指定) multiple(多样的) password reset configurations if you have more
    | than one user table or model in the application and you want to have
    | separate password reset settings based on the specific user types.
    |
    | The expire time is the number of minutes that the reset token should be
    | considered(经过深思熟虑的) valid. This security feature keeps tokens short-lived so
    | they have less time to be guessed. You may change this as needed.
    |
    */

    'passwords' => [
        'users' => [
            'provider' => 'users',
            'table' => 'password_resets',
            'expire' => 60,
            'throttle' => 60, //节流阀;
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Password Confirmation(确认) Timeout
    |--------------------------------------------------------------------------
    |
    | Here you may define the amount of seconds before a password confirmation
    | times out and the user is prompted to re-enter their password via the
    | confirmation screen. By default, the timeout lasts for three hours.
    |
    */

    'password_timeout' => 10800,

];
