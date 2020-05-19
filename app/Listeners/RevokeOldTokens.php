<?php

namespace App\Listeners;

use Illuminate\Support\Facades\DB;
use Laravel\Passport\Events\AccessTokenCreated;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;


/**
 * ^2_3^ 删除多余访问令牌
 * Class RevokeOldTokens
 * @package App\Listeners
 */
class RevokeOldTokens
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  AccessTokenCreated  $event
     * @return void
     */
    public function handle(AccessTokenCreated $event)
    {
        //// 基础数据
        $clientId = $event->clientId;
        $userId = $event->userId;
        $tokenId = $event->tokenId;

        //// 删除多余令牌
        //// 查询构造器(删除过期令牌)
        $where = array(
            ['id', '!=', $tokenId],
            ['user_id', '=', $userId],
            ['client_id', '=', $clientId]
        );
        // 过期令牌
        $tokens = DB::table('oauth_access_tokens')->where($where)->get();
        foreach ( $tokens as $token ){
            // 删除过期刷新令牌
            DB::table('oauth_refresh_tokens')->where('access_token_id', $token->id)->delete();
        }
        // 删除过期令牌
        DB::table('oauth_access_tokens')->where($where)->delete();

    }
}
